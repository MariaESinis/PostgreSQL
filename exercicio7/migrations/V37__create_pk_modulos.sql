DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_academico.modulos'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_academico.modulos
        ADD CONSTRAINT pk_modulos_id
        PRIMARY KEY (id);
    END IF;
END
$$;