/*Tигер, який відслідковує модифікацію таблиці constructors та створює 
окрему таблицю constructors_changes, в якій відображається, яка саме 
була здійснена операція UPDATE, яким користувачем, та
записує час, коли відбулася дана операція. */
SELECT user from constructors;

DROP TABLE IF EXISTS constructors_changes;

CREATE TABLE constructors_changes(
	id SERIAL PRIMARY KEY, 
	updated TIMESTAMP, 
	user_name varchar(50) NOT NULL
	);
						  
CREATE OR REPLACE FUNCTION table_constructors_changes() RETURNS trigger 
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO constructors_changes(updated, user_name)
	VALUES(NOW(), user);
	RETURN NULL;
END;
$$ ;

CREATE TRIGGER constructors_update_details 
AFTER UPDATE ON constructors
FOR EACH ROW EXECUTE FUNCTION table_constructors_changes();


SELECT * FROM constructors;

UPDATE constructors SET constructor_name = 'Mercedes' WHERE constructor_id = 1;

SELECT * FROM constructors_changes;



