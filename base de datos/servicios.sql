-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2015 at 06:00 PM
-- Server version: 5.6.14
-- PHP Version: 5.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servicios`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `userid` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `bizrule` text COLLATE utf8_spanish_ci,
  `data` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `AuthAssignment`
--

INSERT INTO `AuthAssignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', '1', NULL, 'N;'),
('recepcionOtrasEmpresas', '1', NULL, 'N;'),
('recepcionOtrasEmpresas', '13', NULL, 'N;'),
('recepcionOtrasEmpresas', '5', NULL, 'N;'),
('recepcionOtrasEmpresas', '6', NULL, 'N;'),
('recepcionPcMac', '1', NULL, 'N;'),
('recepcionPcMac', '2', NULL, 'N;'),
('tecnico', '1', NULL, 'N;'),
('tecnico', '4', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_spanish_ci,
  `bizrule` text COLLATE utf8_spanish_ci,
  `data` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `AuthItem`
--

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, 'Administrador de la aplicacion', NULL, 'N;'),
('recepcionOtrasEmpresas', 2, 'Usuarios encargados de crear ordenes', NULL, 'N;'),
('recepcionPcMac', 2, 'Usuarios encargados de asignar ordenes', NULL, 'N;'),
('tecnico', 2, 'Usuarios encargados de las ordenes', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_orden`
--

CREATE TABLE IF NOT EXISTS `detalle_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `referencia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `serial` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `contra_cl` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contra_di` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `garantia` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `prende` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `problema` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `accesorio` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `back` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `diagnostico` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `repuesto` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_orden` (`id_orden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=50 ;

--
-- Dumping data for table `detalle_orden`
--

INSERT INTO `detalle_orden` (`id`, `id_orden`, `referencia`, `serial`, `contra_cl`, `contra_di`, `garantia`, `prende`, `imagen`, `problema`, `accesorio`, `back`, `diagnostico`, `repuesto`) VALUES
(46, 53, 'fbgdfb5241', '63515dfsd', '', '', 'Si', 'Si', 'No', 'Callo de un tercer piso y quedo sin imagen ', 'Celular, Cargador y audifonos ', 'No', 'Se hizo el diagnostico y cambio del display', 'Display 1236589'),
(47, 54, '654186', '36516', '', '', 'No', 'No', 'Si', 'Estor es algo de ensayo', 'Si', 'Si', NULL, NULL),
(48, 55, '68745', 'jsdv61115', '', '', 'Si', 'No', 'Si', 'Proeblemas', 'Si', 'No', NULL, NULL),
(49, 56, 'fbgdfb5241', '63515dfsd', '2604536', '2604536', 'Si', 'No', 'Si', 'gjfgj', 'dfhdfghd', 'Si', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'PcMac', 'Cr.31Sur #16-18', '2604536'),
(2, 'ETB', 'Cr.31Sur #16-18', '2604536'),
(3, 'Avantel', 'Cr.31Sur #16-18', '2604536');

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `estado` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `tecnico` int(11) NOT NULL,
  `fecha_estado` datetime NOT NULL,
  `fecha_futura` datetime NOT NULL,
  `tiempo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=86 ;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id`, `id_orden`, `estado`, `descripcion`, `tecnico`, `fecha_estado`, `fecha_futura`, `tiempo`) VALUES
