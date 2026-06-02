CREATE OR REPLACE FUNCTION ex7_helpers.fn_url(p_url TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN p_url ~* '^https?://([a-z0-9-]+\.)+[a-z]{2,}(/[^\s]*)?$';
END;
$$;