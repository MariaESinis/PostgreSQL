CREATE TABLE IF NOT EXISTS ex7_academico.certificado(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000000
        CACHE 1
        SEQUENCE NAME seq_certificado_id
    ),

    data            TIMESTAMPTZ     NOT NULL,
    local           VARCHAR(60)     NOT NULL,
    duracao         INTEGER         NOT NULL
);