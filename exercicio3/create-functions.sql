--Functions para todas as tabelas


-- Funcao valida nome da tabela usuario
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

-- Funcao valida telefone da tabela usuario
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_telefone(IN p_tel TEXT) 
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        p_tel ~ '^[0-9]{10,11}$'                  
        AND (
            length(p_tel) = 10 
            OR (length(p_tel) = 11 AND substring(p_tel from 3 for 1) = '9')
        )
        AND substring(p_tel from 1 for 2) IN (
            '11', '12', '13', '14', '15', '16', '17', '18', '19', '21', '22', '24', '27', '28', '31', '32', '33', 
            '34', '35', '37', '38', '41', '42', '43', '44', '45', '46', '47', '48', '49', '51', '53', '54', '55', 
            '61', '62', '63', '64', '65', '66', '67', '68', '69', '71', '73', '74', '75', '77', '79', '81', '82', 
            '83', '84', '85', '86', '87', '88', '89', '91', '92', '93', '94', '95', '96', '97', '98', '99'
        )
    );
END;
$$;

-- Funcao valida email da tabela usuario
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_email(IN p_email TEXT)
RETURNS BOOLEAN 
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
    RETURN (
        p_email LIKE '_%@%._%' 
        AND p_email ~* '^[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,255}\.[A-Z]{2,}$' 
    );
END;
$$;

--Valida codigo produto da tabela produtos
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

--Valida nome da tabela produtos
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

--Valida descricao da tabela produtos
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

--Valida da codigo do pedido da tabela pedidos
CREATE OR REPLACE FUNCTION exercicio3.fn_valida_codigo_pedido()
RETURNS VARCHAR(17)
LANGUAGE plpgsql
VOLATILE
AS $$

BEGIN
    RETURN
        'PED-' ||
        TO_CHAR(TIMESTAMPTZ, 'YYYYMMDD') ||
        '-' ||
        UPPER(SUBSTRING(MD5(RANDOM()::TEXT) FROM 1 FOR 4));

END;
$$;

--Funcao valida nome da tabela categorias
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