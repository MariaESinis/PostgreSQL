CREATE SCHEMA IF NOT EXISTS exercicio3;
CREATE TYPE exercicio3.status_pedidos AS ENUM('aguardando_pagamento', 'pago',  'em_separacao', 
                                            'enviado', 'entregue', 'cancelado', 'devolvido ');

CREATE OR REPLACE FUNCTION exercicio3.fn_valida_codigo_pedido()
RETURNS VARCHAR(17)
LANGUAGE plpgsql
VOLATILE
AS $$

BEGIN
    RETURN
        'PED-' ||
        TO_CHAR(TIMESTAMPTZ, 'YYYYMMDD') ||
        '-' ||
        UPPER(SUBSTRING(MD5(RANDOM()::TEXT) FROM 1 FOR 4));

END;
$$;

CREATE TABLE exercicio3.pedidos(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 1000
        CACHE 1 
        SEQUENCE NAME seq_pedidos_id
    ),
    codigo_pedido   VARCHAR(17)                 NOT NULL   DEFAULT exercicio3.fn_valida_codigo_pedido(),
    usuario         INT                         NOT NULL,
    valor_total     DECIMAL(10,2)               NOT NULL,
    status          exercicio3.status_pedidos   NOT NULL    DEFAULT 'aguardando_pagamento',
    data_pedido     TIMESTAMPTZ                 NOT NULL,

    
    CONSTRAINT fk_pedidos_usuario 
        FOREIGN KEY (usuario) 
        REFERENCES exercicio3.usuario(id),

    CONSTRAINT uq_pedidos_codigo_pedido UNIQUE (codigo_pedido),
    CONSTRAINT uq_pedidos_usuario UNIQUE(usuario),

    CONSTRAINT chk_pedidos_valor_total CHECK (valor_total > 0)
)

