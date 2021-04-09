USE dbaula01;
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