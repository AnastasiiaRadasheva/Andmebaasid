AUTO_INCREMENT = identity(1,1)
decimal(десятичное число)

CREATE TABLE opilane(
opilaneID int primary key AUTO_INCREMENT,
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
delete from opilane Where opilaneid=2
UPDATE opilane SET aadress='Tartu'
WHERE opilane=3
