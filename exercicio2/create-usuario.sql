DROP FUNCTION IF EXISTS exercicio2.fn_valida_nome(text);
DROP FUNCTION IF EXISTS exercicio2.fn_valida_telefone(text);
DROP FUNCTION IF EXISTS exercicio2.fn_valida_email(text);
CREATE SCHEMA IF NOT EXISTS exercicio2;

-- Funcao valida nome
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_nome(input_nome TEXT) 
RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        length(trim(input_nome)) >= 3        
        AND input_nome ~ '^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ ]*[A-Za-zÀ-ÿ]$' 
        AND input_nome !~ '  ' -- Evita espaços duplos
    );
END;
$$ LANGUAGE plpgsql;

-- Funcao valida telefone
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_telefone(input_tel TEXT) 
RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        input_tel ~ '^[0-9]{10,11}$'                  
        AND (
            length(input_tel) = 10 
            OR (length(input_tel) = 11 AND substring(input_tel from 3 for 1) = '9')
        )
    );
END;
$$ LANGUAGE plpgsql;

-- Funcao valida email
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_email(input_email TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        input_email LIKE '_%@%._%' 
        AND input_email ~* '^[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,255}\.[A-Z]{2,}$' 
    );
END;
$$ LANGUAGE plpgsql;

-- Tabela Usuario
CREATE TABLE IF NOT EXISTS exercicio2.usuario(
    nome            VARCHAR(150)        NOT NULL,
    email           VARCHAR(320)        NOT NULL, 
    senha           VARCHAR(100)        NOT NULL,
    telefone        VARCHAR(11)         NOT NULL,
    status          VARCHAR(10)         NOT NULL         DEFAULT 'ativo',
    data_criacao    TIMESTAMP           NOT NULL         DEFAULT CURRENT_TIMESTAMP,
    idade           INTEGER             NOT NULL,
    nivel_acesso    INTEGER             NOT NULL,

    CONSTRAINT chk_nome_valido           CHECK (exercicio2.fn_valida_nome(nome)),
    CONSTRAINT chk_usuario_email         CHECK (exercicio2.fn_valida_email(email)),
    CONSTRAINT chk_senha_valido          CHECK (senha ~ '[A-Z]' AND senha ~ '[a-z]' AND senha ~ '[0-9]' AND senha ~ '[!@#$%^&*()]' AND LENGTH(senha) >= 8),
    CONSTRAINT chk_usuario_telefone      CHECK (exercicio2.fn_valida_telefone(telefone)),
    CONSTRAINT chk_usuario_status        CHECK (status IN ('ativo', 'inativo', 'bloqueado', 'pendente')),
    CONSTRAINT chk_usuario_idade         CHECK (idade BETWEEN 14 AND 120),
    CONSTRAINT chk_usuario_nivel_acesso  CHECK (nivel_acesso BETWEEN 1 AND 5)
);
