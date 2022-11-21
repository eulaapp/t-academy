DROP DATABASE spring;

SELECT * FROM musica;
SELECT * FROM musica_artista;
SELECT * FROM playlist_musica;

DELETE FROM  playlist_musica WHERE musica_codigo = 2 AND playlist_codigo=6;
