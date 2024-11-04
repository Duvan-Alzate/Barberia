-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `test`;

-- Volcando estructura para tabla test.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barber_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`barber_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`barber_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla test.citas: ~24 rows (aproximadamente)
INSERT INTO `citas` (`fecha`, `estado`, `nombre`, `cedula`, `celular`, `id`, `barber_id`) VALUES
	('2024-01-10 23:30:00', 'pendiente', NULL, NULL, NULL, 1, 3),
	('2024-01-18 23:30:00', 'pendiente', NULL, NULL, NULL, 2, 2),
	('2024-01-17 23:30:00', 'pendiente', 'Duvan alzate marin ', '1234568', '320538628', 3, 4),
	('2024-01-17 23:30:00', 'pendiente', 'Duvan alzate marin ', '1234568', '320538628', 4, 4),
	('2024-01-17 23:30:00', 'pendiente', 'Duvan alzate marin ', '1234568', '320538628', 5, 2),
	('2024-01-17 23:30:00', 'pendiente', 'Duvan alzate marin ', '1234568', '320538628', 6, 3),
	('2024-01-25 16:30:00', 'pendiente', 'Asd', '123', '123', 7, 2),
	('2024-01-25 23:30:00', 'pendiente', 'Hgt', 'Hh', 'Jh', 8, 2),
	('2024-02-21 13:30:00', 'pendiente', 'Duvan', '12345', '304562573', 9, 3),
	('2024-02-20 18:30:00', 'pendiente', 'Hola', '12345', '304627538', 10, 3),
	('2024-03-27 15:30:00', 'pendiente', 'Hshd', '62783', '427283', 11, 3),
	('2024-03-28 00:00:00', 'pendiente', 'Jshdjd', '26284', '363773', 12, 4),
	('2024-03-28 00:00:00', 'pendiente', 'Jshdjd', '26284', '363773', 13, 4),
	('2024-03-28 00:00:00', 'pendiente', 'Jshdjd', '26284', '363773', 14, 4),
	('2024-03-29 11:30:00', 'pendiente', 'Hsjdd', '362773', 'Ueueur', 15, 4),
	('2024-03-30 11:30:00', 'pendiente', 'Jdbdjkd', '362773', '37274', 16, 4),
	('2024-04-02 11:30:00', 'pendiente', 'Hshdjd', '637373', '38284', 17, 3),
	('2024-04-04 11:30:00', 'pendiente', 'Uejdjd', '737844', '3727373', 18, 4),
	('2024-03-26 11:35:08', 'pendiente', 'Ghg', '443', '433', 19, 4),
	('2024-03-26 11:35:08', 'pendiente', 'Aaaa', '4444', '432', 20, 2),
	('2024-03-26 11:35:08', 'pendiente', 'Vbbbb', '4432', '4322', 21, 3),
	('2024-03-26 11:40:05', 'pendiente', 'Ccc', '626474', '53828', 22, 2),
	('2024-03-26 11:44:54', 'pendiente', 'Fghu', '3567', '334', 23, 1),
	('2024-03-26 11:45:49', 'pendiente', 'Dgh', '4433', '332', 24, 3),
	('2024-04-12 15:30:00', 'pendiente', 'Duvan', '123456', '326736636', 25, 4),
	('2024-04-11 14:30:00', 'pendiente', 'Gabriel', '12345678', '3105643256', 26, 4),
	('2024-04-19 20:30:00', 'pendiente', 'Valentino', '1234321', '3468443212', 27, 4);

-- Volcando estructura para tabla test.cortes
CREATE TABLE IF NOT EXISTS `cortes` (
  `CorteId` int(100) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `RutaImagen` varchar(500) NOT NULL,
  PRIMARY KEY (`CorteId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla test.cortes: ~4 rows (aproximadamente)
INSERT INTO `cortes` (`CorteId`, `Nombre`, `Descripcion`, `RutaImagen`) VALUES
	(1, 'Buzz cut', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer.', 'https://images.unsplash.com/photo-1463430144406-394c977562d7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzV8fGNvcnRlJTIwZGUlMjBwZWxvJTIwZGUlMjBsb3MlMjBob21icmVzfGVufDB8fDB8fHww'),
	(2, 'Siete', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer.', 'https://images.unsplash.com/photo-1562004760-aceed7bb0fe3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG1lbnMlMjBoYWlyY3V0fGVufDB8fDB8fHww'),
	(3, 'Fade', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer.', 'https://images.unsplash.com/photo-1634480789085-33416565117d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNvcnRlJTIwZGUlMjBwZWxvJTIwZGUlMjBsb3MlMjBob21icmVzfGVufDB8fDB8fHww'),
	(4, 'Fade buz cut', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo "Contenido aquí, contenido aquí". Estos textos hacen parecerlo un español que se puede leer.', 'https://images.unsplash.com/photo-1567894340315-735d7c361db0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGNvcnRlJTIwZGUlMjBwZWxvJTIwZGUlMjBsb3MlMjBob21icmVzfGVufDB8fDB8fHww');

-- Volcando estructura para tabla test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `phone` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rutaImagen` varchar(500) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla test.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `phone`, `name`, `email`, `password`, `rutaImagen`, `role`) VALUES
	(1, '3046219341', 'Duvan Alzate Marin', 'duvanalzatemarin25@gmail.com', '123', '', 'admin'),
	(2, '3203168012', 'Andres', 'andresprueba@yopmail.com', '123', '', 'barbero'),
	(3, '3203168012', 'Carlos', 'carlosprueba@yopmail.com', '123', '', 'barbero'),
	(4, '3203168012', 'Martin', 'martinprueba@yopmail.com', '123', '', 'barbero');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
