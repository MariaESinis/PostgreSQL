CREATE TABLE IF NOT EXISTS exercicio4.especialidade(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME seq_especialide_id
    ),

    nome            VARCHAR(150)    NOT NULL,
    descricao       VARCHAR(1000)   NOT NULL,
    created_at      TIMESTAMPTZ     NOT NULL,

    CONSTRAINT pk_especialidade_id PRIMARY KEY(id),

    CONSTRAINT chk_nome CHECK(
        exercicio4.fn_nome(nome)
    ),
    
    CONSTRAINT chk_descricao CHECK(
        exercicio4.fn_nome(descricao)
    )
);