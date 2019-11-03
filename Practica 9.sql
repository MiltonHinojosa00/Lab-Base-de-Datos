CREATE DATABASE Restaurante
USE Restaurante

CREATE TABLE [Estados] (
  [Estado_ID] int PRIMARY KEY NOT NULL,
  [Estado_Nombre] varchar(120)
);

CREATE TABLE [Municipios] (
  [Municipio_ID] int PRIMARY KEY NOT NULL,
  [Municipio_Nombre] varchar(120),
  [Estado_ID] int,
  CONSTRAINT FK_Estado_ID_Municipios FOREIGN KEY (Estado_ID) REFERENCES dbo.Estados (Estado_ID),
);

CREATE TABLE [Colonias] (
  [Colonia_ID] int PRIMARY KEY NOT NULL,
  [Colonia_Nombre] varchar(120),
  [Municipio_ID] int,
  CONSTRAINT FK_Municipio_ID_Colonias FOREIGN KEY (Municipio_ID) REFERENCES dbo.Municipios (Municipio_ID),
);

CREATE TABLE [Clientes] (
  [Cliente_ID] int PRIMARY KEY NOT NULL,
  [Cliente_Nombre] varchar(120),
  [Cliente_Contacto] varchar(10),
  [Estado_ID] int,
  [Municipio_ID] int,
  [Colonia_ID] int,
  [Cliente_Calle] varchar(50),
  [Cliente_Numero_Exterior ] smallint,
  CONSTRAINT FK_Estado_ID_Clientes FOREIGN KEY (Estado_ID) REFERENCES dbo.Estados (Estado_ID),
  CONSTRAINT FK_Municipio_ID_Clientes FOREIGN KEY (Municipio_ID) REFERENCES dbo.Municipios (Municipio_ID),
  CONSTRAINT FK_Colonia_ID_Clientes FOREIGN KEY (Colonia_ID) REFERENCES dbo.Colonias (Colonia_ID),
);

CREATE TABLE [Sucursales] (
  [Sucursal_ID] int PRIMARY KEY NOT NULL,
  [Estado_ID] int,
  [Municipio_ID] int,
  [Colonia_ID] int,
  [Sucursal_Calle] varchar(50),
  [Sucursal_Numero_Exterior ] smallint
  CONSTRAINT FK_Estado_ID_Sucursales FOREIGN KEY (Estado_ID) REFERENCES dbo.Estados (Estado_ID),
  CONSTRAINT FK_Municipio_ID_Sucursales FOREIGN KEY (Municipio_ID) REFERENCES dbo.Municipios (Municipio_ID),
  CONSTRAINT FK_Colonia_ID_Sucursales FOREIGN KEY (Colonia_ID) REFERENCES dbo.Colonias (Colonia_ID),
);

CREATE TABLE [Empleados] (
  [Empleado_ID] int PRIMARY KEY NOT NULL,
  [Empleado_Nombre] varchar(50),
  [Empleado_Apellido_Paterno] varchar(50),
  [Empleado_Apellido_Materno] varchar(50),
  [Empleado_Nombre_Completo] varchar(150),
  [Empleado_Celular] varchar(10),
  [Empleado_Telefono] varchar(10),
  [Empleado_Correo_Electronico] varchar(50),
  [Empleado_Contratacion] date,
  [Estado_ID] int,
  [Municipio_ID] int,
  [Colonia_ID] int,
  [Empleado_Calle] varchar(50),
  [Empleado_Numero_Exterior] smallint,
  CONSTRAINT FK_Estado_ID_Empleados FOREIGN KEY (Estado_ID) REFERENCES dbo.Estados (Estado_ID),
  CONSTRAINT FK_Municipio_ID_Empleados FOREIGN KEY (Municipio_ID) REFERENCES dbo.Municipios (Municipio_ID),
  CONSTRAINT FK_Colonia_ID_Empleados FOREIGN KEY (Colonia_ID) REFERENCES dbo.Colonias (Colonia_ID),
);

