-- Виклик функції
SELECT * FROM get_teams_with_points_below_threshold(100);

-- Виклик процедури
CALL new_gp(20032, 'New Grand Prix');

-- Виклик тригеру
UPDATE constructors SET constructor_name = 'Ford' WHERE constructor_id = 1;
