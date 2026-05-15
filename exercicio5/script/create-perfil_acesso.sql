CREATE TYPE ex5_ti.perfil_acesso_is_active AS ENUM(
    'ativo',
    'inativo'
);

CREATE TABLE ex5_ti.perfil_acesso(
    id INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 0 
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000
        CACHE 1
        SEQUENCE NAME seq_perfil_acesso_id
    ),
    nome                VARCHAR(150)            			NOT NULL,
    nivel_acesso        CHAR                    			NOT NULL,
    descricao           VARCHAR(3000)           			NOT NULL,
    is_active           ex5_ti.perfil_acesso_is_active      NOT NULL    DEFAULT 'ativo',

    CONSTRAINT pk_perfil_acesso_id PRIMARY KEY(id),

    CONSTRAINT chk_perfil_acesso CHECK(
        nivel_acesso IN('1','2','3','4','5')
    ),

    CONSTRAINT chk_peril_acesso CHECK(
        ex5_helpers.fn_nome(nome)
    )
);
