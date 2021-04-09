CREATE DATABASE dbaula01;

USE dbaula01;
GO

CREATE TABLE musica(
cod_musica INTEGER NOT NULL PRIMARY KEY,
nm_musica VARCHAR(50) NOT NULL,
duracao decimal (4,2) NOT NULL
);
GO

CREATE TABLE autor(
cod_autor INTEGER NOT NULL PRIMARY KEY,
nm_autor VARCHAR (50) NOT NULL
);
GO

ALTER TABLE musica ADD PRIMARY KEY (cod_musica)
GO

CREATE TABLE musica_autor(
cod_musica INTEGER NOT NULL,
cod_autor INTEGER NOT NULL
);
GO

ALTER TABLE musica_autor ADD FOREIGN KEY (cod_musica) REFERENCES musica (cod_musica);
ALTER TABLE musica_autor ADD FOREIGN KEY (cod_autor) REFERENCES autor (cod_autor);
GO

CREATE TABLE gravadora(
cod_gravadora INTEGER NOT NULL PRIMARY KEY,
nm_gravadora VARCHAR(50) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone INTEGER NOT NULL,
contato INTEGER NOT NULL,
url VARCHAR(100) NULL
);
GO


CREATE TABLE cd(
cod_cd INTEGER NOT NULL PRIMARY KEY,
cod_gravadora INTEGER NOT NULL,
nm_cd VARCHAR(50) NOT NULL,
preco_venda DECIMAL(5,2) NOT NULL,
dt_lanca SMALLDATETIME NOT NULL,
cd_indicado INTEGER NOT NULL,
FOREIGN KEY (cod_gravadora) REFERENCES gravadora (cod_gravadora),
FOREIGN KEY (cd_indicado) REFERENCES cd (cod_cd)
);
GO

CREATE TABLE cd_categoria(
cod_categoria INTEGER NOT NULL PRIMARY KEY,
menor_preco DECIMAL(5,2) NOT NULL,
maior_preco DECIMAL(5,2) NOT NULL
);
GO

CREATE TABLE faixa(
cod_cd INTEGER NOT NULL,
cod_musica INTEGER NOT NULL,
nroFaixa INTEGER NOT NULL,
FOREIGN KEY(cod_cd)
REFERENCES cd(cod_cd),
FOREIGN KEY(cod_musica)
REFERENCES musica(cod_musica)
);
GO

CREATE TABLE item_cd(
cod_faixa INTEGER NOT NULL,
cod_cd INTEGER NOT NULL,
cod_musica INTEGER NOT NULL,
FOREIGN KEY (cod_faixa) REFERENCES faixa (cod_faixa),
FOREIGN KEY (cod_cd) REFERENCES cd (cod_cd),
FOREIGN KEY (cod_musica) REFERENCES musica (cod_musica)
);
GO

INSERT INTO autor
VALUES
(1,'Renato Russo'),
(2,'Tom Jobim'),
(3,'Chico Buarque'),
(4,'Dado Vila-Lobos'),
(5,'Marcelo Bonfá'),
(6,'Ico Ouro Preto'),
(7,'Vinicius de Morais');
GO

SELECT *
FROM musica_autor;
GO

INSERT INTO musica
VALUES
(1,'Será',2.28),
(2,'Ainda é Cedo',3.55),
(3,'Geração Coca-Cola',2.20),
(4,'Eduardo e Monica',4.32),
(5,'Tempo Perdido',5.00),
(6,'Indios',4.23),
(7,'Que País é este',3.04),
(8,'Faroeste Caboclo',9.03),
(9,'Há Tempos',3.16),
(10,'Pais e Filhos',5.06),
(11,'Meninos e Meninas',3.22),
(12,'Vento no Litoral',6.05),
(13,'Perfeição',4.35),
(14,'Giz',3.20),
(15,'Dezesseis',5.28),
(16,'Antes das Seis',3.09),
(17,'Meninos, Eu vi',3.25),
(18,'Eu te amo',3.06),
(19,'Piano na Mangueira',2.25),
(20,'A Violeira',2.54),
(21,'Anos Dourados',2.56),
(22,'Olha, Maria',3.55),
(23,'Biscate',3.20),
(24,'Retrato em Preto e Branco',3.03),
(25,'Falando de Amor',3.20),
(26,'Pois é',2.48),
(27,'Noite dos Mascarados',2.42),
(28,'Sabiá',3.20),
(29,'Imagina',2.52),
(30,'Bate-Boca',4.41);
GO

