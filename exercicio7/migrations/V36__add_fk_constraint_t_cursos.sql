DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'fk_categoria_id'
    ) THEN
        ALTER TABLE ex7_academico.cursos
        ADD CONSTRAINT fk_categoria_id
        FOREIGN KEY (categoria_id)
        REFERENCES ex7_cadastro.categorias(id);
    END IF;
END
$$;