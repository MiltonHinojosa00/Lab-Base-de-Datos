create database Practica2

use Practica2

create table Empleado(
	id_empleado int not null,
	nombre varchar(15) not null,
	apellidoPat varchar(15) not null,
	apellidoMat varchar(15) not null,
	sexo int not null,
	edad int not null,
	nombrecompleto as (nombre + ' ' + apellidoPat + ' ' + apellidoMat)
	constraint pk_idempleado primary key (id_empleado desc)
)

create table Platillo(
	id_platillo int not null,
	nombrePlatillo varchar (20) not null,
	precioPlatillo int not null,
	descripcionPlatillo varchar (100) not null,
	detallesPlatillo as (nombrePlatillo + ' ' + precioPlatillo+ ' ' + descripcionPlatillo)
	constraint pk_idplatillo primary key (id_platillo desc)
	)

create table Bebida(
	id_bebida int not null,
	nombreBebida varchar (20) not null,
	precioBebida int not null,
	descripcionBebida varchar(100) not null,
	)

create table Postre(
	id_postre int not null,
	nombrePostre varchar(20) not null,
	precioPostre int not null, 
	descripcionPostre varchar(100) not null,
	)

create table Ticket(
	id_empleado int not null,
	id_platillo int not null,
	id_bebida int not null,
	id_postre int not null,
	)

create index empleado on empleado (id_empleado, nombrecompleto desc);
create index Platillo on Platillo (id_platillo, detallesPlatillo desc);	