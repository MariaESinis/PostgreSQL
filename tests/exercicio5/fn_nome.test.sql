BEGIN;

SET search_path to ex_pgtap;
SELECT plan(6);

SELECT diag('Retorna TRUE se o nome for válido');
SELECT is(ex5_helpers.fn_nome('Maria Eduarda Barboza Sinis'), true, 'Nome válido');

SELECT diag('Nome com simbolos deve ser invalido');
SELECT is(ex5_helpers.fn_nome('M@ri@ Edu@rda Barboza Sinis'), false, 'Nome inválido');
SELECT is(ex5_helpers.fn_nome('Maria.Eduarda Barboza.Sinis'), false, 'Nome inválido');
SELECT is(ex5_helpers.fn_nome('Maria Eduarda Barboza S!n!s'), false, 'Nome inválido');
SELECT is(ex5_helpers.fn_nome('Maria Eduarda Barboza Sinis'), false, 'Nome inválido');

SELECT diag('Nome com espaços duplos deve ser invalido');
SELECT is(ex5_helpers.fn_nome('Maria  Eduarda  Barboza Sinis'), false, 'Nome invalido');

SELECT * FROM finish();

ROLLBACK;