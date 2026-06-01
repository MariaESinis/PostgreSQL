CREATE TABLE IF NOT EXISTS ex7_academico.aulas(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_aulas_id
    ),

    url         VARCHAR(2500)                   NOT NULL,
    titulo      VARCHAR(120)                    NOT NULL,
    duracao     INTEGER                         NOT NULL,
    ordem       SMALLINT                        NOT NULL,
    status      ex7_academico.aulas_status       NOT NULL
);