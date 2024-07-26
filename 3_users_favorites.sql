USE db;
SELECT 
    U.id AS user_id,
    U.username,
    GROUP_CONCAT(F.movie_id) AS favorite_movie_ids
FROM 
    USERS U
LEFT JOIN 
    FAVORITES F ON U.id = F.person_id
GROUP BY 
    U.id, U.username
ORDER BY 
    U.username;