USE db;
SELECT 
    P.id AS director_id,
    CONCAT(P.first_name, ' ', P.last_name) AS director_name,
    AVG(M.budget) AS average_budget
FROM 
    PERSON P
JOIN 
    MOVIE M ON P.id = M.director
GROUP BY 
    P.id, P.first_name, P.last_name
ORDER BY 
    director_name;