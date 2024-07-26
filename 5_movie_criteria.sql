USE lecture7;
SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_OBJECT(
        'id', f.id,
        'name', f.name,
        'mime_type', f.mime_type,
        'key_', f.key_,
        'url', f.url,
        'created_at', f.created_at,
        'updated_at', f.updated_at
    ) AS poster,
    JSON_OBJECT(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name
    ) AS director
FROM
    MOVIE m
    JOIN FILES f ON m.poster = f.id
    JOIN PERSON p ON m.director = p.id
    JOIN MOVIEGENRE mg ON m.id = mg.movie_id
    JOIN GENRE g ON mg.genre_id = g.id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND (g.name = 'Action' OR g.name = 'Drama')
GROUP BY
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    f.id,
    f.name,
    f.mime_type,
    f.key_,
    f.url,
    f.created_at,
    f.updated_at,
    p.id,
    p.first_name,
    p.last_name
HAVING
    COUNT(DISTINCT g.id) > 0;
