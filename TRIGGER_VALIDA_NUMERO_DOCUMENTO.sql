CREATE OR REPLACE TRIGGER validar_documento
BEFORE INSERT OR UPDATE ON DOCUMENTO_PRINCIPAL
FOR EACH ROW
DECLARE
    l_valido BOOLEAN;
BEGIN
    IF :NEW.TIPO_DOCUMENTO_PRINCIPAL = 'CPF' THEN
        l_valido := validar_documentos_principais.validar_cpf(:NEW.NUMERO_DOCUMENTO_PRINCIPAL);
    ELSIF :NEW.TIPO_DOCUMENTO_PRINCIPAL = 'CNPJ' THEN
        l_valido := validar_documentos_principais.validar_cnpj(:NEW.NUMERO_DOCUMENTO_PRINCIPAL);
    ELSE
        l_valido := FALSE; -- Caso inesperado, mas coberto pela constraint CK_TIPO_DOCUMENTO
    END IF;

    IF NOT l_valido THEN
        RAISE_APPLICATION_ERROR(-20001, 'Documento inválido: ' || :NEW.NUMERO_DOCUMENTO_PRINCIPAL);
    END IF;
END;
/

COMMIT;
