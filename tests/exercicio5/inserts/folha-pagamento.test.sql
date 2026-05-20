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

SELECT throws_ok(
  $$
    INSERT INTO ex5_financeiro.pagamento(
    competencia,
    data_pagamento,
    valor_bruto,
    valor_desconto,
    valor_liquido,
    status,
    funcionario_id
)
VALUES (
    '2026-05',
    NOW(),
    -5000.00,
    500.00,
    4500.00,
    'pendente',
    1
);
  $$,
  '23514',
  'new row for relation "pagamento" violates check constraint "chk_valor_bruto"'
);

SELECT * FROM finish();

ROLLBACK;