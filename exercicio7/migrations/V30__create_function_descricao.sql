CREATE OR REPLACE FUNCTION ex7_helpers.fn_descricao(IN p_descricao TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_descricao ~ '^[A-Za-z0-9À-ÿ,.\- ]+$'
        AND length(trim(p_descricao)) >= 10
        AND p_descricao !~ '  '

    );
END;
$$;