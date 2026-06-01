DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_avaliacao.logs_eventos'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_avaliacao.logs_eventos
        ADD CONSTRAINT pk_logs_eventos_id
        PRIMARY KEY (id);
    END IF;
END
$$;