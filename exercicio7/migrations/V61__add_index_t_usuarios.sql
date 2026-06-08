CREATE UNIQUE INDEX IF NOT EXISTS system_t_usuarios_idxpt_cpf
ON ex7_cadastro.usuarios
USING btree (cpf)
WHERE is_deleted = FALSE;

CREATE UNIQUE INDEX IF NOT EXISTS system_t_usuarios_idxpt_email
ON ex7_cadastro.usuarios
USING btree (email)
WHERE is_deleted = FALSE;

CREATE UNIQUE INDEX IF NOT EXISTS system_t_usuarios_idxpt_tel
ON ex7_cadastro.usuarios
USING btree (telefone)
WHERE is_deleted = FALSE;