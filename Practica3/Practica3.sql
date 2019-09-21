create database Practica3

use Practica3

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
	constraint pk_idbebida primary key (id_bebida desc)
	)

create table Postre(
	id_postre int not null,
	nombrePostre varchar(20) not null,
	precioPostre int not null, 
	descripcionPostre varchar(100) not null,
	constraint pk_idpostre primary key (id_postre desc)
	)

create table Ticket(
	id_ticket int not null,
	id_empleado int not null,
	id_platillo int not null,
	id_bebida int not null,
	id_postre int not null,
	)

create table Mesas(
	id_mesa int not null,
	ubicacion varchar(100),
	Capacidad int not null,
	constraint pk_idmesa primary key (id_mesa desc)
	)


create index empleado on empleado (id_empleado, nombrecompleto desc);
create index Platillo on Platillo (id_platillo, detallesPlatillo desc);	

alter table Ticket add id_mesa int not null

alter table Ticket add constraint relacion_ticket_empleado foreign key (id_empleado) references Empleado (id_empleado)
alter table Ticket add constraint relacion_ticket_platillo foreign key (id_platillo) references Platillo (id_platillo)
alter table Ticket add constraint relacion_ticket_bebida foreign key (id_bebida) references Bebida (id_bebida)
alter table Ticket add constraint relacion_ticket_postre foreign key (id_postre) references Postre (id_postre)
alter table Ticket add constraint relacion_ticket_mesa foreign key (id_mesa) references Mesas (id_mesa)
