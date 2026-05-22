CREATE TABLE IF NOT EXISTS escola_magia.aluno(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME seq_aluno_id
    ),

    nome        VARCHAR(150)        NOT NULL,
    idade       SMALLINT            NOT NULL
);