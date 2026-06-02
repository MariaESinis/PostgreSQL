CREATE OR REPLACE FUNCTION ex7_helpers.fn_nome(IN p_nome TEXT)
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


