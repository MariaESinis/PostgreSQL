DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_cadastro.instrutores'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_cadastro.instrutores
        ADD CONSTRAINT pk_instrutores_id
        PRIMARY KEY (id);
    END IF;
END
$$;