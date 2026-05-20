CREATE TYPE ex5_ti.alocacao_equipamentos_status AS ENUM(
    'ativa', 
    'encerrada', 
    'cancelada'
);

CREATE TABLE IF NOT EXISTS ex5_ti.alocacao_equipamentos(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_alocacao_equipamentos_id
    ),
    periodo             TSTZRANGE                               NOT NULL,
    motivo              VARCHAR(1000)                           NOT NULL,
    situacao            ex5_ti.alocacao_equipamentos_status     NOT NULL    DEFAULT 'ativa',
    funcionario_id      INTEGER                                 NOT NULL,
    equipamento_id      INTEGER                                 NOT NULL,

    CONSTRAINT pk_reembolso_id PRIMARY KEY(id),
    
    CONSTRAINT chk_motivo CHECK(
        ex5_helpers.fn_motivo(motivo)
    ),

    CONSTRAINT fk_funcionario_id FOREIGN KEY(
        funcionario_id) REFERENCES 
        ex5_rh.funcionario(id),

    CONSTRAINT fk_equipamento_id FOREIGN KEY(
        equipamento_id) REFERENCES 
        ex5_rh.departamento(id)
);
