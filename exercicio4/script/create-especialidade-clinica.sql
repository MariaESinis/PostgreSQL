--Tabela de relacionamento de clinica com especialidade

CREATE TABLE IF NOT EXISTS exercicio4.especialidade_clinica(
    id   INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_especialidade_clinica_id
    ),

    especialidade_id    INTEGER     NOT NULL,
    clinica_id          INTEGER     NOT NULL,

    CONSTRAINT pk_especialidade_clinica_id PRIMARY KEY(id),

    CONSTRAINT fk_especialidade_id
        FOREIGN KEY(especialidade_id)
        REFERENCES  exercicio4.especialidade(id),

    CONSTRAINT fk_clinica_id
        FOREIGN KEY(clinica_id)
        REFERENCES  exercicio4.clinica(id)
);