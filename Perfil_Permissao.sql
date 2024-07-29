DROP TABLE PERFIL_PERMISSAO; 

CREATE TABLE PERFIL_PERMISSAO
(
  PERFIL_ID INTEGER NOT NULL,
  PERMISSAO_TELA_ID INTEGER NOT NULL,
  PRIMARY KEY (PERFIL_ID, PERMISSAO_TELA_ID),
  FOREIGN KEY (PERFIL_ID) REFERENCES PERFIL (PERFIL_ID),
  FOREIGN KEY (PERMISSAO_TELA_ID) REFERENCES PERMISSAOTELA (PERMISSAOTELA_ID)
);

INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 1); 
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 2); 
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 3);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 4);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 5);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 6);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 7);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 8);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 9);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 10);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 11);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 12);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (1, 13);

INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 4);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 5);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 6);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 7);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 8);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 9);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 11);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 10);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 12);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (2, 13);

INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 4);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 5);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 7);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 8);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 10);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (3, 16);

INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (4, 4);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (4, 5);
INSERT INTO PERFIL_PERMISSAO (PERFIL_ID, PERMISSAO_TELA_ID) VALUES (4, 6);

COMMIT;

SELECT * FROM PERFIL_PERMISSAO;
