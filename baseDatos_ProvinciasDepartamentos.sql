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

CREATE TABLE Direccion (
idDireccion int primary key auto_increment,
calle varchar(50),
numero int,
idDepartamento int,
idPersona int,
foreign key(idDepartamento) references Departamento(idDepartamento),
foreign key (idPersona) references Persona(idPersona)
);
create table Compra( 
idCompra int primary key auto_increment,
idClientes int,
fechaCompra date,
foreign key(idClientes) references Clientes(idClientes)
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
create table productoProveedor(
idProductoProveedor int primary key auto_increment,
idProducto int,
idProveedores int,
foreign key (idProducto) references Producto(idProducto),
foreign key (idProveedores) references Proveedores(idProveedores)
);
create table Proveedores(
idProveedores int primary key auto_increment,
codigo int,
idPersona int,
foreign key (idPersona) references Persona(idPersona)
);
create table Persona(
idPersona int primary key auto_increment,
nombre varchar(50),
apellido varchar(50),
numeroTelefono int
);
create table Clientes(
idClientes int primary key auto_increment,
codigo int,
idPersona int,
foreign key (idPersona) references Persona(idPersona)
);
create table Producto(
idProducto int primary key auto_increment,
codigo int,
descripcion varchar(200),
precio int,
numeroExistencias int
);

# SELECT
select * from Provincia;
select * from Departamento;

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