SET SEREVEROUTPUT ON 

DECLARE
    v_name   RESULT.STUDENT_NAME%TYPE := '&Student_Name';
    v_result RESULT.RESULT%TYPE;
BEGIN
    SELECT RESULT
    INTO v_result
    FROM RESULT
    WHERE STUDENT_NAME = v_name;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student not found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one student found');
END;
/