BEGIN;

SET search_path TO ex_pgtap;
SELECT plan(1);

SELECT diag('Retorna TRUE se o email for válido');
SELECT is(ex7_helpers.fn_email('maria.sinis@gmail.com'), TRUE, 'Email válido');


SELECT * FROM finish();

ROLLBACK;