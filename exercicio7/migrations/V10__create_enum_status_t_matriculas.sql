DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'matriculas_status') THEN
            CREATE TYPE ex7_academico.matriculas_status AS ENUM (
                'ativa',
                'concluida',
                'cancelada' 
            );
        END IF;
    END
$$;