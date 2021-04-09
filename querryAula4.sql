USE dbaula01;

SELECT *
FROM gravadora;
GO

INSERT INTO gravadora(cod_gravadora, nm_gravadora, telefone, contato, url)
VALUES
(6, 'SONY', 21280600, 2128-0688, 'contato@sonymusic.com.br'),
(7, 'DDM', 55113700, 968101684, 'ddm@ddmmusic.com.br'),
(8, 'CDA', 55132607, 973428364, 'atendimento@cda.com.br');
GO

SELECT nm_gravadora, endereco
FROM gravadora
WHERE endereco IS NULL;
GO

SELECT nm_gravadora, endereco
FROM gravadora
WHERE endereco IS NULL;
GO

SELECT nm_cd, dt_lanca
FROM cd
WHERE dt_lanca BETWEEN '1999/01/01' AND '2001/31/12';
GO

SELECT cod_musica, nroFaixa
FROM faixa
WHERE nroFaixa BETWEEN 5 AND 10;
GO

SELECT *
FROM musica m
INNER JOIN faixa f  on m.cod_musica  = f.cod_musica
WHERE f.nroFaixa  BETWEEN  5 AND 10;
GO

SELECT nm_musica, duracao
FROM musica
WHERE cod_musica IN(10, 15, 18, 20, 38);
GO

SELECT nm_cd, preco_venda
FROM cd
WHERE preco_venda LIKE '1%';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE 'A%';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '%A';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '%A%';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '_I_';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '__R_';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '%A_';
GO

SELECT * 
FROM musica
WHERE nm_musica LIKE '_A%';
GO

SELECT COUNT(*)
FROM gravadora;
GO

SELECT COUNT(*)
FROM cd;
GO

SELECT COUNT(*)
FROM musica;
GO

SELECT COUNT(*)
FROM musica_autor;
GO

SELECT COUNT(*)
FROM cd_categoria;
GO

SELECT COUNT(*)
FROM faixa;
GO

SELECT AVG(preco_venda)
FROM cd;
GO

SELECT SUM(duracao)
FROM musica;
GO

SELECT MIN(menor_preco)
FROM cd_Categoria;
GO

SELECT MAX(maior_preco)
FROM cd_categoria;
GO

SELECT STDEV(preco_venda)
FROM cd;
GO

SELECT VAR(preco_venda)
FROM cd;
GO

ALTER TABLE gravadora ALTER COLUMN endereco VARCHAR(100) NULL;

SELECT COUNT(*), cod_gravadora
from cd
GROUP BY cod_gravadora;
GO

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