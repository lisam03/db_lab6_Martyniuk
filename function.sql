-- Функція повертає всі команди, що набрали кількість балів, меншу за вказану
CREATE OR REPLACE FUNCTION get_teams_with_points_below_threshold(p_threshold INT)
RETURNS TABLE (team_name VARCHAR) AS
$$
BEGIN
    RETURN QUERY
    SELECT constructors.constructor_name AS team_name
    FROM constructors
    LEFT JOIN results ON constructors.constructor_id = results.constructor_id
    GROUP BY constructors.constructor_name
    HAVING COALESCE(SUM(results.points), 0) < p_threshold;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_teams_with_points_below_threshold(100);
