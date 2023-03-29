
CREATE DATABASE energia_futura;
 use energia_futura;

 
 -- TABELA PRÉ CADASTRO
 CREATE TABLE PreCadastro (idInteressado INT PRIMARY KEY auto_increment,
 email VARCHAR (60),
 nome_fantasia VARCHAR (70),
 cnpj VARCHAR (14) unique,
 statusConta CHAR(1),
 constraint chkStatusConta CHECK (statusConta in (0,1))
 );
 DESC PreCadastro;

 INSERT INTO PreCadastro (email, nome_fantasia, cnpj, statusConta) VALUES
 ('empresa.teste@gmail.com','Empresa Teste',38902647820001, 1);

SELECT * FROM PreCadastro;

SELECT cnpj, email FROM PreCadastro;


-- TABELA CADASTRO

CREATE TABLE cadastro (
idCadastro INT PRIMARY KEY auto_increment,
rua VARCHAR (100),
bairro VARCHAR(80),
numero VARCHAR (10) not null,
cidade VARCHAR (100),
cep VARCHAR (8) not null,
StatusEmpresa CHAR(1),constraint chkStatusEmpresa CHECK (StatusEmpresa IN (0,1)),
numeroTelefone VARCHAR(20) not null,
DthoraComercialAbertura time not null,
DthoraComercialFechamento time not null,
numeroLampadas INT not null,
 senha VARCHAR(80) unique
 );
 DESC cadastro;
 
 INSERT INTO cadastro (rua, bairro, numero, cidade, cep, 
 StatusEmpresa, numeroTelefone, DtHoraComercialAbertura, DtHoraComercialFechamento, numeroLampadas, senha) VALUES
 ('Rua Haddock Lobo', 'Cerqueira César', '595', 'São Paulo',
 '01414001', 1, '11312344321', '08:00:00', '17:00:00', 15, 'K9$100jpe');
 
 SELECT * FROM cadastro;
 
UPDATE cadastro SET DtHoraComercialFechamento = '18:00:00' WHERE idCadastro = 1;
 SELECT * FROM cadastro; 

-- TABELA SENSOR

CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
idCadastro INT not null,
statusLuminosidade INT not null,
 statusSensor VARCHAR(10) not null,
 constraint chkStatusSensor CHECK (statusSensor IN ('inativo','ativo'))
 );
 DESC sensor;
 
 INSERT INTO sensor (idCadastro, statusLuminosidade, statusSensor) VALUES
 (1, '754','ativo'),
 (1, '347','ativo'),
 (1, '245','ativo');
  SELECT * FROM sensor;

SELECT idSensor,idCadastro FROM sensor;




-- TABELA LAMPADA

CREATE TABLE lampada(
 idLampada INT primary key auto_increment,
 idCadastro int,
 idSensor varchar(15) not null,
 statusLampada INT not null,
  constraint chkStatusLampada check (statusLampada in (0, 1))
  ) auto_increment = 100;
DESC lampada;

INSERT INTO lampada (idCadastro, idSensor, statusLampada) VALUES
  ('1', '1', '0'),
  ('1', '1', '0'),
  ('1', '2', '1'),
  ('1', '2', '1'),
  ('1', '2', '1'),
  ('1', '2', '1'),
  ('1', '3', '1'),
  ('1', '3', '1'),
  ('1', '3', '1'),
  ('1', '3', '1'),
  ('1', '3', '1'),
  ('1', '2', '1'),
  ('1', '2', '1');

SELECT * FROM lampada;

SELECT * FROM lampada where idSensor in (1,3) ;





-- TABELA HISTORICO DO SENSOR

CREATE TABLE historicoSensor (
idHistorico int auto_increment primary key,
idSensor varchar(15) not null,
idLampada INT,
hrsDaCaptura datetime default current_timestamp,
statusLuminosidade int not null,
constraint chkLuminosidade check (statusLuminosidade <= 1023),
variacaoSensor varchar(15) not null
constraint chkVariacao check (variacaoSensor in('claro', 'escuro'))
);
DESC historicoSensor;

INSERT INTO historicoSensor (idSensor, idLampada, statusLuminosidade, variacaoSensor) VALUES

(1, '100', '754', 'claro'),
(1, '101', '754', 'claro'),
(1, '111', '754', 'claro'),
(1, '112', '754', 'claro'),
(2, '102', '347', 'escuro'),
(2, '103', '347', 'escuro'),
(2, '104', '347', 'escuro'),
(2, '105', '347', 'escuro'),
(2, '113', '347', 'escuro'),
(2, '114', '347', 'escuro'),
(3, '106', '245', 'escuro'),
(3, '107', '245', 'escuro'),
(3, '108', '245', 'escuro'),
(3, '109', '245', 'escuro'),
(3, '110', '245', 'escuro');

SELECT * FROM historicoSensor;

ALTER TABLE historicoSensor DROP COLUMN hrsDaCaptura;
SELECT * FROM historicoSensor;

-- TABELA FUNCIONARIO

CREATE TABLE funcionario(
idFuncionario INT PRIMARY KEY auto_increment,
nome VARCHAR(80) not null,
cpf VARCHAR(14) not null unique,
RG VARCHAR(12) not null unique,
dtNasc DATE,
email VARCHAR(100) not null,
permissao varchar(15) not null,
	constraint chkPermissao check (permissao in ('administrador', 'funcionario'))
   ); 
   
insert into funcionario(nome,cpf,RG,dtNasc,email,permissao) values
('Arthur', '112-334-567.09', '50.878.877-8', '2004-02-05', 'arthur.salomao@gmail.com', 'administrador'),
('Matheus', '234-567-980.89', '55.666.222-9', '2004-03-23', 'matheus.santiago@gmail.com', 'administrador'),
('Evelyn', '454-222-111.65', '23.445.555-0', '2003-12-12', 'evelyn.farias@gmail.com', 'administrador'),
('Brenda', '465-890-099.43', '11.121.323-7', '2002-11-30', 'brenda.catharina@gmail.com', 'administrador'),
('Felipe', '232-212-555.86', '28.888.999-0', '2004-07-08', 'felipe.andrade@gmail.com', 'administrador'),
('Daniel', '345-543-765.77', '43.234.345-7', '1997-09-21', 'daniel.rodrigues@gmail.com', 'administrador'),
('Pedro', '321-432-654.69', '32.345.567-9', '1999-04-12', 'pedro.ramos@gmail.com', 'administrador'),
('Marcelo', '533-112-276.29', '56.546.456-0', '1987-09-09', 'marcelo.silva2gmail.com', 'funcionario'),
('Rafael', '333-788-656.76', '67.345.453-2', '1990-03-11', 'rafael.olivares@gmail.com', 'funcionario'),
('Bruno', '456-345-234.54', '54.345.678-5', '2000-12-09', 'bruno.pinheiros@gmail.com', 'funcionario');


select * from funcionario;
