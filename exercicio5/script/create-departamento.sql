CREATE TYPE ex5_rh.departamento_is_active AS ENUM(
    'ativo',
    'inativo'
);

CREATE TABLE IF NOT EXISTS ex5_rh.departamento(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000
        CACHE 1
        SEQUENCE NAME seq_departamento_id
    ),
    nome                    VARCHAR(150)                            NOT NULL,
    sigla                   VARCHAR(10)                             NOT NULL,
    orcamento_mensal        DECIMAL(14,2)                           NOT NULL,
    data_criacao            TIMESTAMPTZ                             NOT NULL,
    is_active               ex5_ti.departamento_is_active           NOT NULL    DEFAULT 'ativo',

    CONSTRAINT pk_departamento_id PRIMARY KEY(id),

    CONSTRAINT chk_departamento_nome CHECK(
        ex5_helpers.fn_nome(nome)
    )
)

--ALTER TABLE ex5_rh.departamento ADD gestor_id INTEGER;
--ALTER TABLE ex5_rh.departamento ADD CONSTRAINT fk_gestor_id FOREIGN KEY(gestor_id) REFERENCES ex5_rh.funcionario(id);