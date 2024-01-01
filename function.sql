-- Функція повертає всі команди з сезону 2023-го року, що набрали кількість балів, меншу за вказану
DROP FUNCTION get_teams_with_points_below_threshold(integer);

CREATE OR REPLACE FUNCTION get_teams_with_points_below_threshold(p_threshold INT)
RETURNS TABLE (team_name VARCHAR, total_points INT) AS
$$
BEGIN
    RETURN QUERY
    SELECT constructors.constructor_name AS team_name, COALESCE(SUM(results.points), 0)::INT AS total_points
    	FROM results INNER JOIN constructors ON results.constructor_id = constructors.constructor_id 
    GROUP BY constructors.constructor_name
    HAVING COALESCE(SUM(results.points), 0) < p_threshold
	ORDER BY total_points DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_teams_with_points_below_threshold(100);


