DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_aulas_url'
    ) THEN
        ALTER TABLE ex7_academico.aulas
        ADD CONSTRAINT chk_aulas_url
        CHECK (ex7_helpers.fn_url(url));
    END IF;
END
$$;