BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1);

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
      )
    $$,
     '23514',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_valor_aquisicao"'

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
        'Rayzor'
        'BR404', 
        '2025-04-03 00:00:00-03', 
        500.00, 
        'disponivel', 
        '2025-04-03 00:00:00-03', 
        '2025-04-06 00:00:00-03'
      )
    $$
     '23514'
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_num_serie"'
);

SELECT * FROM finish();

ROLLBACK;