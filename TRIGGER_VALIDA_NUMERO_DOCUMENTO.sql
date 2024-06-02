CREATE OR REPLACE TRIGGER validar_documento
BEFORE INSERT OR UPDATE ON DOCUMENTO
FOR EACH ROW
DECLARE
    l_valido BOOLEAN;
BEGIN
    IF :NEW.TIPO_DOCUMENTO = 'CPF' THEN
        l_valido := validar_documentos.validar_cpf(:NEW.NUMERO_DOCUMENTO);
    ELSIF :NEW.TIPO_DOCUMENTO = 'CNPJ' THEN
        l_valido := validar_documentos.validar_cnpj(:NEW.NUMERO_DOCUMENTO);
    ELSE
        l_valido := FALSE; -- Caso inesperado, mas coberto pela constraint CK_TIPO_DOCUMENTO
    END IF;

    IF NOT l_valido THEN
        RAISE_APPLICATION_ERROR(-20001, 'Documento inválido: ' || :NEW.NUMERO_DOCUMENTO);
    END IF;
END;
/

COMMIT;
