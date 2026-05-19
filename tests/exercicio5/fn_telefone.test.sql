BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(6);

SELECT diag('Retorne TRUE se o telefone for válido');
SELECT is(ex5_helpers.fn_telefone('11910935435'), TRUE, 'Telefone válido');

SELECT diag('Retorna FALSE se o telefone for todo com o mesmo digito');
SELECT is(ex5_helpers.fn_telefone('11111111111'), FALSE, 'Telefone inválido');

SELECT diag('Retorna FALSE se o telefone nao tiver caracter suficiente');
SELECT is(ex5_helpers.fn_telefone('11910935'), FALSE, 'Telefone inválido');

SELECT diag('Retorna FALSE se o DDD do telefone for invalido');
SELECT is(ex5_helpers.fn_telefone('00910935435'), FALSE, 'Telefone inválido');

SELECT diag('Retorna FALSE se o telefone tiver simbolo');
SELECT is(ex5_helpers.fn_telefone('119!093$43$'), FALSE, 'Telefone inválido');

SELECT diag('Retorna False se o telefone tiver 11 digitos, e o terceiro nao for 9');
SELECT is(ex5_helpers.fn_telefone('11010935435'), FALSE, 'Telefone inválido');

SELECT * FROM finish();

ROLLBACK;


