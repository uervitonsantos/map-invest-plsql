DROP SEQUENCE SEQ_ENDERECO;

CREATE SEQUENCE SEQ_ENDERECO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE ENDERECO;

CREATE TABLE ENDERECO
(
  ENDERECO_ID INTEGER NOT NULL,
  USUARIO_ID INTEGER NOT NULL,
  TIPO_ENDERECO VARCHAR2(3) NOT NULL,
  CEP VARCHAR2(10) NOT NULL,
  RUA VARCHAR2(100) NOT NULL,
  NUMERO VARCHAR2(4) NOT NULL,
  COMPLEMENTO VARCHAR2(100) NOT NULL,
  CIDADE VARCHAR2(50) NOT NULL,
  UF VARCHAR2(2) NOT NULL,
  DATA_INSERSAO timestamp DEFAULT SYSDATE,
  USUARIO_MODIFICACAO VARCHAR(10),
  DATA_MODIFICACAO timestamp DEFAULT SYSDATE,
  CONSTRAINT PK_ENDERECO_ID PRIMARY KEY (ENDERECO_ID),
  CONSTRAINT CK_TIPO_ENDERECO CHECK (TIPO_ENDERECO IN ('RES', 'COM')) ENABLE
);

ALTER TABLE ENDERECO
ADD CONSTRAINT FK_ENDERECO_USUARIO
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID);

COMMIT;

SELECT * FROM ENDERECO;
