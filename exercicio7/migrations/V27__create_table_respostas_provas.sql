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
    status          ex7_avaliacao.respostas_provas_status     NOT NULL,
    prova_id        INTEGER                                   NOT NULL,
    estudante_id    INTEGER                                   NOT NULL,

    CONSTRAINT pk_respostas_provas_id PRIMARY KEY (id),

    CONSTRAINT chk_respostas_provas_data_envio
        CHECK (data_envio <= CURRENT_TIMESTAMP),
    
    CONSTRAINT chk_respostas_provas_notas
        CHECK (nota >=0 AND nota <=10),

    CONSTRAINT chk_respostas_provas_tempo_gasto
        CHECK (tempo_gasto >= 0),

    CONSTRAINT fk_prova_id
        FOREIGN KEY (prova_id)
        REFERENCES ex7_avaliacao.provas(id),

    CONSTRAINT fk_estudante_id
        FOREIGN KEY (estudante_id)
        REFERENCES ex7_cadastro.usuarios(id)
);