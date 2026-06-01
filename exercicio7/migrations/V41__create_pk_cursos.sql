DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_academico.cursos'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_academico.cursos
        ADD CONSTRAINT pk_cursos_id
        PRIMARY KEY (id);
    END IF;
END
$$;