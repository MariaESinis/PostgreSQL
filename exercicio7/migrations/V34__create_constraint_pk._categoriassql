DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_cadastro.categorias'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_cadastro.categorias
        ADD CONSTRAINT pk_categorias_id
        PRIMARY KEY (id);
    END IF;
END
$$;