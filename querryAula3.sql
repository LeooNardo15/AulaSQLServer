USE dbaula01;

SELECT cod_musica, duracao FROM musica;

SELECT cod_cd, nm_cd, preco_venda FROM cd;

SELECT * FROM cd_categoria;

SELECT * FROM musica ORDER BY duracao DESC;

SELECT * FROM musica ORDER BY nm_musica ASC;

SELECT * FROM musica_autor ORDER BY cod_musica DESC;

SELECT * FROM faixa ORDER BY nroFaixa ASC;

SELECT * FROM autor ORDER BY nm_autor DESC;

SELECT nm_musica, duracao FROM musica WHERE duracao>3;

SELECT * FROM faixa WHERE cod_cd=2;
SELECT COUNT(*) FROM faixa WHERE cod_cd=2;

SELECT * FROM gravadora WHERE cod_gravadora=3;
SELECT COUNT(*) FROM gravadora WHERE cod_gravadora=3;

SELECT * FROM musica WHERE duracao>5;
SELECT COUNT(*) FROM musica WHERE duracao>5;

SELECT * FROM cd WHERE preco_venda>20;
SELECT COUNT(*) FROM cd WHERE preco_venda>20;

SELECT * FROM cd_categoria WHERE maior_preco<=100;
SELECT COUNT(*) FROM cd_categoria WHERE maior_preco<=100;

SELECT * FROM autor WHERE cod_autor>=2;
SELECT COUNT(*) FROM autor WHERE cod_autor>=2;

SELECT * FROM faixa WHERE nroFaixa<>13;
SELECT COUNT(*) FROM faixa WHERE nroFaixa<>13;

SELECT nm_cd, preco_venda, cod_gravadora FROM cd WHERE preco_venda>10 AND cod_gravadora=4;

SELECT * FROM musica WHERE cod_musica=10 OR cod_musica=15 OR cod_musica=18 OR cod_musica=20 OR cod_musica=38;

SELECT nm_cd, preco_venda FROM cd WHERE NOT(preco_venda<15);