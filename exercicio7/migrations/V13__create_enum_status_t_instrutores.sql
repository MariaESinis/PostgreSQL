DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'instrutores_status') THEN
            CREATE TYPE ex7_cadastro.instrutores_status AS ENUM (
                'ativo',
                'afastado', 
                'desligado' 
            );
        END IF;
    END
$$;