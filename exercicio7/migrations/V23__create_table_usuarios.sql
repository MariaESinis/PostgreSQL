CREATE TABLE IF NOT EXISTS ex7_cadastro.usuarios(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_usuario_id
    ),

    cpf                 VARCHAR(11)     NOT NULL,
    email               VARCHAR(320)    NOT NULL,
    telefone            VARCHAR(11),
    nome                VARCHAR(150)    NOT NULL,
    data_nascimento     TIMESTAMPTZ     NOT NULL,
    idade               SMALLINT        NOT NULL,
    status              ex7_cadastro.usuarios_status,
    senha               VARCHAR(100)    NOT NULL,
    created_date        TIMESTAMPTZ     NOT NULL,
    updated_date        TIMESTAMPTZ     NOT NULL,

    CONSTRAINT pk_usuarios_id PRIMARY KEY (id),

    CONSTRAINT uq_usuarios_cpf UNIQUE (cpf),
    CONSTRAINT uq_usuarios_email UNIQUE (email),
    CONSTRAINT uq_usuarios_tel UNIQUE (telefone),

    CONSTRAINT ck_usuario_cpf
        CHECK (ex7_helpers.fn_cpf(cpf)),

    CONSTRAINT ck_usuario_email
        CHECK (ex7_helpers.fn_email(email)),

    CONSTRAINT ck_usuario_tel
        CHECK (ex7_helpers.fn_telefone(telefone)),

    CONSTRAINT ck_usuario_nome
        CHECK (ex7_helpers.fn_nome(nome)),

    CONSTRAINT ck_usuario_data_nascimento
        CHECK (data_nascimento <= CURRENT_DATE),

    CONSTRAINT ck_usuario_idade
        CHECK (idade >= 0),

    CONSTRAINT ck_usuario_senha
        CHECK (ex7_helpers.fn_senha(senha))

  
);