INSERT INTO musica_autor
VALUES
	(1,1), (1,4), (1,5),
	(2,1), (2,4), (2,5), (2,6),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1), (9,4),
	(10,1), (10,4), (10,5),
	(11,1), (11,4), (11,5),
	(12,1), (12,4), (12,5),
	(13,1), (13,4), (13,5),
	(14,1), (14,4), (14,5),
	(15,1), (15,4), (15,5),
	(16,1), (16,4), (16,5),
	(17,2), (17,3),
	(18,2), (18,3),
	(19,2), (19,3),
	(20,2), (20,3),
	(21,2), (21,3),
	(22,2), (22,3), (22,7),
	(23,3),
	(24,2), (24,3),
	(25,2),
	(26,2), (26,3),
	(27,3),
	(28,2), (28,3),
	(29,2), (29,3),
	(30,3)
	;
	GO

INSERT INTO gravadora
VALUES
	(1, 'EMI', 'Rod. Dutra, KM 29.8', 55659856, 89657894, 'emi@emi-music.com.br'),
	(2, 'Polygram', 'Rod. Imigrantes, KM 29.8', 99659856, 77987894, 'polygram@music.com.br'),
	(3, 'BMG', 'Rod. Anchieta, KM 289.8', 99654456, 75957004, 'bmg@music.com.br'),
	(4, 'Som Livre', 'Av. São José, KM 289.8', 99657806, 78657004, 'somlivre@music.com.br'),
	(5, 'Epic', 'Av. Alda, n.89', 58793321, 89654789, 'epic@music.com.br');

INSERT INTO cd
VALUES
	(1, 1, 'Mais do Mesmo', 5.00, '1985-03-02', 1),
	(2, 3, 'Bate Boca', 15.00, '1999-07-08', 2),
	(3, 4, 'Elis Regina- Essa Mulher', 18.00, '1986-25-05', 3),
	(4, 3, 'A Força que Nunca Seca', 5.25, '1981-15-07', 4),
	(5, 4, 'Perfil', 20.99, '1987-02-01', 5),
	(6, 2, 'Barry Manilow Greastest Hits', 25.00, '1958-18-12', 1),
	(7, 5, 'Listen Without Prejudice', 28.00, '1975-11-06', 7);
GO

INSERT INTO faixa
VALUES 	(1,1,1),
		(1,2,2),
		(1,3,3),
		(1,4,4),
		(1,5,5),
		(1,6,6),
		(1,7,7),
		(1,8,8),
		(1,9,9),
		(1,10,10),
		(1,11,11),
		(1,12,12),
		(1,13,13),
		(1,14,14),
		(1,15,15),
		(1,16,16),
		(2,17,1),
		(2,18,2),
		(2,19,3),
		(2,20,4),
		(2,21,5),
		(2,22,6),
		(2,23,7),
		(2,24,8),
		(2,25,9),
		(2,26,10),
		(2,27,11),
		(2,28,12),
		(2,29,13),
		(2,30,14);
GO

ALTER TABLE faixa
DROP CONSTRAINT PK__faixa__38E80FA626B4FECE;

ALTER TABLE item_cd
DROP CONSTRAINT FK__item_cd__cod_fai__47DBAE45;

DROP TABLE item_cd;

INSERT INTO cd_categoria
VALUES 	(1,10,20),
		(2,20,40),
		(3,30,60),
		(4,11,22),
		(5,15,30),
		(6,25,50),
		(7,21,42),
		(8,22,44),
		(9,9,18),
		(10,5,10);
GO

SELECT *
FROM autor;
GO

UPDATE autor
SET nm_autor='ColdPlay'
WHERE cod_autor=6;
GO

DELETE FROM musica
WHERE cod_musica = 30;
GO

INSERT INTO musica_autor
VALUES
(30,3);