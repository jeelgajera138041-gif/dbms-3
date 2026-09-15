SET SEREVEROUTPUT ON 

DECLARE
    v_name   EMP.EMP_NAME%TYPE;
    v_salary EMP.BASIC_SALARY%TYPE;
BEGIN
    SELECT EMP_NAME, BASIC_SALARY
    INTO v_name, v_salary
    FROM EMP
    WHERE AGE = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found whose age is 50');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee has age 50');
END;
/