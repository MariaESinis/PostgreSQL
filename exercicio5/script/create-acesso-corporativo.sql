CREATE TYPE ex5_ti.acesso_status AS ENUM(
    'ativo',
    'bloqueado',
    'expirado',
    'revogado'
);

CREATE TABLE IF NOT EXISTS ex5_ti.acesso_corporativo(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000000
        CACHE 1
        SEQUENCE NAME seq_acesso_id
    ),
    periodo                 TSTZRANGE                   NOT NULL,
    status                  ex5_ti.acesso_status        NOT NULL    DEFAULT 'ativo',
    funcionario_id          INTEGER                     NOT NULL,

    CONSTRAINT pk_acesso_corporativo_id PRIMARY KEY(id),
    
    CONSTRAINT fk_funcionario_id FOREIGN KEY(
        funcionario_id) REFERENCES 
        ex5_rh.funcionario(id)
)