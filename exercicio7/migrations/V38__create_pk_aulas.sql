DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_academico.aulas'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_academico.aulas
        ADD CONSTRAINT pk_aulas_id
        PRIMARY KEY (id);
    END IF;
END
$$;