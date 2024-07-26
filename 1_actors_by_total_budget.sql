USE db;

SELECT
    p.id AS ID,
    p.first_name AS "First name",
    p.last_name AS "Last name",
    SUM(m.budget) AS "Total movies budget"
FROM
    PERSON p
JOIN
    CHARACTERS c ON p.id = c.actor
JOIN
    MOVIE m ON c.movie_id = m.id
GROUP BY
    p.id, p.first_name, p.last_name
ORDER BY
    "Total movies budget" DESC;