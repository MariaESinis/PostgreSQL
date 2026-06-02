CREATE TABLE IF NOT EXISTS ex7_cadastro.categorias(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME seq_categorias_id
    ),

    nome            VARCHAR(150)    NOT NULL,
    descricao       VARCHAR(300)    NULL,

    CONSTRAINT pk_categorias_id PRIMARY KEY (id),

    CONSTRAINT uq_categorias_nome UNIQUE (nome)
);