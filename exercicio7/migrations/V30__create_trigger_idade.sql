CREATE OR REPLACE VIEW ex7_trigger.idade AS
SELECT 
    EXTRACT(YEAR FROM AGE(data_nascimento))::INT AS idade
FROM ex7_cadastro.usuarios;