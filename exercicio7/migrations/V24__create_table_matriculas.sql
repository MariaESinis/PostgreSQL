CREATE TABLE IF NOT EXISTS ex7_academico.matriculas(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_matriculas_id
    ),
    
    data_matricula      TIMESTAMPTZ                         NOT NULL,
    status              ex7_academico.matriculas_status     NOT NULL,
    progresso           INTEGER                             NOT NULL,
    modulo_id           INTEGER                             NOT NULL,
    usuario_id          INTEGER                             NOT NULL,

    CONSTRAINT pk_matriculas_id PRIMARY KEY (id),

    CONSTRAINT chk_matriculas_data_matricula
        CHECK (data_matricula <= CURRENT_TIMESTAMP),

    CONSTRAINT chk_matriculas_progresso
        CHECK (progresso >= 0 AND progresso <= 100),

    CONSTRAINT fk_matriculas_usuario_id
        FOREIGN KEY(usuario_id)
        REFERENCES ex7_cadastro.usuarios(id)
);