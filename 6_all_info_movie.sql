USE db;
SELECT
    M.id AS movie_id,
    M.title,
    M.release_date,
    M.duration,
    M.description,
    JSON_OBJECT(
        'id', PF.id,
        'name', PF.name,
        'mime_type', PF.mime_type,
        'key', PF.key_,
        'url', PF.url
    ) AS poster,
    JSON_OBJECT(
        'id', D.id,
        'first_name', D.first_name,
        'last_name', D.last_name,
        'photo', JSON_OBJECT(
            'id', PF2.id,
            'name', PF2.name,
            'mime_type', PF2.mime_type,
            'key', PF2.key_,
            'url', PF2.url
        )
    ) AS director,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', A.id,
            'first_name', A.first_name,
            'last_name', A.last_name,
            'photo', JSON_OBJECT(
                'id', PF3.id,
                'name', PF3.name,
                'mime_type', PF3.mime_type,
                'key', PF3.key_,
                'url', PF3.url
            )
        )
    ) AS actors,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', G.id,
            'name', G.name
        )
    ) AS genres
FROM
    MOVIE M
JOIN
    FILES PF ON M.poster = PF.id
JOIN
    PERSON D ON M.director = D.id
LEFT JOIN
    FILES PF2 ON D.primary_image = PF2.id
LEFT JOIN
    CHARACTERS C ON M.id = C.movie_id
LEFT JOIN
    PERSON A ON C.actor = A.id
LEFT JOIN
    FILES PF3 ON A.primary_image = PF3.id
LEFT JOIN
    MOVIEGENRE MG ON M.id = MG.movie_id
LEFT JOIN
    GENRE G ON MG.genre_id = G.id
WHERE
    M.id = 1
GROUP BY
    M.id, PF.id, D.id, PF2.id
ORDER BY
    M.title;
