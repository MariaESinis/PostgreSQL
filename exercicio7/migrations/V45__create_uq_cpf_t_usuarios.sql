DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'uq_usuarios_cpf'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT uq_usuarios_cpf
        UNIQUE (cpf);
    END IF;
END
$$;