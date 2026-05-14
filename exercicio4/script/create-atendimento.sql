CREATE TYPE exercicio4.situacao_atendimento AS ENUM(
    'agendado',
    'concluido',
    'cancelado'
);

CREATE TABLE IF NOT EXISTS exercicio4.atendimento(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_atendimento_id
    ),
    diagnostico     VARCHAR(1000)                       NOT NULL,
    valor           DECIMAL(8,2)                        NOT NULL,
    situacao        exercicio4.situacao_atendimento     NOT NULL,
    periodo         TSTZRANGE                           NOT NULL,
    created_at      TIMESTAMPTZ                         NOT NULL,
    animal_id       INTEGER                             NOT NULL    REFERENCES exercicio4.animal(id),
    veterinario_id  INTEGER                             NOT NULL    REFERENCES exercicio4.veterinario(id),
    
    CONSTRAINT pk_atendimento_id PRIMARY KEY(id),

    CONSTRAINT ex_atendimento_animal_periodo EXCLUDE USING GIST(
        animal_id WITH =,
        periodo WITH &&
    ),

    CONSTRAINT ex_atenimento_veterinario_periodo EXCLUDE USING GIST(
        veterinario_id WITH =,
        periodo WITH &&
    ),

    CONSTRAINT chk_atendimento_valor CHECK (valor > 0)

);