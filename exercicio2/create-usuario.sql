CREATE SCHEMA IF NOT EXISTS exercicio2;

--Funcao valida nome
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_nome(nome TEXT) 
RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        length(trim(nome)) >= 3        
        AND nome ~ '^[A-Za-zÀ-ÿ][A-Za-zÀ-ÿ ]*[A-Za-zÀ-ÿ]$' 
        AND nome !~ '  '                        
        AND nome ~ '^[A-Za-zÀ-ÿ ]+$'            
    );
END;
$$ LANGUAGE plpgsql;

--Funcao valida telefone
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_telefone(tel TEXT) 
RETURNS BOOLEAN AS $$
BEGIN
    RETURN (
        tel ~ '^[0-9]{10,11}$'                  
        AND (length(tel) = 10 OR (length(tel) = 11 AND substring(tel from 3 for 1) = '9'))
    );
END;
$$ LANGUAGE plpgsql;

--Funcao valida senha
CREATE OR REPLACE FUNCTION exercicio2.fn_valida_senha(senha TEXT, email TEXT)
RETURNS BOOLEAN AS $$
BEGIN
        RETURN (
        length(senha) >= 8                    
        AND senha !~ ' '                      
        AND senha ~ '[A-Z]'                   
        AND senha ~ '[a-z]'                   
        AND senha ~ '[0-9]'                
        AND senha ~ '[!@#$%^&*]' 
        AND senha <> email
    );
END;
$$ LANGUAGE plpgsql;
    
CREATE TABLE IF NOT EXISTS exercicio2.usuario(
    nome VARCHAR(150),
    email VARCHAR(320), 
    senha VARCHAR(100),
    telefone VARCHAR(11),
    status VARCHAR(8) NOT NULL DEFAULT 'ativo',
    data_criacao DATE NOT NULL DEFAULT CURRENT_DATE,
    idade INTEGER CHECK (idade BETWEEN 14 AND 120),
    nivel_acesso INTEGER CHECK (nivel_acesso BETWEEN 1 and 5),

    CONSTRAINT chk_nome_valido CHECK (exercicio2.fn_valida_nome(nome)),
    CONSTRAINT chk_usuario_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT chk_senha_valido check(exercicio2.fn_valida_senha(senha, email)),
    CONSTRAINT chk_telefone_brasil CHECK (exercicio2.fn_valida_telefone(telefone)),
    CONSTRAINT chk_usuario_status CHECK (status IN ('ativo', 'inativo', 'bloqueado', 'pendente'))
);
