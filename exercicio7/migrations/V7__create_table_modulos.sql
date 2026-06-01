CREATE TABLE IF NOT EXISTS ex7_academico.modulos(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_modulos_id
    ),

    nome        VARCHAR(100)        NOT NULL,
    ordem       CHAR(1)             NOT NULL
);