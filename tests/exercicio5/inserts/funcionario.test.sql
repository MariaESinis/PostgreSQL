BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1);

	INSERT INTO ex5_rh.departamento(
    nome,
    sigla,
    orcamento_mensal,
    data_criacao,
    gestor_id
	)
VALUES (
    'Tecnologia da Informação',
    'TI',
    75000.00,
    '2026-05-20 10:00:00-03',
    1
    
	);

	SELECT throws_ok(
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
    'J0ã0 Silv@',
    '12345678901',
    'joao.silva@email.com',
    '11999999999',
    'Analista de Sistemas',
    5500.00,
    'ativo',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    1
	);
	'23514',
  'new row for relation "funcionario" violates check constraint "chk_funcionario_nome"'
);
	

SELECT * FROM finish();

ROLLBACK;