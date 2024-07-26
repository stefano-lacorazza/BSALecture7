USE db;
SELECT
    M.id AS movie_id,
    M.title,
    COUNT(C.actor) AS actors_count
FROM
    MOVIE M
LEFT JOIN
    CHARACTERS C ON M.id = C.movie_id
WHERE
    M.release_date >= CURDATE() - INTERVAL 5 YEAR
GROUP BY
    M.id, M.title
ORDER BY
    M.release_date DESC;