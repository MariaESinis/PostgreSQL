BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(4);

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
        3004,
        'A23BG', 
        'Lazer', 
        'A32', 
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
        3005, 
        'A356!%', 
        'Rayzor',
        'BR404', 
        '2025-04-03 09:00:00-03', 
        500.00, 
        'disponivel', 
        '2025-04-03 12:00:00-03', 
        '2025-04-06 00:00:00-03'
      );
    $$,
     '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_num_serie"'
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
        3005, 
        'A356', 
        '@pple',
        'BR404', 
        '2025-04-03 09:00:00-03', 
        500.00, 
        'disponivel', 
        '2025-04-03 12:00:00-03', 
        '2025-04-06 00:00:00-03'
      );
    $$,
     '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_fabricante"'
);

INSERT INTO ex5_ti.equipamentos(num_patrimonial, num_serie)
VALUES (3005, 'ABC123');

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
        3005, 
        'A356', 
        'Samsung',
        'BR404', 
        '2025-04-03 09:00:00-03', 
        500.00, 
        'disponivel', 
        '2025-04-03 12:00:00-03', 
        '2025-04-06 00:00:00-03'
      );
    $$,
     '23505',
    'new row for relation "equipamentos" violates unique constraint "uq_equipamento_num_patrimonial"'
);
SELECT * FROM finish();

ROLLBACK;