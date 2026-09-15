SET SEREVEROUTPUT ON 

DECLARE
    v_name EMP.EMP_NAME%TYPE;
    v_salary EMP.BASIC_SALARY%TYPE;
BEGIN
    SELECT EMP_NAME, BASIC_SALARY
    INTO v_name, v_salary
    FROM EMP
    WHERE EMP_ID = 9999;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found');
END;
/