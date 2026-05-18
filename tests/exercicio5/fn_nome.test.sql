BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(5);

SELECT diag('Retorna TRUE se o nome for válido');
SELECT is(ex5_helpers.fn_nome('Maria Eduarda Barboza Sinis'), true, 'Nome válido');

SELECT diag('Nome com símbolos deve ser inválido');
SELECT is(ex5_helpers.fn_nome('M@ri@ Edu@rda Barboza Sinis'), false, 'Nome inválido');
SELECT is(ex5_helpers.fn_nome('Maria.Eduarda Barboza.Sinis'), false, 'Nome inválido');
SELECT is(ex5_helpers.fn_nome('Maria Eduarda Barboza S!n!s'), false, 'Nome inválido');

SELECT diag('Nome com espaços duplos deve ser inválido');
SELECT is(ex5_helpers.fn_nome('Maria  Eduarda  Barboza Sinis'), false, 'Nome inválido');

SELECT * FROM finish();

ROLLBACK;