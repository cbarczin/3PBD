INSERT INTO `cliente` (`idCliente`, `nome`, `cpf`, `email`, `senha`) VALUES
(1, 'andre', '12345678910', 'andre@gmail.com', 'senha123'),
(2, 'maria', '36254815698', 'maria@gmail.com', '123senha'),
(3, 'lucia', '74582136029', 'lucia@gmail.com', 'se123nha');

INSERT INTO `especialidade` (`idEspecialidade`, `nome`) VALUES
(1, 'Cabeleireiro'),
(2, 'Manicure'),
(3, 'Maquiador');

INSERT INTO `profissionais` (`idProfissional`, `idEspecialidade`, `nomeProfissional`, `email`, `senha`) VALUES
(2, 1, 'Ana', 'ana@gmail.com', 'ana753'),
(4, 1, 'Olga', 'olga@gmail.com', 'olg753');

INSERT INTO `reserva` (`idReserva`, `idCliente`, `idServico`, `idProfissional`, `dtHoraReserva`, `valor`) VALUES
(1, 0, 0, 0, '0000-00-00 00:00:00', 0);

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`idEspecialidade`);

ALTER TABLE `profissionais`
  ADD PRIMARY KEY (`idProfissional`);

ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`);

ALTER TABLE `servicos`
  ADD PRIMARY KEY (`idServicos`);

ALTER TABLE `profissionais`
  MODIFY `idProfissional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `servicos`
  MODIFY `idServicos` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
