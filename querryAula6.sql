USE dbaula01;

SELECT ASCII(nm_musica), nm_musica
FROM musica
WHERE ASCII(nm_musica)=83;
GO

SELECT UPPER(nm_musica) Maiusculo, LOWER(nm_musica) Minusculo
FROM musica;
GO

SELECT LOWER(nm_gravadora) Minusculo, UPPER(endereco) Maiusculo
FROM gravadora;
GO

SELECT * 
FROM gravadora
WHERE LOWER(LEFT(endereco, 3))='rod';
GO

SELECT LEFT(nm_cd, 3) 
FROM cd;
GO

SELECT RIGHT(nm_musica,4)
FROM musica;
GO

SELECT SUBSTRING(nm_musica, 9, 4)
FROM musica
WHERE cod_musica IN(2, 3, 17);
GO

SELECT SUBSTRING(nm_musica, 4, 5)
FROM musica
WHERE cod_musica IN(3, 4, 7, 8, 9, 24);
GO

SELECT SUBSTRING(nm_musica, 6, 4)
FROM musica
WHERE cod_musica IN(15, 18, 22, 27, 30);
GO

SELECT SUBSTRING(nm_musica, 10, 2)
FROM musica
WHERE cod_musica IN(7, 17);
GO

SELECT SUBSTRING(nm_musica, 4, 2)
FROM musica
WHERE cod_musica IN(9, 27);
GO

SELECT SUBSTRING(nm_musica, 10, 8)
FROM musica
WHERE cod_musica IN(4,7,8,11,12,16,17,25,27);
GO

SELECT ASCII('L') L, ASCII('E') E, ASCII('O') O, ASCII('N') N, ASCII('A') A, ASCII('R') R, ASCII('D') D, ASCII('O') O;
GO
-- 76 69 79 78 65 82 68 79

SELECT DAY(dt_lanca)Dia, dt_lanca
FROM cd;
GO

SELECT DAY(dt_lanca)Dia, MONTH(dt_lanca) Mês, YEAR(dt_lanca) Ano
FROM cd;
GO

SELECT DATEADD(QUARTER, 1, dt_lanca) Trimestre, dt_lanca
FROM cd;
GO

SELECT DATEADD(MONTH, 3, dt_lanca) Mês, dt_lanca
FROM cd;
GO

SELECT DATEADD(YEAR, 40, dt_lanca) Ano, dt_lanca
FROM cd;
GO

SELECT DATEDIFF(YEAR, dt_lanca, GETDATE())ANOS, dt_lanca, GETDATE() Hoje
FROM cd;
GO

SELECT DATEDIFF(YEAR, '2001-06-15', GETDATE())ANOS
GO

SELECT ABS(preco_venda)
FROM cd;
GO

SELECT ROUND(ABS(preco_venda), 1), ABS(preco_venda)
FROM cd;
GO

SELECT ROUND(ABS(preco_venda), -1), ABS(preco_venda)
FROM cd;
GO

-- A=-1 B=-4 C=5
SELECT (4 + SQRT((POWER(-4, 2))-4*(-1)*5))/(-2) x1, (4 - SQRT((POWER(-4, 2))-4*(-1)*5))/(-2) x2;
GO

--Raio = 5
SELECT PI()*POWER(5,2) Área;
GO

