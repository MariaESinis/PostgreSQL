CREATE TABLE IF NOT EXISTS ex7_logs.logs (
    id  BIGINT GENERATED ALWAYS AS IDENTITY(
        START WITH 1
        INCREMENT BY 1
        MINVALUE 1
        MAXVALUE 1000000000
        CACHE 1
        SEQUENCE NAME seq_logs_id
    ), 

    tipo_log                ex7_logs.log_tipo       NOT NULL,            
    usuario_id              INTEGER                 NULL,                                         
    dados_detalhados        JSONB                   NULL,                   
    created_at              TIMESTAMPTZ         NOT NULL    DEFAULT CURRENT_TIMESTAMP ,                     

    CONSTRAINT pk_logs_id PRIMARY KEY(id),

    CONSTRAINT fk_usuario_id 
        FOREIGN KEY (usuario_id)
        REFERENCES ex7_cadastro.usuarios

);
