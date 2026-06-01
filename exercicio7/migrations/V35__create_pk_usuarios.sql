DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_cadastro.usuarios'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_cadastro.usuarios
        ADD CONSTRAINT pk_usuarios_id
        PRIMARY KEY (id);
    END IF;
END
$$;