CREATE TABLE [Usuarios] (
  [Usuario_ID] int PRIMARY KEY NOT NULL,
  [Empleado_ID] int,
  [Usuario_Password] varchar(255),
  CONSTRAINT FK_Empleado_ID_Usuarios FOREIGN KEY (Empleado_ID) REFERENCES dbo.Empleados (Empleado_ID),
);

CREATE TABLE [Maquinas] (
  [Maquina_ID] int PRIMARY KEY NOT NULL,
  [Maquina_Modelo] int,
  [Maquina_Marca] int,
  [Maquina_Adquisicion] datetime
CREATE TABLE [Registros_Usuarios] (
  [Registro_ID] int PRIMARY KEY NOT NULL,
);

  [Maquina_ID] int,
  [Usuario_ID] int,
  [Registro_Inicio ] datetime,
  [Registro_Cierre] datetime,
  [Registro_Duracion] datetime,
  CONSTRAINT FK_Maquina_ID_Registros FOREIGN KEY (Maquina_ID) REFERENCES dbo.Maquinas (Maquina_ID),
  CONSTRAINT FK_Usuario_ID_Registros FOREIGN KEY (Usuario_ID) REFERENCES dbo.Usuarios (Usuario_ID),
);

CREATE TABLE [Proveedores] (
  [Proveedor_ID] int PRIMARY KEY NOT NULL,
  [Proveedor_Nombre] varchar(30),
  [Proveedor_Contacto] varchar(30)
);

CREATE TABLE [Orden_Compras] (
  [Orden_Compra_ID] int PRIMARY KEY NOT NULL,
  [Orden_Compra_Total] money,
  [Orden_Compra_Fecha] date,
  [Proveedor_ID] int,
  CONSTRAINT FK_Proveedor_ID_Compras FOREIGN KEY (Proveedor_ID) REFERENCES dbo.Proveedores (Proveedor_ID),
);

CREATE TABLE [Productos] (
  [Producto_ID] int PRIMARY KEY NOT NULL,
  [Producto_Nombre] varchar(30),
  [Producto_Categoria] varchar(30),
  [Producto_Descripcion] varchar(30),
  [Producto_Precio] money
);

CREATE TABLE [Detalle_Compras] (
  [Detalle_Compra_ID] int PRIMARY KEY NOT NULL,
  [Orden_Compra_ID] int,
  [Producto_ID] int,
  [Detalle_Compra_Cantidad] smallint,
  [Detalle_Compra_Costo] money,
  CONSTRAINT FK_Orden_Compra_ID_Compras FOREIGN KEY (Orden_Compra_ID) REFERENCES dbo.Orden_Compras (Orden_Compra_ID),
  CONSTRAINT FK_Producto_ID_Compras FOREIGN KEY (Producto_ID) REFERENCES dbo.Productos (Producto_ID),
);

CREATE TABLE [Inventarios] (
  [Inventario_ID] int PRIMARY KEY NOT NULL,
  [Producto_ID] int,
  [Inventario_Cantidad] int,
  [Inventario_Necesidad] bit,
  CONSTRAINT FK_Producto_ID_Inventario FOREIGN KEY (Producto_ID) REFERENCES dbo.Productos (Producto_ID),
);

CREATE TABLE [Tipos_Pagos] (
  [Tipo_Pago_ID] int PRIMARY KEY NOT NULL,
  [Tipo_Pago_Credito] varchar(50),
  [Tipo_Pago_Debito] varchar(50),
  [Tipo_Pago_Efectivo] varchar(50)
);

CREATE TABLE [Orden_Ventas] (
  [Orden_Venta_ID] int PRIMARY KEY NOT NULL,
  [Orden_Venta_Total] money,
  [Orden_Venta_Recibido] money,
  [Orden_Venta_Feria] money,
  [Tipo_Pago_ID] int,
  [Orden_Venta_Fecha] datetime,
  [Registro_ID] int,
  CONSTRAINT FK_Tipo_Pago_ID_Ventas FOREIGN KEY (Tipo_Pago_ID) REFERENCES dbo.Tipos_Pagos (Tipo_Pago_ID),
  CONSTRAINT FK_Registro_ID_Ventas FOREIGN KEY (Registro_ID) REFERENCES dbo.Registros_Usuarios (Registro_ID),
);

