BEGIN;

SET search_path TO ex_pgtap;

SELECT plan(2);

SET CONSTRAINTS ex5_rh.fk_departamento_id, ex5_rh.fk_gestor_id DEFERRED;

-- Funcionário base
INSERT INTO ex5_rh.funcionario (
    matricula,
    nome,
    pis_pasep,
    email,
    telefone,
    cargo,
    salario_base,
    status,
    created_at,
    updated_at,
    departamento_id
)
VALUES (
    1001,
    'João Silva',
    '12345678901',
    'joao.silva@email.com',
    '11999999999',
    'Analista de Sistemas',
    5500.00,
    'ativo',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    1
);

-- Departamento base
INSERT INTO ex5_rh.departamento (
    nome,
    sigla,
    orcamento_mensal,
    data_criacao,
    gestor_id
)
VALUES (
    'Tecnologia da Informação',
    'TI',
    75000.00,
    '2026-05-20 10:00:00-03',
    1
);

--TESTE 1: nome invalido
SELECT throws_ok(
$$
    INSERT INTO ex5_rh.departamento (
        nome,
        sigla,
        orcamento_mensal,
        data_criacao,
        gestor_id
    )
    VALUES (
        'Tecnologi@',
        'TI',
        75000.00,
        '2026-05-20 10:00:00-03',
        1
    );
$$,
'23514',
'new row for relation "departamento" violates check constraint "chk_departamento_nome"'
);

--TESTE 2: sigla invalida
SELECT throws_ok(
    $$
        INSERT INTO ex5_rh.departamento (
            nome,
            sigla,
            orcamento_mensal,
            data_criacao,
            gestor_id
        )
        VALUES (
            'Tecnologia da Informação',
            'T',
            75000.00,
            '2026-05-20 10:00:00-03',
            1
        );
    $$,
    '23514',
    'new row for relation "departamento" violates check constraint "chk_departamento_nome"'
);
SELECT * FROM finish();

ROLLBACK;