CREATE TYPE exercicio4.status_clinica AS ENUM(
    'ativa',
    'desativada'
);

CREATE TABLE IF NOT EXISTS exercicio4.clinica(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_clinica_id
    ),

    nome                VARCHAR(150)                NOT NULL,
    cnpj                VARCHAR(14)                 NOT NULL,
    data_abertura       TIMESTAMPTZ                 NOT NULL,
    status_animal       exercicio4.status_clinica   NOT NULL    DEFAULT 'ativa',
    telefone            VARCHAR(11)                 NOT NULL,
    rua                 VARCHAR(120)                NOT NULL,
    numero              SMALLINT                    NOT NULL,
    bairro              VARCHAR(70)                 NOT NULL,
    estado              CHAR(2)                     NOT NULL,
    pais                VARCHAR(42)                 NOT NULL,
    cep                 VARCHAR(8)                  NOT NULL,
    complemento         VARCHAR(200)                NOT NULL,

    CONSTRAINT pk_tutor_clinica_id PRIMARY KEY(id),

    CONSTRAINT uq_cnpj UNIQUE(cnpj),
    CONSTRAINT uq_telefone UNIQUE(telefone),

    CONSTRAINT chk_clinica_nome CHECK(
        exercicio4.fn_nome(nome)
    ),

    CONSTRAINT chk_clinica_cnpj CHECK(
        exercicio4.fn_cnpj(cnpj)
    ),

    CONSTRAINT chk_clinica_telefone CHECK(
        exercicio4.fn_telefone(telefone)
    ),

    CONSTRAINT chk_clinica_rua CHECK(
        exercicio4.fn_nome(rua)
    ),

    CONSTRAINT chk_clinica_num CHECK(
        numero >= 0
    ),

    CONSTRAINT chk_clinica_bairro CHECK(
        exercicio4.fn_nome(bairro)
    ),

    CONSTRAINT chk_clinica_estado CHECK(estado IN(
        'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO',
        'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
        'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
    )),

    CONSTRAINT chk_clinica_pais CHECK(
        exercicio4.fn_nome(pais)
    ),

    CONSTRAINT chk_clinica_cep CHECK(
        exercicio4.fn_cep(cep)
    ),

    CONSTRAINT chk_clinica_complemento CHECK(
        exercicio4.fn_nome(complemento)
    )
);