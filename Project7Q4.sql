SPOOL C:\BD2\Project7Q4.txt
SELECT to_char(sysdate, 'DD Month YYYY HH:MI:SS') FROM dual;

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p6question4 AS
v_item NUMBER;
v_item_value NUMBER;
BEGIN
   FOR f_item IN (SELECT item_id, item_desc, cat_id FROM item) LOOP
        SELECT SUM(inv_price * inv_qoh) INTO v_item_value
        FROM inventory
        WHERE item_id = f_item.item_id;

       DBMS_OUTPUT.PUT_LINE('Item number: ' || f_item.item_id || '. Description: ' || f_item.item_desc || '. Value: ' || v_item_value || '. Category: ' || f_item.cat_id);
       v_item := f_item.item_id;
       
       FOR f_inventory IN (SELECT inv_id, inv_price, inv_qoh FROM inventory WHERE item_id = v_item) LOOP
       
       DBMS_OUTPUT.PUT_LINE('Inventory number '|| f_inventory.inv_id || '; The price is ' || f_inventory.inv_price || '. Quantity:  ' || f_inventory.inv_qoh);
       END LOOP;
    END LOOP;
END;
/
exec p6question4;

Spool off;