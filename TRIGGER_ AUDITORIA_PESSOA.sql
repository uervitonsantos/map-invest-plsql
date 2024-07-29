CREATE OR REPLACE TRIGGER AUDITORIA_PESSOA
BEFORE INSERT OR UPDATE OR DELETE ON PESSOA
FOR EACH ROW
DECLARE
    v_evento VARCHAR2(6);
    v_dados_antigos CLOB;
    v_dados_novos CLOB;
    v_registro_id INTEGER;
BEGIN
    -- Determina o tipo de evento
    IF INSERTING THEN
        v_evento := 'INSERT';
        v_registro_id := :NEW.PESSOA_ID;
    ELSIF UPDATING THEN
     -- Verifica se houve realmente uma alteração nos campos monitorados
        IF :OLD.NOME = :NEW.NOME AND
           :OLD.ATIVO = :NEW.ATIVO THEN
            -- Se todos os valores são iguais, não faz nada
            RETURN;
        END IF;
        v_evento := 'UPDATE';
        v_registro_id := :NEW.PESSOA_ID;
    ELSIF DELETING THEN
        v_evento := 'DELETE';
        v_registro_id := :OLD.PESSOA_ID;
    END IF;

    -- Captura os dados antigos e novos em formato JSON
    IF UPDATING OR DELETING THEN
        SELECT JSON_OBJECT(
            'PESSOA_ID' VALUE :OLD.PESSOA_ID,
            'NOME' VALUE :OLD.NOME,
            'ATIVO' VALUE :OLD.ATIVO
        ) INTO v_dados_antigos FROM DUAL;
    END IF;

    IF INSERTING OR UPDATING THEN
        SELECT JSON_OBJECT(
            'PESSOA_ID' VALUE :NEW.PESSOA_ID,
            'NOME' VALUE :NEW.NOME,
            'ATIVO' VALUE :NEW.ATIVO
        ) INTO v_dados_novos FROM DUAL;
    END IF;

    -- Insere registro de auditoria na tabela AUDITORIA
    INSERT INTO AUDITORIA (
        AUDITORIA_ID,
        DATA_HORA,
        EVENTO,
        TABELA_NOME,
        REGISTRO_ID,
        PESSOA,
        DADOS_ANTIGOS,
        DADOS_NOVOS
    ) VALUES (
        SEQ_AUDITORIA.NEXTVAL,
        SYSTIMESTAMP,
        v_evento,
        'PESSOA',
        v_registro_id,
        USER,
        v_dados_antigos,
        v_dados_novos
    );
END;
/

COMMIT;
