DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_provas_soft_delete'
    ) THEN
        ALTER TABLE ex7_avaliacao.provas
            ADD CONSTRAINT chk_provas_soft_delete
            CHECK (
                ex7_helpers.fn_valida_soft_delete
                (deleted_at, is_deleted)
            );
    END IF;
END
$$;