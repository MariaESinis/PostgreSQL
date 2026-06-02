CREATE OR REPLACE FUNCTION ex7_helpers.fn_senha(IN p_senha TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_senha ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{8,}$'
    );
END;
$$;