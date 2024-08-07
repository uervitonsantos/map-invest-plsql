CREATE OR REPLACE TRIGGER AUDITORIA_ACESSO
BEFORE INSERT OR UPDATE OR DELETE ON ACESSO
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
        v_registro_id := :NEW.ACESSO_ID;
    ELSIF UPDATING THEN
            -- Verifica se houve realmente uma altera��o nos campos monitorados
        IF :OLD.ACESSO_ID = :NEW.ACESSO_ID AND
           :OLD.PESSOA_ID = :NEW.PESSOA_ID AND
           :OLD.PERFIL_ID = :NEW.PERFIL_ID AND
           :OLD.EMAIL = :NEW.EMAIL THEN
            -- Se todos os valores s�o iguais, n�o faz nada
            RETURN;
        END IF;
        v_evento := 'UPDATE';
        v_registro_id := :NEW.ACESSO_ID;
    ELSIF DELETING THEN
        v_evento := 'DELETE';
        v_registro_id := :OLD.ACESSO_ID;
    END IF;

    -- Captura os dados antigos e novos em formato JSON
    IF UPDATING OR DELETING THEN
        SELECT JSON_OBJECT(
            'ACESSO_ID' VALUE :OLD.ACESSO_ID,
            'PESSOA_ID' VALUE :OLD.PESSOA_ID,
            'PERFIL_ID' VALUE :OLD.PERFIL_ID,
            'EMAIL' VALUE :OLD.EMAIL
        ) INTO v_dados_antigos FROM DUAL;
    END IF;

    IF INSERTING OR UPDATING THEN
        SELECT JSON_OBJECT(
            'ACESSO_ID' VALUE :NEW.ACESSO_ID,
            'PESSOA_ID' VALUE :NEW.PESSOA_ID,
            'PERFIL_ID' VALUE :NEW.PERFIL_ID,
            'EMAIL' VALUE :NEW.EMAIL
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
        'ACESSO',
        v_registro_id,
        USER,
        v_dados_antigos,
        v_dados_novos
    );
END;
/

COMMIT;
