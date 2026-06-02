DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_matricula_id'
        AND conrelid = 'ex7_academico.certificado'::regclass
    ) THEN
        ALTER TABLE ex7_academico.certificado
        ADD CONSTRAINT fk_matricula_id
        FOREIGN KEY (matricula_id)
        REFERENCES ex7_academico.matriculas(id);
    END IF;
END
$$;