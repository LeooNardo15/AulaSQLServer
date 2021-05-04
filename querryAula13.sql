USE dbaula01;
GO

--Musicas que não foram gravadas
SELECT f.cod_musica, m.nm_musica, m.duracao, f.cod_cd
FROM musica m LEFT OUTER JOIN faixa f --INTERSECÇÃO USAR RIGHT(FK)
ON f.cod_musica=m.cod_musica --UNIÃO USAR LEFT(PK)
WHERE f.cod_musica IS NULL --EXCEÇÃO (PK COM IS NULL)
GO

--Musicas que foram gravadas
SELECT f.cod_musica, m.nm_musica, m.duracao, f.cod_cd
FROM musica m RIGHT OUTER JOIN faixa f --INTERSECÇÃO USAR RIGHT(FK)
ON f.cod_musica=m.cod_musica --UNIÃO USAR LEFT(PK)
GO

--Quais as gravadoras que tem CD
SELECT DISTINCT g.cod_gravadora, g.nm_gravadora, g.telefone, c.nm_cd
FROM gravadora g RIGHT OUTER JOIN cd c
ON c.cod_gravadora=g.cod_gravadora;
GO

--Todas as gravadoras 
SELECT DISTINCT g.cod_gravadora, g.nm_gravadora, g.telefone, c.nm_cd
FROM gravadora g LEFT OUTER JOIN cd c
ON c.cod_gravadora=g.cod_gravadora;
GO

--Apresentar as gravadoras que não tem cds
SELECT DISTINCT g.cod_gravadora, g.nm_gravadora, g.telefone, c.nm_cd
FROM gravadora g LEFT OUTER JOIN cd c
ON c.cod_gravadora=g.cod_gravadora
WHERE c.cod_cd IS NULL;
GO

--Quais os nm dos cds, numeros da faixa e os nomes das musicas apenas dos cds 1 e 2
SELECT DISTINCT c.cod_cd, c.nm_cd, f.nroFaixa, m.nm_musica
FROM cd c RIGHT OUTER JOIN faixa f --aponta para faixa(fk)
ON f.cod_cd=c.cod_cd 
LEFT OUTER JOIN musica m --aponta para faixa(left porque tem fk)
ON m.cod_musica=f.cod_musica
WHERE f.cod_cd IN (1, 2); --trata-se de um fk
GO

INSERT INTO musica
VALUES
(34, 'Sound of Silence', 3.04),
(35, 'Souk Eyes', 4.34);
GO

INSERT INTO autor
VALUES
(11, 'Gorillaz'),
(12, 'Simon & Garfunkel');
GO

INSERT INTO autor
VALUES
(13, 'Depeache mode');

--Quais as musicas não foram gravadas
SELECT m.nm_musica, m.duracao, f.cod_musica, f.nroFaixa
FROM musica m LEFT OUTER JOIN faixa f
ON f.cod_musica=m.cod_musica
WHERE f.cod_musica IS NULL;
GO

--Quais os nomes dos cd´s, o preco de venda e cd da categoria dos precos que estejam entre o menor preço e maior preço da categoria
SELECT nm_cd, preco_venda
FROM cd 
WHERE preco_venda BETWEEN (	SELECT AVG(menor_preco)
							FROM cd_categoria) AND (	SELECT AVG(maior_preco)
														FROM cd_categoria);
GO

--Quais as músicas e autores da gravadora 3
SELECT DISTINCT m.nm_musica, a.nm_autor, g.nm_gravadora
FROM cd c RIGHT OUTER JOIN gravadora g
ON g.cod_gravadora=c.cod_gravadora
LEFT OUTER JOIN faixa f
ON f.cod_cd=f.cod_cd
LEFT OUTER JOIN musica m
ON m.cod_musica=f.cod_musica
LEFT OUTER JOIN musica_autor ma
ON ma.cod_musica=m.cod_musica
LEFT OUTER JOIN autor a
ON a.cod_autor=ma.cod_autor
WHERE g.cod_gravadora = 3;
GO

--QUAIS AS MÚSICAS(nmMusica) QUE SEJAM DOS CD´S(nmCD) COM PRECO MENOR QUE 15
SELECT DISTINCT m.nm_musica, c.nm_cd, c.preco_venda
FROM cd c RIGHT OUTER JOIN faixa f
ON f.cod_cd=c.cod_cd
LEFT OUTER JOIN musica m 
ON m.cod_musica=f.cod_musica
WHERE c.preco_venda<15;
GO