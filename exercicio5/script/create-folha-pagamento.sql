CREATE TYPE ex5_financeiro.pagamento_status AS ENUM(
    'pendente',
    'processado',
    'cancelado'
);

CREATE TABLE IF NOT EXISTS ex5_financeiro.pagamento(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_pagamento_id
    ),
    competencia         VARCHAR(12)                             NOT NULL,
    data_pagamento      TIMESTAMPTZ                             NOT NULL,
    valor_bruto         DECIMAL(11,2)                           NOT NULL,
    valor_desconto      DECIMAL(11,2)                           NOT NULL,
    valor_liquido       DECIMAL(11,2)                           NOT NULL,
    status              ex5_financeiro.pagamento_status         NOT NULL,
    funcionario_id      INTEGER                                 NOT NULL,

    CONSTRAINT pk_pagamento_id PRIMARY KEY(id),
    CONSTRAINT fk_financeiro_funcionario_id FOREIGN KEY (funcionario_id) REFERENCES (ex5_rh.funcionario(id)),
)