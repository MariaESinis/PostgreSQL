BEGIN;

SET search_path TO ex_pgtap

SELECT plan(1);

INSERT INTO ex5_rh.funcionario(id)
VALUES (1);
	
INSERT INTO ex5_rh.departamento(id)
VALUES (1);

SELECT throws_ok(
  $$
		INSERT INTO ex5_ti.alocacao_equipamentos(
			id, 
			periodo, 
			motivo, 
			situacao, 
			funcionario_id, 
			equipamento_id
		)
		VALUES (
			10, 
			'[2024-01-01 10:00:00+00, 2024-01-01 12:00:00+00]', 
			'Aloc@cao de tr@b@lh0', 
			'ativa', 
			'1', 
			'1'
		);
	$$,
	'23514',
  'new row for relation "alocacao-equipamento" violates check constraint "chk_motivo"'
);

SET * FROM finish();
ROLLBACK;