DROP DATABASE if exists practicoDDL
go

CREATE DATABASE practicoDDL
GO
use practicoDDL
go


drop table if exists Rubros
go

create table Rubros(
idRubro int identity Primary key ,
Descripcion Varchar(30) not null Check (Descripcion like '___%')

)

drop table if exists Articulos
go

create table Articulos(
idArticulo varchar(5) not null check ( idArticulo  like  '[A-Z][A-Z][0-9][0-9][0-9]') Primary key,
Nombre varchar(30) not null Check (Nombre like '___%'),
Constraint uqNombreArticulo Unique(Nombre),
Precio Money check (Precio > 0) not null ,
id_Rubro int not null Foreign key references Rubros(idRubro)
)


drop table if exists Depositos
go
create table Depositos(
idDeposito varchar(3) not null  Primary key,
Nombre varchar(30)  Check (Nombre like '___%') not null ,
Constraint uqNombreDeposito Unique(Nombre)
)
drop table if exists Stock
go

create table Stock(
Cantidad smallint Check (Cantidad > 0) not null, 
idArticulo varchar(5) not null check ( idArticulo  like  '[A-Z][A-Z][0-9][0-9][0-9]') Foreign key references Articulos(idArticulo),
idDeposito varchar(3) not null foreign key references Depositos(idDeposito)
)


drop table if exists Operaciones
go

create table Operaciones(
idOperacion tinyint identity  Primary key,
Operando char(1) Check (Operando like '[+][-]' ) not null Default ('+'),
Descripcion varchar(30) Check (Descripcion like '___%') not null Default('Ingreso') ,
Constraint uqDescricionOperaciones Unique(Descripcion)
)

drop table if exists Movimientos
go
create table Movimientos(
idMovimiento int identity  Primary key,
Cantidad smallint Check (Cantidad > 0) not null Default (1),
Fecha DateTime not null Default GETUTCDATE(), -- GETDATE() , GETUTCDATE(),CURRENT_TIMESTAMP ? Que verga las fechas macho
idArticulo varchar(5) not null check ( idArticulo  like  '[A-Z][A-Z][0-9][0-9][0-9]') Foreign key references Articulos(idArticulo),
idOperacion tinyint not null foreign key references Operaciones(idOperacion) 
)


select SP_WHO; -- Ver a Quien Matar

KILL 57 --Matar segun Id

---Switchear de Base a Master
USE Master;
GO
DROP DATABASE practicoDDL; ---Drop q(O_o)p
GO