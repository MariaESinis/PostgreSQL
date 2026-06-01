DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'ck_usuario_tel'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT ck_usuario_tel
        CHECK (ex7_helpers.fn_telefone(telefone));
    END IF;
END
$$;