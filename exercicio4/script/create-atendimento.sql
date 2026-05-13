CREATE TYPE exercicio4.situacao_atendimento AS ENUM(
    'agendado',
    'concluido',
    cancelado
);

CREATE TABLE IF NOT EXIST exercicio4.atendimento(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH o
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_atendimento_id
    ),
    diagnostico     VARCHAR(1000)                       NOT NULL,
    valor           DECIMAL(8,2)                        NOT NULL,
    situacao        exercicio4.situacao_atendimento     NOT NULL,
    periodo         TST2RANGE                           NOT NULL,
    created_at      TIMESTAMPTZ                         NOT NULL,

    CONSTRAINT pk_atendimento_id PRIMARY KEY(id),

    CONSTRAINT chk_atendimento_valor CHECK (valor > 0),
    --CONSTRAINT de periodo

);