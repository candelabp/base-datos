create database ventasDispositivos;
use ventasDispositivos;
CREATE TABLE Provincia (
  idProvincia int primary key auto_increment,
  nombreProvincia varchar(50)
);
CREATE TABLE Departamento (
idDepartamento int primary key auto_increment,
nombreDepartamento varchar(50),
idProvincia int,
foreign key (idProvincia) references Provincia(idProvincia)
);
create table Persona(
idPersona int primary key auto_increment,
nombre varchar(50),
apellido varchar(50),
numeroTelefono int
);
create table Empresa(
idEmpresa int primary key auto_increment,
nombreEmpresa varchar(50),
numeroTelefono int,
esNacional boolean
);
CREATE TABLE Direccion (
idDireccion int primary key auto_increment,
calle varchar(50),
numero int,
idDepartamento int,
idPersona int,
idEmpresa int,
esNacional BOOLEAN,
foreign key(idDepartamento) references Departamento(idDepartamento),
foreign key (idPersona) references Persona(idPersona),
foreign key (idEmpresa) references Empresa(idEmpresa)
);

create table Clientes(
idClientes int primary key auto_increment,
codigo int,
idPersona int,
foreign key (idPersona) references Persona(idPersona)
);
create table Compra( 
idCompra int primary key auto_increment,
idClientes int,
fechaCompra date,
foreign key(idClientes) references Clientes(idClientes)
);
create table Producto(
idProducto int primary key auto_increment,
codigo int,
descripcion varchar(200),
precio int,
numeroExistencias int
);
create table Detalle(
idDetalle int primary key auto_increment,
precio int,
cantidad int,
idProducto int,
idCompra int,
foreign key (idCompra) references Compra(idCompra),
foreign key (idProducto) references Producto(idProducto)
);
create table Proveedores(
idProveedores int primary key auto_increment,
codigo int,
idPersona int,
foreign key (idPersona) references Persona(idPersona)
);
create table productoProveedor(
idProductoProveedor int primary key auto_increment,
idProducto int,
idProveedores int,
foreign key (idProducto) references Producto(idProducto),
foreign key (idProveedores) references Proveedores(idProveedores)
);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Teclado Alambrico Membrana", 5000, 50);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Teclado Alambrico Mecánico", 5000, 50);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Mouse Láser", 4800, 100);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Mouse Óptico", 6000, 100);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Joystick Xbox", 18000, 40);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Joystick PS4", 25000, 40);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Impresora Térmica", 60000, 100);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Impresora Laser", 150000, 40);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Parlantes 2.1", 40000, 40);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Conversor a Audio 7.1", 35000, 40);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Cámara Web de Visor", 15000, 15);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Cámara Web de Réflex", 25000, 20);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Disco Duro HDD 1TB", 80000, 200);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Unidad de Almacenamiento Sólido SSD 1TB", 100000, 180);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Monitor LCD 24' 144hz", 320000, 50);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Monitor LED 24' 60hz", 90000, 200);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Placa de Video RTX 3070", 500000, 100);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Procesador intel i5 11400 con gráficos integrados", 200000, 150);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Placa de red ethernet", 18000, 100);
INSERT INTO Producto(descripcion, precio, numeroExistencias) 
VALUES ("Placa de red wifi", 25000, 85);

# Inserto PROVINCIAS a las tablas
insert into Provincia(nombreProvincia) VALUES("Mendoza");
insert into Provincia(nombreProvincia) VALUES("Cordoba");
insert into Provincia(nombreProvincia) VALUES("Buenos Aires");
insert into Provincia(nombreProvincia) VALUES("San Luis");
insert into Provincia(nombreProvincia) VALUES("Tierra del Fuego");

# Inserto DEPARTAMENTOS
insert into Departamento(nombreDepartamento, idProvincia) VALUES("San Rafael", 1);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("San Martin", 1);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Rio Segundo", 2);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Colon", 2);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("La Plata", 3);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Quilmes", 3);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Ayacucho", 4);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Coronel Pringles", 4);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Ushuaia", 5);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Tolhuin", 5); 

SELECT *
FROM Departamento;

SELECT *
FROM Producto