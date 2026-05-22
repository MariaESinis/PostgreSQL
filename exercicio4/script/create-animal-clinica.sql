--Tabela de relacionamento de clinica com animal

CREATE TABLE IF NOT EXISTS exercicio4.animal_clinica(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_animal_clinica_id
    ),

    animal_id         INTEGER     NOT NULL,
    clinica_id      INTEGER     NOT NULL,

    CONSTRAINT pk_animal_clinica_id PRIMARY KEY(id),

    CONSTRAINT fk_animal_id
        FOREIGN KEY(animal_id)
        REFERENCES  exercicio4.animal(id),

    CONSTRAINT fk_clinica_id
        FOREIGN KEY(clinica_id)
        REFERENCES  exercicio4.clinica(id)
);