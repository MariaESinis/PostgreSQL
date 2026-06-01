CREATE TABLE IF NOT EXISTS ex7_avaliacao.respostas_provas(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_respostas_provas_id
    ),

    data_envio      TIMESTAMPTZ                               NOT NULL,
    nota            DECIMAL(4,2)                              NOT NULL,
    tempo_gasto     INTEGER                                   NOT NULL,
    status          ex7_avaliacao.respostas_provas_status     NOT NULL
);