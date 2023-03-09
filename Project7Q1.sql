SPOOL C:\BD2\Project7Q1.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p6question1 AS
  CURSOR c_faculty IS
    SELECT f_id, f_last, f_first, f_rank
    FROM faculty;
    v_f_id faculty.f_id%TYPE;
    
  CURSOR c_students (p_f_id faculty.f_id%TYPE) IS
    SELECT s_id, s_last, s_first, s_dob, s_class
    FROM student
    WHERE f_id = p_f_id;
    v_s_id student.s_id%TYPE;
    
BEGIN
   FOR f_faculty IN c_faculty LOOP
    DBMS_OUTPUT.PUT_LINE('Faculty ID: ' || f_faculty.f_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || f_faculty.f_first || ' ' || f_faculty.f_last);
    DBMS_OUTPUT.PUT_LINE('Rank: ' || f_faculty.f_rank);
    DBMS_OUTPUT.PUT_LINE('Students Advised:');
    
    FOR f_students IN c_students(f_faculty.f_id) LOOP
      DBMS_OUTPUT.PUT_LINE('  Student ID: ' || f_students.s_id);
      DBMS_OUTPUT.PUT_LINE('  Name: ' || f_students.s_first || ' ' || f_students.s_last);
      DBMS_OUTPUT.PUT_LINE('  Birthdate: ' || f_students.s_dob);
      DBMS_OUTPUT.PUT_LINE('  Class: ' || f_students.s_class);
    END LOOP;
  END LOOP;
END;
/
exec p6question1;

Spool off;