CREATE TYPE ex5_rh.funcionario_status AS ENUM(
    'ativo',
    'afastado',
    'desligado'
);

CREATE TABLE IF NOT EXISTS ex5_rh.funcionario(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_funcionario_id
    ),
    matricula           INTEGER NOT NULL,
    nome                VARCHAR(150) NOT NULL,
    pis_pasep           VARCHAR(11) NOT NULL,
    email               VARCHAR(320) NOT NULL,
    telefone            VARCHAR(11) NOT NULL,
    cargo               VARCHAR(100) NOT NULL,
    salario_base        DECIMAL(10,2) NOT NULL,
    status              ex5_rh.funcionario_status NOT NULL DEFAULT 'ativo',
    created_at          TIMESTAMPTZ NOT NULL,
    updated_At          TIMESTAMPTZ NOT NULL,

    CONSTRAINT pk_funcionario_id PRIMARY KEY(id),

    CONSTRAINT uq_funcionario_matricula UNIQUE(matricula),
    CONSTRAINT uq_funcionario_pis UNIQUE(pis_pasep),
    CONSTRAINT uq_funcionario_email UNIQUE(email),
    CONSTRAINT uq_funcionario_telefone UNIQUE(telefone),

    CONSTRAINT chk_funcionario_email CHECK(ex5_helpers.fn_email(email)),
    CONSTRAINT chk_funcionario_telefone CHECK(ex5_helpers.fn_telefone(telefone)),
    CONSTRAINT chk_funcionario_salario CHECK(salario_base > 0)

);

--ALTER TABLE ex5_rh.funcionario ADD departamento_id INTEGER;
--ALTER TABLE ex5_rh.funcionario ADD CONSTRAINT fk_departamento_id FOREIGN KEY(departamento_id) REFERENCES ex5_rh.departamento(id);