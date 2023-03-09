SPOOL C:\BD2\Project7Q3.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p6question3 AS
v_item NUMBER;
BEGIN
   FOR f_item IN (SELECT item_id, item_desc, cat_id FROM item) LOOP
       DBMS_OUTPUT.PUT_LINE('Item number: ' || f_item.item_id || '. Description: ' || f_item.item_desc || '. Category: ' || f_item.cat_id);
       v_item := f_item.item_id;
       
       FOR f_inventory IN (SELECT inv_id, inv_price, inv_qoh FROM inventory WHERE item_id = v_item) LOOP
       
       DBMS_OUTPUT.PUT_LINE('Inventory number '|| f_inventory.inv_id || '; The price is ' || f_inventory.inv_price || '. Quantity:  ' || f_inventory.inv_qoh);
       END LOOP;
    END LOOP;
END;
/
exec p6question3;

Spool off;