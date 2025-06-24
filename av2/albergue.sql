-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 07:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `albergue`
--

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL,
  `idReserva` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `statusPagamento` enum('concluído','pendente','cancelado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagamento`
--

INSERT INTO `pagamento` (`idPagamento`, `idReserva`, `valor`, `statusPagamento`) VALUES
(2, 2, 300, 'concluído');

-- --------------------------------------------------------

--
-- Table structure for table `quartos`
--

CREATE TABLE `quartos` (
  `idQuarto` int(11) NOT NULL,
  `numVagas` int(11) NOT NULL,
  `banheiro` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quartos`
--

INSERT INTO `quartos` (`idQuarto`, `numVagas`, `banheiro`) VALUES
(1, 4, 1),
(2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `statusReserva` enum('concluido','pendente','cancelado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserva`
--

INSERT INTO `reserva` (`idReserva`, `idUsuario`, `checkIn`, `checkOut`, `statusReserva`) VALUES
(2, 2, '2025-09-10', '2025-09-12', 'pendente');

-- --------------------------------------------------------

--
-- Table structure for table `reservar_vaga`
--

CREATE TABLE `reservar_vaga` (
  `idReserva` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservar_vaga`
--

INSERT INTO `reservar_vaga` (`idReserva`, `idVaga`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nome`, `email`, `telefone`) VALUES
(2, 'Suellen Braga', 'suellen.novo@email.com', '12888880000');

-- --------------------------------------------------------

--
-- Table structure for table `vagas`
--

CREATE TABLE `vagas` (
  `idVaga` int(11) NOT NULL,
  `idQuarto` int(11) DEFAULT NULL,
  `tipoCama` enum('camaNormal','em cima','embaixo') DEFAULT NULL,
  `posicaoCama` enum('porta','janela','meio','outro') DEFAULT NULL,
  `ilumSolar` enum('manhã','tarde','nenhuma') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vagas`
--

INSERT INTO `vagas` (`idVaga`, `idQuarto`, `tipoCama`, `posicaoCama`, `ilumSolar`) VALUES
(1, 1, 'embaixo', 'janela', 'manhã'),
(2, 2, 'em cima', 'porta', 'manhã');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`idPagamento`),
  ADD KEY `idReserva` (`idReserva`);

--
-- Indexes for table `quartos`
--
ALTER TABLE `quartos`
  ADD PRIMARY KEY (`idQuarto`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `reservar_vaga`
--
ALTER TABLE `reservar_vaga`
  ADD PRIMARY KEY (`idReserva`,`idVaga`),
  ADD KEY `idVaga` (`idVaga`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indexes for table `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`idVaga`),
  ADD KEY `idQuarto` (`idQuarto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `idPagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quartos`
--
ALTER TABLE `quartos`
  MODIFY `idQuarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vagas`
--
ALTER TABLE `vagas`
  MODIFY `idVaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE CASCADE;

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE;

--
-- Constraints for table `reservar_vaga`
--
ALTER TABLE `reservar_vaga`
  ADD CONSTRAINT `reservar_vaga_ibfk_1` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservar_vaga_ibfk_2` FOREIGN KEY (`idVaga`) REFERENCES `vagas` (`idVaga`) ON DELETE CASCADE;

--
-- Constraints for table `vagas`
--
ALTER TABLE `vagas`
  ADD CONSTRAINT `vagas_ibfk_1` FOREIGN KEY (`idQuarto`) REFERENCES `quartos` (`idQuarto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
