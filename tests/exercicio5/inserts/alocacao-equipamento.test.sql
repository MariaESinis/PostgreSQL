BEGIN;

SET search_path TO ex_pgtap;

SELECT plan(1);

INSERT INTO ex5_rh.funcionario(
    matricula,
    nome,
    pis_pasep,
    email,
    telefone,
    cargo,
    salario_base,
    status,
    created_at,
    updated_at,
    departamento_id
)
VALUES (
    1001,
    'João Silva',
    '12345678901',
    'joao.silva@email.com',
    '11999999999',
    'Analista de Sistemas',
    5500.00,
    'ativo',
    NOW(),
    NOW(),
		NULL
);

INSERT INTO ex5_ti.equipamentos(
    num_patrimonial,
    num_serie,
    fabricante,
    modelo,
    data_aquisicao,
    valor_aquisicao,
    situacao,
    created_at,
    updated_at
)
VALUES (
    10001,
    'SNABC123',
    'Dell',
    'Latitude 5420',
    '2024-01-10 10:00:00-03',
    4500.00,
    'disponivel',
    NOW(),
    NOW()
);

SELECT throws_ok(
  $$
		INSERT INTO ex5_ti.alocacao_equipamentos(
			periodo, 
			motivo, 
			situacao, 
			funcionario_id, 
			equipamento_id
		)
		VALUES ( 
			'[2024-01-01 10:00:00+00, 2024-01-01 12:00:00+00]', 
			'Aloc@cao de tr@b@lh0', 
			'ativa', 
			'1', 
			'1'
		);
	$$,
	'23514',
  'new row for relation "alocacao_equipamento" violates check constraint "chk_motivo"'
);

SELECT * FROM finish();
ROLLBACK;