-- Tabela relacionamento de clinica com veterinario

CREATE TABLE IF NOT EXISTS exercicio4.veterinario_clinica(
    id INTEGER  GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 10000000
        CACHE 1
        SEQUENCE NAME seq_veterinario_id
    ),

    veterinario_id      INTEGER         NOT NULL,
    clinica_id          INTEGER         NOT NULL,

    CONSTRAINT pk_veterinario_clinica_id PRIMARY KEY(id),

    CONSTRAINT fk_veterinario_id    
        FOREIGN KEY(veterinario_id)
        REFERENCES exercicio4.veterinario(id),

    CONSTRAINT fk_clinica_id    
        FOREIGN KEY(clinica_id)
        REFERENCES exercicio4.clinica(id)
);