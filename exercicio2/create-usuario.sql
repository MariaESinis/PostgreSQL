CREATE SCHEMA IF NOT EXIST exercicio2;

CREATE TABLE IF NOT EXIST usuario(
    nome VARCHAR(150),
    email VARCHAR(320),
    senha VARCHAR(20),
    telefone INTEGER,
    status-usuario VARCHAR(8),
    date-criacao DATE,
    idade INTEGER,
    nivel-acesso INTEGER
)
