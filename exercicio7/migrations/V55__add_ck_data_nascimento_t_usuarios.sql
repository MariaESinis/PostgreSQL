DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'ck_usuario_data_nascimento'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT ck_usuario_data_nascimento
        CHECK (data_nascimento <= CURRENT_DATE);
    END IF;
END
$$;