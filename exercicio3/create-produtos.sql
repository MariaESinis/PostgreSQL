CREATE SCHEMA IF NOT EXISTS exercicio3;
CREATE TYPE exercicio3.status AS ENUM ('ativo', 'indisponivel', 'promocao', 'esgotado', 'cancelado');

--Valida codigo produto
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_codigo_produto()
RETURNS VARCHAR(10)
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN 
        'PRD-' || UPPER(SUBSTRING(MD5(RANDOM()::TEXT) FROM 1 FOR 6));
END;
$$;

--Valida nome
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_nome(IN p_nome TEXT)
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        length(trim(p_nome)) >= 3        
        AND p_nome ~ '^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ ]*[A-Za-zÀ-ÿ]$' 
        AND p_nome !~ '  ' -- Evita espaços duplos
    );
END;
$$;

--Valida descricao
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_descricao(IN p_descricao TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN   
    RETURN(
        length(trim(p_descricao)) >= 20
        AND p_descricao !~ '  ' -- Evita espaços duplos
    );
END;
$$;


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
    nome            VARCHAR(150)        NOT NULL,
    descricao       VARCHAR(2000)       NOT NULL,
    preco           DECIMAL(10,2)       NOT NULL,
    estoque         INT                 NOT NULL,
    status          exercicio3.status   NOT NULL,
    data_cadastro   TIMESTAMPTZ         NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    categoria       INT                 NOT NULL,

    CONSTRAINT pk_produtos_id PRIMARY KEY (id),

    CONSTRAINT uq_produtos_codigo UNIQUE (codigo_produto),

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

