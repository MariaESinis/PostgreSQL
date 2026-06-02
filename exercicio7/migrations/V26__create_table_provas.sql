CREATE TABLE IF NOT EXISTS ex7_avaliacao.provas(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_provas_id
    ),

    titulo                VARCHAR(120)                  NOT NULL,
    quantidade_questoes   SMALLINT                      NOT NULL,
    nota_minima           DECIMAL(4,2)                  NOT NULL,
    tempo_limite          INTEGER                       NOT NULL,
    status                ex7_avaliacao.provas_status   NOT NULL,
    modulo_id              INTEGER                       NOT NULL,
    instrutor_id          INTEGER                       NOT NULL,

    CONSTRAINT pk_provas_id PRIMARY KEY (id),

    CONSTRAINT chk_provas_titulo
        CHECK(ex7_helpers.fn_titulo(titulo)),

    CONSTRAINT chk_provas_quantidade_questoes
        CHECK(quantidade_questoes > 0),

    CONSTRAINT chk_provas_nota_minima
        CHECK(nota_minima >= 0),

    CONSTRAINT chk_provas_tempo_limite
        CHECK(tempo_limite > 0),

    CONSTRAINT fk_modulo_id
        FOREIGN KEY(modulo_id)
        REFERENCES ex7_academico.modulos(id),

    CONSTRAINT fk_instrutor_id
        FOREIGN KEY(instrutor_id)       
        REFERENCES ex7_cadastro.instrutores(id)

);