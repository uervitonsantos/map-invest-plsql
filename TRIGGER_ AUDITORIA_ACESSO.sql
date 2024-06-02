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
            'USUARIO_ID' VALUE :OLD.USUARIO_ID,
            'PERFIL_ID' VALUE :OLD.PERFIL_ID,
            'LOGIN_USUARIO' VALUE :OLD.LOGIN_USUARIO,
            'SENHA_USUARIO' VALUE :OLD.SENHA_USUARIO
        ) INTO v_dados_antigos FROM DUAL;
    END IF;

    IF INSERTING OR UPDATING THEN
        SELECT JSON_OBJECT(
            'ACESSO_ID' VALUE :NEW.ACESSO_ID,
            'USUARIO_ID' VALUE :NEW.USUARIO_ID,
            'PERFIL_ID' VALUE :NEW.PERFIL_ID,
            'LOGIN_USUARIO' VALUE :NEW.LOGIN_USUARIO,
            'SENHA_USUARIO' VALUE :NEW.SENHA_USUARIO
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
        'ACESSO',
        v_registro_id,
        USER,
        v_dados_antigos,
        v_dados_novos
    );
END;
/
