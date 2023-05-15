-- DROP DATABASE OpusQuality;
DROP DATABASE IF EXISTS OpusQuality;
CREATE DATABASE OpusQuality;
USE OpusQuality;

-- CRIANDO TABELA EMPRESA

DROP TABLE IF EXISTS Empresa;
DROP  TABLE IF EXISTS Usuario;
DROP  TABLE IF EXISTS Setor;
DROP  TABLE IF EXISTS Sensores;
DROP  TABLE IF EXISTS Registros;


create table Empresa(
idEmpresa int primary key auto_increment,
nomeFantasia varchar(45),
razaoSocial varchar (45),
email varchar(45) not null,
telefone varchar(12),
cep char(9),
cnpj char(16) not null,
rua varchar(25),
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
cpf char (12) not null,
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
minTemperatura decimal(4,2),
maxTemperatura decimal(4,2),
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
sensorStatus tinyint,
fkSetor int,
constraint fkSetorSensores foreign key (fkSetor) references Setor(idSetor),
constraint pkComposta primary key (idSensores, fkSetor)
);
desc Sensores;
-- drop table Sensores;

-- CRIANDO TABELA REGISTROS

create table Registros(
idRegistro int auto_increment,
valor decimal(6,2),
dataHora datetime,
fkSensores int,
constraint fkSensoresRegistro foreign key (fkSensores) references Sensores(idSensores),
constraint pkCoposta primary key (idRegistro, fkSensores)
); 
desc Registros;
-- drop table Registros;

-- INSERÇÃO DE DADOS NAS TABELAS
 
insert into Empresa values
(null, 'Itau', 'Banco Itau', 'itau.banco@hotmail.com', '1199999-9999', '99999-999', '99999999/0001-99', 'Esquina A', '9999', null),
(null, 'Safra', 'Banco Safra', 'safra.banco@hotmail.com', '1188888-8888', '88888-888', '88888888/0001-88', 'Esquina B', '8888', 'saida estação Consolação'),
(null, 'SPTech', 'Faculdade SPTech', 'sptech.school@sptech.school', '1177777-7777', '77777-77', '77777777/0001-77', 'Esquina C', '7777', null),
(null, 'Stefanini', 'Consultoria Stefanini', 'stefanini.consultoria@sptech.school', null, '66666-66', '66666666/0002-66', 'Esquina D', '6666', null);

insert into Usuario values
(null, 'Luiz', 'luiz.email@hotmail.com', '1111', '111111111/11', '1'),
(null, 'Katherinne', 'katherinne.email.@hotmail.com', '2222', '222222222/22', '2'),
(null, 'Carlos', 'carlos.email.@hotmail.com', '3333', '333333333/33', '3'),
(null, 'Luan', 'luan.email.@hotmail.com', '4444', '444444444/44', '4'),
(null, 'Guedes', 'guedes.email.@hotmail.com', '5555', '555555555/55', '1'),
(null, 'Peterson', 'peterson.email.@hotmail.com', '6666', '666666666/66', '4');

insert into Setor values
(null, 'Setor1', '500', '1000', 20, 27, '1'),
(null, 'Setor1', '500', '1000', 20, 27, '2'),
(null, 'Setor3', '500', '1000', 20, 27, '3'),
(null, 'Setor2', '500', '1000', 20, 27, '4'),
(null, 'Setor3', '500', '1000', 20, 27, '4'),
(null, 'Setor2', '500', '1000', 20, 27, '1');


insert into Sensores values
(null, 'luminosidade', 'LDR5', '2022-10-10', '1', '1'),
(null, 'temperatura', 'LM35', '2022-10-11', '0', '1'),
(null, 'temperatura', 'LM35', '2022-05-11', '1', '2'),
(null, 'temperatura', 'LM35', '2022-05-11', '1', '3'),
(null, 'luminosidade', 'LDR5', '2022-06-11', '1', '4'),
(null, 'luminosidade', 'LDR5', '2022-06-11', '0', '5'),
(null, 'temperatura', 'LM35', '2022-06-11', '1', '5'),
(null, 'temperatura', 'LM35', '2022-12-02', '1', '6');

insert into Registros values
(null, '1000', '2023-11-11 09:15:02', '1'),
(null, '24.55', '2023-12-12 08:15:02', '2'),
(null, '20', '2023-10-12 07:15:02', '3'),
(null, '21', '2023-09-12 06:15:02', '4'),
(null, '500', '2023-08-12 05:15:02', '5'),
(null, '750', '2023-07-12 04:15:02', '6');



select * from Empresa;
USE OpusQuality;
select * from usuario;
select * from setor;
select * from sensores;
select * from registros;
select * from usuario join empresa on fkempresa = idempresa;
select * from usuario join empresa on fkempresa = idempresa where nomeFantasia = 'Sptech';
select * from setor join empresa on fkempresa = idempresa;
select * from setor join empresa on fkempresa = idempresa where idSetor = '3';      
select * from Sensores join setor on fkSetor = idsetor;
select * from Sensores join setor on fkSetor = idsetor where tipo = 'luminosidade';
select * from registros join sensores on fksensores = idsensores;
select * from registros join sensores on fksensores = idsensores where tipo = 'temperatura';



select usuario.nome as Nome_Usuario,
       Empresa.nomeFantasia as Nome_Empresa,
       setor.apelido as Local_Empresa,
       sensores.tipo as Modelo,
       registros.valor as Valor
       from usuario join Empresa on usuario.fkEmpresa = Empresa.idEmpresa join setor
       on setor.fkempresa = empresa.idempresa 
       join sensores on sensores.fksetor = setor.idsetor
       join registros on registros.fksensores = sensores.idsensores;
       
