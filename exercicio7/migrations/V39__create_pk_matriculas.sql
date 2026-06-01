DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_academico.matriculas'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_academico.matriculas
        ADD CONSTRAINT pk_matriculas_id
        PRIMARY KEY (id);
    END IF;
END
$$;