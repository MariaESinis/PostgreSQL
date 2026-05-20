BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(2); --Adicionar um numero antes de rodar o teste

SELECT throws_ok(
    $$
      INSERT INTO ex5_ti.perfil_acesso(
	      nome, 
        nivel_acesso, 
        descricao, 
        is_active
      )
	    VALUES (
        'User123', 
        '6', 
        'Uso corporativo', 
        'ativo'
      );
    $$,
    '23514',
    'new row for relation "perfil_acesso" violates check constraint "chk_perfil_acesso_nivel_acesso"'
);

SELECT throws_ok(
    $$
      INSERT INTO ex5_ti.perfil_acesso(
	      nome, 
        nivel_acesso, 
        descricao, 
        is_active
      )
	    VALUES (
        'User 1@3', 
        '1', 
        'Uso corporativo', 
        'ativo'
      );
    $$,
    '23514',
    'new row for relation "perfil_acesso" violates check constraint "chk_perfil_acesso_nome"'
);
SELECT * FROM finish();

ROLLBACK;