CREATE TABLE [Detalle_Ventas] (
  [Detalle_Venta_ID] int PRIMARY KEY NOT NULL,
  [Orden_Venta_ID] int,
  [Producto_ID] int,
  [Detalle_Compra_Cantidad] smallint,
  [Detalle_Compra_Costo] money,
  CONSTRAINT FK_Orden_Venta_ID_Ventas FOREIGN KEY (Orden_Venta_ID) REFERENCES dbo.Orden_Ventas (Orden_Venta_ID),
  CONSTRAINT FK_Producto_ID_Ventas FOREIGN KEY (Producto_ID) REFERENCES dbo.Productos (Producto_ID),
)
select * from Estados

insert into Estados (Estado_ID, Estado_Nombre) values (10, 'Jalisco');
insert into Estados (Estado_ID, Estado_Nombre) values (11, 'Nuevo León');
insert into Estados (Estado_ID, Estado_Nombre) values (12, 'Aguascalientes');
insert into Estados (Estado_ID, Estado_Nombre) values (13, 'Coahuila');
insert into Estados (Estado_ID, Estado_Nombre) values (14, 'Sonora');
insert into Estados (Estado_ID, Estado_Nombre) values (15, 'Chihuahua');
insert into Estados (Estado_ID, Estado_Nombre) values (16, 'Durango');
insert into Estados (Estado_ID, Estado_Nombre) values (17, 'Quintana Roo');
insert into Estados (Estado_ID, Estado_Nombre) values (18, 'Veracruz');
insert into Estados (Estado_ID, Estado_Nombre) values (19, 'Chiapas');
insert into Estados (Estado_ID, Estado_Nombre) values (20, 'Sinaloa');
insert into Estados (Estado_ID, Estado_Nombre) values (21, 'Guanajuato');
insert into Estados (Estado_ID, Estado_Nombre) values (22, 'Tamaulipas');
insert into Estados (Estado_ID, Estado_Nombre) values (23, 'San Luis Potosi');
insert into Estados (Estado_ID, Estado_Nombre) values (24, 'Nayarit');


select * from Municipios
insert into Municipios values (10, 'Guadalajara', 10);
insert into Municipios values (20, 'Monterrey', 11);
insert into Municipios values (30, 'Aguascalientes', 12);
insert into Municipios values (40, 'Saltillo', 13);
insert into Municipios values (50, 'Hermosillo', 14);
insert into Municipios values (60, 'Chihuahua', 15);
insert into Municipios values (70, 'Durango', 16);
insert into Municipios values (80, 'Chetumal', 17);
insert into Municipios values (90, 'Xalapa', 18);
insert into Municipios values (100, 'Tuxtla', 19);
insert into Municipios values (110, 'Mazatlan', 20);
insert into Municipios values (120, 'Guanajuato', 21);
insert into Municipios values (130, 'Ciudad Victoria', 22);
insert into Municipios values (140, 'San Luis Potosi', 23);
insert into Municipios values (150, 'Tepic', 24);
insert into Colonias values (2, 'Roma', 20);

select * from Colonias
insert into Colonias values (1, 'Providencia', 10);
insert into Colonias values (3, 'Altavista', 30);
insert into Colonias values (4, 'Jesús Cabello', 40);
insert into Colonias values (5, 'Pitic', 50);
insert into Colonias values (6, 'Ranchería', 60);
insert into Colonias values (7, 'Azteca', 70);
insert into Colonias values (8, 'Adolfo Lopez Mateos', 80);
insert into Colonias values (9, 'Progreso', 90);
insert into Colonias values (10, 'Lomas del Sur', 100);

