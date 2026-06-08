DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conname = 'chk_modulos_soft_delete'
    ) THEN
        ALTER TABLE ex7_academico.modulos
            ADD CONSTRAINT chk_modulos_soft_delete
            CHECK (
                ex7_helpers.fn_valida_soft_delete
                (deleted_at, is_deleted)
            );
    END IF;
END
$$;