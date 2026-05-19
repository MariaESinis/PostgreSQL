BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1);

SELECT throwns_ok(
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
        2024-04-02,
        -45.00, 
        'disponivel', 
        2024-04-03, 
        2024-04-03
      )
    $$,
    'check_violation',
    'new row for relation "equipamentos" violates check constraint "chk_equipamento_valor_aquisicao"'
);

SELECT * FROM finish();

ROLLBACK;