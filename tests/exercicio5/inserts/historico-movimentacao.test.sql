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
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    NULL
);

SELECT throws_ok(
    $$
			INSERT INTO ex5_rh.historico(
				tipo, 
				data, 
				descricao, 
				responsavel, 
				funcionario_id)
			VALUES (
				'admissao', 
				'2026-05-20 10:00:00-03', 
				'Funcionario admitido no dia 20-05, sem impedimentos', 
				'Carl@ Sant0s', 
				'1'
			);
    $$,
		'23514',
    'new row for relation "historico" violates check constraint "chk_historico_responsavel"'
);

SELECT * FROM finish();
ROLLBACK;