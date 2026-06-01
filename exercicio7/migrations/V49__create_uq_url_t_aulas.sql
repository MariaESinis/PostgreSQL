DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'uq_aulas_url'
    ) THEN
        ALTER TABLE ex7_academico.aulas
        ADD CONSTRAINT uq_aulas_url
        UNIQUE (url);
    END IF;
END
$$;