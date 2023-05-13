-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-05-2023 a las 21:05:05
-- Versión del servidor: 10.3.38-MariaDB-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ZuleinisNorbertoJose`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Disponible_en`
--

CREATE TABLE `Disponible_en` (
  `videogameID` int(50) NOT NULL,
  `platformID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Disponible_en`
--

INSERT INTO `Disponible_en` (`videogameID`, `platformID`) VALUES
(105805, 622080),
(503841, 771474),
(529124, 239801),
(674811, 239801),
(675482, 239801),
(676807, 755521),
(712090, 681235);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GameEngine`
--

CREATE TABLE `GameEngine` (
  `gameEngineTitle` varchar(50) NOT NULL,
  `3D` tinyint(1) NOT NULL,
  `2D` tinyint(1) NOT NULL,
  `Company` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `GameEngine`
--

INSERT INTO `GameEngine` (`gameEngineTitle`, `3D`, `2D`, `Company`) VALUES
('CryEngine', 1, 0, 'Crytek'),
('GameMaker Studio', 0, 1, 'YoYo Games'),
('Godot', 1, 1, 'Godot Engine'),
('havok', 1, 0, 'Havok'),
('Kinetica', 1, 0, 'Santa Monica Studios'),
('Lightweight Java Game Library', 1, 1, 'OpenSource'),
('Microsoft XNA framework', 1, 1, 'Microsoft'),
('Source', 1, 0, 'Valve'),
('tempest engine', 1, 0, 'Sony'),
('Unity', 1, 0, 'Unity Technologies'),
('Unreal Engine', 1, 0, 'Epic Games');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Juega`
--

CREATE TABLE `Juega` (
  `videogameID` int(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `timePlayed` float NOT NULL,
  `completionPercent` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Juega`
--

INSERT INTO `Juega` (`videogameID`, `userName`, `timePlayed`, `completionPercent`) VALUES
(105805, 'crybaby', 12, 70),
(105805, 'user1', 10, 50),
(105805, 'user3', 15, 30),
(503841, 'cowplant', 20, 100),
(503841, 'user1', 22, 10),
(529124, 'blackbeans', 8, 40),
(529124, 'cowplant', 53, 45),
(529124, 'user3', 5, 75),
(674811, 'emilord', 15, 80),
(675482, 'amalee', 22, 85),
(675482, 'thrillerman', 30, 90),
(676807, 'user6', 25, 60),
(712090, 'williethumb', 40, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PC`
--

CREATE TABLE `PC` (
  `platformID` int(50) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PC`
--

INSERT INTO `PC` (`platformID`, `Type`) VALUES
(197498, 'All-in-One PC'),
(681235, 'Laptop'),
(755521, 'Gaming PC'),
(769560, 'Workstation');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Platforms`
--

CREATE TABLE `Platforms` (
  `platformID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Platforms`
--

INSERT INTO `Platforms` (`platformID`) VALUES
(197498),
(239801),
(354844),
(390200),
(393853),
(622080),
(681235),
(755521),
(769560),
(771474),
(832766);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PlayStation`
--

CREATE TABLE `PlayStation` (
  `platformID` int(50) NOT NULL,
  `genP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PlayStation`
--

INSERT INTO `PlayStation` (`platformID`, `genP`) VALUES
(239801, 'PlayStation 4'),
(390200, 'PlayStation 2'),
(622080, 'PlayStation 3'),
(832766, 'PlayStation 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Publicadora`
--

CREATE TABLE `Publicadora` (
  `nameP` varchar(50) NOT NULL,
  `fechaFund` year(4) NOT NULL,
  `CEO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Publicadora`
--

INSERT INTO `Publicadora` (`nameP`, `fechaFund`, `CEO`) VALUES
('505 Games', 2006, 'Linny Cendana'),
('Electronic Arts', 1982, 'Andrew Wilson'),
('HoYoverse', 2011, 'Haoyu Cai'),
('Mojang Studios', 2009, 'Jonas Mårtensson'),
('Sony Interactive Entertainment', 1968, 'Jim Ryan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `userName` varchar(50) NOT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `IDamigo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`userName`, `realName`, `firstName`, `middleName`, `lastName`, `email`, `IDamigo`) VALUES
('amalee', 'Amanda Lee', 'Amanda', '', 'Lee', 'user10@example.com', 'user3'),
('blackbeans', 'David Garcia', 'David', 'Guzman', 'Garcia', 'user9@example.com', 'venuzfly'),
('copperscale', NULL, 'Alina', NULL, 'Mendez', 'alina@gmail.com', 'cowplant'),
('cowplant', 'Jane Smith', 'Jane', '', 'Smith', 'user2@example.com', 'copperscale'),
('crybaby', 'Jessica Martinez', 'Jessica', '', 'Martinez', 'user8@example.com', 'user1'),
('emilord', 'Emily Davis', 'Emily', '', 'Davis', 'user4@example.com', 'thrillerman'),
('thrillerman', 'Michael Wilson', 'Michael', '', 'Wilson', 'user5@example.com', 'emilord'),
('user1', 'John Doe', 'John', '', 'Doe', 'user1@example.com', 'crybaby'),
('user3', 'Robert Johnson', 'Robert', '', 'Johnson', 'user3@example.com', 'amalee'),
('user6', 'Jennifer Anderson', 'Jennifer', 'Lawrance', 'Anderson', 'user6@example.com', 'waterbender'),
('venuzfly', NULL, 'Zuleinis', NULL, 'Ramos', 'zuleinis@gmail.com', 'blackbeans'),
('waterbender', NULL, 'Sam', NULL, 'Sung', 'samsung@gmail.com', 'user6'),
('williethumb', 'William Thompson', 'William', '', 'Thompson', 'user7@example.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VideoGame`
--

CREATE TABLE `VideoGame` (
  `videogameID` int(50) NOT NULL,
  `gameEngineTitle` varchar(50) NOT NULL,
  `nameP` varchar(50) NOT NULL,
  `gameName` varchar(50) NOT NULL,
  `releaseDate` year(4) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `secuelaID` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `VideoGame`
--

INSERT INTO `VideoGame` (`videogameID`, `gameEngineTitle`, `nameP`, `gameName`, `releaseDate`, `genre`, `secuelaID`) VALUES
(105805, 'havok', 'Sony Interactive Entertainment', 'The Last of Us', 2013, 'horror', 675482),
(503841, 'Microsoft XNA framework', '505 Games', 'Terraria', 2011, 'sandbox', NULL),
(529124, 'Source', 'Electronic Arts', 'Apex Legends', 2019, 'battle-royale', NULL),
(674811, 'Kinetica', 'Sony Interactive Entertainment', 'God of War', 2018, 'action-adventure', NULL),
(675482, 'tempest engine', 'Sony Interactive Entertainment', 'The Last of Us Part II', 2020, 'horror', NULL),
(676807, 'Unity', 'HoYoverse', 'Genshin Impact', 2020, 'RPG', NULL),
(712090, 'Lightweight Java Game Library', 'Mojang Studios', 'Minecraft', 2011, 'sandbox', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Xbox`
--

CREATE TABLE `Xbox` (
  `platformID` int(50) NOT NULL,
  `genX` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Xbox`
--

INSERT INTO `Xbox` (`platformID`, `genX`) VALUES
(354844, 'Xbox Series S'),
(393853, 'Xbox Series X'),
(771474, 'Xbox One');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Disponible_en`
--
ALTER TABLE `Disponible_en`
  ADD PRIMARY KEY (`videogameID`,`platformID`),
  ADD UNIQUE KEY `videogameID` (`videogameID`,`platformID`),
  ADD KEY `Disponible_en_ibfk_2` (`platformID`);

--
-- Indices de la tabla `GameEngine`
--
ALTER TABLE `GameEngine`
  ADD PRIMARY KEY (`gameEngineTitle`);

--
-- Indices de la tabla `Juega`
--
ALTER TABLE `Juega`
  ADD KEY `userName` (`userName`),
  ADD KEY `Juega` (`videogameID`);

--
-- Indices de la tabla `PC`
--
ALTER TABLE `PC`
  ADD PRIMARY KEY (`platformID`);

--
-- Indices de la tabla `Platforms`
--
ALTER TABLE `Platforms`
  ADD PRIMARY KEY (`platformID`);

--
-- Indices de la tabla `PlayStation`
--
ALTER TABLE `PlayStation`
  ADD KEY `platformID` (`platformID`);

--
-- Indices de la tabla `Publicadora`
--
ALTER TABLE `Publicadora`
  ADD PRIMARY KEY (`nameP`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`userName`),
  ADD KEY `AMIGOS` (`IDamigo`);

--
-- Indices de la tabla `VideoGame`
--
ALTER TABLE `VideoGame`
  ADD PRIMARY KEY (`videogameID`),
  ADD KEY `Desarrollar-en` (`gameEngineTitle`),
  ADD KEY `Squela-de` (`secuelaID`),
  ADD KEY `Crear` (`nameP`);

--
-- Indices de la tabla `Xbox`
--
ALTER TABLE `Xbox`
  ADD KEY `Inheritance` (`platformID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Disponible_en`
--
ALTER TABLE `Disponible_en`
  ADD CONSTRAINT `Disponible_en_ibfk_1` FOREIGN KEY (`videogameID`) REFERENCES `VideoGame` (`videogameID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Disponible_en_ibfk_2` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`platformID`);

--
-- Filtros para la tabla `Juega`
--
ALTER TABLE `Juega`
  ADD CONSTRAINT `Juega` FOREIGN KEY (`videogameID`) REFERENCES `VideoGame` (`videogameID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Juega_ibfk_2` FOREIGN KEY (`userName`) REFERENCES `Usuario` (`userName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `PC`
--
ALTER TABLE `PC`
  ADD CONSTRAINT `Heritance` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`platformID`);

--
-- Filtros para la tabla `PlayStation`
--
ALTER TABLE `PlayStation`
  ADD CONSTRAINT `PlayStation_ibfk_1` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`platformID`);

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `AMIGOS` FOREIGN KEY (`IDamigo`) REFERENCES `Usuario` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `VideoGame`
--
ALTER TABLE `VideoGame`
  ADD CONSTRAINT `Crear` FOREIGN KEY (`nameP`) REFERENCES `Publicadora` (`nameP`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Desarrollar-en` FOREIGN KEY (`gameEngineTitle`) REFERENCES `GameEngine` (`gameEngineTitle`),
  ADD CONSTRAINT `Squela-de` FOREIGN KEY (`secuelaID`) REFERENCES `VideoGame` (`videogameID`);

--
-- Filtros para la tabla `Xbox`
--
ALTER TABLE `Xbox`
  ADD CONSTRAINT `Inheritance` FOREIGN KEY (`platformID`) REFERENCES `Platforms` (`platformID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
