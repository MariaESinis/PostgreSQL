CREATE TABLE IF NOT EXISTS ex7_logs.l (
    id                      BIGSERIAL, 
    tipo_log                ex7_logs.log_tipo       NOT NULL,            
    usuario_id              INTEGER                 NULL,                                         
    dados_detalhados        JSONB                   NULL,                   
    created_at              TIMESTAMPTZ         NOT NULL    DEFAULT CURRENT_TIMESTAMP ,                     

    CONSTRAINT pk_logs_id PRIMARY KEY(id),

    CONSTRAINT fk_usuario_id 
        FOREIGN KEY (usuario_id)
        REFERENCES ex7_cadastro.usuarios

);
