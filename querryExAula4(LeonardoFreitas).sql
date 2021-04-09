USE dbaula01

SELECT COUNT(cod_musica) QtdMusicas, cod_cd
FROM faixa
GROUP BY cod_cd;
GO

SELECT AVG(preco_venda), cod_gravadora
FROM cd
GROUP BY cod_gravadora;
GO

SELECT MIN(dt_lanca)
FROM cd;
GO

SELECT MAX(duracao)
FROM musica;
GO

SELECT COUNT(*) Autores, cod_musica
FROM musica_autor
GROUP BY cod_musica;
GO

SELECT *
FROM musica
WHERE cod_musica<15;
GO 

select COUNT(*) from musica where duracao>3.16 Having SUM(duracao)<77;
select * from musica order by duracao desc;

INSERT INTO faixa
VALUES
	(3, 8, 1),
	(3, 12, 2),
	(3, 15, 3),
	(3, 10, 4),
	(3, 5, 5),
	(3, 30, 6),
	(3, 13, 7),
	(3, 4, 8),
	(3, 6, 9),
	(3, 2, 10),
	(3, 22, 11),
	(3, 17, 12),
	(3, 11, 13),
	(3, 14, 14),
	(3, 23, 15),
	(3, 25, 16),
	(3, 28, 17);
GO

SELECT * FROM faixa;

SELECT SUM(m.duracao)
FROM musica m
INNER JOIN faixa f  on m.cod_musica  = f.cod_musica
WHERE f.cod_cd= 3;
GO