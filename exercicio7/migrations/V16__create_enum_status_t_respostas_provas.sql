DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'provas_status') THEN
            CREATE TYPE ex7_avaliacao.provas_status AS ENUM (
                'rascunho',
                'publicada',
                'encerrada'              
            );
        END IF;
    END
$$;