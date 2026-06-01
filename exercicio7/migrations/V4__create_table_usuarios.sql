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
    updated_date        TIMESTAMPTZ     NOT NULL
  
);
