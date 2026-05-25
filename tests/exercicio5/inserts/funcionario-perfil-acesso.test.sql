BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(2);

INSERT INTO ex5_ti.perfil_acesso(
    nome, 
    nivel_acesso, 
    descricao, 
    is_active
)
	VALUES (
        'maria', 
	    '1', 
		'Perfil criado para trabalho', 
		'ativo'
);

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


INSERT INTO ex5_ti.funcionario_perfil_acesso( 
	perfil_acesso_id, 
	funcionario_id
)
	VALUES ( 
		'1', 
		'1'
);

-- TESTE 1: unique para perfil_acesso_id
SELECT throws_ok(
    $$
			INSERT INTO ex5_ti.funcionario_perfil_acesso( 
				perfil_acesso_id, 
				funcionario_id
			)
			VALUES ( 
				'1', 
				'1'
			);
    $$,
	'23505',
    'duplicate key value violates unique constraint "uq_perfil_acesso_id"'
);

--TESTE 2: unique para funcionario_id
SELECT throws_ok(
    $$
			INSERT INTO ex5_ti.funcionario_perfil_acesso( 
				perfil_acesso_id, 
				funcionario_id
			)
			VALUES ( 
				'1', 
				'1'
			);
    $$,
	'23505',
    'duplicate key value violates unique constraint "uq_funcionario_id"'
);

SELECT * FROM finish();

ROLLBACK;