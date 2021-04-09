USE dbaula01;
GO

SELECT nm_musica, duracao
FROM musica
WHERE cod_musica IN (	SELECT cod_musica
						FROM musica_autor
						WHERE cod_autor IN (4, 5, 6));
GO

SELECT COUNT(cod_musica), cod_cd
FROM faixa
WHERE cod_musica IN (	SELECT cod_musica
						FROM musica
						WHERE duracao IN (	SELECT MAX(duracao)
											FROM musica));
GO

SELECT cod_musica CODIGO, nm_musica Nome
FROM musica
UNION ALL
SELECT cod_autor, nm_autor
FROM autor;
GO


SELECT cod_autor, nm_autor
FROM autor
UNION
SELECT cod_musica CODIGO, nm_musica Nome
FROM musica;
GO


SELECT cod_autor Código
FROM autor
UNION ALL
SELECT cod_musica 
FROM musica
UNION ALL
SELECT cod_cd
FROM cd
UNION ALL
SELECT cod_gravadora
FROM gravadora
UNION ALL
SELECT nroFaixa 
FROM faixa;
GO