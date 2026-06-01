DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'respostas_provas_status') THEN
            CREATE TYPE ex7_avaliacao.respostas_provas_status AS ENUM (
                'reprovado',
                'aprovado'
            );
        END IF;
    END
$$;