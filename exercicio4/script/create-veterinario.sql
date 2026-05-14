CREATE TYPE exercicio4.status_veterinario AS ENUM(
    'ativo',
    'afastado',
    'desligado'
);


CREATE TABLE IF NOT EXISTS exercicio4.veterinario(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_veterinario_id
    ),
	
    nome                    VARCHAR(150)                        NOT NULL,
    crmv                    VARCHAR(11)                         NOT NULL,
    cpf                     VARCHAR(11)                         NOT NULL,
    especialidade           VARCHAR(60)                         NOT NULL,
    data_contratacao        TIMESTAMPTZ                         NOT NULL,
    situacao                exercicio4.status_veterinario       NOT NULL       DEFAULT 'ativo',
    created_at              TIMESTAMPTZ                         NOT NULL,
    updated_at              TIMESTAMPTZ                         NOT NULL,
    
    CONSTRAINT pk_veterinario_id PRIMARY KEY(id),
    
    CONSTRAINT chk_veterinario_nome CHECK(
        exercicio4.fn_nome(nome)
    ),
    CONSTRAINT chk_veterinario_crmv CHECK(
        exercicio4.fn_veterinario_crmv(crmv)
    ),
    CONSTRAINT chk_veterinario_cpf CHECK(
        exercicio4.fn_cpf(cpf)
    ),
    CONSTRAINT chk_veterinario_especialidade CHECK(
        exercicio4.fn_veterinario_especialidade(especialidade)
    )

);
