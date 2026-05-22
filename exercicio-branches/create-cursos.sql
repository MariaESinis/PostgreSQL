CREATE TABLE IF NOT EXISTS  escola_magia.curso(
    id  INTERGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000
        CACHE 1
        SEQUENCE seq_curso_id
    ),

    nome        VARCHAR(150)    NOT NULL,
    professor   VARCHAR(150)    NOT NULL
);