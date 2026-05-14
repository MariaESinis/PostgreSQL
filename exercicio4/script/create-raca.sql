CREATE TABLE IF NOT EXISTS exercicio4.raca(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_raca_id
    ),

    raca                VARCHAR(45)         NOT NULL,
    especie             VARCHAR(50)         NOT NULL,
    created_at          TIMESTAMPTZ         NOT NULL,
    updated_at          TIMESTAMPTZ         NOT NULL,

    CONSTRAINT pk_raca_id PRIMARY KEY(id),
    
    CONSTRAINT uq_especie UNIQUE(especie),

    CONSTRAINT chk_raca_raca CHECK(
        exercicio4.fn_raca_raca(raca)
    ),
    CONSTRAINT chk_raca_especie CHECK(
        exercicio4.fn_raca_especie(especie)
    )
);
