SET SEREVEROUTPUT ON 

DECLARE
    v_name   EMP.EMP_NAME%TYPE := '&Employee_Name';
    v_salary EMP.BASIC_SALARY%TYPE;
BEGIN
    SELECT BASIC_SALARY
    INTO v_salary
    FROM EMP
    WHERE EMP_NAME = v_name;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee found');
END;
/