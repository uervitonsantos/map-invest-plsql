DROP TABLE PESSOA_TELEFONE; 

CREATE TABLE PESSOA_TELEFONE
(
  PESSOA_ID INTEGER NOT NULL,
  TELEFONE_PESSOA_ID INTEGER NOT NULL,
  PRIMARY KEY (PESSOA_ID, TELEFONE_PESSOA_ID),
  FOREIGN KEY (PESSOA_ID) REFERENCES PESSOA (PESSOA_ID),
  FOREIGN KEY (TELEFONE_PESSOA_ID) REFERENCES TELEFONE (TELEFONE_ID)
);

SELECT * FROM PESSOA_TELEFONE;

COMMIT;