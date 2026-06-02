DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_curso_id'
    ) THEN
        ALTER TABLE ex7_academico.certificado
        ADD CONSTRAINT fk_curso_id
        FOREIGN KEY (curso_id)
        REFERENCES ex7_academico.cursos(id);
    END IF;
END
$$;