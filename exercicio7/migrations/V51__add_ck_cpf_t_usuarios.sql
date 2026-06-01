DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'ck_usuario_cpf'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT ck_usuario_cpf
        CHECK (ex7_helpers.fn_cpf(cpf));
    END IF;
END
$$;