CREATE TABLE IF NOT EXISTS ex8.users(
   id   INTEGER GENERATED ALWAYS AS IDENTITY(
        START WITH 1
        INCREMENT BY 1
        MINVALUE 0
        MAXVALUE 100000000
        CACHE 1
        SEQUENCE NAME seq_users_id
   ),

   login                VARCHAR(50)     NOT NULL,
   email                VARCHAR(100)    NOT NULL,
   password_hash        VARCHAR(255)    NOT NULL,
   role                 VARCHAR(20)     NOT NULL,
   status               VARCHAR(20)     NOT NULL,
   last_login           TIMESTAMPTZ         NULL,
   created_at           TIMESTAMPTZ     NOT NULL,

   CONSTRAINT pk_users PRIMARY KEY(id),

   CONSTRAINT uq_users_email UNIQUE (id)
);