CREATE UNIQUE INDEX IF NOT EXISTS system_t_aulas_idexpt_url
ON ex7_academico.aulas
USING btree (url)
WHERE is_deleted = FALSE;