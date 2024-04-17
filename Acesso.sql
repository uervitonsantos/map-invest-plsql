DROP SEQUENCE SEQ_ACESSO;

CREATE SEQUENCE SEQ_ACESSO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE ACESSO;


CREATE TABLE ACESSO
(
  ACESSO_ID INTEGER NOT NULL,
  USUARIO_ID INTEGER NOT NULL,
  LOGIN_USUARIO VARCHAR2(20) NOT NULL,
  SENHA_USUARIO VARCHAR2(50) NOT NULL,
  DATA_INSERSAO timestamp DEFAULT SYSDATE,
  USUARIO_MODIFICACAO VARCHAR(10),
  DATA_MODIFICACAO timestamp DEFAULT SYSDATE,
  CONSTRAINT PK_ACESSO_ID PRIMARY KEY (ACESSO_ID),
  CONSTRAINT LOGIN_USUARIO_UNIQUE UNIQUE(LOGIN_USUARIO)
);

ALTER TABLE ACESSO
ADD CONSTRAINT FK_USUARIO_ACESSO
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID);


-- Inserindo dados na tabela ACESSO
INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO)
VALUES (1, 1, 'usuario1', 'senha1', 'admin');

INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO)
VALUES (2, 2, 'usuario2', 'senha2', 'admin');

INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO)
VALUES (3, 3, 'usuario3', 'senha3', 'admin');

INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO)
VALUES (4, 4, 'usuario4', 'senha4', 'admin');


  
SELECT * FROM ACESSO;