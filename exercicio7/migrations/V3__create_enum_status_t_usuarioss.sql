DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'usuarios_status') THEN
        CREATE TYPE ex7_cadastro.usuarios_status AS ENUM (
            'ativo',
            'bloqueado',
            'inativo'
        );
    END IF;
END$$;