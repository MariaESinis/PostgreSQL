--Tabela de relacionamento de clinica com raça

CREATE TABLE IF NOT EXISTS exercicio4.raca_clinica(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_raca_clinica_id
    ),

    raca_id         INTEGER     NOT NULL,
    clinica_id      INTEGER     NOT NULL,

    CONSTRAINT pk_raca_clinica_id PRIMARY KEY(id),

    CONSTRAINT fk_raca_id
        FOREIGN KEY(raca_id)
        REFERENCES  exercicio4.raca(id),

    CONSTRAINT fk_clinica_id
        FOREIGN KEY(clinica_id)
        REFERENCES  exercicio4.clinica(id)
);