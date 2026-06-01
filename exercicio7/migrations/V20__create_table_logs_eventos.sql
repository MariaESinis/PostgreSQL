CREATE TABLE IF NOT EXISTS ex7_avaliacao.logs_eventos(
    id  INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_logs_eventos_id
    ),
    
    tipo            VARCHAR(200)    NOT NULL,
    data_hora       TIMESTAMPTZ     NOT NULL

);