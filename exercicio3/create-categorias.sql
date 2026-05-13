CREATE TYPE exercicio3.status AS ENUM (
    'ativo', 
    'inativo', 
    'bloqueado', 
    'arquivada'
);

CREATE TABLE IF NOT EXISTS exercicio3.categorias(
    id INTEGER	GENERATED ALWAYS AS IDENTITY(
        START WITH 1
        INCREMENT BY 1
        MINVALUE 1
        MAXVALUE 1000
        CACHE 1
        SEQUENCE NAME exercicio3.seq_categorias_id
    ),
    nome          VARCHAR(150)           NOT NULL,
    status        exercicio3.status      NOT NULL   DEFAULT 'ativo',
    data_criacao  TIMESTAMPTZ            NOT NULL   DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_categorias_id PRIMARY KEY(id)
);

