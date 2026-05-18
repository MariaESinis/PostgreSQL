CREATE TYPE ex5_financeiro.reembolso_status AS ENUM(
    'aberta',
    'aprovada', 
    'recusada',
    'paga'
);

CREATE TABLE IF NOT EXISTS ex5_financeiro.reembolso(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000000
        CACHE 1
        SEQUENCE NAME seq_reembolso_id
    ),
    data_solicitacao        TIMESTAMPTZ                         NOT NULL,
    valor_solicitacao       DECIMAL(13,2)                       NOT NULL,
    descricao               VARCHAR(3000)                       NOT NULL,
    status                  ex5_financeiro.reembolso_status     NOT NULL        DEFAULT 'aberta',
    aprovador_id            INTEGER                             NOT NULL,
    funcionario_id          INTEGER                             NOT NULL,
    departamento_id         INTEGER                             NOT NULL,


    CONSTRAINT pk_reembolso_id PRIMARY KEY(id),

    CONSTRAINT chk_reembolso_valor_solicitado CHECK(
        valor_solicitacao > 0
    ),

    CONSTRAINT fk_funcionario_id FOREIGN KEY(
        funcionario_id) REFERENCES 
        ex5_rh.funcionario(id)
    ,
    CONSTRAINT fk_departamento_id FOREIGN KEY(
        departamento_id) REFERENCES 
        ex5_rh.departamento(id)

)