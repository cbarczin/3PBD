
-- insert

INSERT INTO usuarios (nome, email, telefone) VALUES ('João Silva', 'joao@email.com', '21999999999'), ('Maria Oliveira', 'maria.oliveira@email.com', '21988887777'),
('Carlos Souza', 'carlos.souza@email.com', '21987654321'),
('Ana Lima', 'ana.lima@email.com', '21981234567');

INSERT INTO quartos (numVagas, banheiro) VALUES (4, 1), (6, 1), (4, 0), (8, 1);

INSERT INTO vagas (idQuarto, tipoCama, posicaoCama, ilumSolar)
VALUES (1, 'embaixo', 'porta', 'tarde'), (2, 'embaixo', 'meio', 'nenhuma'),
(3, 'em cima', 'porta', 'manhã'), (4, 'camaNormal', 'meio', 'manhã');;

INSERT INTO reserva (idUsuario, checkIn, checkOut, statusReserva)
VALUES (1, '2025-07-01', '2025-07-10', 'pendente'), 2, '2025-07-01', '2025-07-03', 'concluido'),
(3, '2025-07-08', '2025-07-15', 'pendente');

INSERT INTO reservar_vaga (idReserva, idVaga) VALUES (1, 1), (2, 3);

INSERT INTO pagamento (idReserva, valor, statusPagamento)
VALUES (1, 500.00, 'pendente');

-- update

UPDATE usuarios SET telefone = '21988888888' WHERE idUsuario = 1;

UPDATE quartos SET numVagas = 6 WHERE idQuarto = 1;

UPDATE vagas SET tipoCama = 'camaNormal' WHERE idVaga = 1;

UPDATE reserva SET statusReserva = 'concluido' WHERE idReserva = 1;

UPDATE pagamento SET statusPagamento = 'concluído' WHERE idPagamento = 1;

-- delete

DELETE FROM reservar_vaga WHERE idReserva = 1 AND idVaga = 1;

DELETE FROM pagamento WHERE idPagamento = 1;

DELETE FROM reserva WHERE statusReserva = "cancelada";

DELETE FROM vagas WHERE idVaga = 1;

DELETE FROM quartos WHERE idQuarto = 1;

DELETE FROM usuarios WHERE idUsuario = 1;

-- select

SELECT * FROM usuarios;
SELECT * FROM usuarios WHERE idUsuario = 1;

SELECT * FROM quartos;
SELECT * FROM quartos WHERE idQuarto = 1;

SELECT * FROM vagas;
SELECT * FROM vagas WHERE idVaga = 1;

SELECT v.*
FROM vagas v
JOIN quartos q ON v.idQuarto = q.idQuarto
WHERE q.banheiro = 1;

-- vagas disponiveis em determinado dia

SELECT v.*
FROM vagas v
LEFT JOIN reservar_vaga rv ON v.idVaga = rv.idVaga
LEFT JOIN reserva r ON rv.idReserva = r.idReserva
    AND '2025-07-01' BETWEEN r.checkIn AND r.checkOut
WHERE r.idReserva IS NULL;

-- camas reservadas em determinado dia

SELECT v.*, r.checkIn, r.checkOut
FROM vagas v
JOIN reservar_vaga rv ON v.idVaga = rv.idVaga
JOIN reserva r ON rv.idReserva = r.idReserva
WHERE '2025-07-01' BETWEEN r.checkIn AND r.checkOut;
