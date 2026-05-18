CREATE TYPE ex5_rh.historico_status AS ENUM(
    'admissao',
    'promocao',
    'transferencia',
    'afastamento', 
    'desligamento'
);

CREATE TABLE IF NOT EXISTS ex5_rh.fn_historico(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_historico_id
    ),
    tipo                ex5_rh.historico_status     NOT NULL,
    data                TIMESTAMPTZ                 NOT NULL,
    descricao           VARCHAR(1000)               NOT NULL,
    responsavel         VARCHAR(150)                NOT NULL,
    funcionario_id      INTEGER                     NOT NULL,

    CONSTRAINT pk_historico_id PRIMARY KEY(id),

    CONSTRAINT chk_historico_responsavel CHECK(ex5_helpers.fn_nome(responsavel)),

    CONSTRAINT fk_funcionario_id FOREIGN KEY(funcionario_id) REFERENCES ex5_rh.funcionario(id)
)