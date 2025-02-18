-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 18, 2025 kell 02:01 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `retsepriraamatradasheva`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddKoostis` (IN `kogus` INT, IN `yhik_id` INT, IN `toiduaine_id` INT, IN `retsept_id` INT)   BEGIN
    INSERT INTO koostis (kogus, yhik_id, toiduaine_id, retsept_id)
    VALUES (kogus, yhik_id, toiduaine_id, retsept_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddRetsept` (IN `retsept_nimi` VARCHAR(100), IN `kirjeldus` VARCHAR(200), IN `juhend` VARCHAR(500), IN `sisestatud_kp` DATE, IN `kasutaja_id` INT, IN `kategooria_id` INT)   BEGIN
    INSERT INTO retsept (retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
    VALUES (retsept_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTehtud` (IN `tehtud_kp` DATE, IN `retsept_id` INT)   BEGIN
    INSERT INTO tehtud (tehtud_kp, retsept_id)
    VALUES (tehtud_kp, retsept_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteKoostis` (IN `koostis_id` INT)   BEGIN
    DELETE FROM koostis WHERE koostis_id = koostis_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteRetsept` (IN `retsept_id` INT)   BEGIN
    DELETE FROM retsept WHERE retsept_id = retsept_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteTehtud` (IN `tehtud_id` INT)   BEGIN
    DELETE FROM tehtud WHERE tehtud_id = tehtud_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertKaalud` (IN `kaal` INT, IN `kasutaja_id` INT, IN `retsept_id` INT)   BEGIN
    INSERT INTO kaalud (kaal, kasutaja_id, retsept_id)
    VALUES (kaal, kasutaja_id, retsept_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateKaalud` (IN `kaalud_id` INT, IN `kaal` INT)   BEGIN
    UPDATE kaalud
    SET kaal = kaal
    WHERE kaalud_id = kaalud_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateKoostis` (IN `koostis_id` INT, IN `kogus` INT, IN `yhik_id` INT, IN `toiduaine_id` INT, IN `retsept_id` INT)   BEGIN
    UPDATE koostis
    SET kogus = kogus,
        yhik_id = yhik_id,
        toiduaine_id = toiduaine_id,
        retsept_id = retsept_id
    WHERE koostis_id = koostis_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateRetsept` (IN `retsept_id` INT, IN `retsept_nimi` VARCHAR(100), IN `kirjeldus` VARCHAR(200), IN `juhend` VARCHAR(500), IN `sisestatud_kp` DATE, IN `kasutaja_id` INT, IN `kategooria_id` INT)   BEGIN
    UPDATE retsept
    SET retsept_nimi = retsept_nimi,
        kirjeldus = kirjeldus,
        juhend = juhend,
        sisestatud_kp = sisestatud_kp,
        kasutaja_id = kasutaja_id,
        kategooria_id = kategooria_id
    WHERE retsept_id = retsept_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTehtud` (IN `tehtud_id` INT, IN `tehtud_kp` DATE, IN `retsept_id` INT)   BEGIN
    UPDATE tehtud
    SET tehtud_kp = tehtud_kp,
        retsept_id = retsept_id
    WHERE tehtud_id = tehtud_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kaalud`
--

CREATE TABLE `kaalud` (
  `kaalud_id` int(11) NOT NULL,
  `kaal` int(11) DEFAULT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kaalud`
--

INSERT INTO `kaalud` (`kaalud_id`, `kaal`, `kasutaja_id`, `retsept_id`) VALUES
(1, 300, NULL, NULL),
(2, 250, NULL, NULL),
(3, 220, NULL, NULL),
(4, 600, NULL, NULL),
(5, 467, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutaja_id` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perenimi` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kasutaja`
--

INSERT INTO `kasutaja` (`kasutaja_id`, `eesnimi`, `perenimi`, `email`) VALUES
(1, 'Artem', 'Põldsaar', 'Põldsaar@gmail.com');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kategooria`
--

CREATE TABLE `kategooria` (
  `kategooria_id` int(11) NOT NULL,
  `kategooria_nimi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kategooria`
--

INSERT INTO `kategooria` (`kategooria_id`, `kategooria_nimi`) VALUES
(1, 'xleb'),
(2, 'kinder'),
(3, 'moloko'),
(4, 'raamat'),
(5, 'sõnastik'),
(6, 'kogus');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `koostis`
--

CREATE TABLE `koostis` (
  `koostis_id` int(11) NOT NULL,
  `kogus` int(11) DEFAULT NULL,
  `yhik_id` int(11) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `koostis`
--

INSERT INTO `koostis` (`koostis_id`, `kogus`, `yhik_id`, `toiduaine_id`, `retsept_id`) VALUES
(5, 3, NULL, NULL, NULL),
(6, 2, NULL, NULL, NULL),
(7, 1, NULL, NULL, NULL),
(8, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `retsept`
--

CREATE TABLE `retsept` (
  `retsept_id` int(11) NOT NULL,
  `retsept_nimi` varchar(100) DEFAULT NULL,
  `kirjeldus` varchar(200) DEFAULT NULL,
  `juhend` varchar(500) DEFAULT NULL,
  `sisestatud_kp` date DEFAULT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `kategooria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `retsept`
--

INSERT INTO `retsept` (`retsept_id`, `retsept_nimi`, `kirjeldus`, `juhend`, `sisestatud_kp`, `kasutaja_id`, `kategooria_id`) VALUES
(16, 'Magus retsept', 'Magus dessert', 'Küpseta 30 minutit.', '2025-02-14', NULL, NULL),
(17, 'Hapu retsept', 'Kiseldatud salat', 'Sega koostisosad.', '2025-02-14', NULL, NULL),
(18, 'Terav retsept', 'Vürtsikas liha', 'Küpseta vürtsidega.', '2025-02-14', NULL, NULL),
(19, 'Meat retsept', 'Mugav liharoog', 'Sega köögiviljad ja liha.', '2025-02-14', NULL, NULL),
(20, 'Drink retsept', 'Maitsev jook', 'Sega viljad ja vesi.', '2025-02-14', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tehtud`
--

CREATE TABLE `tehtud` (
  `tehtud_id` int(11) NOT NULL,
  `tehtud_kp` date DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tehtud`
--

INSERT INTO `tehtud` (`tehtud_id`, `tehtud_kp`, `retsept_id`) VALUES
(6, '2025-06-23', NULL),
(7, '2025-05-13', NULL),
(8, '2025-02-28', NULL),
(9, '2025-01-14', NULL),
(10, '2025-04-02', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `toiduaine`
--

CREATE TABLE `toiduaine` (
  `toiduaine_id` int(11) NOT NULL,
  `toiduaine_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `toiduaine`
--

INSERT INTO `toiduaine` (`toiduaine_id`, `toiduaine_nimi`) VALUES
(1, 'magus'),
(2, 'hapu'),
(3, 'terav'),
(4, 'meat'),
(5, 'drink');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `yhik`
--

CREATE TABLE `yhik` (
  `yhik_id` int(11) NOT NULL,
  `yhik_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `yhik`
--

INSERT INTO `yhik` (`yhik_id`, `yhik_nimi`) VALUES
(1, 'ml'),
(2, 'g'),
(3, 'kl'),
(4, 'tl'),
(5, 'sl');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `kaalud`
--
ALTER TABLE `kaalud`
  ADD PRIMARY KEY (`kaalud_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutaja_id`);

--
-- Indeksid tabelile `kategooria`
--
ALTER TABLE `kategooria`
  ADD PRIMARY KEY (`kategooria_id`);

--
-- Indeksid tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD PRIMARY KEY (`koostis_id`),
  ADD KEY `yhik_id` (`yhik_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD PRIMARY KEY (`retsept_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `kategooria_id` (`kategooria_id`);

--
-- Indeksid tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD PRIMARY KEY (`tehtud_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  ADD PRIMARY KEY (`toiduaine_id`);

--
-- Indeksid tabelile `yhik`
--
ALTER TABLE `yhik`
  ADD PRIMARY KEY (`yhik_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `kaalud`
--
ALTER TABLE `kaalud`
  MODIFY `kaalud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `kategooria`
--
ALTER TABLE `kategooria`
  MODIFY `kategooria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `koostis`
--
ALTER TABLE `koostis`
  MODIFY `koostis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabelile `retsept`
--
ALTER TABLE `retsept`
  MODIFY `retsept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT tabelile `tehtud`
--
ALTER TABLE `tehtud`
  MODIFY `tehtud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  MODIFY `toiduaine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `yhik`
--
ALTER TABLE `yhik`
  MODIFY `yhik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `kaalud`
--
ALTER TABLE `kaalud`
  ADD CONSTRAINT `kaalud_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `kaalud_ibfk_2` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);

--
-- Piirangud tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD CONSTRAINT `koostis_ibfk_1` FOREIGN KEY (`yhik_id`) REFERENCES `yhik` (`yhik_id`),
  ADD CONSTRAINT `koostis_ibfk_2` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`toiduaine_id`),
  ADD CONSTRAINT `koostis_ibfk_3` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);

--
-- Piirangud tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD CONSTRAINT `retsept_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `retsept_ibfk_2` FOREIGN KEY (`kategooria_id`) REFERENCES `kategooria` (`kategooria_id`);

--
-- Piirangud tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD CONSTRAINT `tehtud_ibfk_1` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
