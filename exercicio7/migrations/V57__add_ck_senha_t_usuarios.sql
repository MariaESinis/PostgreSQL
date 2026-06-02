DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'ck_usuario_senha'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT ck_usuario_senha
        CHECK (ex7_helpers.fn_senha);
    END IF;
END
$$;