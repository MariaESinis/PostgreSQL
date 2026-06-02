DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_modulo_id'
    ) THEN
        ALTER TABLE ex7_academico.matriculas
        ADD CONSTRAINT fk_modulo_id
        FOREIGN KEY (modulo_id)
        REFERENCES ex7_academico.modulos(id);
    END IF;
END
$$;