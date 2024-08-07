DELETE FROM TELEFONE WHERE TELEFONE_ID = '29';
SELECT * FROM TELEFONE ORDER BY TELEFONE_ID;


INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Maria','maria@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Carlos', 'carlos@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jose', 'jose@example.com');

SELECT * FROM PESSOA ORDER BY PESSOA_ID;


-- Inserir dados de teste na tabela DOCUMENTO usando a sequ�ncia SEQ_DOCUMENTO.NEXTVAL
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 1, 'CPF', '70204194024', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 2, 'CNPJ', '23580728000135', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 3, 'CPF', '64007782091', 'admin');
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO) VALUES (SEQ_DOCUMENTO.NEXTVAL, 4, 'CNPJ', '59156987000180', 'admin');

SELECT * FROM DOCUMENTO;


-- INSERT ENDERECO
INSERT INTO ENDERECO (ENDERECO_ID, USUARIO_ID, TIPO_ENDERECO, CEP, RUA, NUMERO, COMPLEMENTO, CIDADE, UF, USUARIO_MODIFICACAO) 
VALUES (SEQ_ENDERECO.NEXTVAL, 1, 'RES', '02146-020', 'Rua Soldado Almadio Goering', '123', 'Parque Novo Mundo', 'S�o Paulo', 'SP', 'admin');

INSERT INTO ENDERECO (ENDERECO_ID, USUARIO_ID, TIPO_ENDERECO, CEP, RUA, NUMERO, COMPLEMENTO, CIDADE, UF, USUARIO_MODIFICACAO) 
VALUES (SEQ_ENDERECO.NEXTVAL, 2, 'COM', '08485-280', 'Rua Edson Danillo Dotto', '456', 'Conjunto Habitacional Santa Etelvina II', 'S�o Paulo', 'SP', 'admin');

INSERT INTO ENDERECO (ENDERECO_ID, USUARIO_ID, TIPO_ENDERECO, CEP, RUA, NUMERO, COMPLEMENTO, CIDADE, UF, USUARIO_MODIFICACAO) 
VALUES (SEQ_ENDERECO.NEXTVAL, 3, 'RES', '15804-375', 'Rua das Violetas', '789', 'Jardim Pedro Borgoni', 'Catanduva', 'SP', 'admin');

INSERT INTO ENDERECO (ENDERECO_ID, USUARIO_ID, TIPO_ENDERECO, CEP, RUA, NUMERO, COMPLEMENTO, CIDADE, UF, USUARIO_MODIFICACAO) 
VALUES (SEQ_ENDERECO.NEXTVAL, 4, 'COM', '11666-800', 'Avenida Pedro Reginaldo da Costa', '135', 'Balne�rio dos Golfinhos', 'Caraguatatuba', 'SP', 'admin');

SELECT * FROM ENDERECO;


-- INSERT TELEFONE
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'RES', '11234567890', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 2, '55', 'CEL', '11987654321', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 3, '55', 'COM', '1112223337', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 4, '55', 'CEL', '11444555666', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'CEL', '11938569210', 'admin');
INSERT INTO TELEFONE (TELEFONE_ID, USUARIO_ID, CODIGO, TIPO_TELEFONE, NUMERO_TELEFONE, USUARIO_MODIFICACAO) VALUES (SEQ_TELEFONE.NEXTVAL, 1, '55', 'COM', '11542365475', 'admin');

SELECT * FROM TELEFONE ORDER BY USUARIO_ID;


-- Inserindo dados na tabela ACESSO
INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, PERFIL_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO) VALUES (SEQ_ACESSO.NEXTVAL, 1, 1, 'joao_silva', 'qMHom-<q|@yZC]@?', 'admin');
INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, PERFIL_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO) VALUES (SEQ_ACESSO.NEXTVAL, 2, 2, 'maria_souza', 'b2bjP>4N.@i}H.[Z', 'admin');
INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, PERFIL_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO) VALUES (SEQ_ACESSO.NEXTVAL, 3, 3, 'carlos_Ferreira', 'pU,;s:rjs{n*!C.2', 'admin');
INSERT INTO ACESSO (ACESSO_ID, USUARIO_ID, PERFIL_ID, LOGIN_USUARIO, SENHA_USUARIO, USUARIO_MODIFICACAO) VALUES (SEQ_ACESSO.NEXTVAL, 4, 4, 'ana_Santos', '{a)a@|cOayKO#|K@', 'admin');
  
SELECT * FROM ACESSO ORDER BY USUARIO_ID;


