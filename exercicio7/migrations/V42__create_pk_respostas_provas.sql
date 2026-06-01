DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_constraint
        WHERE conrelid = 'ex7_avaliacao.respostas_provas'::regclass
          AND contype = 'p'
    ) THEN
        ALTER TABLE ex7_avaliacao.respostas_provas
        ADD CONSTRAINT pk_respostas_provas_id
        PRIMARY KEY (id);
    END IF;
END
$$;