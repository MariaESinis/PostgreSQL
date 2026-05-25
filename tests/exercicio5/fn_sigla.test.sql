BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1);

SELECT diag('Retorna TRUE se a sigla for válida');
SELECT is(ex5_helpers.fn_sigla('B2'), TRUE, 'Sigla válida');

SELECT * FROM finish();

ROLLBACK;