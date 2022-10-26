-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2022 a las 00:29:34
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS disqueria ;
CREATE DATABASE disqueria;
USE disqueria;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `disqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `cod_album` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_interprete` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `cant_temas` int(11) NOT NULL,
  `id_discografica` int(11) NOT NULL,
  `id_formato` int(11) NOT NULL,
  `fech_lanzamiento` date NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `caratula` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id_album`, `cod_album`, `nombre`, `id_interprete`, `id_genero`, `cant_temas`, `id_discografica`, `id_formato`, `fech_lanzamiento`, `precio`, `cantidad`, `caratula`) VALUES
(1, 1234567, 'La noche ke me muera', 1, 1, 7, 5, 4, '2020-07-30', 1000, 2, 'https://i.scdn.co/image/ab67616d0000b273bfd7c6d3d9e2c5122c5198e4'),
(2, 1234568, 'Calambre', 2, 1, 12, 2, 1, '2020-10-02', 1000, 1, 'https://images.genius.com/b9bb3acdf128d66ae8a8eb5b44bc6010.1000x1000x1.jpg'),
(3, 1234569, 'Motomami', 3, 3, 15, 6, 4, '2022-03-18', 1000, 3, 'https://www.dodmagazine.es/wp-content/uploads/2022/02/tracklist-motomami-rosalia.jpg'),
(4, 1234570, 'Blackstar', 4, 4, 7, 6, 1, '2016-01-08', 1000, 1, 'https://upload.wikimedia.org/wikipedia/commons/c/c5/David_Bowie_%E2%80%93_Blackstar.jpg'),
(5, 1234571, 'Stories from the City', 5, 4, 11, 2, 1, '2000-10-24', 1500, 3, 'https://upload.wikimedia.org/wikipedia/en/a/a3/Stories_From_The_City%2C_Stories_From_The_Sea.jpg'),
(6, 1234572, 'La sintesis O\'konor', 6, 6, 10, 5, 4, '2017-06-22', 800, 5, 'https://i.discogs.com/4N8i7mVSYw72oWwbfBb2MshX2urzoecpVR3liF80fSY/rs:fit/g:sm/q:90/h:535/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNTk0/NzcyLTE1MTg0NDk5/NTYtMjQ2MS5qcGVn.jpeg'),
(7, 1234573, 'Slow wine mixtape', 7, 1, 12, 5, 4, '2016-11-09', 999.99, 155, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSK8GROxCVgpu4aSnSAJ-2VAxhMe_q-ei46TFkBKLZ02jOVPG-RJvo8ytpO2UQve9FmhM&usqp=CAU'),
(8, 1234574, 'Ramito de Violeta', 31, 5, 11, 2, 1, '2006-10-23', 800, 5, 'https://www.cmtv.com.ar/tapas-cd/monagraciasadios.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discografica`
--

CREATE TABLE `discografica` (
  `id_discografica` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discografica`
--

INSERT INTO `discografica` (`id_discografica`, `nombre`) VALUES
(1, 'BMG'),
(2, 'Sony Music'),
(3, 'WEA'),
(4, 'Universal'),
(5, 'Independiente'),
(6, 'Columbia Records'),
(7, 'Pelo Music S.A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

CREATE TABLE `formato` (
  `id_formato` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formato`
--

INSERT INTO `formato` (`id_formato`, `tipo`) VALUES
(1, 'Compact Disc'),
(2, 'Cassette'),
(3, 'Long Play'),
(4, 'Digital'),
(5, 'MP3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`) VALUES
(1, 'Urban'),
(2, 'Pop'),
(3, 'Pop-flamenco'),
(4, 'Pop-Rock'),
(5, 'Rock'),
(6, 'Indie');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interprete`
--

CREATE TABLE `interprete` (
  `id_interprete` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `interprete`
--

INSERT INTO `interprete` (`id_interprete`, `nombre`, `nacionalidad`, `foto`) VALUES
(1, 'Juicy Bae', 'España', NULL),
(2, 'Naty Peluso', 'Argentina', NULL),
(3, 'Rosalia', 'España', NULL),
(4, 'David Bowie', 'Gran Bretaña', NULL),
(5, 'Pj Harvey', 'Reino unido', NULL),
(6, 'El mató un policia morotizado', 'Argentina', NULL),
(7, 'Bad gyal', 'España', NULL),
(8, 'Widowspeak', 'United States', NULL),
(9, 'Natalia Lafourcade', 'Mexico', NULL),
(10, 'Chico Blanco', 'España', NULL),
(11, 'Soto Asa', 'España', NULL),
(12, 'Las ligas Menores', 'Argentina', NULL),
(13, 'Madonna', 'United States', NULL),
(14, 'Miley cyrus', 'United States', NULL),
(15, 'Fka twigs', 'Gran Bretaña', NULL),
(16, 'Gustavo Cerati', 'Argentina', NULL),
(17, 'Catriel', 'Argentina', NULL),
(18, 'Paco Amoroso', 'Argentina', ''),
(28, 'Luis Alberto Spinetta', 'Argentina', ''),
(29, 'Charly Garcia', 'Argentina', ''),
(30, 'Marilina Bertoldi', 'Argentina', ''),
(31, 'Mona Jimenez', 'Argentina', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `autor` varchar(100) NOT NULL,
  `compositor` varchar(100) NOT NULL,
  `id_album` int(11) DEFAULT NULL,
  `id_interprete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`id_tema`, `titulo`, `duracion`, `autor`, `compositor`, `id_album`, `id_interprete`) VALUES
(1, 'KUARENTENA ft Blackthoven', '00:02:09', 'Juicy Bae', 'Juicy Bae', 1, 1),
(2, 'Celebré', '00:03:00', 'Naty Peluso', 'Naty Peluso', 2, 2),
(3, 'La combi versace', '00:02:41', 'Rosalia', 'Rosalia', 3, 3),
(4, 'Blackstart', '00:10:00', 'David Bowie', 'David Bowie', 4, 4),
(7, 'Saoko', '00:02:20', 'Rosalía', 'Rosalía', 3, 3),
(8, 'La combi versace', '00:03:00', 'Rosalia', 'Rosalia', 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `id_formato` (`id_formato`),
  ADD KEY `id_interprete` (`id_interprete`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_discografica` (`id_discografica`);

--
-- Indices de la tabla `discografica`
--
ALTER TABLE `discografica`
  ADD PRIMARY KEY (`id_discografica`);

--
-- Indices de la tabla `formato`
--
ALTER TABLE `formato`
  ADD PRIMARY KEY (`id_formato`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `interprete`
--
ALTER TABLE `interprete`
  ADD PRIMARY KEY (`id_interprete`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_interprete` (`id_interprete`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `discografica`
--
ALTER TABLE `discografica`
  MODIFY `id_discografica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `formato`
--
ALTER TABLE `formato`
  MODIFY `id_formato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `interprete`
--
ALTER TABLE `interprete`
  MODIFY `id_interprete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`),
  ADD CONSTRAINT `album_ibfk_3` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `album_ibfk_4` FOREIGN KEY (`id_discografica`) REFERENCES `discografica` (`id_discografica`);

--
-- Filtros para la tabla `tema`
--
ALTER TABLE `tema`
  ADD CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `tema_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
