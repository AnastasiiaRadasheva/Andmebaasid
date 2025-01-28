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
select * from opilane;
