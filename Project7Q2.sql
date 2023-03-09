SPOOL C:\BD2\Project7Q2.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p6question2 IS
  v_consultant consultant%ROWTYPE;
  CURSOR c_skills (p_consultant_id consultant.c_id%TYPE) IS
    SELECT skill_description, certification
    FROM consultant_skill, skill
    WHERE c_id = p_consultant_id
    AND consultant_skill.skill_id = skill.skill_id;

  v_skill_description skill.skill_description%TYPE;
  v_certified consultant_skill.certification%TYPE;
BEGIN

  FOR r_consultants IN (SELECT * FROM consultant) LOOP
    v_consultant := r_consultants;

    DBMS_OUTPUT.PUT_LINE('Consultant ID: ' || v_consultant.c_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_consultant.c_first || ' ' || v_consultant.c_last);
    DBMS_OUTPUT.PUT_LINE('Skills:');
    
    FOR r_skills IN c_skills(v_consultant.c_id) LOOP

      v_skill_description := r_skills.skill_description;
      v_certified := r_skills.certification;

      DBMS_OUTPUT.PUT_LINE('  Skill Description: ' || v_skill_description);
      DBMS_OUTPUT.PUT_LINE('  Certified: ' || v_certified);
    END LOOP;
  END LOOP;
END;
/
exec p6question2;

Spool off;