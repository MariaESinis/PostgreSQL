CREATE OR REPLACE FUNCTION ex7_helpers.fn_url(IN p_url TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        p_url ~ '^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\/.*)?$'
    );
END;
$$;