SET SEREVEROUTPUT ON 

DECLARE
    v_a NUMBER := 100;
    v_b NUMBER := 0;
    v_result NUMBER;
BEGIN
    v_result := v_a / v_b;

    DBMS_OUTPUT.PUT_LINE('Result = ' || v_result);

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed');
END;
/