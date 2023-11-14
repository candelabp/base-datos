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
insert into Provincia(nombreProvincia) VALUES("Catamarca");
insert into Provincia(nombreProvincia) VALUES("Chaco");
insert into Provincia(nombreProvincia) VALUES("Chubut");
insert into Provincia(nombreProvincia) VALUES("Corrientes");
insert into Provincia(nombreProvincia) VALUES("Entre Rios");
insert into Provincia(nombreProvincia) VALUES("Formosa");
insert into Provincia(nombreProvincia) VALUES("Jujuy");
insert into Provincia(nombreProvincia) VALUES("La Pampa");
insert into Provincia(nombreProvincia) VALUES("La Rioja");
insert into Provincia(nombreProvincia) VALUES("Misiones");
insert into Provincia(nombreProvincia) VALUES("Neuquen");
insert into Provincia(nombreProvincia) VALUES("Rio Negro");
insert into Provincia(nombreProvincia) VALUES("Salta");
insert into Provincia(nombreProvincia) VALUES("San Juan");
insert into Provincia(nombreProvincia) VALUES("Santa Cruz");
insert into Provincia(nombreProvincia) VALUES("Santa Fe");
insert into Provincia(nombreProvincia) VALUES("Santiago del Estero");
insert into Provincia(nombreProvincia) VALUES("Tucuman");


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

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Fray Mamerto Esquiu", 6);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("San Fernando del Valle de Catamarca", 6);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("San Fernando", 7);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Almirante Brown", 7);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Rawson", 8);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Biedma", 8);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Monte Caseros", 9);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Mercedes", 9);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Concordia", 10);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Parana", 10);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Formosa", 11);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Laishi", 11);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Rinconada", 12);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Valle Grande", 12);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Chalileo", 13);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Toay", 13);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Independencia", 14);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Arauco", 14);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Eldorado", 15);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Candelaria", 15);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Confluencia", 16);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Los Lagos", 16);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("El Cuy", 17);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("9 de Julio", 17);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Los Andes", 18);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("La Poma", 18);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Pocito", 19);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Chimbas", 19);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Corpen Aike", 20);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Magallanes", 20);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Rosario", 21);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("General Obligado", 21);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("Pellegrini", 22);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Atamisqui", 22);

insert into Departamento(nombreDepartamento, idProvincia) VALUES("La Cocha", 23);
insert into Departamento(nombreDepartamento, idProvincia) VALUES("Graneros", 23);


