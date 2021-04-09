USE dbaula01;

SELECT * 
FROM musica 
WHERE duracao>5 AND duracao<9;
GO

SELECT * 
FROM faixa 
WHERE nroFaixa=11 
OR nroFaixa=13 
OR nroFaixa=17 
OR nroFaixa=33 
OR nroFaixa=50;
GO

SELECT * 
FROM gravadora 
ORDER BY nm_gravadora ASC;
GO

SELECT * 
FROM cd_categoria 
WHERE menor_preco>20 
AND maior_preco<40;
GO