CREATE UNIQUE INDEX IF NOT EXISTS system_t_categorias_idxpt_nome
ON ex7_cadastro.categorias
USING btree (nome)
WHERE is_deleted = FALSE;