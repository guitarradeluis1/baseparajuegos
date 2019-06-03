-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para indi
CREATE DATABASE IF NOT EXISTS `indi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `indi`;

-- Volcando estructura para tabla indi.amigos
CREATE TABLE IF NOT EXISTS `amigos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario` bigint(20) NOT NULL,
  `amigo` bigint(20) NOT NULL,
  `pendiente` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.amigos: ~0 rows (aproximadamente)
DELETE FROM `amigos`;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;

-- Volcando estructura para tabla indi.arma
CREATE TABLE IF NOT EXISTS `arma` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objeto_id` bigint(20) NOT NULL,
  `dibujo_id` bigint(20) NOT NULL,
  `funciones_id` bigint(20) DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `dano_min` int(20) NOT NULL DEFAULT '0',
  `dano_max` int(20) NOT NULL DEFAULT '0',
  `defensa` int(100) NOT NULL DEFAULT '0',
  `fuerza` int(100) NOT NULL DEFAULT '0',
  `punteria` int(100) NOT NULL DEFAULT '0',
  `velocidad` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.arma: ~3 rows (aproximadamente)
DELETE FROM `arma`;
/*!40000 ALTER TABLE `arma` DISABLE KEYS */;
INSERT INTO `arma` (`id`, `objeto_id`, `dibujo_id`, `funciones_id`, `nombre`, `dano_min`, `dano_max`, `defensa`, `fuerza`, `punteria`, `velocidad`) VALUES
	(1, 3, 7, 3, 'Daga azul', 1, 3, 2, -1, 0, 2),
	(2, 3, 15, 3, 'Palo', 4, 4, 0, 0, 0, 0),
	(3, 3, 16, 2, 'sanador', 10, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `arma` ENABLE KEYS */;

-- Volcando estructura para tabla indi.arma_usuarios
CREATE TABLE IF NOT EXISTS `arma_usuarios` (
  `usuarios_id` bigint(20) NOT NULL,
  `oro` int(20) NOT NULL DEFAULT '0',
  `plata` int(20) NOT NULL DEFAULT '0',
  `arma_1` bigint(20) NOT NULL DEFAULT '0',
  `arma_2` bigint(20) NOT NULL DEFAULT '0',
  `arma_3` bigint(20) NOT NULL DEFAULT '0',
  `arma_4` bigint(20) NOT NULL DEFAULT '0',
  `arma_5` bigint(20) NOT NULL DEFAULT '0',
  `arma_6` bigint(20) NOT NULL DEFAULT '0',
  `arma_7` bigint(20) NOT NULL DEFAULT '0',
  `arma_8` bigint(20) NOT NULL DEFAULT '0',
  `c1` int(20) NOT NULL DEFAULT '0',
  `c2` int(20) NOT NULL DEFAULT '0',
  `c3` int(20) NOT NULL DEFAULT '0',
  `c4` int(20) NOT NULL DEFAULT '0',
  `c5` int(20) NOT NULL DEFAULT '0',
  `c6` int(20) NOT NULL DEFAULT '0',
  `c7` int(20) NOT NULL DEFAULT '0',
  `c8` int(20) NOT NULL DEFAULT '0',
  UNIQUE KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.arma_usuarios: ~2 rows (aproximadamente)
DELETE FROM `arma_usuarios`;
/*!40000 ALTER TABLE `arma_usuarios` DISABLE KEYS */;
INSERT INTO `arma_usuarios` (`usuarios_id`, `oro`, `plata`, `arma_1`, `arma_2`, `arma_3`, `arma_4`, `arma_5`, `arma_6`, `arma_7`, `arma_8`, `c1`, `c2`, `c3`, `c4`, `c5`, `c6`, `c7`, `c8`) VALUES
	(1, 2, 50, 0, 3, 1, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 0),
	(4, 2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `arma_usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla indi.campo
CREATE TABLE IF NOT EXISTS `campo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mapa_id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) DEFAULT '0',
  `fondo` bigint(20) NOT NULL,
  `limite_arriba_dibujo` bigint(20) NOT NULL,
  `limite_abajo_dibujo` bigint(20) NOT NULL,
  `limite_derecha_dibujo` bigint(20) NOT NULL,
  `limite_izquierda_dibujo` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.campo: ~2 rows (aproximadamente)
DELETE FROM `campo`;
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` (`id`, `mapa_id`, `usuarios_id`, `fondo`, `limite_arriba_dibujo`, `limite_abajo_dibujo`, `limite_derecha_dibujo`, `limite_izquierda_dibujo`, `nombre`) VALUES
	(1, 1, 0, 2, 14, 13, 1, 1, 'uno'),
	(2, 1, 0, 2, 2, 2, 2, 1, 'dos');
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.campo_dibujo
CREATE TABLE IF NOT EXISTS `campo_dibujo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_id` bigint(20) NOT NULL,
  `dibujo_id` bigint(20) NOT NULL,
  `funciones_id` bigint(20) DEFAULT '0',
  `arma_id` bigint(20) DEFAULT '0',
  `ia_id` bigint(20) DEFAULT '0',
  `campo_destino` bigint(20) DEFAULT '0',
  `parametros` varchar(20) DEFAULT NULL,
  `nivel` int(20) DEFAULT '0',
  `posicionx` int(120) NOT NULL,
  `posiciony` int(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.campo_dibujo: ~51 rows (aproximadamente)
DELETE FROM `campo_dibujo`;
/*!40000 ALTER TABLE `campo_dibujo` DISABLE KEYS */;
INSERT INTO `campo_dibujo` (`id`, `campo_id`, `dibujo_id`, `funciones_id`, `arma_id`, `ia_id`, `campo_destino`, `parametros`, `nivel`, `posicionx`, `posiciony`) VALUES
	(1, 1, 14, 0, 0, 0, 0, 'parametro', 0, 130, 90),
	(2, 1, 8, 1, 0, 0, 0, '', 0, 160, 150),
	(4, 1, 8, 0, 0, 0, 2, '', 0, 30, 230),
	(7, 1, 16, 4, 3, 0, 0, '', 0, 40, 120),
	(8, 2, 22, 0, 0, 0, 0, '', 0, 380, 40),
	(9, 2, 8, 0, 0, 0, 1, '', 0, 20, 20),
	(10, 2, 21, 0, 0, 0, 0, '', 0, 340, 40),
	(11, 2, 25, 0, 0, 0, 0, '', 0, 301, 40),
	(12, 2, 20, 0, 0, 0, 0, '', 0, 261, 40),
	(13, 2, 25, 0, 0, 0, 0, '', 0, 301, 79),
	(14, 2, 23, 0, 0, 0, 0, '', 0, 261, 119),
	(15, 2, 26, 0, 0, 0, 0, '', 0, 262, 79),
	(16, 2, 25, 0, 0, 0, 0, '', 0, 340, 80),
	(17, 2, 27, 0, 0, 0, 0, '', 0, 380, 80),
	(18, 2, 24, 0, 0, 0, 0, '', 0, 380, 120),
	(19, 2, 29, 0, 0, 0, 0, '', 0, 341, 119),
	(20, 2, 28, 0, 0, 0, 0, '', 0, 301, 118),
	(21, 2, 18, 0, 0, 0, 0, '', 0, 120, 60),
	(22, 2, 18, 0, 0, 0, 0, '', 0, 120, 100),
	(23, 2, 19, 0, 0, 0, 0, '', 0, 210, 360),
	(24, 2, 31, 0, 0, 0, 0, '', 0, 301, 158),
	(25, 2, 32, 0, 0, 0, 0, '', 0, 341, 158),
	(26, 2, 30, 0, 0, 0, 0, '', 0, 380, 158),
	(27, 2, 30, 0, 0, 0, 0, '', 0, 261, 158),
	(28, 2, 33, 0, 0, 0, 0, '', 0, 340, 200),
	(29, 2, 33, 0, 0, 0, 0, '', 0, 340, 240),
	(30, 2, 33, 0, 0, 0, 0, '', 0, 340, 280),
	(31, 2, 33, 0, 0, 0, 0, '', 0, 380, 280),
	(32, 2, 33, 0, 0, 0, 0, '', 0, 420, 280),
	(33, 2, 33, 0, 0, 0, 0, '', 0, 460, 280),
	(34, 2, 33, 0, 0, 0, 0, '', 0, 500, 280),
	(35, 2, 19, 0, 0, 0, 0, '', 0, 420, 180),
	(36, 2, 18, 0, 0, 0, 0, '', 0, 60, 330),
	(37, 2, 34, 0, 0, 0, 0, '', 0, 120, 320),
	(38, 2, 34, 0, 0, 0, 0, '', 0, 380, 300),
	(39, 2, 34, 0, 0, 0, 0, '', 0, 260, 182),
	(40, 2, 40, 0, 0, 0, 0, '', 0, 11, 370),
	(41, 2, 40, 0, 0, 0, 0, '', 0, 40, 370),
	(42, 2, 40, 0, 0, 0, 0, '', 0, 80, 370),
	(43, 2, 40, 0, 0, 0, 0, '', 0, 120, 370),
	(44, 2, 39, 0, 0, 0, 0, '', 0, 160, 370),
	(45, 2, 42, 0, 0, 0, 0, '', 0, 160, 410),
	(46, 2, 42, 0, 0, 0, 0, '', 0, 160, 450),
	(47, 2, 1, 0, 0, 0, 0, '', 0, 9, 409),
	(48, 2, 1, 0, 0, 0, 0, '', 0, 41, 409),
	(49, 2, 1, 0, 0, 0, 0, '', 0, 81, 409),
	(50, 2, 1, 0, 0, 0, 0, '', 0, 121, 409),
	(51, 2, 1, 0, 0, 0, 0, '', 0, 10, 420),
	(52, 2, 1, 0, 0, 0, 0, '', 0, 41, 420),
	(53, 2, 1, 0, 0, 0, 0, '', 0, 80, 420),
	(54, 2, 1, 0, 0, 0, 0, '', 0, 120, 420);
/*!40000 ALTER TABLE `campo_dibujo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.campo_enemigo
CREATE TABLE IF NOT EXISTS `campo_enemigo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_id` bigint(20) NOT NULL,
  `enemigo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.campo_enemigo: ~4 rows (aproximadamente)
DELETE FROM `campo_enemigo`;
/*!40000 ALTER TABLE `campo_enemigo` DISABLE KEYS */;
INSERT INTO `campo_enemigo` (`id`, `campo_id`, `enemigo_id`) VALUES
	(5, 2, 1),
	(6, 1, 1),
	(7, 2, 2),
	(8, 2, 2);
/*!40000 ALTER TABLE `campo_enemigo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.campo_objeto
CREATE TABLE IF NOT EXISTS `campo_objeto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_id` bigint(20) NOT NULL,
  `objeto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.campo_objeto: ~5 rows (aproximadamente)
DELETE FROM `campo_objeto`;
/*!40000 ALTER TABLE `campo_objeto` DISABLE KEYS */;
INSERT INTO `campo_objeto` (`id`, `campo_id`, `objeto_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 2, 2),
	(4, 1, 3),
	(5, 2, 3);
/*!40000 ALTER TABLE `campo_objeto` ENABLE KEYS */;

-- Volcando estructura para tabla indi.campo_usuarios
CREATE TABLE IF NOT EXISTS `campo_usuarios` (
  `usuarios_id` bigint(20) NOT NULL,
  `campo_id` bigint(20) NOT NULL,
  `x` double NOT NULL DEFAULT '60',
  `y` double NOT NULL DEFAULT '60',
  `cambio` varchar(50) NOT NULL,
  UNIQUE KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.campo_usuarios: ~2 rows (aproximadamente)
DELETE FROM `campo_usuarios`;
/*!40000 ALTER TABLE `campo_usuarios` DISABLE KEYS */;
INSERT INTO `campo_usuarios` (`usuarios_id`, `campo_id`, `x`, `y`, `cambio`) VALUES
	(1, 1, 282.61111724853527, 306.6950000000011, '03-06-2019'),
	(4, 2, 349.37000000000006, 250, '60');
/*!40000 ALTER TABLE `campo_usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla indi.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario1` bigint(20) NOT NULL,
  `usuario2` bigint(20) DEFAULT '0',
  `campo_id` bigint(20) DEFAULT '0',
  `mapa_id` bigint(20) DEFAULT '0',
  `gremio_id` bigint(20) DEFAULT '0',
  `grupo` int(2) DEFAULT '0',
  `mensaje` varchar(220) NOT NULL,
  `creado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.chat: ~10 rows (aproximadamente)
DELETE FROM `chat`;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`id`, `usuario1`, `usuario2`, `campo_id`, `mapa_id`, `gremio_id`, `grupo`, `mensaje`, `creado`) VALUES
	(1, 1, 0, 1, 0, 0, 0, 'campo', '02-06-2018'),
	(2, 4, 0, 1, 0, 0, 0, 'campoasssss', '02-06-2018'),
	(3, 1, 0, 1, 0, 0, 0, 'asdasdasdasda', '13-06-2018'),
	(4, 4, 0, 1, 0, 0, 0, 'luid........', '15-06-2018'),
	(5, 1, 0, 1, 0, 0, 0, 'Hola campo', '18-06-2018'),
	(6, 1, 0, 1, 0, 0, 0, 'asdasdsadasdas', '18-06-2018'),
	(7, 1, 4, 0, 0, 0, 0, 'hola amigo coneectadooo', '18-06-2018'),
	(8, 1, 4, 0, 0, 0, 0, 'czxczxczxczx', '18-06-2018'),
	(9, 4, 1, 0, 0, 0, 0, 'responde', '18-06-2018'),
	(10, 1, 0, 1, 0, 0, 0, 'gfgf', '11-09-2018');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- Volcando estructura para tabla indi.collide
CREATE TABLE IF NOT EXISTS `collide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dibujo_id_uno` bigint(20) NOT NULL,
  `dibujo_id_dos` bigint(20) NOT NULL,
  `funciones_id` bigint(20) DEFAULT NULL,
  `parametros` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.collide: ~0 rows (aproximadamente)
DELETE FROM `collide`;
/*!40000 ALTER TABLE `collide` DISABLE KEYS */;
/*!40000 ALTER TABLE `collide` ENABLE KEYS */;

-- Volcando estructura para tabla indi.dibujo
CREATE TABLE IF NOT EXISTS `dibujo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dibujotipo_id` bigint(20) DEFAULT NULL,
  `objeto_id` bigint(20) NOT NULL,
  `texto` varchar(220) DEFAULT NULL,
  `height` int(20) NOT NULL,
  `width` int(20) NOT NULL,
  `font` varchar(120) DEFAULT '20px Arial',
  `color` varchar(120) DEFAULT NULL,
  `velocidad` int(10) NOT NULL,
  `cuadros` varchar(150) NOT NULL,
  `play` int(2) DEFAULT '0',
  `fisica` int(2) DEFAULT '0',
  `immovable` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.dibujo: ~44 rows (aproximadamente)
DELETE FROM `dibujo`;
/*!40000 ALTER TABLE `dibujo` DISABLE KEYS */;
INSERT INTO `dibujo` (`id`, `dibujotipo_id`, `objeto_id`, `texto`, `height`, `width`, `font`, `color`, `velocidad`, `cuadros`, `play`, `fisica`, `immovable`) VALUES
	(1, 3, 1, 'Agua pura', 40, 40, '20px Arial', '#8080ff', 1, '[(23*21)+3,(23*21)+5]', 0, 1, 1),
	(2, 3, 1, 'Pasto', 40, 40, '', '#000000', 1, '[(23*2)+1]', 0, 0, 0),
	(3, 3, 2, 'Gatita abajo', 40, 40, '', '#000000', 6, '[ (16*4),(16*4)+1,(16*4)+2,(16*4)+3]', 0, 0, 0),
	(4, 3, 2, 'Gatita derecha', 40, 40, '', '#000000', 6, '[ (16*6),(16*6)+1,(16*6)+2,(16*6)+3]', 0, 0, 0),
	(5, 3, 2, 'Gatita izquierda', 40, 40, '', '#000000', 6, '[ (16*5),(16*5)+1,(16*5)+2,(16*5)+3]', 0, 0, 0),
	(6, 3, 2, 'Gatita arriba', 40, 40, '', '#000000', 6, '[ (16*7),(16*7)+1,(16*7)+2,(16*7)+3]', 0, 0, 0),
	(7, 3, 3, 'Daga azul', 40, 40, '', '#000000', 0, '[2]', 0, 0, 0),
	(8, 3, 1, 'puerta1', 40, 40, '', '#000000', 1, '[(23*2)+6]', 0, 1, 1),
	(9, 3, 2, 'Crerigo abajo', 40, 40, '', '#0000ff', 6, '[ (16*0),(16*0)+1,(16*0)+2,(16*0)+3]', 0, 0, 0),
	(10, 3, 2, 'Crerigo izquierda', 40, 40, '', '#0000ff', 6, '[ (16*1),(16*1)+1,(16*1)+2,(16*1)+3]', 0, 0, 0),
	(11, 3, 2, 'Crerigo derecha', 40, 40, '', '#0000ff', 6, '[ (16*2),(16*2)+1,(16*2)+2,(16*2)+3]', 0, 0, 0),
	(12, 3, 2, 'Crerigo arriba', 40, 40, '', '#0000ff', 6, '[ (16*3),(16*3)+1,(16*3)+2,(16*3)+3]', 0, 0, 0),
	(13, 3, 1, 'madera', 40, 40, '', '#000000', 1, '[(23*2)+8]', 0, 1, 1),
	(14, 3, 1, 'piedra', 40, 40, '', '#000000', 1, '[(23*3)+4]', 0, 1, 1),
	(15, 3, 3, 'palo', 40, 40, '', '#000000', 1, '[(14*6)+2]', 0, 0, 0),
	(16, 3, 3, 'sanar1', 40, 40, '', '#ffff80', 0, '[(14*3)+5]', 0, 1, 1),
	(17, 3, 4, 'uno', 40, 40, '', '#80ff80', 1, '[0,1,2,3]', 1, 0, 0),
	(18, 3, 1, 'flores rojas', 40, 40, '', '#ff0000', 0, '[231]', 0, 0, 0),
	(19, 3, 1, 'flores rojas con tronco', 40, 40, '', '#ff0000', 1, '[184]', 0, 1, 1),
	(20, 3, 1, 'techo naranja1 borde izqu ini', 40, 40, '', '#ff8000', 0, '[65]', 0, 1, 1),
	(21, 3, 1, 'techo naranja2 con ventana', 40, 40, '', '#ff8000', 0, '[67]', 0, 1, 1),
	(22, 3, 1, 'techo naranja1 borde dere ini', 40, 40, '', '#ff8000', 0, '[68]', 0, 1, 1),
	(23, 3, 1, 'techo naranja1 borde izqu fin', 40, 40, '', '#ff8000', 0, '[111]', 0, 1, 1),
	(24, 3, 1, 'techo naranja1 borde dere fin', 40, 40, '', '#ff8000', 0, '[114]', 0, 1, 1),
	(25, 3, 1, 'techo naranja', 40, 40, '', '#ff8000', 0, '[89]', 0, 1, 1),
	(26, 3, 1, 'techo naranja1 borde izqu', 40, 40, '', '#ff8000', 0, '[88]', 0, 1, 1),
	(27, 3, 1, 'techo naranja1 borde dere', 40, 40, '', '#ff8000', 0, '[91]', 0, 1, 1),
	(28, 3, 1, 'pared ventana izq', 40, 40, '', '#ffff80', 0, '[155]', 0, 1, 1),
	(29, 3, 1, 'pared ventana der', 40, 40, '', '#ffff80', 0, '[156]', 0, 1, 1),
	(30, 3, 1, 'pared', 40, 40, '', '#ffff80', 0, '[200]', 0, 1, 1),
	(31, 3, 1, 'pared ventana', 40, 40, '', '#ffff80', 0, '[179]', 0, 1, 1),
	(32, 3, 1, 'pared puerta', 40, 40, '', '#ffff80', 0, '[202]', 0, 1, 1),
	(33, 3, 1, 'camino arena', 40, 40, '', '#ffff00', 0, '[239]', 0, 0, 0),
	(34, 3, 1, 'arbusto', 40, 40, '', '#008000', 0, '[256]', 0, 1, 1),
	(35, 3, 5, 'zooro blanco abajo', 40, 40, '', '#ffffff', 2, '[0,1,2]', 1, 1, 0),
	(36, 3, 5, 'zooro blanco izquierda', 40, 40, '', '#ffffff', 2, '[11,12,13]', 1, 1, 0),
	(37, 3, 5, 'zooro blanco derecha', 40, 40, '', '#ffffff', 2, '[22,23,24]', 1, 1, 0),
	(38, 1, 5, 'zooro blanco arriba', 40, 40, '', '#ffffff', 2, '[33,34,35]', 1, 1, 0),
	(39, 3, 1, 'pasto arena agua derecha', 40, 40, '', '#400080', 1, '[518, 508]', 1, 1, 1),
	(40, 3, 1, 'pasto arena agua centro abajo', 40, 40, '', '#400080', 1, '[517, 507]', 1, 1, 1),
	(41, 3, 1, 'pasto arena agua izquierda', 40, 40, '', '#400080', 1, '[516, 506]', 1, 1, 1),
	(42, 3, 1, 'pasto arena agua derecha centro', 40, 40, '', '#400080', 1, '[545, 535]', 1, 1, 1),
	(43, 3, 1, 'pasto arena agua izquierda centro', 40, 40, '', '#400080', 1, '[542, 532]', 1, 1, 1),
	(44, 3, 6, 'NOMBRE', 40, 40, '', '#000000', 1, '[0,1]', 1, 0, 0);
/*!40000 ALTER TABLE `dibujo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.dibujotipo
CREATE TABLE IF NOT EXISTS `dibujotipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.dibujotipo: ~3 rows (aproximadamente)
DELETE FROM `dibujotipo`;
/*!40000 ALTER TABLE `dibujotipo` DISABLE KEYS */;
INSERT INTO `dibujotipo` (`id`, `nombre`) VALUES
	(1, 'text'),
	(2, 'button'),
	(3, 'sprite');
/*!40000 ALTER TABLE `dibujotipo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.enemigo
CREATE TABLE IF NOT EXISTS `enemigo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objeto_id` bigint(20) NOT NULL,
  `movimientos_id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `left_id` bigint(20) NOT NULL,
  `right_id` bigint(20) NOT NULL,
  `down_id` bigint(20) NOT NULL,
  `up_id` bigint(20) NOT NULL,
  `stop_id` bigint(20) NOT NULL,
  `dano_min` int(20) NOT NULL,
  `dano_max` int(20) NOT NULL,
  `vida` int(20) NOT NULL,
  `defensa` int(100) NOT NULL,
  `fuerza` int(100) NOT NULL,
  `punteria` int(100) NOT NULL,
  `velocidad` int(100) NOT NULL,
  `velocidad_juego` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.enemigo: ~2 rows (aproximadamente)
DELETE FROM `enemigo`;
/*!40000 ALTER TABLE `enemigo` DISABLE KEYS */;
INSERT INTO `enemigo` (`id`, `objeto_id`, `movimientos_id`, `nombre`, `left_id`, `right_id`, `down_id`, `up_id`, `stop_id`, `dano_min`, `dano_max`, `vida`, `defensa`, `fuerza`, `punteria`, `velocidad`, `velocidad_juego`) VALUES
	(1, 2, 4, 'gato enemigo', 3, 4, 3, 6, 3, 2, 4, 20, 1, 1, 1, 25, 2),
	(2, 5, 4, 'Zorro Blanco', 36, 37, 35, 38, 35, 0, 0, 0, 0, 0, 0, 2, 0);
/*!40000 ALTER TABLE `enemigo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.enemigo_arma
CREATE TABLE IF NOT EXISTS `enemigo_arma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enemigo_id` int(11) NOT NULL,
  `arma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.enemigo_arma: ~1 rows (aproximadamente)
DELETE FROM `enemigo_arma`;
/*!40000 ALTER TABLE `enemigo_arma` DISABLE KEYS */;
INSERT INTO `enemigo_arma` (`id`, `enemigo_id`, `arma_id`) VALUES
	(6, 1, 1);
/*!40000 ALTER TABLE `enemigo_arma` ENABLE KEYS */;

-- Volcando estructura para tabla indi.funciones
CREATE TABLE IF NOT EXISTS `funciones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(220) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.funciones: ~4 rows (aproximadamente)
DELETE FROM `funciones`;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'console_pruebas', 'Pruebas'),
	(2, 'obj_sanar', 'Recupera vida'),
	(3, 'obj_arma', 'Arma'),
	(4, 'recojer_obj', 'Recolectar Objeto');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

-- Volcando estructura para tabla indi.gremios
CREATE TABLE IF NOT EXISTS `gremios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lider` bigint(20) NOT NULL,
  `Nombre` bigint(20) NOT NULL,
  `eslogan` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.gremios: ~0 rows (aproximadamente)
DELETE FROM `gremios`;
/*!40000 ALTER TABLE `gremios` DISABLE KEYS */;
/*!40000 ALTER TABLE `gremios` ENABLE KEYS */;

-- Volcando estructura para tabla indi.gremios_usuarios
CREATE TABLE IF NOT EXISTS `gremios_usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.gremios_usuarios: ~0 rows (aproximadamente)
DELETE FROM `gremios_usuarios`;
/*!40000 ALTER TABLE `gremios_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `gremios_usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla indi.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `usuariorey` bigint(20) NOT NULL,
  `usuario1` bigint(20) NOT NULL,
  `usuario2` bigint(20) DEFAULT NULL,
  `usuario3` bigint(20) DEFAULT NULL,
  `usuario4` bigint(20) DEFAULT NULL,
  `usuario5` bigint(20) DEFAULT NULL,
  `usuario6` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.grupo: ~0 rows (aproximadamente)
DELETE FROM `grupo`;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.ia
CREATE TABLE IF NOT EXISTS `ia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enemigo_id` bigint(20) NOT NULL DEFAULT '0',
  `nivel` int(22) DEFAULT '0',
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.ia: ~1 rows (aproximadamente)
DELETE FROM `ia`;
/*!40000 ALTER TABLE `ia` DISABLE KEYS */;
INSERT INTO `ia` (`id`, `enemigo_id`, `nivel`, `nombre`, `descripcion`) VALUES
	(1, 1, 0, 'gata', 'gatita');
/*!40000 ALTER TABLE `ia` ENABLE KEYS */;

-- Volcando estructura para tabla indi.mapa
CREATE TABLE IF NOT EXISTS `mapa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_id` bigint(20) DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `x` bigint(20) DEFAULT '0',
  `y` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.mapa: ~1 rows (aproximadamente)
DELETE FROM `mapa`;
/*!40000 ALTER TABLE `mapa` DISABLE KEYS */;
INSERT INTO `mapa` (`id`, `campo_id`, `nombre`, `x`, `y`) VALUES
	(1, 1, 'Inicio', 50, 50);
/*!40000 ALTER TABLE `mapa` ENABLE KEYS */;

-- Volcando estructura para tabla indi.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla indi.movimientos: ~6 rows (aproximadamente)
DELETE FROM `movimientos`;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` (`id`, `nombre`) VALUES
	(1, 'quieto'),
	(2, 'arriba abajo'),
	(3, 'derecha izquierda'),
	(4, 'aleatorio'),
	(5, 'ataque'),
	(6, 'defensa');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;

-- Volcando estructura para tabla indi.objeto
CREATE TABLE IF NOT EXISTS `objeto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objetotipo_id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `archivo` varchar(200) NOT NULL,
  `cortex` int(20) NOT NULL,
  `cortey` int(11) NOT NULL,
  `inventario` int(2) DEFAULT '0',
  `conteofila` int(10) DEFAULT '0',
  `conteocolumna` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.objeto: ~6 rows (aproximadamente)
DELETE FROM `objeto`;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
INSERT INTO `objeto` (`id`, `objetotipo_id`, `nombre`, `archivo`, `cortex`, `cortey`, `inventario`, `conteofila`, `conteocolumna`) VALUES
	(1, 1, 'Bosque', 'Bosque.png', 32, 32, 0, 23, 29),
	(2, 4, 'Personajes1', 'Personajes1.png', 32, 48, 0, 16, 8),
	(3, 1, 'Objetos1', 'Objetos1.png', 60, 60, 1, 14, 8),
	(4, 1, 'demo', 'demo.png', 16, 16, 0, 2, 4),
	(5, 1, 'zooros', 'zooros.png', 50, 50, 0, 11, 7),
	(6, 1, 'NOMBRE', 'NOMBRE.png', 40, 40, 0, 2, 4);
/*!40000 ALTER TABLE `objeto` ENABLE KEYS */;

-- Volcando estructura para tabla indi.objetotipo
CREATE TABLE IF NOT EXISTS `objetotipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.objetotipo: ~4 rows (aproximadamente)
DELETE FROM `objetotipo`;
/*!40000 ALTER TABLE `objetotipo` DISABLE KEYS */;
INSERT INTO `objetotipo` (`id`, `nombre`) VALUES
	(1, 'spritesheet'),
	(2, 'image'),
	(3, 'audio'),
	(4, 'personaje');
/*!40000 ALTER TABLE `objetotipo` ENABLE KEYS */;

-- Volcando estructura para tabla indi.paises
CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.paises: ~240 rows (aproximadamente)
DELETE FROM `paises`;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` (`id`, `iso`, `nombre`) VALUES
	(1, 'AF', 'Afganistán'),
	(2, 'AX', 'Islas Gland'),
	(3, 'AL', 'Albania'),
	(4, 'DE', 'Alemania'),
	(5, 'AD', 'Andorra'),
	(6, 'AO', 'Angola'),
	(7, 'AI', 'Anguilla'),
	(8, 'AQ', 'Antártida'),
	(9, 'AG', 'Antigua y Barbuda'),
	(10, 'AN', 'Antillas Holandesas'),
	(11, 'SA', 'Arabia Saudí'),
	(12, 'DZ', 'Argelia'),
	(13, 'AR', 'Argentina'),
	(14, 'AM', 'Armenia'),
	(15, 'AW', 'Aruba'),
	(16, 'AU', 'Australia'),
	(17, 'AT', 'Austria'),
	(18, 'AZ', 'Azerbaiyán'),
	(19, 'BS', 'Bahamas'),
	(20, 'BH', 'Bahréin'),
	(21, 'BD', 'Bangladesh'),
	(22, 'BB', 'Barbados'),
	(23, 'BY', 'Bielorrusia'),
	(24, 'BE', 'Bélgica'),
	(25, 'BZ', 'Belice'),
	(26, 'BJ', 'Benin'),
	(27, 'BM', 'Bermudas'),
	(28, 'BT', 'Bhután'),
	(29, 'BO', 'Bolivia'),
	(30, 'BA', 'Bosnia y Herzegovina'),
	(31, 'BW', 'Botsuana'),
	(32, 'BV', 'Isla Bouvet'),
	(33, 'BR', 'Brasil'),
	(34, 'BN', 'Brunéi'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'CV', 'Cabo Verde'),
	(39, 'KY', 'Islas Caimán'),
	(40, 'KH', 'Camboya'),
	(41, 'CM', 'Camerún'),
	(42, 'CA', 'Canadá'),
	(43, 'CF', 'República Centroafricana'),
	(44, 'TD', 'Chad'),
	(45, 'CZ', 'República Checa'),
	(46, 'CL', 'Chile'),
	(47, 'CN', 'China'),
	(48, 'CY', 'Chipre'),
	(49, 'CX', 'Isla de Navidad'),
	(50, 'VA', 'Ciudad del Vaticano'),
	(51, 'CC', 'Islas Cocos'),
	(52, 'CO', 'Colombia'),
	(53, 'KM', 'Comoras'),
	(54, 'CD', 'República Democrática del Congo'),
	(55, 'CG', 'Congo'),
	(56, 'CK', 'Islas Cook'),
	(57, 'KP', 'Corea del Norte'),
	(58, 'KR', 'Corea del Sur'),
	(59, 'CI', 'Costa de Marfil'),
	(60, 'CR', 'Costa Rica'),
	(61, 'HR', 'Croacia'),
	(62, 'CU', 'Cuba'),
	(63, 'DK', 'Dinamarca'),
	(64, 'DM', 'Dominica'),
	(65, 'DO', 'República Dominicana'),
	(66, 'EC', 'Ecuador'),
	(67, 'EG', 'Egipto'),
	(68, 'SV', 'El Salvador'),
	(69, 'AE', 'Emiratos Árabes Unidos'),
	(70, 'ER', 'Eritrea'),
	(71, 'SK', 'Eslovaquia'),
	(72, 'SI', 'Eslovenia'),
	(73, 'ES', 'España'),
	(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
	(75, 'US', 'Estados Unidos'),
	(76, 'EE', 'Estonia'),
	(77, 'ET', 'Etiopía'),
	(78, 'FO', 'Islas Feroe'),
	(79, 'PH', 'Filipinas'),
	(80, 'FI', 'Finlandia'),
	(81, 'FJ', 'Fiyi'),
	(82, 'FR', 'Francia'),
	(83, 'GA', 'Gabón'),
	(84, 'GM', 'Gambia'),
	(85, 'GE', 'Georgia'),
	(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
	(87, 'GH', 'Ghana'),
	(88, 'GI', 'Gibraltar'),
	(89, 'GD', 'Granada'),
	(90, 'GR', 'Grecia'),
	(91, 'GL', 'Groenlandia'),
	(92, 'GP', 'Guadalupe'),
	(93, 'GU', 'Guam'),
	(94, 'GT', 'Guatemala'),
	(95, 'GF', 'Guayana Francesa'),
	(96, 'GN', 'Guinea'),
	(97, 'GQ', 'Guinea Ecuatorial'),
	(98, 'GW', 'Guinea-Bissau'),
	(99, 'GY', 'Guyana'),
	(100, 'HT', 'Haití'),
	(101, 'HM', 'Islas Heard y McDonald'),
	(102, 'HN', 'Honduras'),
	(103, 'HK', 'Hong Kong'),
	(104, 'HU', 'Hungría'),
	(105, 'IN', 'India'),
	(106, 'ID', 'Indonesia'),
	(107, 'IR', 'Irán'),
	(108, 'IQ', 'Iraq'),
	(109, 'IE', 'Irlanda'),
	(110, 'IS', 'Islandia'),
	(111, 'IL', 'Israel'),
	(112, 'IT', 'Italia'),
	(113, 'JM', 'Jamaica'),
	(114, 'JP', 'Japón'),
	(115, 'JO', 'Jordania'),
	(116, 'KZ', 'Kazajstán'),
	(117, 'KE', 'Kenia'),
	(118, 'KG', 'Kirguistán'),
	(119, 'KI', 'Kiribati'),
	(120, 'KW', 'Kuwait'),
	(121, 'LA', 'Laos'),
	(122, 'LS', 'Lesotho'),
	(123, 'LV', 'Letonia'),
	(124, 'LB', 'Líbano'),
	(125, 'LR', 'Liberia'),
	(126, 'LY', 'Libia'),
	(127, 'LI', 'Liechtenstein'),
	(128, 'LT', 'Lituania'),
	(129, 'LU', 'Luxemburgo'),
	(130, 'MO', 'Macao'),
	(131, 'MK', 'ARY Macedonia'),
	(132, 'MG', 'Madagascar'),
	(133, 'MY', 'Malasia'),
	(134, 'MW', 'Malawi'),
	(135, 'MV', 'Maldivas'),
	(136, 'ML', 'Malí'),
	(137, 'MT', 'Malta'),
	(138, 'FK', 'Islas Malvinas'),
	(139, 'MP', 'Islas Marianas del Norte'),
	(140, 'MA', 'Marruecos'),
	(141, 'MH', 'Islas Marshall'),
	(142, 'MQ', 'Martinica'),
	(143, 'MU', 'Mauricio'),
	(144, 'MR', 'Mauritania'),
	(145, 'YT', 'Mayotte'),
	(146, 'MX', 'México'),
	(147, 'FM', 'Micronesia'),
	(148, 'MD', 'Moldavia'),
	(149, 'MC', 'Mónaco'),
	(150, 'MN', 'Mongolia'),
	(151, 'MS', 'Montserrat'),
	(152, 'MZ', 'Mozambique'),
	(153, 'MM', 'Myanmar'),
	(154, 'NA', 'Namibia'),
	(155, 'NR', 'Nauru'),
	(156, 'NP', 'Nepal'),
	(157, 'NI', 'Nicaragua'),
	(158, 'NE', 'Níger'),
	(159, 'NG', 'Nigeria'),
	(160, 'NU', 'Niue'),
	(161, 'NF', 'Isla Norfolk'),
	(162, 'NO', 'Noruega'),
	(163, 'NC', 'Nueva Caledonia'),
	(164, 'NZ', 'Nueva Zelanda'),
	(165, 'OM', 'Omán'),
	(166, 'NL', 'Países Bajos'),
	(167, 'PK', 'Pakistán'),
	(168, 'PW', 'Palau'),
	(169, 'PS', 'Palestina'),
	(170, 'PA', 'Panamá'),
	(171, 'PG', 'Papúa Nueva Guinea'),
	(172, 'PY', 'Paraguay'),
	(173, 'PE', 'Perú'),
	(174, 'PN', 'Islas Pitcairn'),
	(175, 'PF', 'Polinesia Francesa'),
	(176, 'PL', 'Polonia'),
	(177, 'PT', 'Portugal'),
	(178, 'PR', 'Puerto Rico'),
	(179, 'QA', 'Qatar'),
	(180, 'GB', 'Reino Unido'),
	(181, 'RE', 'Reunión'),
	(182, 'RW', 'Ruanda'),
	(183, 'RO', 'Rumania'),
	(184, 'RU', 'Rusia'),
	(185, 'EH', 'Sahara Occidental'),
	(186, 'SB', 'Islas Salomón'),
	(187, 'WS', 'Samoa'),
	(188, 'AS', 'Samoa Americana'),
	(189, 'KN', 'San Cristóbal y Nevis'),
	(190, 'SM', 'San Marino'),
	(191, 'PM', 'San Pedro y Miquelón'),
	(192, 'VC', 'San Vicente y las Granadinas'),
	(193, 'SH', 'Santa Helena'),
	(194, 'LC', 'Santa Lucía'),
	(195, 'ST', 'Santo Tomé y Príncipe'),
	(196, 'SN', 'Senegal'),
	(197, 'CS', 'Serbia y Montenegro'),
	(198, 'SC', 'Seychelles'),
	(199, 'SL', 'Sierra Leona'),
	(200, 'SG', 'Singapur'),
	(201, 'SY', 'Siria'),
	(202, 'SO', 'Somalia'),
	(203, 'LK', 'Sri Lanka'),
	(204, 'SZ', 'Suazilandia'),
	(205, 'ZA', 'Sudáfrica'),
	(206, 'SD', 'Sudán'),
	(207, 'SE', 'Suecia'),
	(208, 'CH', 'Suiza'),
	(209, 'SR', 'Surinam'),
	(210, 'SJ', 'Svalbard y Jan Mayen'),
	(211, 'TH', 'Tailandia'),
	(212, 'TW', 'Taiwán'),
	(213, 'TZ', 'Tanzania'),
	(214, 'TJ', 'Tayikistán'),
	(215, 'IO', 'Territorio Británico del Océano Índico'),
	(216, 'TF', 'Territorios Australes Franceses'),
	(217, 'TL', 'Timor Oriental'),
	(218, 'TG', 'Togo'),
	(219, 'TK', 'Tokelau'),
	(220, 'TO', 'Tonga'),
	(221, 'TT', 'Trinidad y Tobago'),
	(222, 'TN', 'Túnez'),
	(223, 'TC', 'Islas Turcas y Caicos'),
	(224, 'TM', 'Turkmenistán'),
	(225, 'TR', 'Turquía'),
	(226, 'TV', 'Tuvalu'),
	(227, 'UA', 'Ucrania'),
	(228, 'UG', 'Uganda'),
	(229, 'UY', 'Uruguay'),
	(230, 'UZ', 'Uzbekistán'),
	(231, 'VU', 'Vanuatu'),
	(232, 'VE', 'Venezuela'),
	(233, 'VN', 'Vietnam'),
	(234, 'VG', 'Islas Vírgenes Británicas'),
	(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
	(236, 'WF', 'Wallis y Futuna'),
	(237, 'YE', 'Yemen'),
	(238, 'DJ', 'Yibuti'),
	(239, 'ZM', 'Zambia'),
	(240, 'ZW', 'Zimbabue');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;

-- Volcando estructura para tabla indi.personaje
CREATE TABLE IF NOT EXISTS `personaje` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objeto_id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `left_id` bigint(20) NOT NULL,
  `right_id` bigint(20) NOT NULL,
  `down_id` bigint(20) NOT NULL,
  `up_id` bigint(20) NOT NULL,
  `stop_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.personaje: ~3 rows (aproximadamente)
DELETE FROM `personaje`;
/*!40000 ALTER TABLE `personaje` DISABLE KEYS */;
INSERT INTO `personaje` (`id`, `objeto_id`, `nombre`, `left_id`, `right_id`, `down_id`, `up_id`, `stop_id`) VALUES
	(1, 2, 'Gatita.', 5, 4, 3, 6, 3),
	(2, 2, 'Crerigo', 10, 11, 9, 12, 9),
	(3, 5, 'Zorro blanco', 36, 37, 35, 38, 35);
/*!40000 ALTER TABLE `personaje` ENABLE KEYS */;

-- Volcando estructura para tabla indi.tipousuario
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.tipousuario: ~3 rows (aproximadamente)
DELETE FROM `tipousuario`;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` (`id`, `nombre`) VALUES
	(1, 'Abministrador'),
	(2, 'Creador'),
	(3, 'Jugador');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;

-- Volcando estructura para tabla indi.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipousuario_id` bigint(20) NOT NULL DEFAULT '3',
  `paises_id` bigint(20) DEFAULT '0',
  `personaje_id` bigint(20) DEFAULT '0',
  `arma1` bigint(20) DEFAULT NULL,
  `arma2` bigint(20) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `pass` varchar(120) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_nacimento` varchar(50) NOT NULL,
  `creado` varchar(50) NOT NULL,
  `ultima_entrada` varchar(50) DEFAULT NULL,
  `img_jugador` varchar(50) DEFAULT NULL,
  `img_perfil` varchar(50) DEFAULT NULL,
  `vida` int(50) DEFAULT '100',
  `nivel` int(100) DEFAULT '0',
  `puntos` int(100) DEFAULT '0',
  `defensa` int(100) DEFAULT '0',
  `fuerza` int(100) DEFAULT '0',
  `punteria` int(100) DEFAULT '0',
  `velocidad` int(100) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla indi.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `tipousuario_id`, `paises_id`, `personaje_id`, `arma1`, `arma2`, `email`, `pass`, `nombre`, `fecha_nacimento`, `creado`, `ultima_entrada`, `img_jugador`, `img_perfil`, `vida`, `nivel`, `puntos`, `defensa`, `fuerza`, `punteria`, `velocidad`) VALUES
	(1, 1, 52, 2, 2, NULL, 'guitarradeluis@gmail.com', 'luis', 'luis', '1991-09-13', '2017-08-29', '2019-05-27', NULL, NULL, 55, 0, 0, 0, 2, 1, 2),
	(4, 2, 52, 1, 1, NULL, 'guitarradeluis@hotmail.com', 'luis', 'luis2', '1991-09-13', '2017-08-29', '2018-04-14', NULL, NULL, 100, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
