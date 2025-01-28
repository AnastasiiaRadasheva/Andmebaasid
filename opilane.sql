--AB loomine
create database RadashevaBaas;
use RadashevaBaas; 
CREATE TABLE opilane(
opilan
select * from opilane;eID int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)

INSERT INTO opilane(
eesnimi, 
perenimi,
synniaeg, 
stip, 
keskmine_hinne)
values(
'nastja',
'nastja2',
'2002-12-12',
1,
4.5),
(
'anastasia',
'lol',
'2005-03-04',
1,
2.2),
drop table opilane;
DELETE FROM opilane where opilaneId=2

--andmete uuendamine 
UPDATE opilane SET aadress='Tartu'
WHERE opilane
select * from opilane;
create table Language
(
ID int NOT NULL primary key,
code char(3) NOT NULL,
Language varchar(50) NOT NULL,
isOfficial bit,
Percentage smallint
);
select * from Language;

insert into Language(ID, Code, Language)
Values (2, 'ENG', 'inglise'), (3, 'RUS', 'vene'),
(4, 'DE', 'saksa')
create table keelevalik(
keeleValikId int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
Language int,
foreign key (Language) references Language(ID)
)
select * from keelevalik
select * from Language
select * from opilane
Insert into keelevalik(valikuNimetus, opilaneId, Language)
Values ('valik D', 1, 4)

select opilane.eesnimi, Language.Language
from opilane, Language, keelevalik
where opilane.opilaneId=keelevalik.opilaneID
AND Language.ID=keelevalik.Language

select *
from opilane, Language, keelevalik
where opilane.opilaneId=keelevalik.opilaneID
AND Language.ID=keelevalik.Language

create table opimine (
    opilaneId int primary key identity(1,1),
    aine varchar(50) not null,
    aasta int,
	hinne int,
    opetaja varchar(100) not null,
    Foreign key (opilaneId) references opilane(opilaneId) on delete cascade,
);
insert into, oppimine(opilaneID, aine, opetaja, aasta, hinne)
Values ('andmebaasid'
DROP TABLE opimine;
select tabel 
CREATE TABLE oppimine
(
oppimineId int primary key identity(1,1),
aine text not null, 
aasta char(4),
opetaja varchar(25),
opilaneID int not null,
FOREIGN KEY (opilaneID) REFERENCES opilane(opilaneID),
hinne int check (hinne BETWEEN 1 AND 5)
)
SELECT * FROM keeleValik;
SELECT * FROM Language;
SELECT * FROM opilane;	
SELECT * FROM oppimine;	
INSERT INTO oppimine(aine, aasta, opetaja, opilaneID, hinne)
Values('Inglise keel', 2025, 'Irina Merkulova', 10, 5)
