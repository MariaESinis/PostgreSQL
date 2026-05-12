CREATE SCHEMA IF NOT EXISTS exercicio3;
--CREATE TYPE exercicio3.status AS ENUM ('ativo', 'inativo', 'bloqueado', 'arquivada');

--Funcao valida nome
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

