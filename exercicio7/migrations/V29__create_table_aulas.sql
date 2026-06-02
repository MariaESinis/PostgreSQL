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
    status      ex7_academico.aulas_status      NOT NULL,
    modulo_id   INTEGER                         NOT NULL,

    CONSTRAINT pk_aulas_id PRIMARY KEY (id),

    CONSTRAINT uq_aulas_url UNIQUE (url),

    CONSTRAINT chk_aulas_titulo
        CHECK(ex7_helpers.fn_titulo(titulo)),

    CONSTRAINT chk_aulas_duracao
        CHECK (duracao > 0),

    CONSTRAINT chk_auLas_ordem
        CHECK ( ordem >=1),

    CONSTRAINT fk_modulo_id 
        FOREIGN KEY (modulo_id)
        REFERENCES ex7_academico.modulos(id)        

);