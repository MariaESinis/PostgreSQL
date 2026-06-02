CREATE TABLE IF NOT EXISTS ex7_academico.cursos(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000000
        CACHE 1
        SEQUENCE NAME seq_cursos_id
    ),

    titulo          VARCHAR(120)                    NOT NULL,
    descricao       VARCHAR(120)                    NOT NULL,
    valor           DECIMAL(12,2)                   NOT NULL,
    duracao         INTEGER                         NOT NULL,
    nivel           ex7_academico.cursos_nivel      NOT NULL,
    status          ex7_academico.cursos_status     NOT NULL,
    categoria_id    INTEGER                         NOT NULL,
    

    CONSTRAINT pk_cursos_id PRIMARY KEY (id),

    CONSTRAINT uq_cursos_titulo UNIQUE (titulo),

    CONSTRAINT chk_cursos_descricao
        CHECK(ex7_helpers.fn_descricao(descricao)),

    CONSTRAINT chk_cursos_valor
        CHECK(valor >= 0),

    CONSTRAINT chk_cursos_duracao
        CHECK(duracao > 0)

    
);