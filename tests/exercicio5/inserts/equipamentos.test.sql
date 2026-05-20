BEGIN;

SET search_path TO ex_pgtap;

SELECT plan(6);

-- 1) CHECK valor_aquisicao
SELECT throws_ok(
    $$
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
        3001,
        'ABC123',
        'Dell',
        'X1',
        '2024-04-02 14:00:00-03',
        -45.00,
        'disponivel',
        '2024-04-03 00:00:00-03',
        '2024-04-03 00:00:00-03'
    );
    $$,
    '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_valor_aquisicao"'

);

-- 2) CHECK num_serie
SELECT throws_ok(
    $$
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
        3002,
        'A35!@%',   -- inválido
        'Dell',
        'X1',
        '2024-04-02 14:00:00-03',
        100.00,
        'disponivel',
        '2024-04-03 00:00:00-03',
        '2024-04-03 00:00:00-03'
    );
    $$,
    '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_num_serie"'
);

-- 3) CHECK fabricante
SELECT throws_ok(
    $$
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
        3003,
        'ABC999',
        '@pple',  -- inválido
        'X1',
        '2024-04-02 14:00:00-03',
        100.00,
        'disponivel',
        '2024-04-03 00:00:00-03',
        '2024-04-03 00:00:00-03'
    );
    $$,
    '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_fabricante"'
);

-- 4) UNIQUE num_patrimonial
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
    3004,
    'ABC111',
    'Dell',
    'X1',
    '2024-04-02 14:00:00-03',
    100.00,
    'disponivel',
    '2024-04-03 00:00:00-03',
    '2024-04-03 00:00:00-03'
);

SELECT throws_ok(
    $$
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
        3004,  -- duplicado
        'ABC222',
        'Dell',
        'X2',
        '2024-04-02 14:00:00-03',
        200.00,
        'disponivel',
        '2024-04-03 00:00:00-03',
        '2024-04-03 00:00:00-03'
    );
    $$,
    '23505',
    NULL
);

-- 5) UNIQUE num_serie
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
    3100,
    'BCD1500',
    'Dell',
    'X1',
    '2024-04-02 14:00:00-03',
    100.00,
    'disponivel',
    '2024-04-03 00:00:00-03',
    '2024-04-03 00:00:00-03'
    );


SELECT throws_ok(
    $$
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
    3100,
    'BCD1500',
    'Dell',
    'X1',
    '2024-04-02 14:00:00-03',
    100.00,
    'disponivel',
    '2024-04-03 00:00:00-03',
    '2024-04-03 00:00:00-03'
  );
  $$,
  '23505',
    NULL
);

SELECT * FROM finish();

ROLLBACK;