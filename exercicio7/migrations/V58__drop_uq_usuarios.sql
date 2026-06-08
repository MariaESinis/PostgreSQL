ALTER TABLE ex7_cadastro.usuarios
DROP CONSTRAINT IF EXISTS uq_usuarios_cpf;

ALTER TABLE ex7_cadastro.usuarios
DROP CONSTRAINT IF EXISTS uq_usuarios_email;

ALTER TABLE ex7_cadastro.usuarios
DROP CONSTRAINT IF EXISTS uq_usuarios_tel;
