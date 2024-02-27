drop database if exists empresaConstruccion;
create database empresaConstruccion;
use empresaConstruccion ;	

create table if not exists clientes (
nif varchar(9) not null,
nome varchar(45) not null,
enderezo varchar(45) not null,
telefono varchar(9) not null,
tipo enum("particular","empresa") not null,
primary key (nif)
);
 
 create table if not exists empregado (
dni varchar(9) not null,
nome varchar(45) not null,
enderezo varchar(45) not null,
telefono varchar(9) not null,
primary key (dni)
);

 create table if not exists oficio(
nomeOficio varchar(45) not null,
primary key (nomeOficio)
);

 create table if not exists proxecto (
idProxecto int ,
nifClientes varchar(9) not null,
descricion varchar(100)not null,
dataInicio date  not null,
dataFin date not null,
dataFinPrevista date not null,
primary key (idProxecto),
constraint FK_idProxecto
	foreign key (nifClientes)
	references clientes(nif)
);

create table if not exists subvencion (
idSubvencion int not null auto_increment,
tipo enum("local","autonomico","estatal"),
cuantia decimal not null,
idProxecto int,
descricion varchar(100) not null,
primary key (idSubvencion),
constraint FK_subvencion_prox
	foreign key (idProxecto)
	references proxecto(idProxecto)
    on delete cascade
    on update set null
);

create table if not exists presuposto (
idPresuposto int not null auto_increment,
data date not null,
cuantia decimal not null,
idProxecto int,
descricion varchar(100) not null,
importe decimal (13,2) not null,
aceptado boolean not null,
primary key (idPresuposto),
constraint FK_presuposto_prox
	foreign key (idProxecto)
	references proxecto(idProxecto)
    on delete cascade
    on update set null
);

create table if not exists proxecto_empregados (
idProxecto int not null auto_increment,
dni varchar(9) not null,
dataInicio date not null,
dataFin date,
primary key (dataInicio,dni,idProxecto),
constraint FK_proxectos_traballadores
	foreign key (idProxecto)
    references proxecto (idProxecto)
	on delete cascade
    on update cascade,
constraint FK_traballadores_proxectos
    foreign key (dni)
	references empregado (dni)
	on delete no action
    on update cascade
);

create table if not exists empregados_oficio (
dni varchar(9) not null,
 nomeOficio varchar(45)not null,
primary key (nomeOficio,dni),
constraint FK_oficio_traballadores
	foreign key (nomeOficio)
    references oficio (nomeOficio)
	on delete no action
    on update cascade,
constraint FK_traballadores_oficios
    foreign key (dni)
	references empregado (dni)
	on delete no action
    on update cascade
);

