DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'uq_cursos_titulo'
    ) THEN
        ALTER TABLE ex7_academico.cursos
        ADD CONSTRAINT uq_cursos_titulo
        UNIQUE (titulo);
    END IF;
END
$$;