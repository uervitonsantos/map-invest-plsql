CREATE OR REPLACE PACKAGE validar_documentos_principais IS
    FUNCTION validar_cpf(p_cpf IN VARCHAR2) RETURN BOOLEAN;
    FUNCTION validar_cnpj(p_cnpj IN VARCHAR2) RETURN BOOLEAN;
END validar_documentos_principais;
/

CREATE OR REPLACE PACKAGE BODY validar_documentos_principais IS

    FUNCTION validar_cpf(p_cpf IN VARCHAR2) RETURN BOOLEAN IS
        m_total NUMBER := 0;
        m_digito NUMBER := 0;
        cpf_limpo VARCHAR2(11);
    BEGIN
        -- Remove caracteres não numéricos do CPF
        cpf_limpo := regexp_replace(p_cpf, '[^0-9]', '');
        
        DBMS_OUTPUT.PUT_LINE('cpf_limpo: ' || cpf_limpo);
        
        -- Verifica se o CPF possui o tamanho correto
        IF LENGTH(cpf_limpo) != 11 THEN
            RETURN FALSE;
        END IF;

        -- Cálculo do primeiro dígito verificador
        FOR i IN 1 .. 9 LOOP
            m_total := m_total + SUBSTR(cpf_limpo, i, 1) * (11 - i);
        END LOOP;

        m_digito := 11 - MOD(m_total, 11);
        IF m_digito > 9 THEN
            m_digito := 0;
        END IF;

        IF m_digito != SUBSTR(cpf_limpo, 10, 1) THEN
            RETURN FALSE;
        END IF;

        -- Cálculo do segundo dígito verificador
        m_total := 0;
        FOR i IN 1 .. 10 LOOP
            m_total := m_total + SUBSTR(cpf_limpo, i, 1) * (12 - i);
        END LOOP;

        m_digito := 11 - MOD(m_total, 11);
        IF m_digito > 9 THEN
            m_digito := 0;
        END IF;

        IF m_digito != SUBSTR(cpf_limpo, 11, 1) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;
    END validar_cpf;

    FUNCTION validar_cnpj(p_cnpj IN VARCHAR2) RETURN BOOLEAN IS
        digito NUMBER := 0;
        soma NUMBER := 0;
        cnpj_limpo VARCHAR2(14);
    BEGIN
        -- Remove caracteres não numéricos do CNPJ
        cnpj_limpo := regexp_replace(p_cnpj, '[^0-9]', '');
        
        -- Verifica se o CNPJ possui o tamanho correto
        IF LENGTH(cnpj_limpo) != 14 THEN
            RETURN FALSE;
        END IF;

        -- Cálculo do primeiro dígito verificador
        FOR i IN 1 .. 4 LOOP
            soma := soma + SUBSTR(cnpj_limpo, i, 1) * (6 - i);
        END LOOP;

        FOR i IN 5 .. 12 LOOP
            soma := soma + SUBSTR(cnpj_limpo, i, 1) * (14 - i);
        END LOOP;

        digito := 11 - MOD(soma, 11);
        IF digito > 9 THEN
            digito := 0;
        END IF;

        IF digito != SUBSTR(cnpj_limpo, 13, 1) THEN
            RETURN FALSE;
        END IF;

        -- Cálculo do segundo dígito verificador
        soma := 0;
        FOR i IN 1 .. 5 LOOP
            soma := soma + SUBSTR(cnpj_limpo, i, 1) * (7 - i);
        END LOOP;

        FOR i IN 6 .. 13 LOOP
            soma := soma + SUBSTR(cnpj_limpo, i, 1) * (15 - i);
        END LOOP;

        digito := 11 - MOD(soma, 11);
        IF digito > 9 THEN
            digito := 0;
        END IF;

        IF digito != SUBSTR(cnpj_limpo, 14, 1) THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;
    END validar_cnpj;

END validar_documentos_principais;
/

COMMIT;
