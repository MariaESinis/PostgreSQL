CREATE TYPE ex5_ti.equipamento_status AS ENUM(
    'disponivel',
    'alocado',
    'manutencao',
    'baixado'
);

CREATE TABLE IF NOT EXISTS ex5_ti.equipamentos(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_equipamento_id
    ),
    num_patrimonial         INTEGER                         NOT NULL,
    num_serie               VARCHAR(10)                     NOT NULL,
    fabricante              VARCHAR(100)                    NOT NULL,
    modelo                  VARCHAR(150)                    NOT NULL,
    data_aquisicao          TIMESTAMPTZ                     NOT NULL,
    valor_aquisicao         DECIMAL(11,2)                   NOT NULL,
    situacao                ex5_ti.equipamento_status       NOT NULL,
    created_at              TIMESTAMPTZ                     NOT NULL,
    updated_at              TIMESTAMPTZ                     NOT NULL,

    CONSTRAINT pk_equipamento_id PRIMARY KEY(id),

    CONSTRAINT uq_equipamento_num_patrimonial UNIQUE(num_patrimonial),
    CONSTRAINT uq_equipamento_num_serie UNIQUE(num_serie),

    CONSTRAINT chk_equipamento_valor_aquisicao CHECK(
        valor_aquisicao > 0
    )
)