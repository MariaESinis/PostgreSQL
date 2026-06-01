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
    status                ex7_avaliacao.provas_status   NOT NULL        
);