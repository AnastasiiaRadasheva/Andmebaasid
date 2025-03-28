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
----------------------------------------------------------



SELECT * FROM opilane

CREATE PROCEDURE opilaneUuendus
    @opilaneID INT,
    @p_eesnimi VARCHAR(50),
    @p_perenimi VARCHAR(50),
    @p_synniaeg DATE,
    @p_stip DECIMAL(5,2),
    @p_keskmine_hinne DECIMAL(3,2)
AS
BEGIN
    UPDATE opilane
    SET eesnimi = @p_eesnimi,
        perenimi = @p_perenimi,
        synniaeg = @p_synniaeg,
        stip = @p_stip,
        keskmine_hinne = @p_keskmine_hinne
    WHERE opilaneID = @opilaneID;
END;
SELECT * FROM opilane


CREATE PROCEDURE opilaneSisesta
    @p_eesnimi VARCHAR(50),
    @p_perenimi VARCHAR(50),
    @p_synniaeg DATE,
    @p_stip DECIMAL(5,2),
    @p_keskmine_hinne DECIMAL(3,2)
AS
BEGIN
    INSERT INTO opilane (
        eesnimi,
        perenimi,
        synniaeg,
        stip,
        keskmine_hinne)
    VALUES
    (@p_eesnimi,
     @p_perenimi,
     @p_synniaeg,
     @p_stip,
     @p_keskmine_hinne);
END;
SELECT * FROM opilane

CREATE PROCEDURE opilaneVali
    @p_opilaneID INT
AS
BEGIN
    SELECT * 
    FROM opilane 
    WHERE opilaneID = @p_opilaneID;
END;
CREATE PROCEDURE opilaneKustuta
    @p_opilaneID INT
AS
BEGIN
    DELETE FROM opilane 
    WHERE opilaneID = @p_opilaneID;
END;
SELECT * FROM opilane
