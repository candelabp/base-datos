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
create table Compras(
idCompras int primary key,
idProducto int,
idProveedores int,
cantidad int,
fecha_compra date,
foreign key (idProducto) references Producto(idProducto),
foreign key (idProveedor) references Proveedor(idProveedor)
)

delimiter //
create procedure RegistrarCompra(
in p_idProducto int,
in p_idProveedor int,
in p_cantidad int,
in p_fecha_compra date
)

begin
insert into Compra(idProducto, idProveedor, cantidad, fecha_compra)
values(p_idProducto, p_idProveedor, p_cantidad, p_fecha_compra);

update Productos 
set numeroExistencias = numeroExistencias - cantidad
where idProducto = p_idProducto;
end //
delimiter ;

call RegistrarCompra(1, 1, 10, '2023-11-13');