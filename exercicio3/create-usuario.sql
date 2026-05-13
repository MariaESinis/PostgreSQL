CREATE TYPE exercicio3.status_usuario AS ENUM (
    'ativo', 
    'inativo', 
    'bloqueado', 
    'pendente'
);

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
