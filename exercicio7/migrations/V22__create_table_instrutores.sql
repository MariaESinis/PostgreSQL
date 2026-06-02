CREATE TABLE IF NOT EXISTS ex7_cadastro.instrutores(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
            START WITH 1
            INCREMENT BY 1
            MINVALUE 0
            MAXVALUE 100000000
            CACHE 1
            SEQUENCE NAME seq_instrutores_id
    ),
    biografia       VARCHAR(500)                        NOT NULL,
    valor_hora      DECIMAL(10,2)                       NOT NULL,
    nota_media      DECIMAL(3,1)                        NOT NULL,
    status          ex7_cadastro.instrutores_status     NOT NULL,
    usuario_id      INTEGER                             NOT NULL,

    CONSTRAINT pk_instrutores_id PRIMARY KEY (id),

    CONSTRAINT chk_instrutores_biografia
        CHECK(ex7_helpers.fn_biografia(biografia)),

    CONSTRAINT chk_instrutores_valor_hora
        CHECK(valor_hora >= 0),

    CONSTRAINT chk_instrutores_nota_media
        CHECK(nota_media >= 0 AND nota_media <= 10)
);