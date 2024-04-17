DROP SEQUENCE SEQ_DOCUMENTO;

CREATE SEQUENCE SEQ_DOCUMENTO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE DOCUMENTO;

CREATE TABLE DOCUMENTO
(
  DOCUMENTO_ID INTEGER NOT NULL,
  USUARIO_ID INTEGER NOT NULL,
  TIPO_DOCUMENTO VARCHAR2(4) NOT NULL,
  NUMERO_DOCUMENTO VARCHAR2(14) NOT NULL,
  DATA_INSERSAO timestamp DEFAULT SYSDATE,
  USUARIO_MODIFICACAO VARCHAR(10),
  DATA_MODIFICACAO timestamp DEFAULT SYSDATE,
  CONSTRAINT PK_DOCUMENTO_ID PRIMARY KEY (DOCUMENTO_ID),
  CONSTRAINT NUMERO_DOCUMENTO_UNIQUE UNIQUE(NUMERO_DOCUMENTO),
  CONSTRAINT CK_TIPO_DOCUMENTO CHECK (TIPO_DOCUMENTO IN ('CPF', 'CNPJ')) ENABLE
);

ALTER TABLE DOCUMENTO
ADD CONSTRAINT FK_USUARIO_DOCUMENTO
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID);

-- Inserir dados de teste na tabela DOCUMENTO usando a sequ�ncia SEQ_DOCUMENTO.NEXTVAL
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 1, 'CPF', '12345678900', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 2, 'CNPJ', '98765432000121', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 3, 'CPF', '11122233344', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 4, 'CNPJ', '44455666000199', 'admin');

SELECT * FROM DOCUMENTO;