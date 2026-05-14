CREATE TYPE exercicio4.situacao_tutor AS ENUM (
    'ativo',
    'bloqueado',
    'inativo'
);

CREATE TABLE IF NOT EXISTS exercicio4.tutor(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_tutor_id
    ),
    cpf             VARCHAR(11)                   NOT NULL,
    nome            VARCHAR(150)                  NOT NULL,
    email           VARCHAR(320)                  NOT NULL,
    telefone        VARCHAR(11)                   NOT NULL,
    created_at      TIMESTAMPTZ                   NOT NULL,
    situacao        exercicio4.situacao_tutor     NOT NULL DEFAULT 'ativo',

    CONSTRAINT chk_tutor_cpf CHECK(
        exercicio4.fn_cpf(cpf)
    ),
    CONSTRAINT chk_tutor_nome CHECK(
        exercicio4.fn_nome(nome)
    ),
    CONSTRAINT chk_tutor_email CHECK(
        exercicio4.fn_tutor_email(email)
    ),
    CONSTRAINT chk_tutor_telefone CHECK(
        exercicio4.fn_telefone(telefone)
    )

);