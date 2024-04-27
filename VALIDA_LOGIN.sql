CREATE OR REPLACE FUNCTION validar_padrao_login_senha (
    p_login_usuario IN VARCHAR2,
    p_senha_usuario IN VARCHAR2
) RETURN BOOLEAN
IS
    v_valid_login BOOLEAN := FALSE;
    v_valid_senha BOOLEAN := FALSE;
BEGIN
    -- Verifica o padrão do login
    IF LENGTH(p_login_usuario) <= 20 AND
       REGEXP_LIKE(p_login_usuario, '^[a-z0-9]+$') THEN
        v_valid_login := TRUE;
    END IF;

    -- Verifica o padrão da senha
    IF LENGTH(p_senha_usuario) BETWEEN 8 AND 50 AND
       REGEXP_LIKE(p_senha_usuario, '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$') THEN
        v_valid_senha := TRUE;
    END IF;

    -- Retorna TRUE se ambos login e senha seguem os padrões, FALSE caso contrário
    RETURN v_valid_login AND v_valid_senha;
END validar_padrao_login_senha;
/
