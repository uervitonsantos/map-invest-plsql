DROP SEQUENCE SEQ_PERMISSAOTELA;

CREATE SEQUENCE SEQ_PERMISSAOTELA
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCACHE
NOCYCLE;

DROP TABLE PERMISSAOTELA;

CREATE TABLE PERMISSAOTELA
(
  PERMISSAOTELA_ID INTEGER NOT NULL,
  NOME_PERMISSAO VARCHAR2(15) NOT NULL,
  DESCRICAO VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_PERMISSAOTELA_ID PRIMARY KEY (PERMISSAOTELA_ID),
  CONSTRAINT DESCRICAO_UNIQUE UNIQUE(DESCRICAO)
);

INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'CADASTRAR', 'Permiss�o para cadastrar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'EDITAR', 'Permiss�o para editar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'EXCLUIR', 'Permiss�o para excluir dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'CONSULTAR', 'Permiss�o para consultar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'IMPRIMIR', 'Permiss�o para imprimir dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'EXPORTAR', 'Permiss�o para exportar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'IMPORTAR', 'Permiss�o para importar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'GERAR', 'Permiss�o para gerar relat�rios na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'ANALISAR', 'Permiss�o para analisar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'VALIDAR', 'Permiss�o para validar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'AUTORIZAR', 'Permiss�o para autorizar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'NEGAR', 'Permiss�o para negar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'APROVAR', 'Permiss�o para aprovar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'REPROVAR', 'Permiss�o para reprovar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'CANCELAR', 'Permiss�o para cancelar dados na tela');
INSERT INTO PERMISSAOTELA (PERMISSAOTELA_ID, NOME_PERMISSAO, DESCRICAO) VALUES (SEQ_PERMISSAOTELA.NEXTVAL, 'ACESSAR', 'Permiss�o para acessar a tela');


SELECT * FROM PERMISSAOTELA;