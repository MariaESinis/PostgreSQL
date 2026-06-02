CREATE TABLE IF NOT EXISTS ex7_academico.certificado(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000000
        CACHE 1
        SEQUENCE NAME seq_certificado_id
    ),

    data             TIMESTAMPTZ     NOT NULL,
    local            VARCHAR(60)     NOT NULL,
    duracao          INTEGER         NOT NULL,
    matricula_id     INTEGER         NOT NULL,
    usuario_id       INTEGER         NOT NULL,
    curso_id         INTEGER         NOT NULL,

    CONSTRAINT pk_certificado_id PRIMARY KEY (id),

    CONSTRAINT chk_certificado_data
        CHECK (data <= CURRENT_TIMESTAMP),

    CONSTRAINT chk_certificado_local
        CHECK(ex7_helpers.fn_nome(local)),

    CONSTRAINT chk_certificado_duracao
        CHECK (duracao > 0)

);