DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'uq_categorias_nome'
    ) THEN
        ALTER TABLE ex7_cadastro.categorias
        ADD CONSTRAINT uq_categorias_nome
        UNIQUE (nome);
    END IF;
END
$$;