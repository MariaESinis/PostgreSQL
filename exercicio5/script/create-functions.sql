CREATE OR REPLACE FUNCTION ex5_helpers.fn_nome(IN p_nome TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        trim(p_nome) ~ '^[A-Za-zÀ-ÿ]+( [A-Za-zÀ-ÿ]+)*$'
        AND length(trim(p_nome)) >= 3
        AND p_nome !~ '  '
    );
END;
$$;

CREATE OR REPLACE FUNCTION ex5_helpers.fn_email(IN p_email TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        p_email LIKE '_%@%._%' 
        AND p_email ~* '^[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,255}\.[A-Z]{2,}$'
    );
END;
$$;


CREATE OR REPLACE FUNCTION ex5_helpers.fn_telefone(IN p_tel TEXT) 
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

CREATE OR REPLACE FUNCTION ex5_helpers.fn_num_serie(IN p_nome TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_nome ~ '^[A-Za-z0-9]+$'
        AND length(p_nome) >= 3
    );
END;
$$;

CREATE OR REPLACE FUNCTION ex5_helpers.fn_nome_perfil(IN p_nome TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_nome ~ '^[A-Za-z0-9]+$'
        AND length(p_nome) >= 3

    );
END;
$$;

CREATE OR REPLACE FUNCTION ex5_helpers.fn_motivo(IN p_motivo TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_motivo ~ '^[A-Za-z0-9À-ÿ]+$'
        AND length(trim(p_motivo)) >= 10
        AND p_motivo !~ '  '

    );
END;
$$;