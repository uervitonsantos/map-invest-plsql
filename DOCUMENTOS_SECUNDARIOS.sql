DROP SEQUENCE SEQ_DOCUMENTOS_SECUNDARIOS;

CREATE SEQUENCE SEQ_DOCUMENTOS_SECUNDARIOS
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE DOCUMENTOS_SECUNDARIOS;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

CREATE TABLE DOCUMENTOS_SECUNDARIOS
(
  DOCUMENTOS_SECUNDARIOS_ID INTEGER NOT NULL,
  PESSOA_FISICA_ID INTEGER NOT NULL,
  TIPO_DOCUMENTOS_SECUNDARIOS VARCHAR2(3) NOT NULL,
  NUMERO_DOCUMENTOS_SECUNDARIOS VARCHAR2(20) NOT NULL,
  ORGAO_EMISSOR VARCHAR2(5) NOT NULL,
  DATA_EMISSAO DATE NOT NULL,
  DATA_NASCIMENTO DATE NOT NULL,
  SEXO VARCHAR2(1) NOT NULL,
  NACIONALIDADE VARCHAR2(50) NOT NULL,
  NATURALIDADE VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_DOCUMENTOS_SECUNDARIOS_ID PRIMARY KEY (DOCUMENTOS_SECUNDARIOS_ID),
  CONSTRAINT NUMERO_DOCUMENTOS_SECUNDARIOS_UNIQUE UNIQUE(NUMERO_DOCUMENTOS_SECUNDARIOS),
  CONSTRAINT CK_SEXO CHECK (SEXO IN ('M', 'F', 'O')) ENABLE,
  CONSTRAINT CK_TIPO_DOCUMENTOS_SECUNDARIOS CHECK (TIPO_DOCUMENTOS_SECUNDARIOS IN ('RG', 'CNH')) ENABLE
);

ALTER TABLE DOCUMENTOS_SECUNDARIOS
ADD CONSTRAINT FK_PESSOA_FISICA_DOCUMENTOS_SECUNDARIOS
FOREIGN KEY (PESSOA_FISICA_ID)
REFERENCES PESSOA_FISICA (PESSOA_FISICA_ID);

COMMIT;

SELECT * FROM DOCUMENTOS_SECUNDARIOS;
