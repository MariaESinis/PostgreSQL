BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(4);

SELECT diag('Retorna TRUE se o numero de serie for válido');
SELECT is(ex5_helpers.fn_num_serie('ABC123'), TRUE, 'Número de serie válido');

SELECT diag('Numero de serie com espaço deve ser inválido');
SELECT is(ex5_helpers.fn_num_serie('DEF 123'), FALSE, 'Número de serie inválido');

SELECT diag('Numero de serie com simbolo deve ser inválido');
SELECT is(ex5_helpers.fn_num_serie('GHI!@#'), FALSE, 'Número de serie inválido');

SELECT diag('Numero de serie com caracter < 3 deve ser inválido');
SELECT is(ex5_helpers.fn_num_serie('J1'), FALSE, 'Número de serie inválido');

SELECT * FROM finish();

ROLLBACK;