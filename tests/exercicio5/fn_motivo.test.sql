BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(4);

SELECT diag('Retorna TRUE se o motivo for válido');
SELECT is(ex5_helpers.fn_motivo('Alocação por 3 meses por motivo de trabalho'), TRUE, 'Motivo válido');

SELECT diag('Retorna FALSE se nao tiver caracter suficiente');
SELECT is(ex5_helpers.fn_motivo('Trabalho'), FALSE, 'Motivo inválido');

SELECT diag('Retorna FALSE se o motivo conter símbolo');
SELECT is(ex5_helpers.fn_motivo('Alocação para tr@balh0, por 3 meses!!!!!'), FALSE, 'Motivo inválido');

SELECT diag('Retorna FALSE se tiver espaços duplos');
SELECT is(ex5_helpers.fn_motivo('Alocacao  necessaria  para  estudo  dos  estagiarios  '), FALSE, 'Motivo inválido');

SELECT * FROM finish();

ROLLBACK;
