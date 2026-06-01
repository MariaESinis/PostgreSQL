DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'cursos_status') THEN
            CREATE TYPE ex7_academico.cursos_status AS ENUM (
                'rascunho',
                'publicado',
                'encerrado'
            );
        END IF;
    END
$$;