SET SEREVEROUTPUT ON 

DECLARE
    v_dept_no NUMBER := &Dept_No;
    
    CURSOR c_emp IS
        SELECT *
        FROM EMP
        WHERE DEPT_NO = v_dept_no;

    NO_DEPT_FOUND EXCEPTION;
    v_count NUMBER := 0;

BEGIN
    FOR emp_rec IN c_emp LOOP

        INSERT INTO EMP_BACKUP
        VALUES emp_rec;

        v_count := v_count + 1;

    END LOOP;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_count || ' records inserted successfully');

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found for Department ' || v_dept_no);
END;
/