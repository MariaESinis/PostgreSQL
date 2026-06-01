CREATE TABLE IF NOT EXISTS ex7_academico.matriculas(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_matriculas_id
    ),
    
    data_matricula      TIMESTAMPTZ                         NOT NULL,
    status              ex7_cadastro.matriculas_status      NOT NULL,
    progresso           INTEGER                             NOT NULL
);