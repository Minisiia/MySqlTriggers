/*
Создайте триггер, который будет удалять записи со 2-й и 3-й таблиц перед удалением записей 
из таблиц сотрудников (1-й таблицы), чтобы не нарушить целостность данных.
*/

DELIMITER //
USE MyTransDb;
//

SELECT * FROM personalinfo;
SELECT * FROM serviceinfo;
SELECT * FROM staff;
//

CREATE TRIGGER delete_first
BEFORE DELETE ON staff
FOR EACH ROW
BEGIN
DELETE FROM serviceinfo WHERE id_main = OLD.id_main;
DELETE FROM personalinfo WHERE id_main = OLD.id_main;
END;
//

DELETE FROM staff WHERE id_main = 1; 
//