(69, 53, 'Recepcion', 'Recepción de PcMac', 2, '2015-01-22 11:12:43', '2015-01-23 11:12:43', '24 horas'),
(70, 53, 'Tecnico', 'Para revisar y diagnostico inicial', 2, '2015-01-22 01:22:03', '2015-01-22 13:32:24', '12 Horas 10 Minutos'),
(71, 53, 'Tecnico', 'Se hizo el diagnostico inicial existosamente!!!', 4, '2015-01-22 13:32:24', '2015-01-24 13:32:24', '48 horas'),
(72, 53, 'Recepcion', 'Recepción de PcMac', 4, '2015-01-22 02:08:14', '2015-01-22 14:10:05', '12 Horas 1 Minutos'),
(73, 53, 'Recepcion', 'Recepción de PcMac', 2, '2015-01-22 14:10:05', '2015-01-22 14:40:02', 'NaN Horas NaN Minutos'),
(74, 53, 'Bodega', 'Solicitando Piezas', 2, '2015-01-22 14:40:02', '2015-01-23 02:40:02', '12 horas'),
(75, 54, 'Traslado', 'Traslado del producto de las empresas exteriores a PcMac', 13, '2015-01-22 14:51:32', '2015-01-23 14:51:32', '24 horas'),
(76, 55, 'Traslado', 'Traslado del producto de las empresas exteriores a PcMac', 5, '2015-01-22 15:00:14', '2015-01-23 15:00:14', '24 horas'),
(77, 54, 'Tecnico', 'Producto esta en reparación ', 2, '2015-01-22 03:01:46', '2015-01-24 03:01:46', '48 horas'),
(78, 55, 'Tecnico', 'Producto esta en reparación ', 2, '2015-01-22 03:01:58', '2015-01-25 00:25:54', '69 Horas 24 Minutos'),
(79, 54, 'Recepcion', 'Recepción de PcMac', 4, '2015-01-22 23:37:44', '2015-01-23 23:37:44', '24 horas'),
(80, 54, 'Finalizado', 'Se da por finalizada la orden y se entrega el producto sin novedad', 2, '2015-01-22 23:38:07', '2015-01-22 23:38:07', '0 horas'),
(81, 56, 'Recepcion', 'Recepción de PcMac', 2, '2015-01-22 23:41:40', '2015-02-05 10:05:09', '322 Horas 23 Minutos'),
(82, 55, 'Tecnico', 'Producto esta en reparación faltan piezas ', 4, '2015-01-25 00:25:54', '2015-02-06 17:53:11', '314 Horas 27 Minutos'),
(83, 56, 'Tecnico', 'Producto esta en reparación ', 1, '2015-02-05 10:05:08', '2015-02-07 10:05:08', '48 horas'),
(84, 55, 'Tecnico', 'Producto esta en reparación ', 1, '2015-02-06 17:53:11', '2015-02-06 17:53:25', '9 Horas 0 Minutos'),
(85, 55, 'Asignado', 'Asignado a tecnico a la espera de diagnostico inicial', 1, '2015-02-06 17:53:25', '2015-02-07 05:53:25', '12 horas');

-- --------------------------------------------------------

--
-- Table structure for table `estado_predet`
--

CREATE TABLE IF NOT EXISTS `estado_predet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `estado_predet`
--

INSERT INTO `estado_predet` (`id`, `estado`, `descripcion`, `duracion`) VALUES
(1, 'Traslado', 'Traslado del producto de las empresas exteriores a PcMac', '24'),
(2, 'Recepcion', 'Recepción de PcMac', '24'),
(3, 'Tecnico', 'Producto esta en reparación ', '48'),
(4, 'Bodega', 'Solicitando Piezas', '12'),
(5, 'Estado FN', 'Algo anormal en el proceso.', '24'),
(6, 'Asignado', 'Asignado a tecnico a la espera de diagnostico inicial', '12');

-- --------------------------------------------------------

--
-- Table structure for table `orden_servicio`
--

CREATE TABLE IF NOT EXISTS `orden_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `docu_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nom_cliente` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tele_cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `dire_cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mail_cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `tiempo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=57 ;

--
-- Dumping data for table `orden_servicio`
--

INSERT INTO `orden_servicio` (`id`, `id_usuario`, `id_responsable`, `docu_cliente`, `nom_cliente`, `tele_cliente`, `dire_cliente`, `mail_cliente`, `fecha_inicio`, `fecha_entrega`, `tiempo`, `estado`) VALUES
(53, 2, 2, '1110524931', 'John Fredy Triana Camacho', '3132030102', 'Cr 31 Sur # 16-18', 'john1988triana@gmail.com', '2015-01-22', '2015-01-22', 0, 2),
(54, 3, 2, '1110524931', 'John Fredy Triana Camacho', '2604536', 'Cr. 31 #16-18', 'john1988triana@gmail.com', '2015-01-22', '2015-01-22', 0, 2),
(55, 2, 4, '1110524931', 'John fredy Triana Camacho', '2604536', 'Cr 31 Sur #16-18', 'john1988triana@gmail.com', '2015-01-22', '2015-01-26', 39, 1),
(56, 1, 2, '1110524931', 'Jennifer Andrea Triana Camacho', '3132030102', 'Cr 31 Sur # 16-18', 'john1988triana@gmail.com', '2015-01-22', '2015-01-26', 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contra_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descri_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `empresa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nom_usuario`, `contra_usuario`, `descri_usuario`, `empresa`) VALUES
(1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Administrador', 1),
(2, 'jennifer', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'otro', 1),
(4, 'jfredy', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Otros', 1),
(5, 'manuel', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'otros', 2),
(6, 'jomazao', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'otro', 3),
(13, 'camilosarmiento', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'CoordinadorCoC', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AuthAssignment`
--
ALTER TABLE `AuthAssignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AuthItemChild`
--
ALTER TABLE `AuthItemChild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden_servicio` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
