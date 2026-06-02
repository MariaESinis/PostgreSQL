DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_usuario_id'
        AND conrelid = 'ex7_academico.certificado'::regclass
    ) THEN
        ALTER TABLE ex7_academico.certificado
        ADD CONSTRAINT fk_usuario_id
        FOREIGN KEY (usuario_id)
        REFERENCES ex7_cadastro.usuarios(id);
    END IF;
END
$$;