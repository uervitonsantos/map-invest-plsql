DROP SEQUENCE SEQ_TELEFONE;

CREATE SEQUENCE SEQ_TELEFONE
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE TELEFONE;

CREATE TABLE TELEFONE
(
  TELEFONE_ID INTEGER NOT NULL,
  USUARIO_ID INTEGER NOT NULL,
  CODIGO VARCHAR2(2) NOT NULL,
  TIPO_TELEFONE VARCHAR2(12) NOT NULL,
  NUMERO_TELEFONE VARCHAR2(10) NOT NULL,
  DATA_INSERSAO timestamp DEFAULT SYSDATE,
  USUARIO_MODIFICACAO VARCHAR(10),
  DATA_MODIFICACAO timestamp DEFAULT SYSDATE,
  CONSTRAINT PK_TELEFONE_ID PRIMARY KEY (TELEFONE_ID),
  CONSTRAINT NUMERO_TELEFONE_UNIQUE UNIQUE(NUMERO_TELEFONE),
  CONSTRAINT CK_TIPO_TELEFONE CHECK (TIPO_TELEFONE IN ('res', 'cel', 'com')) ENABLE
);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_USUARIO_TELEFONE
FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO (USUARIO_ID);

INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'res', '1234567890', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 2, '55', 'cel', '987654321', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 3, '55', 'com', '111222333', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 4, '55', 'cel', '444555666', 'admin');

INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'cel', '3856921144', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'com', '8542365475', 'admin');

SELECT * FROM TELEFONE;