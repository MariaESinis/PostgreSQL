CREATE TYPE exercicio4.status_animal AS ENUM(
    'ativo',
    'tratamento',
    'obito'
);

CREATE TABLE IF NO EXISTS exercicio4.animal(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000
        CACHE 1
        SEQUENCE NAME exercicio3.seq_animais_id
    )
    nome                    VARCHAR(150)                    NULL,
    data_nascimento         TIMESTAMPTZ                     NULL,
    peso                    DECIMAL(6,3)                    NOT NULL,
    sexo                    CHAR                            NULL,
    situacao                exercicio4.status_animal        NOT NULL,
    created_at              TIMESTAMPTZ                     NOT NULL,
    updated_at              TIMESTAMPTZ                     NOT NULL,
    
)