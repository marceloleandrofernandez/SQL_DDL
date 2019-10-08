use master 
go
drop database Tp2DDL
go
create database Tp2DDL
go
use Tp2DDl

create table Aeronaves(
AeronaveId varchar(5) not null,
Matricula varchar(5) not null,
Modelo varchar(4) not null,
MaximoPasajeros smallint not null,
MaximoCarga tinyint not null,
Constraint ck_Aeronave_Id Check(AeronaveId like '[0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f]'),
Constraint ck_Matricula Check(Matricula like '[L][V]%'),
Constraint ck_Modelo Check(Modelo like '[A,B,J][0-9][0-9][0-9]'),
Constraint ck_MaximoPasajeros Check(MaximoPasajeros >= 0)

)
create table Aeropuertos(
AeropuertoId varchar(3) not null,
Constraint ck_AeropuertoId Check(AeropuertoId like'[a-z][a-z][a-z]'),
Constraint uk_AeropuertoId Unique(AeropuertoId), 
)
create index ix_Aeropuerto_Id on Aeropuertos(AeropuertoId)


create table Ciudades(
CiudadId int not null,
Nombre varchar(50) not null,
Constraint ck_CiudadId Check(CiudadId < 10000),
Constraint uk_CiudadId Unique(CiudadId),
)
create index ix_CiudadId on Ciudades(CiudadId)

create table Dias(
DiasId tinyint not null,
Nombre varchar(15) not null,
Constraint ck_DiasId Check(DiasId < 8),
Constraint uk_Diasid Unique(DiasId)
)
create index ix_DiasId on Dias(DiasId)

create table Rutas(
RutaId smallint not null,
DistanciaKms smallint not null,
TiempoEnMinutos smallint not null,
constraint ck_RutaId Check (RutaId > 0 and RutaId < 20000),
Constraint uk_RutaId Unique(RutaId),
Constraint ck_DistanciaKms Check(DistanciaKms > 0 and DistanciaKms < 20000),
Constraint ck_TiempoEnMinutos Check(TiempoEnMinutos > 0 and TiempoEnMinutos < 1440),

)
create index ix_RutaId on Rutas(RutaId)
create table Rutas_Dias_Aeronaves(
Horario int not null, ---NideaLaPosicione
VueloNumero varchar(6) not null,
HabilitadoHasta date not null,
Constraint ck_VueloNumero Check(VueloNumero like '[a-z][a-z][0-9][0-9][0-9][0-9]'),
Constraint ck_Habilitadohasta Check(HabilitadoHasta > getdate() and HabilitadoHasta <= getdate()+365),
)

create table Vuelos(
Fecha date not null,
Constraint ck_Fecha Check(Fecha >= getdate() ),
Constraint uk_Fecha Unique(Fecha),
)
create index ix_Fecha on Vuelos(Fecha)

create table Pasajes(
Asiento varchar(3) not null,
Constraint ck_Asiento Check(Asiento like '[a-h][0-9][0-9]')
)

create table Pasajeros(
PasajeroId int not null,
PaisOrigen varchar(2) not null default 'AR',
TipoDocumento varchar(3) not null default 'DNI',
NumeroDocumento int not null,
Nombre varchar(50) not null,
Constraint ck_Pasajeros Check(PasajeroId > 0),
Constraint uk_Pasajeros Unique(PasajeroId),
Constraint ck_NumeroDocumento Check(NumeroDocumento > 0)
)
create index ix_Pasajeroid on Pasajeros(PasajeroId)