BEGIN;

SET search_path TO ex_pgtap;

SELECT plan(1);

SET CONSTRAINTS ex5_rh.fk_departamento_id, ex5_rh.fk_gestor_id DEFERRED;


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
    1
	  
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
    1002,
    'Marina Lima',
    '12345678923',
    'marina.lima@email.com',
    '11999999992',
    'Diretora',
    10500.00,
    'ativo',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    1
	  
);

UPDATE ex5_rh.departamento
SET gestor_id = 1
WHERE id = 1;

SELECT throws_ok(
    $$
      INSERT INTO ex5_financeiro.reembolso(
      data_solicitacao,
      valor_solicitacao,
      descricao,
      status,
      aprovador_id,
      funcionario_id,
      departamento_id
    )
      VALUES (
      '2026-05-20 14:30:00-03',
      -350.75,
      'Reembolso de despesas com transporte corporativo',
      'aberta',
      1,
      2,
      1
    );
    $$,
    '23514',
    'new row for relation "reembolso" violates check constraint "chk_reembolso_valor_solicitado"'
);

SELECT throws_ok(
    $$
      INSERT INTO ex5_financeiro.reembolso(
      data_solicitacao,
      valor_solicitacao,
      descricao,
      status,
      aprovador_id,
      funcionario_id,
      departamento_id
    )
      VALUES (
      '2026-05-20 14:30:00-03',
      350.75,
      'Re',
      'aberta',
      1,
      2,
      1
    );
    $$,
    '23514',
    'new row for relation "reembolso" violates check constraint "chk_descricao"'
);
SELECT * FROM finish();

ROLLBACK;