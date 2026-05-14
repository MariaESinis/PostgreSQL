CREATE TYPE exercicio4.status_animal AS ENUM(
    'ativo',
    'tratamento',
    'obito'
);

CREATE TABLE IF NOT EXISTS exercicio4.animal(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000
        CACHE 1
        SEQUENCE NAME exercicio3.seq_animais_id
    ),
    nome                    VARCHAR(150)                    NULL,
    data_nascimento         TIMESTAMPTZ                     NULL,
    peso                    DECIMAL(6,3)                    NOT NULL,
    sexo                    CHAR                            NULL,
    situacao                exercicio4.status_animal        NOT NULL,
    created_at              TIMESTAMPTZ                     NOT NULL,
    updated_at              TIMESTAMPTZ                     NOT NULL,
    tutor_id                INTEGER                         NULL             REFERENCES exercicio4.tutor(id),
    raca_id                 INTEGER                         NOT NULL         REFERENCES exercicio4.raca(id),

    CONSTRAINT pk_animal_id PRIMARY KEY(id),
    CONSTRAINT chk_animal_nome CHECK(
        exercicio4.fn_animal_nome(nome)
    ),

    CONSTRAINT chk_animal_peso CHECK(
        peso > 0
    ),
    
    CONSTRAINT chk_animal_sexo CHECK (
		sexo IN('F', 'M', 'D', 'H')
	)
    
    
)
