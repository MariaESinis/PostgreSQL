BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1); --Adicionar um numero antes de rodar o teste

SELECT diag('Retorna TRUE se o nome de perfil for válido');
SELECT is(ex5_helpers.fn_nome_perfil('User123'), TRUE, 'Nome de perfil válido');



SELECT * FROM finish();
ROLLBACK;