CREATE OR REPLACE FUNCTION ex7_helpers.fn_email(p_email TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_email IS NULL THEN
        RETURN FALSE;
    END IF;

    RETURN p_email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
END;
$$;