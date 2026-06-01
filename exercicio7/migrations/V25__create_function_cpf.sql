CREATE OR REPLACE FUNCTION ex7_helpers.fn_cpf(IN p_cpf TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
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
$$;