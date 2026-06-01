DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_academico.certificado'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_academico.certificado
        ADD CONSTRAINT pk_certificado_id
        PRIMARY KEY (id);
    END IF;
END
$$;