DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'uq_usuarios_tel'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT uq_usuarios_tel
        UNIQUE (telefone);
    END IF;
END
$$;