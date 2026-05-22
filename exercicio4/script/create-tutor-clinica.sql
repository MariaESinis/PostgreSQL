--Esta tabela representa a relação de tutor e clinica

CREATE TABLE IF NOT EXISTS exercicio4.tutor_clinica(
    id          INTEGER     GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME exercicio4.seq_tutor_clinica_id
    ),
    tutor_id    INTEGER     NOT NULL,
    clinica_id  INTEGER     NOT NULL,

    CONSTRAINT pk_tutor_clinica_id PRIMARY KEY(id),

    CONSTRAINT fk_tutor_id 
        FOREIGN KEY(tutor_id)
        REFERENCES exercicio4.tutor,

    CONSTRAINT fk_clinica_id
        FOREIGN KEY(tutor_id)
        REFERENCES exercicio4.clinica
);