--Este arquivo contém todas as functions referentes as tabelas do exercicio4

--Functions referentes a tabela animal
--Valida nome da tabela animal
CREATE OR REPLACE FUNCTION exercicio4.fn_animal_nome(IN p_nome TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN  
    RETURN (
        length(trim(p_nome)) >=2
        AND p_nome ~ '[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ]*[A-Za-zÀ-ÿ]$'
        AND !~ '  '
    );
END;
$$;

--Functions referentes a tabela tutor
--Valida email da tabela tutor
CREATE OR REPLACE FUNCTION exercicio4.fn_tutor_email(IN p_email TEXT)
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

--Functions referentes a tabela raça
--Valida raça da tabela raça
CREATE OR REPLACE FUNCTION exercicio4.fn_raca_raca(IN p_raca TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        lenght(trim(p_nome)) >=3
        AND ~'[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ]*[A-Za-zÀ-ÿ]$'
        AND p_nome !~ '  '
    );
END;
$$;

--Valida especie da tabela raça
CREATE OR REPLACE FUNCTION exercicio4.fn_raca_especie(IN p_especie TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        lenght(trim(p_nome)) >=3
        AND ~'[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ]*[A-Za-zÀ-ÿ]$'
        AND p_nome !~ '  '
    );
END;
$$;

--functions referentes a tabela veterinario
--Valida o CRMV da tabela veterinario
CREATE OR REPLACE FUNCTION exercicio4.fn_veterinario_crmv(IN p_crmv TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        substring(p_crmv FROM 1 FOR 4) = 'CRMV'
        AND substring(p_crmv FROM 5 FOR 2) IN (
            'AC', 'AL', 'AP', 'AM', 'BA', 
            'CE', 'DF', 'ES', 'GO', 'MA', 
            'MT', 'MS', 'MG', 'PA', 'PB', 
            'PR', 'PE', 'PI', 'RJ', 'RN', 
            'RS', 'RO', 'RR', 'SC', 'SP', 
            'SE', 'TO')
        AND substring(p_crmv FROM 7) ~ '^[0-9]{3,5}$'
    );
END;
$$;


--Valida a especialidade da tabela veterinario
CREATE OR REPLACE FUNCTION exercicio4.fn_veterinario_especialidade(IN p_esp TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
        length(trim(p_nome)) >= 3        
        AND p_nome ~ '^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ ]*[A-Za-zÀ-ÿ]$' 
        AND p_nome !~ '  ' -- Evita espaços duplos
    );
END;
$$;

--Functions gerais
--Valida nome
CREATE OR REPLACE FUNCTION exercicio4.fn_nome(IN p_nome TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN   
    RETURN(
        lenght(trim(p_nome)) >=3
        AND ~'[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ]*[A-Za-zÀ-ÿ]$'
        AND p_nome !~ '  '
    );
END;
$$;

--Valida telefone
CREATE OR REPLACE FUNCTION exercicio4.fn_telefone(IN p_tel TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN(
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

--Valida CPF
CREATE OR REPLACE FUNCTION exercicio4.fn_cpf(IN p_cpf TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $FUNCTION$
DECLARE
    v_soma INTEGER;
    v_resto INTEGER;
    v_dig1 INTEGER;
    v_dig2 INTEGER;
    v_i INTEGER;
BEGIN
    -- remove caracteres não numéricos

    -- precisa ter 11 dígitos
    IF length(p_cpf) <> 11 THEN
        RETURN FALSE;
    END IF;

    -- evita CPFs iguais
    IF p_cpf IN (
        '00000000000','11111111111','22222222222',
        '33333333333','44444444444','55555555555',
        '66666666666','77777777777','88888888888',
        '99999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    -- primeiro dígito
    v_soma := 0;

    FOR v_i IN 1..9 LOOP
        v_soma := v_soma + (substring(p_cpf, v_i, 1)::INTEGER * (11 - i));
    END LOOP;

    v_resto := (v_soma * 10) % 11;

    IF v_resto = 10 THEN
        v_resto := 0;
    END IF;

    v_dig1 := v_resto;

    -- segundo dígito
    v_soma := 0;

    FOR v_i IN 1..10 LOOP
        v_soma := v_soma + (substring(p_cpf, v_i, 1)::INTEGER * (12 - i));
    END LOOP;

    v_resto := (v_soma * 10) % 11;

    IF v_resto = 10 THEN
        v_resto := 0;
    END IF;

    v_dig2 := v_resto;

    RETURN (
        v_dig1 = substring(p_cpf, 10, 1)::INTEGER
        AND
        v_dig2 = substring(p_cpf, 11, 1)::INTEGER
    );
END;
$FUNCTION$;

CREATE OR REPLACE FUNCTION exercicio4.fn_animal_diagnostico (IN p_diagnostico TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_diagnostico ~ '^[A-Za-z0-9À-ÿ,.\- ]+$'
        AND length(trim(p_diagnostico)) >= 10
        AND p_diagnostico !~ '  '

    );
END;
$$;

--Valida o CEP
CREATE OR REPLACE FUNCTION exercicio4.fn_cep (IN p_cep TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_cep ~ '^\d{8}$'
    );
END;
$$;

--Validar CNPJ

CREATE OR REPLACE FUNCTION exercicio4.fn_cnpj(IN p_cnpj TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS
$$
DECLARE
    v_cnpj TEXT;
    v_soma INTEGER;
    v_peso INTEGER;
    v_dig1 INTEGER;
    v_dig2 INTEGER;
    i INTEGER;
BEGIN
    -- Remove qualquer caractere não numérico
    v_cnpj := regexp_replace(p_cnpj, '\D', '', 'g');

    -- Deve ter exatamente 14 dígitos
    IF length(v_cnpj) <> 14 THEN
        RETURN FALSE;
    END IF;

    -- Rejeita sequências repetidas
    IF v_cnpj IN (
        '00000000000000',
        '11111111111111',
        '22222222222222',
        '33333333333333',
        '44444444444444',
        '55555555555555',
        '66666666666666',
        '77777777777777',
        '88888888888888',
        '99999999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    /*
     * PRIMEIRO DÍGITO
     */
    v_soma := 0;
    v_peso := 5;

    FOR i IN 1..12 LOOP
        v_soma := v_soma +
            CAST(substr(v_cnpj, i, 1) AS INTEGER) * v_peso;

        v_peso := v_peso - 1;

        IF v_peso < 2 THEN
            v_peso := 9;
        END IF;
    END LOOP;

    v_dig1 := v_soma % 11;

    IF v_dig1 < 2 THEN
        v_dig1 := 0;
    ELSE
        v_dig1 := 11 - v_dig1;
    END IF;

    /*
     * SEGUNDO DÍGITO
     */
    v_soma := 0;
    v_peso := 6;

    FOR i IN 1..13 LOOP
        v_soma := v_soma +
            CAST(substr(v_cnpj, i, 1) AS INTEGER) * v_peso;

        v_peso := v_peso - 1;

        IF v_peso < 2 THEN
            v_peso := 9;
        END IF;
    END LOOP;

    v_dig2 := v_soma % 11;

    IF v_dig2 < 2 THEN
        v_dig2 := 0;
    ELSE
        v_dig2 := 11 - v_dig2;
    END IF;

    -- Valida os dígitos finais
    RETURN
        v_dig1 = CAST(substr(v_cnpj, 13, 1) AS INTEGER)
        AND
        v_dig2 = CAST(substr(v_cnpj, 14, 1) AS INTEGER);
END;
$$;