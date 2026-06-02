DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'aulas_status') THEN
            CREATE TYPE ex7_academico.aulas_status AS ENUM (
                'publicada' 
                'oculta' 
                'removida' 
            );
        END IF;
    END
$$;