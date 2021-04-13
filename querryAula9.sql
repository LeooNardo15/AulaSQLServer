USE dbaula01;
GO

SELECT cod_gravadora
FROM gravadora

INTERSECT

SELECT cod_gravadora
FROM cd;
GO


SELECT cod_musica
FROM musica
INTERSECT
SELECT cod_musica
FROM faixa;
GO

SELECT cod_autor
FROM autor
INTERSECT
SELECT cod_autor
FROM musica_autor;
GO

SELECT cod_autor
FROM autor
INTERSECT
SELECT cod_autor
FROM musica_autor
WHERE cod_musica IN (	SELECT cod_musica
						FROM musica
						WHERE cod_musica IN (	SELECT cod_musica
												FROM faixa
												WHERE cod_cd=2));

SELECT cod_autor
FROM autor
INTERSECT
SELECT cod_autor
FROM musica_autor
WHERE cod_musica IN (	SELECT cod_musica
						FROM faixa
						WHERE cod_cd=2);

SELECT cod_autor
FROM autor
INTERSECT
SELECT cod_autor
FROM musica_autor
WHERE cod_musica IN (	SELECT cod_musica
						FROM musica
						WHERE nm_musica LIKE '%amor%');
GO

INSERT INTO musica
VALUES 
(31, 'Ride the Lightnings', 7.08),
(32, 'Enjoy the Silence', 4.43),
(33, 'Por um gole a mais', 3.51);
GO

INSERT INTO autor
VALUES
(8, 'Metallica'),
(9, 'Depeche Mode'),
(10, 'Bruno e Marrone');
GO

INSERT INTO gravadora
VALUES
(9, 'Sire/Mute', NULL, 40028922, 400028900, NULL),
(10, 'Mosh Studios', NULL, 55171755, 55171700, NULL),
(11, 'Blackend Recordings', NULL, 68453248, 68453200, NULL);
GO


--gravadoras que não tem cd
SELECT cod_gravadora
FROM gravadora
EXCEPT
SELECT cod_gravadora
FROM cd;
GO

--musicas que nunca foram gravadas
SELECT cod_musica
FROM musica
EXCEPT
SELECT cod_musica
FROM faixa;
GO

--autores sem musica
SELECT cod_autor
FROM autor
EXCEPT
SELECT cod_autor
FROM musica_autor;	
GO

--autores que nunca foram gravados
SELECT cod_autor
FROM autor
EXCEPT
SELECT cod_autor
FROM musica_autor
WHERE cod_musica IN (	SELECT cod_musica
						FROM faixa);
GO

SELECT nm_cd, preco_venda,
	CASE
		WHEN preco_venda<10 THEN ROUND(preco_venda*.9,2)
		WHEN preco_venda>=10 AND preco_venda<13 THEN ROUND(preco_venda*.8,2)
		ELSE ROUND(preco_venda*.7,2) 
	END VENDA
FROM cd;
GO

UPDATE cd
SET preco_venda=  
	CASE
		WHEN preco_venda<10 THEN ROUND(preco_venda*.9,2)
		WHEN preco_venda>=10 AND preco_venda<13 THEN ROUND(preco_venda*.8,2)
		ELSE ROUND(preco_venda*.7,2) 
	END 
GO

SELECT nm_gravadora,
	CASE cod_gravadora
		WHEN 1 THEN 'EMI'
		WHEN 2 THEN 'BMG'
		WHEN 3 THEN 'SONY'
		END 
FROM gravadora;
GO

ALTER TABLE cd
ALTER COLUMN cd_indicado INT NULL; 

INSERT INTO cd
VALUES
(8, 11, 'Ride the Lightning', 15.00, '1984-19-03', NULL),
(9, 10, 'Meu presente é você', 24.90, '2005-01-06', NULL),
(10, 9, 'Violator', 171.00, '1990-27-07', NULL);
GO

SELECT cod_cd, nm_cd, cd_indicado,
COALESCE(cd_indicado, cod_cd)"INDICADO"
FROM cd;
GO