/* Create database */
create database db2020;

create table db2020.usuarios (
  id BIGINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255),
  login VARCHAR(255),
  senha VARCHAR(255),
  status VARCHAR(255),
  tipo VARCHAR(255),
  primary key (id));

/* Create tables Schema */
create table db2020.jogadores (
  id BIGINT NOT NULL AUTO_INCREMENT,
  imgJogador VARCHAR(255),
  nome VARCHAR(255),
  cpf VARCHAR(255),
  posicao VARCHAR(255),
  email VARCHAR(255),
  primary key (id));

create table db2020.clubes(
	id BIGINT NOT NULL AUTO_INCREMENT,
	imgClube VARCHAR(255),
  nomeClube VARCHAR(255),
  anoFundacao VARCHAR(4),
	primary key (id)
);

create table db2020.campeonatos(
  id BIGINT NOT NULL AUTO_INCREMENT,
  imgCampeonato VARCHAR(255),
  nomeCampeonato VARCHAR(255),
  premiacao DOUBLE,
  local VARCHAR(255),
  primary key (id)
);

create table db2020.clube_campeonato(
  id BIGINT NOT NULL AUTO_INCREMENT,
  idClube BIGINT,
  idCampeonato BIGINT,
  descricao VARCHAR(255),
  primary key (id)  
);

create table db2020.jogador_clube(
	id BIGINT NOT NULL AUTO_INCREMENT,
	idJogador BIGINT,
	idClube BIGINT,
  salario DOUBLE,
	descricao VARCHAR(255),
	primary key (id)	
);

/* Relations between tables */
ALTER TABLE db2020.jogador_clube ADD CONSTRAINT FK_JOGADOR_ID FOREIGN KEY (IDJOGADOR) REFERENCES db2020.JOGADORES(ID);
ALTER TABLE db2020.jogador_clube ADD CONSTRAINT FK_CLUBE_JOGADOR_ID FOREIGN KEY (IDCLUBE) REFERENCES db2020.CLUBES(ID);  
ALTER TABLE db2020.clube_campeonato ADD CONSTRAINT FK_CAMPEONATO_ID FOREIGN KEY (IDCAMPEONATO) REFERENCES db2020.CAMPEONATOS(ID);
ALTER TABLE db2020.clube_campeonato ADD CONSTRAINT FK_CLUBE_CAMPEONATO_ID FOREIGN KEY (IDCLUBE) REFERENCES db2020.CLUBES(ID); 

/* Insert Datas in the DataBase */
INSERT INTO `db2020`.`usuarios` (`nome`, `login`, `senha`,`status`, `tipo`) VALUES ('ivanildo', 'ivanildo', '12345678', 'ADM', "ADM");

INSERT INTO `db2020`.`jogadores` (`imgJogador`,`nome`, `cpf`, `posicao`,`email`) VALUES ('https://media.zenfs.com/pt/pt.goal.com/e7dbdf37d2ef728fba22bbde6f084047','Cristiano Ronaldo', '13508122859', 'Atacante', 'cr7@mail.com');
INSERT INTO `db2020`.`jogadores` (`imgJogador`,`nome`, `cpf`, `posicao`,`email`) VALUES ('https://s2.glbimg.com/t9pR66zE3QCv0dSZSO46xORXbOI=/0x0:3088x2061/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2019/6/l/aA0FAWSFGNF4ui3L6Dvg/2019-04-16t204603z-571955200-rc1488118d00-rtrmadp-3-soccer-champions-fcb-mun.jpg','Messi', '9214569871', 'Meio Campo', 'messi@mail.com');
INSERT INTO `db2020`.`jogadores` (`imgJogador`,`nome`, `cpf`, `posicao`,`email`) VALUES ('https://upload.wikimedia.org/wikipedia/commons/3/35/Matthijs_de_Ligt_2018.jpg','De Light', '9214569871', 'zagueiro', 'deLight@mail.com');

INSERT INTO `db2020`.`clubes` (`imgClube`,`nomeClube`, `anoFundacao`) VALUES ('https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Juventus_FC_2017_logo.svg/180px-Juventus_FC_2017_logo.svg.png','Juventus', '1897');
INSERT INTO `db2020`.`clubes` (`imgClube`,`nomeClube`, `anoFundacao`) VALUES ('https://upload.wikimedia.org/wikipedia/pt/thumb/4/43/FCBarcelona.svg/180px-FCBarcelona.svg.png','Barcelona', '1899');
INSERT INTO `db2020`.`clubes` (`imgClube`,`nomeClube`, `anoFundacao`) VALUES ('https://upload.wikimedia.org/wikipedia/pt/thumb/9/98/Real_Madrid.png/180px-Real_Madrid.png','Real Madrid', '1902');

INSERT INTO `db2020`.`campeonatos` (`imgCampeonato`,`nomeCampeonato`, `premiacao`, `local`) VALUES ('https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/LaLiga_Santander.svg/300px-LaLiga_Santander.svg.png','Liga espanhola', 1200000, "Paises Baixos");
INSERT INTO `db2020`.`campeonatos` (`imgCampeonato`,`nomeCampeonato`, `premiacao`, `local`) VALUES ('https://upload.wikimedia.org/wikipedia/pt/thumb/4/42/Campeonato_Brasileiro_S%C3%A9rie_A_logo.png/255px-Campeonato_Brasileiro_S%C3%A9rie_A_logo.png','Brasileirao A', 1400000, "Brasil");
INSERT INTO `db2020`.`campeonatos` (`imgCampeonato`,`nomeCampeonato`, `premiacao`, `local`) VALUES ('https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Serie_A_Logo_%28ab_2019%29.png/180px-Serie_A_Logo_%28ab_2019%29.png','Liga Italiana', 1200000, "Italia");


INSERT INTO `db2020`.`jogador_clube` (`idJogador`, `idClube`, `salario`, `descricao`) VALUES ('1', '1', '2500000', 'Melhor do mundo 5 vezes, parece um robo de tão perfeito, faz gol de qualquer jeito');
INSERT INTO `db2020`.`jogador_clube` (`idJogador`, `idClube`, `salario`, `descricao`) VALUES ('2', '2', '2550000', 'Melhor do mundo 6 vezes, um jogador que parece de outro mundo');
INSERT INTO `db2020`.`jogador_clube` (`idJogador`, `idClube`, `salario`, `descricao`) VALUES ('3', '1', '1300000', 'Zagueiro Horlandes, marca qualquer um que apareça na sua frente');

SELECT 
	jogador.id 'ID_JOGADOR', 
    jogador.nome 'NOME_JOGADOR', 
    jogador.posicao 'POSICAO_JOGADOR', 
    clube.nome 'NOME_CLUBE', 
    jogadorClube.id 'ID_RELACAO', 
    jogadorClube.descricao 'DESCRICAO'  
FROM 
	db2020.jogadores jogador, 
    db2020.clubes clube, 
    db2020.jogador_clube jogadorClube 
where 
	jogador.id = jogadorClube.idJogador 
and 
	clube.id = jogadorClube.idClube;