select * from Sucursales
insert into Sucursales values (30, 10, 10, 1, 'Sao Pablo', 534);
insert into Sucursales values (31, 11, 20, 2, 'Palestina', 230);
insert into Sucursales values (32, 12, 30, 3, 'Hombres ilustres', 187);
insert into Sucursales values (33, 13, 40, 4, 'Escuadrón 201', 775);
insert into Sucursales values (34, 14, 50, 5, 'Lozuya', 379);
insert into Sucursales values (35, 15, 60, 6, 'Joaquín Amaro', 221);
insert into Sucursales values (36, 16, 70, 7, 'Francisco Granados', 2697);
insert into Sucursales values (37, 17, 80, 8, 'Calle 1 Sur', 534);
insert into Sucursales values (38, 18, 90, 9, 'Calle 9', 760);
insert into Sucursales values (39, 19, 100, 10, 'Av de la Loma', 111);

select * from Empleados
insert into Empleados values (40, 'Milton', 'Hinojosa', 'Castro', 'Milton Hinojosa Castro', 8113681661, 86645215, 'milton.hinojosa@hotmail.com', '2010-01-22', 10, 10, 1, 'Benito Juarez', 639);
insert into Empleados values (41, 'Javier', 'Rodriguez', 'Mora', 'Javier Rodríguez Mora', 8463484872, 55697461, 'javier.rodriguez@gmail.com', '2015-11-13', 11, 20, 2, 'Almaguer', 5529);
insert into Empleados values (42, 'Carlos', 'Gutierrez', 'Lara', 'Carlos Gutierrez Lara', 4468197552, 67914843, 'c.lara@hotmail.com', '2019-05-01', 13, 30, 3, 'Ares', 126);
insert into Empleados values (43, 'Oscar', 'Morales', 'Dominguez', 'Oscar Morales Dominguez', 7436184164, 79525496, 'oscar.dom@hotmail.com', '2016-09-29', 14, 40, 4, 'Valle Solar', 405);
insert into Empleados values (44, 'Ezequiel', 'Lopez', 'Cantú', 'Ezequiel Lopez Cantú', 5913484672, 220846330, 'Lopez_eze@gmail.com', '2014-02-14', 15, 50, 5, 'Potrillo', 885);

select * from Usuarios
insert into Usuarios values (45, 40, 'contraseña');
insert into Usuarios values (46, 41, 'password');
insert into Usuarios values (47, 42, 'seguridad123.');
insert into Usuarios values (48, 43, 'yanosequeponer');
insert into Usuarios values (49, 44, 'passusuario');

select * from Maquinas
insert into Maquinas values (50, 1, 1, '2017-05-21');
insert into Maquinas values (51, 2, 2, '2015-09-06');
insert into Maquinas values (52, 3, 3, '2010-10-01');
insert into Maquinas values (53, 4, 4, '2012-12-12');
insert into Maquinas values (54, 5, 5, '2015-03-10');
insert into Maquinas values (55, 6, 6, '2011-08-30');
insert into Maquinas values (56, 7, 7, '2018-11-06');
insert into Maquinas values (57, 8, 8, '2016-01-05');
insert into Maquinas values (58, 9, 9, '2013-06-29');
insert into Maquinas values (59, 10, 10, '2012-05-09');

select * from Proveedores
insert into Proveedores values (60, 'Quesos', 'Martin');
insert into Proveedores values (61, 'Harina', 'Hugo');
insert into Proveedores values (62, 'Cajas', 'Martha');
insert into Proveedores values (63, 'Refrescos', 'Samuel');
insert into Proveedores values (64, 'Salsa', 'Leticia');
insert into Proveedores values (65, 'Bolsas', 'Lizeth');
insert into Proveedores values (66, 'Carnes', 'Omar');
insert into Proveedores values (67, 'Aderezos', 'Eduardo');
insert into Proveedores values (68, 'Postres', 'Daniela');
insert into Proveedores values (69, 'Condimentos', 'Jorge');

