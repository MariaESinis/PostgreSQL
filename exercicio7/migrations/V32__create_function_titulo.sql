CREATE OR REPLACE FUNCTION ex7_helpers.fn_titulo(IN p_titulo TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_titulo ~ '^[A-Za-z0-9À-ÿ,.\- ]+$'
        AND length(trim(p_titulo)) >= 2
        AND p_titulo !~ '  '

    );
END;
$$;