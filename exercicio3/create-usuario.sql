CREATE SCHEMA IF NOT EXISTS exercicio3;
CREATE TYPE exercicio3.status_usuario AS ENUM ('ativo', 'inativo', 'bloqueado', 'pendente');

DROP FUNCTION IF EXISTS exercicio3.fn_valida_nome(TEXT) CASCADE;
DROP FUNCTION IF EXISTS exercicio3.fn_valida_telefone(TEXT) CASCADE;
DROP FUNCTION IF EXISTS exercicio3.fn_valida_email(TEXT) CASCADE;

-- Funcao valida nome

CREATE OR REPLACE FUNCTION exercicio3.fn_valida_nome(IN p_nome TEXT)
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        length(trim(p_nome)) >= 3        
        AND p_nome ~ '^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ ]*[A-Za-zÀ-ÿ]$' 
        AND p_nome !~ '  ' -- Evita espaços duplos
    );
END;
$$;

-- Funcao valida telefone
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_telefone(IN p_tel TEXT) 
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        p_tel ~ '^[0-9]{10,11}$'                  
        AND (
            length(p_tel) = 10 
            OR (length(p_tel) = 11 AND substring(p_tel from 3 for 1) = '9')
        )
        AND substring(p_tel from 1 for 2) IN (
            '11', '12', '13', '14', '15', '16', '17', '18', '19', '21', '22', '24', '27', '28', '31', '32', '33', 
            '34', '35', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48', '49', '51', '53', '54', '55', 
            '61', '62', '63', '64', '65', '66', '67', '68', '69', '71', '73', '74', '75', '77', '79', '81', '82', 
            '83', '84', '85', '86', '87', '88', '89', '91', '92', '93', '94', '95', '96', '97', '98', '99'
        )
    );
END;
$$;

-- Funcao valida email
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_email(IN p_email TEXT)
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        p_email LIKE '_%@%._%' 
        AND p_email ~* '^[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,255}\.[A-Z]{2,}$' 
    );
END;
$$;
-- Tabela Usuario
CREATE TABLE IF NOT EXISTS exercicio3.usuario(
    
    id INTEGER GENERATED ALWAYS AS IDENTITY (
    START WITH 1000
    INCREMENT BY 1 
    MINVALUE 1 
    MAXVALUE 10000 
    CACHE 1 
    SEQUENCE NAME exercicio3.seq_usuario_id),
    
    nome            VARCHAR(150)        NOT NULL,
    email          VARCHAR(320)        NOT NULL, 
    senha           VARCHAR(100)        NOT NULL,
    telefone        VARCHAR(11)         NOT NULL,
    status          exercicio3.status_usuario   NOT NULL    DEFAULT 'ativo',
    data_criacao    TIMESTAMPTZ         NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    idade           SMALLINT            NOT NULL,
    nivel_acesso    CHAR                NOT NULL,

    CONSTRAINT pk_usuario_id PRIMARY KEY (id),

    CONSTRAINT uq_usuario_email UNIQUE (email),  
    CONSTRAINT uq_usuario_telefone UNIQUE (telefone),

    CONSTRAINT chk_usuario_nome          
    CHECK (
        exercicio3.fn_valida_nome(nome)
    ),

    
    CONSTRAINT chk_usuario_email        
    CHECK (
        exercicio3.fn_valida_email(email)
    ),
    
    CONSTRAINT chk_usuario_senha        
    CHECK (
        senha ~ '[A-Z]' 
        AND senha ~ '[a-z]' 
        AND senha ~ '[0-9]' 
        AND senha ~ '[!@#$%^&*()]' 
        AND LENGTH(senha) >= 8),

  
    CONSTRAINT chk_usuario_telefone      
    CHECK (
        exercicio3.fn_valida_telefone(telefone)
    ),
    
    CONSTRAINT chk_usuario_idade         
    CHECK (
        idade BETWEEN 14 AND 120
    ),
    
    CONSTRAINT chk_usuario_nivel_acesso  
    CHECK (
        nivel_acesso IN('1', '2', '3', '4', '5')
    )
);