-- INSERT USUARIO_X_TELEFONE
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (6, 7); 
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (6, 8); 
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (6, 9); 
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (2, 2);
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (3, 3);
INSERT INTO USUARIO_TELEFONE (USUARIO_ID, TELEFONE_USUARIO_ID) VALUES (4, 4);

SELECT * FROM USUARIO_TELEFONE;



-- Testando a fun��o validar_cpf
DECLARE
    resultado BOOLEAN;
BEGIN
    resultado := validar_documentos.validar_cpf('718.417.205-18');
    DBMS_OUTPUT.PUT_LINE('CPF v�lido: ' || CASE WHEN resultado THEN 'Sim' ELSE 'N�o' END);
END;
/

-- Testando a fun��o validar_cnpj
DECLARE
    resultado BOOLEAN;
BEGIN
    resultado := validar_documentos.validar_cnpj('57.201.511/0001-91');
    DBMS_OUTPUT.PUT_LINE('CNPJ v�lido: ' || CASE WHEN resultado THEN 'Sim' ELSE 'N�o' END);
END;
/


-- Tentativa de inser��o de um CPF v�lido
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO)
VALUES (SEQ_DOCUMENTO.NEXTVAL, 25, 'CPF', '37344438810', 'admin');

-- Tentativa de inser��o de um CPF inv�lido
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO)
VALUES (SEQ_DOCUMENTO.NEXTVAL, 25, 'CPF', '12345678905', 'admin'); -- Deve falhar

-- Tentativa de inser��o de um CNPJ v�lido
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO)
VALUES (SEQ_DOCUMENTO.NEXTVAL, 25, 'CNPJ', '85.556.738/0001-92', 'admin');

-- Tentativa de inser��o de um CNPJ inv�lido
INSERT INTO DOCUMENTO (DOCUMENTO_ID, USUARIO_ID, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, USUARIO_MODIFICACAO)
VALUES (SEQ_DOCUMENTO.NEXTVAL, 25, 'CNPJ', '85.556.738/0001-94', 'admin'); -- Deve falhar


-- DELETE
DELETE FROM DOCUMENTO WHERE USUARIO_ID = '25';
select * from usuario where USUARIO_ID = 14;
select * from documento where USUARIO_ID = 25;

UPDATE USUARIO SET SOBRENOME = 'Silva Santos' WHERE USUARIO_ID = 14;

-- Exclus�o de teste
DELETE FROM ACESSO WHERE USUARIO_ID = 9;
DELETE FROM USUARIO WHERE USUARIO_ID = 9;
SELECT * FROM ACESSO;
SELECT * FROM USUARIO ORDER BY USUARIO_ID;



INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA_FISICA (PESSOA_FISICA_ID, PESSOA_ID, SOBRENOME, DATA_NASCIMENTO, SEXO, NACIONALIDADE, NATURALIDADE) VALUES (SEQ_PESSOA_FISICA.NEXTVAL, '1000', 'Silva dos Santos', '15-06-1954', 'M', 'BRASIL', 'BAHIA');

INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');
INSERT INTO PESSOA (PESSOA_ID, NOME, EMAIL) VALUES (SEQ_PESSOA.NEXTVAL, 'Jo�o', 'joao@example.com');

drop table "C##MAPINVEST"."ACESSO" cascade constraints PURGE;
drop table "C##MAPINVEST"."AUDITORIA" cascade constraints PURGE;
drop table "C##MAPINVEST"."DOCUMENTO_PRINCIPAL" cascade constraints PURGE;
drop table "C##MAPINVEST"."DOCUMENTOS_SECUNDARIOS" cascade constraints PURGE;
drop table "C##MAPINVEST"."ENDERECO" cascade constraints PURGE;
drop table "C##MAPINVEST"."PERFIL" cascade constraints PURGE;
drop table "C##MAPINVEST"."PERFIL_PERMISSAO" cascade constraints PURGE;
drop table "C##MAPINVEST"."PERMISSAOTELA" cascade constraints PURGE;
drop table "C##MAPINVEST"."PESSOA" cascade constraints PURGE;
drop table "C##MAPINVEST"."PESSOA_FISICA" cascade constraints PURGE;
drop table "C##MAPINVEST"."PESSOA_JURIDICA" cascade constraints PURGE;
drop table "C##MAPINVEST"."PESSOA_TELEFONE" cascade constraints PURGE;
drop table "C##MAPINVEST"."TELEFONE" cascade constraints PURGE;


