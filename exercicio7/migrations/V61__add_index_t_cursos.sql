CREATE UNIQUE INDEX IF NOT EXISTS system_t_cursos_idxpt_titulo
ON ex7_academico.cursos
USING btree (titulo)
WHERE is_deleted = FALSE;