use db_social_plat;

#1.Seleziona gli utenti che hanno postato almeno un video
SELECT u.id, u.username 
FROM medias m
JOIN users u ON m.user_id = u.id
WHERE m.type = "video"
GROUP BY u.id;

#2.Seleziona tutti i post senza like (13)
SELECT *
FROM posts p;

SELECT *
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
WHERE l.post_id IS NULL;

#3.Conta il numero di like per ogni post(152)
SELECT COUNT(*)
FROM likes l;

SELECT l.post_id, COUNT(*)
FROM likes l
LEFT JOIN posts p ON p.id = l.post_id
GROUP BY l.post_id;

SELECT SUM(numero_likes) AS totale_likes
FROM (
    SELECT COUNT(*) AS numero_likes
    FROM likes l 
    LEFT JOIN posts p ON p.id = l.post_id
    GROUP BY l.post_id
) AS conta;

#4.Ordina agli utenti per il numero di media caricati(25)
SELECT u.id, COUNT(m.id)
FROM users u 
RIGHT JOIN medias m ON m.user_id = u.id 
GROUP BY u.id
ORDER BY COUNT(m.id) DESC; 

#5.Ordina gli utenti per totale di likes ricevuti nei loro post(25)
SELECT l.post_id, COUNT(*)
FROM likes l
LEFT JOIN posts p ON p.id = l.post_id
GROUP BY l.post_id;

SELECT u.id, COUNT(l.post_id)
FROM users u 
JOIN likes l ON l.user_id = u.id
GROUP BY u.id
ORDER BY COUNT(l.post_id) DESC;

