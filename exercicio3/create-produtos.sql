CREATE TYPE exercicio3.status_produtos AS ENUM (
    'ativo', 
    'indisponivel', 
    'promocao', 
    'esgotado', 
    'cancelado'
);

CREATE TABLE IF NOT EXISTS exercicio3.produtos(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000
        CACHE 1
        SEQUENCE NAME exercicio3.seq_produtos_id
    ),
    codigo_produto  VARCHAR(10)                 NOT NULL    DEFAULT exercicio3.fn_valida_codigo_produto(),
    nome            VARCHAR(150)                NOT NULL,
    descricao       VARCHAR(2000)               NOT NULL,
    preco           DECIMAL(10,2)               NOT NULL,
    estoque         INT                         NOT NULL,
    status          exercicio3.status_produtos  NOT NULL,
    data_cadastro   TIMESTAMPTZ                 NOT NULL    DEFAULT     CURRENT_TIMESTAMP,
    categoria       INT                         NOT NULL    REFERENCES  exercicio3.categorias(id),

    CONSTRAINT pk_produtos_id PRIMARY KEY (id),

    CONSTRAINT uq_produtos_codigo UNIQUE (codigo_produto),

    CONSTRAINT fk_produtos_categoria
        FOREIGN KEY(categoria)
        REFERENCES exercicio3.categorias (id),

    CONSTRAINT chk_produtos_nome CHECK(
        exercicio3.fn_valida_nome(nome)
    ),

    CONSTRAINT chk_produtos_descricao CHECK(
        exercicio3.fn_valida_descricao(descricao)
    ),

    CONSTRAINT chk_produtos_preco CHECK(
        preco > 0
    ),

    CONSTRAINT chk_produtos_estoque CHECK(
        estoque > 0
    )
);

