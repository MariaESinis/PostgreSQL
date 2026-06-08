DO $$ 
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'log_tipo') THEN
            CREATE TYPE ex7_logs.log_tipo AS ENUM (
                'LOGIN_REALIZADO',
                'LOGIN_FALHOU',
                'CURSO_CRIADO',
                'MATRICULA_REALIZADA',
                'PROVA_FINALIZADA',
                'CERTIFICADO_EMITIDO',
                'ALTERACAO_STATUS_CURSO',
                'EXCLUSAO_LOGICA'            
            );
        END IF;
    END
$$;