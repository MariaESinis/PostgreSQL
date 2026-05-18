BEGIN;

SET search_path TO ex_pgtap;
SELECT plan();

SELECT diag('Retorna TRUE se o email for válido');
SELECT is(ex5_helpers.fn_email('maria.sinis@gmail.com'), TRUE, 'Email válido');

SELECT diag('Retorna FALSE se o email nao tiver @');
SELECT is(ex5_helpers.fn_email('maria.sinisgmail.com'), FALSE, 'Email inválido');

SELECT diag('Retorna FALSE se o email nao tiver dominio');
SELECT is(ex5_helpers.fn_email('maria.sinis@gmail'), FALSE, 'Email inválido');

SELECT diag('Retorna FALSE se o email tiver simbolo');
SELECT is(ex5_helpers.fn_email('m@ria.s!n!s@gmail.com'), FALSE, 'Email inválido');

SELECT * FROM finish();

ROLLBACK;