create database retsepriRaamatRadasheva;
use retsepriRaamatRadasheva;
create table kasutaja(
kasutaja_id int primary key identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));

insert into kasutaja(eesnimi, perenimi, email)
values ('Adriana', 'Pikaljov', 'pikaljov@gmail.com');



create table kategooria (
kategooria_id int primary key identity (1,1),
kategooria_nimi varchar (50));
insert into kategooria (kategooria_nimi)
values('supp'), ('magus'), ('soolane'), ('jook'), ('köögiviljad');
select * from kategooria


create table toiduaine (
toiduaine_id int primary key identity (1,1),
toiduaine_nimi varchar(100));
insert into toiduaine (toiduaine_nimi)
values ('munad'), ('juust'), ('piim'), ('õlu'), ('soola');



create table yhik (
yhik_id int primary key identity (1,1),
yhik_nimi varchar(100));
insert into yhik (yhik_nimi)
values ('ml'), ('g'), ('kg'), ('tl'), ('sl');


create table retsept (
retsept_id int primary key identity (1,1),
retsepti_nimi varchar (100),
kirjendus varchar(200),
juhend varchar (500),
sisestatud_kp date,
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key (kategooria_id) references kategooria(kategooria_id));
insert into retsept (retsepti_nimi, kirjendus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
values('porgandikook', 'väga magus', 'kasuta porgandid', '2025-02-14', 2, 2),
('pannkoogid', 'väga magus', 'kasuta elektripliit', '2025-02-14', 3, 2),
('grill', 'nii soola', 'kasuta grillpott', '2025-02-14', 4, 2),
('supp', 'nii sola', 'kasuta elektripliit', '2025-02-12', 5, 1);



create table koostis(
koostis_id int primary key identity (1,1),
kogus int,
retsept_retsept_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
yhik_id int,
foreign key (yhik_id) references yhik(yhik_id));
insert into koostis (kogus, retsept_retsept_id, toiduaine_id, yhik_id)
values (3, 1, 2, 2), (1, 2, 3, 1), (12, 3, 3, 1), (2, 4, 5, 2), (1, 5, 1, 2);


create table tehtud (
tehtud_id int primary key identity (1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id));
insert into tehtud(tehtud_kp)
values ('2024-02-15'), ('2025-01-15' ), ('2025-02-01'), ('2025-02-02'), ('2024-01-18');

GRANT SELECT, INSERT ON toiduaine TO stafff;
GRANT SELECT, INSERT ON kategooria TO stafff;
GRANT SELECT ON kasutaja TO stafff;

DENY DELETE, UPDATE ON toiduaine TO stafff;
DENY DELETE, UPDATE ON kategooria TO stafff;
DENY DELETE, UPDATE ON kasutaja TO stafff;

GRANT SELECT, INSERT, UPDATE, DELETE ON toiduaine TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON kategooria TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON kasutaja TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON retsept TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON koostis TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON tehtud TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON yhik TO manager;

DENY INSERT ON toiduaine TO manager;
DENY INSERT ON kasutaja TO manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON retsept TO manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON koostis TO manager;


select * from tehtud;
select * from retsept;
select * from kategooria;
select * from toiduaine;
select * from yhik;
-----------------------------------
-----------------------------------
-----------------------------------
CREATE PROCEDURE AddRetsept
    @retsept_nimi VARCHAR(100),
    @kirjeldus VARCHAR(200),
    @juhend VARCHAR(500),
    @sisestatud_kp DATE,
    @kasutaja_id INT,
    @kategooria_id INT
AS
BEGIN
    INSERT INTO retsept (retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
    VALUES (@retsept_nimi, @kirjeldus, @juhend, @sisestatud_kp, @kasutaja_id, @kategooria_id);
END;
EXEC AddRetsept
    @retsept_nimi = 'tort napaleon',
    @kirjeldus = 'teha kooki',
    @juhend = 'adri',
    @sisestatud_kp = '2025-02-14',
    @kasutaja_id = 1, 
    @kategooria_id = 2  
drop from retsept
select * from retsep 
-----------------------------------
CREATE PROCEDURE UpdateRetsept
    @retsept_id INT,
    @retsept_nimi VARCHAR(100),
    @kirjeldus VARCHAR(200),
    @juhend VARCHAR(500),
    @sisestatud_kp DATE,
    @kasutaja_id INT,
    @kategooria_id INT
AS
BEGIN
    UPDATE retsept
    SET retsept_nimi = @retsept_nimi,
        kirjeldus = @kirjeldus,
        juhend = @juhend,
        sisestatud_kp = @sisestatud_kp,
        kasutaja_id = @kasutaja_id,
        kategooria_id = @kategooria_id
    WHERE retsept_id = @retsept_id;
END;
-----------------------------------
EXEC UpdateRetsept
    @retsept_id = 1,
    @retsept_nimi = 'Uuendatud Retsepti Nimi', 
    @kirjeldus = 'See on uuendatud retsepti kirjeldus.', 
    @juhend = 'Uuendatud samm-sammult juhend retsepti tegemiseks.', 
    @sisestatud_kp = '2025-02-14', 
    @kasutaja_id = 2, 
    @kategooria_id = 3;  
select * from retsep
-----------------------------------
CREATE PROCEDURE DeleteRetsept
    @retsept_id INT
AS
BEGIN
    DELETE FROM retsept WHERE retsept_id = @retsept_id;
END;
select * from retsep



-----------------------------------



CREATE PROCEDURE AddKoostis
    @kogus INT,
    @yhik_id INT,
    @toiduaine_id INT,
    @retsept_id INT
AS
BEGIN
    INSERT INTO koostis (kogus, yhik_id, toiduaine_id, retsept_id)
    VALUES (@kogus, @yhik_id, @toiduaine_id, @retsept_id);
END;
EXEC AddKoostis @kogus = 500, @yhik_id = 1, @toiduaine_id = 1, @retsept_id = 1;
select * from koostis
-----------------------------------
CREATE PROCEDURE UpdateKoostis
    @koostis_id INT,
    @kogus INT,
    @yhik_id INT,
    @toiduaine_id INT,
    @retsept_id INT
AS
BEGIN
    UPDATE koostis
    SET kogus = @kogus,
        yhik_id = @yhik_id,
        toiduaine_id = @toiduaine_id,
        retsept_id = @retsept_id
    WHERE koostis_id = @koostis_id;
END;
EXEC UpdateKoostis @koostis_id = 1, @kogus = 600, @yhik_id = 1, @toiduaine_id = 1, @retsept_id = 1;
select * from koostis
-----------------------------------
CREATE PROCEDURE DeleteKoostis
    @koostis_id INT
AS
BEGIN
    DELETE FROM koostis WHERE koostis_id = @koostis_id;
END;
EXEC DeleteKoostis @koostis_id = 1;



-----------------------------------



CREATE PROCEDURE AddTehtud
    @tehtud_kp DATE,
    @retsept_id INT
AS
BEGIN
    INSERT INTO tehtud (tehtud_kp, retsept_id)
    VALUES (@tehtud_kp, @retsept_id);
END;
EXEC AddTehtud @tehtud_kp = '2025-02-14', @retsept_id = 1;
select * from Tehtud
-----------------------------------
CREATE PROCEDURE UpdateTehtud
    @tehtud_id INT,
    @tehtud_kp DATE,
    @retsept_id INT
AS
BEGIN
    UPDATE tehtud
    SET tehtud_kp = @tehtud_kp,
        retsept_id = @retsept_id
    WHERE tehtud_id = @tehtud_id;
END;
EXEC UpdateTehtud @tehtud_id = 1, @tehtud_kp = '2025-02-15', @retsept_id = 2;

select * from Tehtud
-----------------------------------
CREATE PROCEDURE DeleteTehtud
    @tehtud_id INT
AS
BEGIN
    DELETE FROM tehtud WHERE tehtud_id = @tehtud_id;
END;
EXEC DeleteTehtud @tehtud_id = 1;
select * from Tehtud

------------------------------------------

--minu table


--Portsjoni kaalud (Вес порции)
create table kaalud(
kaalud_id int primary key identity(1,1),
kaal int,
kasutaja_id int,
retsept_id int,
FOREIGN KEY (kasutaja_id) REFERENCES kasutaja(kasutaja_id),
FOREIGN KEY (retsept_id) REFERENCES retsept(retsept_id),
);
drop table kaalud 
insert into kaalud(kaal)
values (300),(250), (220), (600), (467);



CREATE PROCEDURE InsertKaalud 
    @kaal INT,
    @kasutaja_id INT,
    @retsept_id INT
AS
BEGIN
    INSERT INTO kaalud (kaal, kasutaja_id, retsept_id)
    VALUES (@kaal, @kasutaja_id, @retsept_id);
END;
EXEC InsertKaalud @kaal = 300, @kasutaja_id = 1, @retsept_id = 5;




CREATE PROCEDURE UpdateKaalud
    @kaalud_id INT,
    @kaal INT
AS
BEGIN
    UPDATE kaalud
    SET kaal = @kaal
    WHERE kaalud_id = @kaalud_id;
END;
EXEC UpdateKaalud @kaalud_id = 1, @kaal = 350;




CREATE PROCEDURE DeleteKaalud
    @kaalud_id INT
AS
BEGIN
    DELETE FROM kaalud
    WHERE kaalud_id = @kaalud_id;
END;
EXEC DeleteKaalud @kaalud_id = 3;

