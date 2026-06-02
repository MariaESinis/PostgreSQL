DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_usuario_id'
    ) THEN
        ALTER TABLE ex7_cadastro.instrutores
        ADD CONSTRAINT fk_usuario_id
        FOREIGN KEY (usuario_id)
        REFERENCES ex7_cadastro.usuarios(id);
    END IF;
END
$$;