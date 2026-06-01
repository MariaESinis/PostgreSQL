DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'ck_usuario_email'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT ck_usuario_email
        CHECK (ex7_helpers.fn_email(email));
    END IF;
END
$$;