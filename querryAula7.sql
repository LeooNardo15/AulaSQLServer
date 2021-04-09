USE dbAula01;
GO

CREATE VIEW vw_consultaMusica AS
SELECT * 
FROM musica
WHERE nm_musica LIKE 'A%' AND duracao>4;
GO

ALTER VIEW vw_consultaMusica AS
SELECT * 
FROM musica
WHERE nm_musica LIKE 'A%' AND duracao>4;
GO

UPDATE musica
SET duracao=4.75
WHERE cod_musica=2;
GO

SELECT *
FROM vw_consultaMusica;
GO

CREATE VIEW vw_mediaPreco AS
SELECT AVG(preco_venda) media
FROM cd
GROUP BY cod_gravadora;
GO

SELECT *
FROM vw_mediaPreco;
GO

CREATE VIEW vw_maiorMenorLanca AS
SELECT MIN(dt_lanca) menor, MAX(dt_lanca) maior
FROM cd;
GO

SELECT *
FROM vw_maiorMenorLanca;
GO

CREATE VIEW vw_musicasCd3 AS
SELECT cod_musica 
FROM faixa
WHERE cod_cd=3;
GO

SELECT *
FROM vw_musicasCd3;
GO

CREATE VIEW vw_gravRod AS
SELECT * 
FROM gravadora
WHERE LOWER(LEFT(endereco, 3))='rod';
GO

SELECT *
FROM vw_gravRod;
GO

CREATE VIEW vw_QuarterData AS
SELECT DATEADD(QUARTER, 10, dt_lanca) data_nova, dt_lanca data_anterior
FROM cd;
GO

SELECT *
FROM vw_QuarterData;
GO

SELECT nm_cd, preco_venda
FROM cd
WHERE preco_venda>(SELECT AVG(preco_venda)
					FROM cd);
GO

SELECT cod_gravadora, nm_cd, preco_venda
FROM cd;
GO

SELECT cod_gravadora
FROM cd
WHERE cod_cd=32;
GO

SELECT preco_venda
FROM cd
WHERE cod_cd=5;
GO

SELECT cod_gravadora, nm_cd, preco_venda
FROM cd
WHERE cod_gravadora = (SELECT cod_gravadora
						FROM cd
						WHERE cod_cd=2 AND preco_venda < (	SELECT preco_venda
																FROM cd
																WHERE cod_cd=5));
GO

SELECT nm_musica, duracao
FROM musica
WHERE cod_musica IN (	SELECT cod_musica 
						FROM faixa 
						WHERE cod_cd=1);
GO

SELECT nm_autor
FROM autor
WHERE cod_autor IN (	SELECT cod_autor
						FROM musica_autor
						WHERE cod_musica IN (	SELECT cod_musica
												FROM faixa
												WHERE cod_cd=2));
GO

SELECT nm_gravadora
FROM gravadora
WHERE cod_gravadora IN (	SELECT cod_gravadora
							FROM cd
							WHERE cod_cd IN (	SELECT cod_cd
												FROM faixa
												WHERE cod_musica IN (	SELECT cod_musica
																		FROM musica_autor
																		WHERE cod_autor IN (5,6))));
GO