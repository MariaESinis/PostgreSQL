CREATE SCHEMA IF NOT EXISTS exercicio2;

CREATE TABLE IF NOT EXISTS exercicio2.usuario(
    nome VARCHAR(150),
    email VARCHAR(320),
    senha VARCHAR(20),
    telefone VARCHAR(11),
    status VARCHAR(8) NOT NULL DEAFULT 'ativo',
    data_criacao DATE NOT NULL DEFAULT CURRENT_DATE,
    idade INTEGER CHECK (idade BETWEEN 14 AND 120),
    nivel_acesso INTEGER CHECK (nivel-acesso BETWEEN 1 and 5),

    CONSTRAINT chk_usuario_status CHECK (status IN ('ativo', 'inativo', 'bloqueado', 'pendente'))
);
