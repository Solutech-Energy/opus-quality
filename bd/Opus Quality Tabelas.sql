use sprint2;

-- CRIANDO TABELA EMPRESA

create table Empresa(
idEmpresa int primary key auto_increment,
nomeFantasia varchar(45),
razaoSocial varchar (45),
email varchar(45) not null,
telefone varchar(12),
cep char(9),
cnpj char(16) not null,
rua varchar(15),
numero varchar(8), 
complemento varchar (35)
);
DROP TABLE EMPRESA;
desc Empresa;
select*from EMPRESA;
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
DROP TABLE USUARIO;
desc Usuario; 
select* from usuario;
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
DROP TABLE SETOR;
desc Setor;
select*from setor;
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
DROP TABLE SENSORES;
desc Sensores;
select*from sensores;
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
DROP TABLE REGISTROS;
desc Registros;
select*from registros;
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
(null, '24', '2023-11-11 09:15:02', '1'),
(null, '27', '2023-12-12 08:15:02', '2'),
(null, '20', '2023-10-12 07:15:02', '3'),
(null, '21', '2023-09-12 06:15:02', '4'),
(null, '23', '2023-08-12 05:15:02', '5'),
(null, '23', '2023-07-12 04:15:02', '6');