select * from Orden_Compras
insert into Orden_Compras values (70, 2250, '2019-10-11', 60);
insert into Orden_Compras values (71, 1870, '2019-10-11', 61);
insert into Orden_Compras values (72, 1600, '2019-10-11', 62);
insert into Orden_Compras values (73, 990, '2019-10-11', 63);
insert into Orden_Compras values (74, 750, '2019-10-11', 64);
insert into Orden_Compras values (75, 400, '2019-10-11', 65);
insert into Orden_Compras values (76, 2100, '2019-10-11', 66);
insert into Orden_Compras values (77, 1000, '2019-10-11', 67);
insert into Orden_Compras values (78, 830, '2019-10-11', 68);
insert into Orden_Compras values (79, 680, '2019-10-11', 69);

select * from Productos
insert into Productos values (80, 'Classic Peperonni', 'Pizzas', 'Pizza grande de Peperonni', 89); 
insert into Productos values (81, 'Classic Jamon', 'Pizzas', 'Pizza grande de Jamon', 89);
insert into Productos values (82, 'Classic 3 carnes', 'Pizzas', 'Pizza grande de 3 carnes', 89);
insert into Productos values (83, 'Classic Hawaii', 'Pizzas', 'Pizza grande con piña', 89);
insert into Productos values (84, 'Refresco Regular', 'Bebidas', 'Refresco regular de 2 litros', 39);
insert into Productos values (85, 'Refresco Fanta', 'Bebidas', 'Refresco sabor naranja', 39);
insert into Productos values (86, 'Refresco Manzanita', 'Bebidas', 'Refresco sabor manzana', 39);
insert into Productos values (87, 'Ranch', 'Aderezos', 'Aderezco ranch (100gr)', 15);
insert into Productos values (88, 'Buffalo', 'Salsas', 'Salsa estilo Buffalo', 15);
insert into Productos values (89, 'Pay de queso', 'Postres', 'Rebanada de pay', 20);

select * from Detalle_Compras
insert into Detalle_Compras values (90, 70, 80, 1, 2250);
insert into Detalle_Compras values (91, 71, 81, 1, 1870);
insert into Detalle_Compras values (92, 72, 82, 1, 1600);
insert into Detalle_Compras values (93, 73, 84, 1, 990);
insert into Detalle_Compras values (94, 74, 88, 1, 750);
insert into Detalle_Compras values (95, 75, 83, 1, 400);
insert into Detalle_Compras values (96, 76, 82, 1, 2100);
insert into Detalle_Compras values (97, 77, 87, 1, 830);
insert into Detalle_Compras values (98, 78, 89, 1, 1000);
insert into Detalle_Compras values (99, 79, 87, 1, 1000);

update Productos set Producto_Precio = 99 where Producto_ID = 82;
update Productos set Producto_Precio = 99 where Producto_ID = 83;
update Productos set Producto_Precio = 35 where Producto_ID = 84;
update Productos set Producto_Precio = 35 where Producto_ID = 85;
update Productos set Producto_Precio = 35 where Producto_ID = 86;

delete from Municipios where Municipio_ID = 110;
delete from Municipios where Municipio_ID = 120;
delete from Municipios where Municipio_ID = 130;
delete from Municipios where Municipio_ID = 140;
delete from Municipios where Municipio_ID = 150;

select * from Municipios;
select * from Estados;

--CONSULTAS BÁSICAS--
select M.Municipio_Nombre, E.Estado_Nombre from Municipios as M inner join Estados as E on M.Estado_ID=E.Estado_ID;
select M.Municipio_ID, E.Estado_ID from Municipios as M inner join Estados as E on M.Estado_ID=E.Estado_ID;
select M.Municipio_ID, E.Estado_Nombre from Municipios as M inner join Estados as E on M.Estado_ID=E.Estado_ID;
select M.Municipio_Nombre, E.Estado_ID from Municipios as M inner join Estados as E on M.Estado_ID=E.Estado_ID;

