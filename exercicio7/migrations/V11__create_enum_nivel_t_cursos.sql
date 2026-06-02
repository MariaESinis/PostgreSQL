DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'cursos_nivel') THEN
            CREATE TYPE ex7_academico.cursos_nivel AS ENUM (
                'iniciante',
                'intermediario',
                'avancado' 
            );
        END IF;
    END
$$;