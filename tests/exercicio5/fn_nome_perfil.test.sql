BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1); --Adicionar um numero antes de rodar o teste

SELECT diag('Retorna TRUE se o nome de perfil for válido');
SELECT is(ex5_helpers.fn_nome_perfil('User123'), TRUE, 'Nome de perfil válido');

SELECT diag('Retorna FALSE se o nome de perfil tiver simbolo');
SELECT is(ex5_helpers.fn_nome_perfil('User!23'), FALSE, 'Nome de perfil inválido');

SELECT diag('Retorna FALSE se o nome de perfil tiver espaço');
SELECT is(ex5_helpers.fn_nome_perfil('User 123'), FALSE, 'Nome de perfil inválido');

SELECT diag('Retorna FALSE se o nome de perfil tiver caracter < 3');
SELECT is(ex5_helpers.fn_nome_perfil('U12'), FALSE, 'Nome de perfil inválido');

SELECT * FROM finish();
ROLLBACK;