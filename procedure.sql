-- Процедура додавання нопого Гран Прі
DROP PROCEDURE IF EXISTS new_gp(integer, varchar);
CREATE OR REPLACE PROCEDURE new_gp(gp_number integer, 
gp_name varchar)
LANGUAGE plpgsql
AS $$
BEGIN
 INSERT INTO races(race_id, race_year, race_name)
 VALUES (gp_number, EXTRACT(YEAR FROM CURRENT_DATE), gp_name);
END;
$$;

-- Виклик процедури
CALL new_gp(20033, 'New Grand Prix');

SELECT * FROM races;

DELETE FROM races
WHERE race_id = 20033;
