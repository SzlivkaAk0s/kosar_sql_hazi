-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Gép: mariadb:3306
-- Létrehozás ideje: 2026. Nov 25. 15:10
-- Kiszolgáló verziója: 11.8.9-MariaDB-ubu2404
-- PHP verzió: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kosar`
--
CREATE DATABASE IF NOT EXISTS `kosar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci;
USE `kosar`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `vevo_id` int(11) NOT NULL,
  `db` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`id`, `termek_id`, `vevo_id`, `db`) VALUES
(1, 1, 1, 4),
(2, 2, 1, 2),
(3, 3, 1, 1),
(4, 4, 1, 3),
(5, 1, 2, 6),
(6, 5, 2, 2),
(7, 6, 2, 1),
(8, 7, 2, 1),
(9, 1, 3, 3),
(10, 8, 3, 5),
(11, 9, 3, 10),
(12, 10, 4, 1),
(13, 11, 4, 2),
(14, 12, 5, 1),
(15, 13, 5, 3),
(16, 14, 6, 2),
(17, 15, 6, 1),
(18, 16, 7, 4),
(19, 17, 7, 2),
(20, 18, 8, 1),
(21, 19, 8, 2),
(22, 20, 9, 1),
(23, 10, 10, 2),
(24, 11, 10, 1),
(25, 12, 11, 4),
(26, 13, 11, 2),
(27, 14, 12, 1),
(28, 15, 13, 3),
(29, 16, 14, 1),
(30, 17, 15, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(250) NOT NULL,
  `cikkszam` varchar(100) NOT NULL,
  `ar` int(7) NOT NULL,
  `dbkeszlet` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`id`, `nev`, `cikkszam`, `ar`, `dbkeszlet`) VALUES
(1, 'Fogkefe', 'FK001', 800, 20),
(2, 'Fogkrém', 'FK002', 1200, 30),
(3, 'Sampon', 'SM001', 1800, 15),
(4, 'Szappan', 'SZ001', 500, 40),
(5, 'Kávé', 'KV001', 3500, 10),
(6, 'Tea', 'TE001', 2000, 25),
(7, 'Fejhallgató', 'FH001', 12000, 8),
(8, 'Füzet', 'FU001', 700, 50),
(9, 'Toll', 'TO001', 300, 100),
(10, 'Egér', 'EG001', 4500, 12),
(11, 'Billentyűzet', 'BI001', 8500, 10),
(12, 'Monitor', 'MO001', 45000, 5),
(13, 'Pendrive', 'PE001', 2500, 20),
(14, 'Hátizsák', 'HA001', 9000, 15),
(15, 'Kulacs', 'KU001', 3000, 25),
(16, 'Póló', 'PO001', 5000, 30),
(17, 'Nadrág', 'NA001', 11000, 12),
(18, 'Labda', 'LA001', 4000, 18),
(19, 'Könyv', 'KO001', 6000, 20),
(20, 'Óra', 'OR001', 15000, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vevo`
--

CREATE TABLE `vevo` (
  `id` int(11) NOT NULL,
  `nev` varchar(250) NOT NULL,
  `kor` int(3) NOT NULL,
  `varos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `vevo`
--

INSERT INTO `vevo` (`id`, `nev`, `kor`, `varos`) VALUES
(1, 'Kovács Péter', 25, 'Miskolc'),
(2, 'Nagy Anna', 32, 'Miskolc'),
(3, 'Tóth Gábor', 41, 'Miskolc'),
(4, 'Szabó Eszter', 28, 'Budapest'),
(5, 'Kiss Dávid', 35, 'Debrecen'),
(6, 'Varga Lilla', 22, 'Szeged'),
(7, 'Molnár Bence', 30, 'Eger'),
(8, 'Balogh Zsófia', 27, 'Pécs'),
(9, 'Farkas Márk', 45, 'Győr'),
(10, 'Papp Réka', 24, 'Budapest'),
(11, 'Lakatos Ádám', 38, 'Sopron'),
(12, 'Takács Nóra', 29, 'Szolnok'),
(13, 'Horváth Tamás', 50, 'Debrecen'),
(14, 'Fekete Dóra', 33, 'Eger'),
(15, 'Oláh Martin', 21, 'Szeged');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termek_id` (`termek_id`),
  ADD KEY `vevo_id` (`vevo_id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vevo`
--
ALTER TABLE `vevo`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `termek`
--
ALTER TABLE `termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `vevo`
--
ALTER TABLE `vevo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`termek_id`) REFERENCES `termek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendeles_ibfk_2` FOREIGN KEY (`vevo_id`) REFERENCES `vevo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