select E.Empleado_ID, A.Estado_ID from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
select E.Empleado_Nombre, A.Estado_Nombre from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
select E.Empleado_ID, A.Estado_Nombre from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
select E.Empleado_Nombre, A.Estado_ID from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;

select S.Sucursal_Calle, E.Estado_Nombre from Sucursales as S inner join Estados as E on S.Estado_ID=E.Estado_ID;
select S.Sucursal_ID, M.Municipio_Nombre from Sucursales as S inner join Municipios as M on S.Municipio_ID=M.Municipio_ID;


--CONSULTAS AVANZADAS--
select Orden_Compra_Total
from Orden_Compras
where Orden_Compra_Total > $1000
order by Orden_Compra_ID desc;

select Orden_Compra_Total
from Orden_Compras
where Orden_Compra_Total > $1000
order by Orden_Compra_ID asc;

select Orden_Compra_Total
from Orden_Compras
where Orden_Compra_Total < $1000
order by Orden_Compra_ID desc;

select Orden_Compra_Total
from Orden_Compras
where Orden_Compra_Total < $1000
order by Orden_Compra_ID asc;

select Municipio_Nombre
from Municipios
where Municipio_ID > 50
order by Municipio_ID desc;

select Municipio_Nombre
from Municipios
where Municipio_ID < 50
order by Municipio_ID asc;

select Estado_Nombre, Estado_ID from Estados where Estado_ID > 15 order by Estado_ID;

select Proveedor_ID, Proveedor_Nombre from Proveedores order by Proveedor_Nombre asc;

select Proveedor_ID, Proveedor_Nombre from Proveedores order by Proveedor_Nombre desc;


create view Listado1
as
select Municipio_Nombre from Municipios
select * from Listado1


create view Listado_Productos
as
select Producto_Nombre, Producto_Categoria, Producto_Descripcion from Productos
select * from Listado_Productos


create view Direccion_Sucursales
as
select S.Sucursal_Calle, E.Estado_Nombre from Sucursales as S inner join Estados as E on S.Estado_ID=E.Estado_ID;
select * from Direccion_Sucursales

create view Direccion_Empleado
as
select E.Empleado_ID, A.Estado_ID from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
select * from Direccion_Empleado

create view Ubicacion_Empleado
as
select E.Empleado_Nombre, A.Estado_Nombre from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
select * from Ubicacion_Empleado


CREATE TRIGGER TRG_VALIDAR_IDENTIDAD1
ON Empleados
FOR INSERT 
AS 
BEGIN 
	
	SET NOCOUNT ON;
	DECLARE @IDENTIDAD VARCHAR(20)
	SET @IDENTIDAD=(
					SELECT Empleado_Nombre
					FROM Empleados)

	IF( Restaurante.dbo.FN_VALIDAR_IDENTIDAD( @IDENTIDAD) = 0 )
	BEGIN
	print' NO PUEDE SER INGRESADO, FORMATO DE IDENTIDAD NO VALIDA'
	DELETE Restaurante.dbo.Empleados
	WHERE Empleado_Nombre = @IDENTIDAD
	END
END

create procedure Sucursal_Estado
as
select S.Sucursal_Calle, E.Estado_Nombre from Sucursales as S inner join Estados as E on S.Estado_ID=E.Estado_ID;
go
exec Sucursal_Estado


create procedure Productos_Info
as
select Producto_Nombre, Producto_Categoria, Producto_Descripcion from Productos
go
exec Productos_Info


create procedure Info_Municipios
as
select Municipio_Nombre from Municipios
go
exec Info_Municipios


create procedure Info_Empleado
as
select E.Empleado_ID, A.Estado_ID from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
go
exec Info_Empleado

create procedure Localizacion_Empleado
as
select E.Empleado_Nombre, A.Estado_Nombre from Empleados as E inner join Estados as A on E.Estado_ID=A.Estado_ID;
go
exec Localizacion_Empleado



--fff
CREATE FUNCTION Suma_Pizzas
(
@Suma int
)
returns int
as
begin
return (count(@suma))
end;
go