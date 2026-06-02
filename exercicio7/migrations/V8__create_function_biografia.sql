CREATE OR REPLACE FUNCTION ex7_helpers.fn_biografia(IN p_biografia TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_biografia ~ '^[A-Za-z0-9À-ÿ,.\- ]+$'
        AND length(trim(p_biografia)) >= 10
        AND p_biografia !~ '  '

    );
END;
$$;