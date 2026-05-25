BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(2);

SELECT diag('Retorna TRUE se a sigla for válida');
SELECT is(ex5_helpers.fn_sigla('B2'), TRUE, 'Sigla válida');

SELECT diag('Sigla com simbolo deve ser inválida');
SELECT is(ex5_helpers.fn_sigla('B!C'), FALSE, 'Sigla inválida');

SELECT * FROM finish();

ROLLBACK;