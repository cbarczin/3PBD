-- Criando banco de dados --
CREATE DATABASE Faeterj;
USE Faeterj;

-- Criando as tabelas disciplinas e alunos --
CREATE TABLE disciplinas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cargaHoraria INT NOT NULL,
    periodo INT NOT NULL,
    limiteFaltas INT NOT NULL
);

CREATE TABLE alunos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matricula BIGINT(16) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf BIGINT(14) NOT NULL UNIQUE
);

-- Inserindo informações na tabela disciplinas --
INSERT INTO Disciplinas (sigla, nome, cargaHoraria, periodo, limiteFaltas) 
VALUES  ('1FAC','Fundamentos de Algoritmos de Computação', 80, 1, 20),
        ('4POA','Programação Orientada a Objetos Avançada', 80, 1, 20),
        ('2TPH','Técnicas e Paradigmas Humanos', 80, 2, 20),
        ('4MET','Metodologia da Pesquisa', 40, 4, 10),
        ('3ALG', 'Álgebra Linear', 80, 3, 20);

-- Alterando dados da tabela disciplinas -- 
UPDATE disciplinas SET cargaHoraria = 80 WHERE sigla = '3ALG';
UPDATE disciplinas SET sigla = '2CAW', nome = 'Construção de Aplicações Web' WHERE sigla = '4POA';

-- Listando dados da tabela disciplinas -- 
SELECT * FROM disciplinas WHERE sigla = '1FAC';
SELECT * FROM disciplinas;

-- Deletando dados da tabela disciplinas --
DELETE FROM disciplinas WHERE sigla = '2TPH';
DELETE FROM disciplinas WHERE cargaHoraria = 10;

-- Inserindo informações na tabela alunos --
INSERT INTO alunos (matricula, nome, email, cpf) 
VALUES  (258111417202326, 'João Marcelo Braga', 'joaobraga@gmail.com', 12345678901),
        (21018263442505, 'Carina Alencar Veneza', 'carinaveneza@gmail.com', 23456789012),
        (27172227323742, 'Carla Silva Paz', 'carlapaz@gmail.com', 34567890123),
        (29162330374451, 'Wendel Vinícius Souza', 'wendelvini@gmail.com', 45678901234),
        (21018263442505, 'Letícia Gomes Bezerra', 'letbezerra@gmail.com', 56789012345);

-- Alterando dados da tabela alunos --
UPDATE alunos SET nome = 'João Pedro Silva', email = 'joaopedro.silva@email.com' WHERE matricula = 258111417202326;
UPDATE alunos SET nome = 'Carina Mendes de Veneza' WHERE cpf = 23456789012;

-- Listando dados da tabela alunos -- 
SELECT * FROM alunos WHERE matricula = 27172227323742;
SELECT * FROM alunos WHERE nome = 'Wendel Vinícius Souza';

-- Deletando dados da tabela alunos -- 
DELETE FROM alunos WHERE matricula = 21018263442505;
DELETE FROM alunos WHERE cpf = 12345678901;