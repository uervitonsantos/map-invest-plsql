DROP SEQUENCE SEQ_USUARIO;

CREATE SEQUENCE SEQ_USUARIO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE USUARIO;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

CREATE TABLE USUARIO
(
  USUARIO_ID INTEGER NOT NULL,
  NOME VARCHAR2(20) NOT NULL,
  SOBRENOME VARCHAR2(50) NOT NULL,
  IDADE DATE NOT NULL,
  SEXO VARCHAR2(1) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL,
  DATA_INSERSAO timestamp DEFAULT SYSDATE,
  USUARIO_MODIFICACAO VARCHAR(10),
  DATA_MODIFICACAO timestamp DEFAULT SYSDATE,
  CONSTRAINT PK_USUARIO_ID PRIMARY KEY (USUARIO_ID),
  CONSTRAINT EMAIL_UNIQUE UNIQUE(EMAIL),
  CONSTRAINT CK_SEXO CHECK (SEXO IN ('M', 'F', 'O')) ENABLE
);

COMMIT;

SELECT * FROM USUARIO;

