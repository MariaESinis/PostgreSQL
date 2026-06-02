CREATE TABLE IF NOT EXISTS ex7_academico.modulos(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_modulos_id
    ),

    nome          VARCHAR(100)        NOT NULL,
    ordem         CHAR(1)             NOT NULL,
    instrutor_id  INTEGER             NOT NULL,  

    CONSTRAINT pk_modulos_id PRIMARY KEY (id),

    CONSTRAINT chk_modulos_nome
        CHECK(ex7_helpers.fn_nome(nome)),

    CONSTRAINT chk_modulos_ordem
        CHECK(ordem IN('1','2','3','4','5')),

    CONSTRAINT fk_instrutor_id
        FOREIGN KEY(instrutor_id)
        REFERENCES ex7_cadastro.instrutores(id)
);