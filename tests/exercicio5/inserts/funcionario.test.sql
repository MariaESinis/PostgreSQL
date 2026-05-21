BEGIN;

SET search_path TO ex_pgtap;

SELECT plan(6);

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

-- TESTE: nome inválido
SELECT throws_ok(
$$
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
        1002,
        'M@r!na Lim$',
        '22345678901',
        'marina.lima@email.com',
        '11999999998',
        'Desenvolvedor back-end',
        7500.00,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23514',
'new row for relation "funcionario" violates check constraint "chk_funcionario_nome"'
);

-- TESTE: email inválido
SELECT throws_ok(
$$
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
        1003,
        'Marina Lima',
        '32345678901',
        'marinalimaemail.com',
        '11999999997',
        'Desenvolvedor back-end',
        10500.00,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23514',
'new row for relation "funcionario" violates check constraint "chk_funcionario_email"'
);

-- TESTE: telefone inválido
SELECT throws_ok(
$$
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
        1004,
        'Ricardo Cardoso',
        '42345678901',
        'ricardo.cardoso@gmail.com',
        '00699999999',
        'Desenvolvedor back-end',
        10500.00,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23514',
'new row for relation "funcionario" violates check constraint "chk_funcionario_telefone"'
);

-- TESTE: salário inválido
SELECT throws_ok(
$$
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
        1005,
        'Amanda Veloso',
        '52345678901',
        'amanda.veloso@gmail.com',
        '11999999996',
        'Desenvolvedor back-end',
        -20.50,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23514',
'new row for relation "funcionario" violates check constraint "chk_funcionario_salario"'
);

-- TESTE: matrícula duplicada
SELECT throws_ok(
$$
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
        'Carlos Lima',
        '62345678901',
        'carlos.lima@gmail.com',
        '11999999995',
        'QA',
        4000,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23505',
'duplicate key value violates unique constraint "uq_funcionario_matricula"'
);

-- TESTE: pis duplicada
SELECT throws_ok(
$$
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
        1006,
        'Robson Thiago',
        '12345678901',
        'robson.thiago@gmail.com',
        '11999999990',
        'Veterinario',
        4000,
        'ativo',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        1
    );
$$,
'23505',
'duplicate key value violates unique constraint "uq_funcionario_pis"'
);

SELECT * FROM finish();

ROLLBACK;