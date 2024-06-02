CREATE OR REPLACE TRIGGER AUDITORIA_USUARIO
BEFORE INSERT OR UPDATE OR DELETE ON USUARIO
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
        v_registro_id := :NEW.USUARIO_ID;
    ELSIF UPDATING THEN
        v_evento := 'UPDATE';
        v_registro_id := :NEW.USUARIO_ID;
    ELSIF DELETING THEN
        v_evento := 'DELETE';
        v_registro_id := :OLD.USUARIO_ID;
    END IF;

    -- Captura os dados antigos e novos em formato JSON
    IF UPDATING OR DELETING THEN
        SELECT JSON_OBJECT(
            'USUARIO_ID' VALUE :OLD.USUARIO_ID,
            'NOME' VALUE :OLD.NOME,
            'SOBRENOME' VALUE :OLD.SOBRENOME,
            'IDADE' VALUE TO_CHAR(:OLD.IDADE, 'YYYY-MM-DD'),
            'SEXO' VALUE :OLD.SEXO,
            'EMAIL' VALUE :OLD.EMAIL
        ) INTO v_dados_antigos FROM DUAL;
    END IF;

    IF INSERTING OR UPDATING THEN
        SELECT JSON_OBJECT(
            'USUARIO_ID' VALUE :NEW.USUARIO_ID,
            'NOME' VALUE :NEW.NOME,
            'SOBRENOME' VALUE :NEW.SOBRENOME,
            'IDADE' VALUE TO_CHAR(:NEW.IDADE, 'YYYY-MM-DD'),
            'SEXO' VALUE :NEW.SEXO,
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
        USUARIO,
        DADOS_ANTIGOS,
        DADOS_NOVOS
    ) VALUES (
        SEQ_AUDITORIA.NEXTVAL,
        SYSTIMESTAMP,
        v_evento,
        'USUARIO',
        v_registro_id,
        USER,
        v_dados_antigos,
        v_dados_novos
    );
END;
/
