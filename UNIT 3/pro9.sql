SET SEREVEROUTPUT ON 

DECLARE
    v_empno EMP.EMPNO%TYPE := &Emp_No;
    v_comm  EMP.COMMISSION%TYPE;

    NULL_COMMISSION EXCEPTION;

BEGIN
    SELECT COMMISSION
    INTO v_comm
    FROM EMP
    WHERE EMPNO = v_empno;

    IF v_comm IS NULL THEN
        RAISE NULL_COMMISSION;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Commission = ' || v_comm);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');

    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE('Commission is NULL');

END;
/