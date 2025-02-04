local)/mssqll
-sql salvestatud protseduur - funktsioon, mis käivitab serveris mitu SQL tegevust järjest.
Kasutame SQL Server

create database protseduurRadasheva;
use protseduurRadasheva;
Create table linn(
LinnID int Primary Key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
select * from linn;
insert into linn(linnNimi, rahvaArv)
values ('tallinn', 60000),
('parnu', 30000), 
('tartu', 12444)
--protseduuri loomine 
--protseduur, mis lisad uus linn ja kohe näitab tabelis

create procedure lisaLinn
@lnimi varchar(30),
@rArv int
as
begin 

insert into linn(linnNimi, rahvaArv)
values (@lnimi, @rArv);
select * from linn;

end;
 --protseduuri kutse
 EXEC lisaLinn @lnimi='tartuu', @rArv=1256
 --lihtsam
 EXEC lisaLinn 'narva', 1256


 drop table linn;
 --kirje kustutamine 
 delete from linn where linnID=3
 select * from linn;
 --protseduur, mis kustutab linn id järgi
 create procedure kustutaLinn
 @deleteID int
 AS
 BEGIN
 SELECT * FROM linn;
 DELETE FROM linn WHERE linnID=@deleteID;
 SELECT * FROM linn;
 END;
 --kutse 
 EXEC kustutataLinn;


--protseduur, mis otsib linn esimse tähte 
CREATE PROCEDURE linnaOtsing
@taht char(1)
AS
BEGIN
SELECT * FROM linn 
WHERE linnNimi LIKE @taht + '%';
--% сколько угодно цифр
END;
--kurse
EXEC linnaOtsing T;




---------------------------------------------------------------------------
KAASUTAME XAMPP /localhost
Create table linn(
LinnID int Primary Key AUTO_INCREMENT,
linnNimi varchar(30),
rahvaArv int);
insert into linn(linnNimi, rahvaArv)
values ('tallinn', 60000),
('parnu', 30000), 
('tartu', 12444);

