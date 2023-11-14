create database VentasDispositivosFinal0;
use VentasDispositivosFinal0;
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

delimiter //
create procedure RegistrarCompra(
in p_idProducto int,
in p_idProveedores int,
in p_cantidad int,
in p_fecha_compra date,
in p_idClientes int
)

begin
insert into Detalle(idProducto, idProveedores, cantidad, fecha_compra, idCompra)
values(p_idProducto, p_idProveedores, p_cantidad, p_fecha_compra, p_idClientes);

update Producto
set numeroExistencias = numeroExistencias - p_cantidad
where idProducto = p_idProducto;
end //
delimiter ;


SELECT *
FROM Departamento;

SELECT *
FROM Producto;


ALTER TABLE Proveedores
ADD COLUMN idEmpresa int,
ADD CONSTRAINT fk_proveedor_empresa FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa);

INSERT INTO Persona (nombre, apellido, numeroTelefono) VALUES
('Juan', 'Perez', 261456789),
('Maria', 'Gomez', 266654321),
('Carlos', 'Rodriguez', 265555555),
('Laura', 'Fernandez', 298111111),
('Martin', 'Lopez', 119999999),
('Ana', 'Diaz', 258444444),
('Diego', 'Martinez', 199777777),
('Carolina', 'Sanchez', 101666666),
('Pablo', 'Garcia', 102222222),
('Valeria', 'Ramirez', 103888888),
('Facundo', 'Torres', 104333333),
('Lucia', 'Suarez', 105111222),
('Santiago', 'Castro', 106111999),
('Agustina', 'Rios', 107888777),
('Alejandro', 'Alvarez', 108222333);

INSERT INTO Empresa (nombreEmpresa, numeroTelefono, esNacional) VALUES
('TecnoVanguardia', 261456777, true),
('ByteFuturo', 266654366, true),
('Innovatec ', 333333355, false),
('QuantumCode ', 444444433, true),
('NeoSync ', 555555544, true),
('Cybervisión ', 666666622, false),
('ElectraByte ', 777777711, true),
('DataSphere ', 888888555, false),
('RoboLogic ', 999999666, true),
('NubeCraft ', 123456779, true),
('SynthWave ', 987654777, true),
('NanoNex ', 555555888, true),
('VirtuTech ', 111111999, true),
('CiberEsfera ', 777777555, false),
('FuturaCode ', 666666111, true);

-- Insertar datos en la tabla Proveedores
INSERT INTO Proveedores (codigo, idPersona, idEmpresa) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15);

-- Vincular proveedores con productos

-- Proveedor 1
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (1, 1);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (2, 1);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (3, 1);

-- Proveedor 2
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (4, 2);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (5, 2);

-- Proveedor 3
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (6, 3);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (7, 3);

-- Proveedor 4
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (8, 4);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (18, 4);

-- Proveedor 5
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (9, 5);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (3, 5);

-- Proveedor 6
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (10, 6);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (9, 6);

-- Proveedor 7
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (11, 7);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (16, 7);

-- Proveedor 8
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (12, 8);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (20, 8);

-- Proveedor 9
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (13, 9);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (5, 9);

-- Proveedor 10
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (14, 10);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (18, 10);

-- Proveedor 11
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (15, 11);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (17, 11);

-- Proveedor 12
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (16, 12);

-- Proveedor 13
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (17, 13);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (12, 13);


-- Proveedor 14
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (18, 14);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (1, 14);

-- Proveedor 15
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (19, 15);
INSERT INTO productoProveedor (idProducto, idProveedores) VALUES (20, 15);
-- Verifica los datos


SELECT * FROM Proveedores;
SELECT * FROM productoProveedor;
SELECT * FROM persona;
SELECT * FROM empresa;

DELIMITER //

CREATE PROCEDURE AumentarStock(
  IN p_idProducto INT,
  IN p_cantidad INT
)
BEGIN
  -- Aumentar el stock del producto existente
  UPDATE Producto
  SET numeroExistencias = numeroExistencias + p_cantidad
  WHERE idProducto = p_idProducto;
END //

DELIMITER ;
SELECT * FROM producto;
CALL AumentarStock(1, 10);
SELECT * FROM producto;
