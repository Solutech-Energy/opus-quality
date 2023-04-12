use sprint2;

-- CRIANDO TABELA EMPRESA

create table Empresa(
idEmpresa int primary key auto_increment,
nomeFantasia varchar(45),
razaoSocial varchar (45),
email varchar(45) not null,
telefone varchar(11),
cep char(8),
cnpj char(12) not null,
rua varchar(45),
numero varchar(8), 
complemento varchar (25)
); 
desc Empresa;
-- drop table Empresa;

-- CRIANDO TABELA USUARIO

create table Usuario(
idUsuario int auto_increment,
nome varchar(45),
email varchar(45) not null,
senha varchar(20) not null,
cpf char (11) not null,
fkEmpresa int,
constraint fkEmpresaUsuario foreign key (fkEmpresa) references Empresa(idEmpresa),
constraint pkComposta primary key (idUsuario, fkEmpresa)
); 
desc Usuario; 
-- drop table Usuario;

-- CRIANDO TABELA SETOR

create table Setor(
idSetor int auto_increment,
apelido varchar(25),
minLuminosidade int,
maxLuminosidade int,
minTemperatura decimal(2,2),
maxTemperatura decimal(2,2),
fkEmpresa int,
constraint fkEmpresaSetor foreign key (fkEmpresa) references Empresa(idEmpresa),
constraint pkComposta primary key (idSetor, fkEmpresa)
);  
desc Setor;
-- drop table Setor;

-- CRIANDO TABELA SENSORES

create table Sensores(
idSensores int auto_increment,
tipo varchar(20),
modelo varchar(20),
dtInstalacao date,
_Status tinyint,
fkSetor int,
constraint fkSetorSensores foreign key (fkSetor) references Setor(idSetor),
constraint pkComposta primary key (idSensores, fkSetor)
); 
desc Sensores;
-- drop table Sensores;

-- CRIANDO TABELA REGISTROS

create table Registros(
idRegistro int auto_increment,
valor decimal,
dataHora datetime,
fkSensores int,
constraint fkSensoresRegistro foreign key (fkSensores) references Sensores(idSensores),
constraint pkCoposta primary key (idRegistro, fkSensores)
); 
desc Registros;
-- drop table Registros;

insert into Empresa values
(null, 'Itau', '', '', '', '', '', '', ''),
(null, 'Safra', '', '', '', '', '', '', ''),
(null, 'SPTech', '', '', '', '', '', '', '');


