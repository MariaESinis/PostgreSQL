CREATE OR REPLACE FUNCTION ex7_helpers.fn_valida_soft_delete(
    p_deleted_at TIMESTAMPTZ,
    p_is_deleted BOOLEAN
)
RETURNS BOOLEAN
LANGUAGE SQL
IMMUTABLE
AS $$
    SELECT (p_deleted_at IS NOT NULL) = p_is_deleted;
$$;