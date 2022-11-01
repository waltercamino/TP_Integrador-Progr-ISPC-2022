SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `disqueria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `disqueria`;

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

INSERT INTO `album` (`id_album`, `cod_album`, `nombre`, `id_interprete`, `id_genero`, `cant_temas`, `id_discografica`, `id_formato`, `fech_lanzamiento`, `precio`, `cantidad`, `caratula`) VALUES
(1, 1234567, 'La noche ke me muera', 1, 1, 7, 5, 4, '2020-07-30', 1000, 2, 'https://i.scdn.co/image/ab67616d0000b273bfd7c6d3d9e2c5122c5198e4'),
(2, 1234568, 'Calambre', 2, 1, 12, 2, 1, '2020-10-02', 1000, 1, 'https://images.genius.com/b9bb3acdf128d66ae8a8eb5b44bc6010.1000x1000x1.jpg'),
(3, 1234569, 'Motomami', 3, 3, 15, 6, 4, '2022-03-18', 1000, 3, 'https://www.dodmagazine.es/wp-content/uploads/2022/02/tracklist-motomami-rosalia.jpg'),
(4, 1234570, 'Blackstar', 4, 4, 7, 6, 1, '2016-01-08', 1000, 1, 'https://upload.wikimedia.org/wikipedia/commons/c/c5/David_Bowie_%E2%80%93_Blackstar.jpg'),
(5, 1234571, 'Stories from the City', 5, 4, 11, 2, 1, '2000-10-24', 1500, 3, 'https://upload.wikimedia.org/wikipedia/en/a/a3/Stories_From_The_City%2C_Stories_From_The_Sea.jpg'),
(6, 1234572, 'La sintesis O\'konor', 6, 6, 10, 5, 4, '2017-06-22', 800, 5, 'https://i.discogs.com/4N8i7mVSYw72oWwbfBb2MshX2urzoecpVR3liF80fSY/rs:fit/g:sm/q:90/h:535/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwNTk0/NzcyLTE1MTg0NDk5/NTYtMjQ2MS5qcGVn.jpeg'),
(7, 1234573, 'Slow wine mixtape', 7, 1, 12, 5, 4, '2016-11-09', 999.99, 155, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSK8GROxCVgpu4aSnSAJ-2VAxhMe_q-ei46TFkBKLZ02jOVPG-RJvo8ytpO2UQve9FmhM&usqp=CAU'),
(8, 1234574, 'Gracias a Dios', 31, 8, 13, 9, 1, '2018-03-02', 800, 5, 'https://www.cmtv.com.ar/tapas-cd/monagraciasadios.jpg');

CREATE TABLE `discografica` (
  `id_discografica` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `discografica` (`id_discografica`, `nombre`) VALUES
(1, 'BMG'),
(2, 'Sony Music'),
(3, 'WEA'),
(4, 'Universal'),
(5, 'Independiente'),
(6, 'Columbia Records'),
(7, 'Pelo Music S.A'),
(9, 'MONA RECORDS');

CREATE TABLE `formato` (
  `id_formato` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `formato` (`id_formato`, `tipo`) VALUES
(1, 'Compact Disc'),
(2, 'Cassette'),
(3, 'Long Play'),
(4, 'Digital'),
(5, 'MP3');

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `genero` (`id_genero`, `nombre`) VALUES
(1, 'Urban'),
(2, 'Pop'),
(3, 'Pop-flamenco'),
(4, 'Pop-Rock'),
(5, 'Rock'),
(6, 'Indie'),
(8, 'Cuarteto');

CREATE TABLE `interprete` (
  `id_interprete` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `interprete` (`id_interprete`, `nombre`, `nacionalidad`, `foto`) VALUES
(1, 'Juicy Bae', 'España', 'https://cdns-images.dzcdn.net/images/artist/d119ffe5426aaca42afa159d4f445585/500x500.jpg'),
(2, 'Naty Peluso', 'Argentina', 'https://i.scdn.co/image/ab6761610000f1785ce303f1b0ffaf1a0ad4287d'),
(3, 'Rosalia', 'España', 'https://i.scdn.co/image/ab6761610000f178d7bb678bef6d2f26110cae49'),
(4, 'David Bowie', 'Gran Bretaña', 'https://i.scdn.co/image/ab6761610000f178b78f77c5583ae99472dd4a49'),
(5, 'Pj Harvey', 'Reino unido', 'https://cdns-images.dzcdn.net/images/artist/082d31e00626e17e63e0732b4f4bea93/500x500.jpg'),
(6, 'El mató un policia morotizado', 'Argentina', 'https://i.scdn.co/image/ab6761610000f178cd0027a261b9d15c556ca883'),
(7, 'Bad gyal', 'España', 'https://i.scdn.co/image/ab6761610000f178c11bd2ab407a9e21b9b3cc02'),
(8, 'Widowspeak', 'United States', 'https://i.scdn.co/image/ab6761610000f178cc515f7bf9e4cc7b2b0f7138'),
(9, 'Natalia Lafourcade', 'Mexico', 'https://i.scdn.co/image/ab6761610000f178c3c42a12891de47e2a39a95a'),
(10, 'Chico Blanco', 'España', 'https://i.scdn.co/image/ab6761610000f178b48864cf195fd44994df0e28'),
(11, 'Soto Asa', 'España', 'https://i.scdn.co/image/ab6761610000f178a294e038d7d691746aff7e68'),
(12, 'Las ligas Menores', 'Argentina', 'https://i.scdn.co/image/ab6761610000f17811ec7d2da9bf6924536a5804'),
(13, 'Madonna', 'United States', 'https://i.scdn.co/image/ab6761610000f178034a19a2d576c696b5be94a5'),
(14, 'Miley cyrus', 'United States', 'https://i.scdn.co/image/ab6761610000f17802651b19050d8bf64b18d40a'),
(15, 'Michael Jackson', 'United States', 'https://i.scdn.co/image/ab6761610000f178a2a0b9e3448c1e702de9dc90'),
(16, 'Gustavo Cerati', 'Argentina', 'https://i.scdn.co/image/ab6761610000f1786d38c7aebc81afb076354b3b'),
(17, 'Catriel', 'Argentina', 'https://i.scdn.co/image/ab6761610000f178687600a13bb57ef13f075c64'),
(18, 'Paco Amoroso', 'Argentina', 'https://images.sk-static.com/images/media/profile_images/artists/9914274/huge_avatar'),
(28, 'Luis Alberto Spinetta', 'Argentina', 'https://i.scdn.co/image/ab6761610000f178e1988a1a730ae50728967a16'),
(29, 'Charly Garcia', 'Argentina', 'https://i.scdn.co/image/ab6761610000f178d25ab3ee01527706a3b47cc6'),
(30, 'Marilina Bertoldi', 'Argentina', 'https://i.scdn.co/image/ab6761610000f178d8fdd4419635c8d2ad7dcb5a'),
(31, 'La Mona Jiménez', 'Argentina', 'https://i.scdn.co/image/ab6761610000f17831180e03b59b3c980db4ebbe'),
(32, 'Sech', 'Panama', 'https://cdns-images.dzcdn.net/images/artist/54a6a3a9c16affdbb158e0d37f2063a8/500x500.jpg');

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `autor` varchar(100) NOT NULL,
  `compositor` varchar(100) NOT NULL,
  `id_album` int(11) DEFAULT NULL,
  `id_interprete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tema` (`id_tema`, `titulo`, `duracion`, `autor`, `compositor`, `id_album`, `id_interprete`) VALUES
(1, 'KUARENTENA ft Blackthoven', '00:02:09', 'Juicy Bae', 'Juicy Bae', 1, 1),
(2, 'Celebré', '00:03:00', 'Naty Peluso', 'Naty Peluso', 2, 2),
(3, 'La combi versace', '00:02:41', 'Rosalia', 'Rosalia', 3, 3),
(4, 'Blackstart', '00:10:00', 'David Bowie', 'David Bowie', 4, 4),
(7, 'Saoko', '00:02:20', 'Rosalía', 'Rosalía', 3, 3),
(14, 'Motomami', '00:01:02', 'Rosalia', 'Rosalia', 3, 3),
(17, 'Ramito de Violeta', '00:05:16', 'La Mona Jiménez', 'La Mona Jiménez', 8, 31);


ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `id_formato` (`id_formato`),
  ADD KEY `id_interprete` (`id_interprete`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_discografica` (`id_discografica`);

ALTER TABLE `discografica`
  ADD PRIMARY KEY (`id_discografica`);

ALTER TABLE `formato`
  ADD PRIMARY KEY (`id_formato`);

ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

ALTER TABLE `interprete`
  ADD PRIMARY KEY (`id_interprete`);

ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_interprete` (`id_interprete`);


ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

ALTER TABLE `discografica`
  MODIFY `id_discografica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `formato`
  MODIFY `id_formato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `interprete`
  MODIFY `id_interprete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;


ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`),
  ADD CONSTRAINT `album_ibfk_3` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `album_ibfk_4` FOREIGN KEY (`id_discografica`) REFERENCES `discografica` (`id_discografica`);

ALTER TABLE `tema`
  ADD CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `tema_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `interprete` (`id_interprete`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
