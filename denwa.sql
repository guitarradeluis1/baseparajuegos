-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-12-2016 a las 20:13:33
-- Versión del servidor: 5.7.15-log
-- Versión de PHP: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `denwa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendamientotipo`
--

CREATE TABLE `agendamientotipo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agendamientotipo`
--

INSERT INTO `agendamientotipo` (`id`, `nombre`) VALUES
(1, 'Agenda por fecha y hora'),
(2, 'Día completo (Fecha)'),
(3, 'Rango de fechas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendamientotipocampos`
--

CREATE TABLE `agendamientotipocampos` (
  `id` bigint(20) NOT NULL,
  `agendamientotipo_id` bigint(20) NOT NULL,
  `tipos_id` bigint(20) NOT NULL,
  `listas_id` bigint(20) NOT NULL,
  `ayuda` text NOT NULL,
  `titulo_campo` varchar(200) NOT NULL,
  `visible` int(2) NOT NULL,
  `orden` int(120) NOT NULL,
  `obligatorio` int(2) NOT NULL,
  `mail` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agendamientotipocampos`
--

INSERT INTO `agendamientotipocampos` (`id`, `agendamientotipo_id`, `tipos_id`, `listas_id`, `ayuda`, `titulo_campo`, `visible`, `orden`, `obligatorio`, `mail`) VALUES
(1, 1, 5, 0, 'fecha inicio', 'inicio', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendas`
--

CREATE TABLE `agendas` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL DEFAULT '0',
  `pibotes_id` bigint(20) NOT NULL DEFAULT '0',
  `agendamientotipo_id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `creado` varchar(150) NOT NULL,
  `cambio` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agendas`
--

INSERT INTO `agendas` (`id`, `campanas_id`, `pibotes_id`, `agendamientotipo_id`, `nombre`, `creado`, `cambio`) VALUES
(1, 3, 1, 1, 'cositas', '08-17-2016', '08-17-2016'),
(2, 8, 1, 1, 'agenda', '17-08-2016', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendasmiento`
--

CREATE TABLE `agendasmiento` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `datoid` bigint(20) NOT NULL,
  `agendas_id` bigint(20) NOT NULL,
  `pibotesitems_id` bigint(20) NOT NULL,
  `pibote` bigint(20) NOT NULL,
  `fechainicio` varchar(50) NOT NULL,
  `fechafin` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `tiempo` int(20) NOT NULL,
  `ultimocambio` varchar(120) DEFAULT NULL,
  `activo` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agendasmiento`
--

INSERT INTO `agendasmiento` (`id`, `campanas_id`, `datoid`, `agendas_id`, `pibotesitems_id`, `pibote`, `fechainicio`, `fechafin`, `hora`, `tiempo`, `ultimocambio`, `activo`) VALUES
(1, 8, 28, 2, 1, 1, '2016-09-15', '2016-09-15', '08:30:00 AM', 2, '18-08-2016', 0),
(2, 8, 29, 2, 1, 1, '2016-09-15', '2016-09-15', '12:00:00 PM', 2, '19-08-2016', 1),
(3, 8, 31, 2, 2, 1, '2016-09-15', '2016-09-15', '01:00:00 PM', 1, '17-08-2016', 1),
(4, 3, 20, 1, 1, 1, '2016-10-03', '2016-10-03', '02:22:00 AM', 1, '03-10-2016', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendasmiento_denwa`
--

CREATE TABLE `agendasmiento_denwa` (
  `id` bigint(20) NOT NULL,
  `agendasmiento_id` bigint(20) NOT NULL,
  `registrodenwa_id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agendasmiento_denwa`
--

INSERT INTO `agendasmiento_denwa` (`id`, `agendasmiento_id`, `registrodenwa_id`, `campanas_id`) VALUES
(1, 1, 28, 8),
(2, 2, 29, 8),
(3, 3, 31, 8),
(4, 4, 20, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banderas`
--

CREATE TABLE `banderas` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `visible` int(2) DEFAULT '1',
  `nombre` varchar(150) NOT NULL,
  `imagen` varchar(120) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banderas`
--

INSERT INTO `banderas` (`id`, `campanas_id`, `visible`, `nombre`, `imagen`) VALUES
(1, 8, 1, 'uno', 'bandera_azul'),
(2, 8, 1, 'otro', 'bandera_roja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buscador`
--

CREATE TABLE `buscador` (
  `id` bigint(20) NOT NULL,
  `salidas_id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `buscador`
--

INSERT INTO `buscador` (`id`, `salidas_id`, `campanas_id`) VALUES
(2, 36, 3),
(3, 37, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas`
--

CREATE TABLE `campanas` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `guion` text NOT NULL,
  `creado` varchar(120) NOT NULL,
  `cambio` varchar(120) NOT NULL,
  `generado` int(2) DEFAULT '0',
  `saliendo` int(2) DEFAULT '0',
  `tipocampana` int(2) DEFAULT '0',
  `tipobusca` int(2) DEFAULT '0',
  `tipoentrada` int(2) DEFAULT '0',
  `regestion` int(2) DEFAULT '0',
  `activo` bigint(2) NOT NULL DEFAULT '1',
  `mail` int(2) DEFAULT '0',
  `guionemail` text,
  `tituloemail` varchar(200) DEFAULT NULL,
  `mailautomatico` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campanas`
--

INSERT INTO `campanas` (`id`, `titulo`, `guion`, `creado`, `cambio`, `generado`, `saliendo`, `tipocampana`, `tipobusca`, `tipoentrada`, `regestion`, `activo`, `mail`, `guionemail`, `tituloemail`, `mailautomatico`) VALUES
(1, 'CIOSAS', 'pendiente', '22-05-2015', '22-05-2015', 0, 1, 1, 1, 0, 0, 0, 0, NULL, NULL, 0),
(2, 'pruebas', 'asdasdasdasd', '22-05-2015', '25-09-2015', 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL, 0),
(3, 'pruebaaleatorio', 'pruebaaleatorio', '22-05-2015', '21-10-2016', 1, 1, 1, 0, 0, 0, 1, 1, '', '', 0),
(4, 'nueva', 'sssssssss', '28-05-2015', '28-05-2015', 1, 0, 0, 1, 0, 1, 0, 0, NULL, NULL, 0),
(5, 'entradagention', 'entrade de gestio', '23-06-2015', '22-09-2016', 1, 0, 0, 1, 1, 1, 1, 0, '', '', 0),
(6, 'Clon_pruebas', 'cmapña clon de pruebas', '24-06-2015', '24-06-2015', 1, 0, 0, 1, 1, 1, 0, 0, NULL, NULL, 0),
(7, 'gention', 'sssss', '24-06-2015', '18-12-2015', 1, 0, 0, 1, 1, 1, 1, 0, NULL, NULL, 0),
(8, 'ERP', 'Ingreso manejo de desarrollo (Luis)', '25-09-2015', '14-07-2016', 1, 0, 0, 1, 0, 1, 1, 1, 'Este es el texto del e_mailllllllllllllllllllllllll', 'titulo del email', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanasusuarios`
--

CREATE TABLE `campanasusuarios` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `pibote` bigint(20) DEFAULT NULL,
  `pibotesitems_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campanasusuarios`
--

INSERT INTO `campanasusuarios` (`id`, `campanas_id`, `usuarios_id`, `pibote`, `pibotesitems_id`) VALUES
(1, 2, 1, NULL, NULL),
(2, 3, 1, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(10, 8, 1, NULL, NULL),
(9, 8, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas_condicion`
--

CREATE TABLE `campanas_condicion` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `comparo_con` varchar(150) NOT NULL,
  `comparo_campo` bigint(20) DEFAULT NULL,
  `comparo_text` varchar(150) DEFAULT NULL,
  `condicional` varchar(100) NOT NULL,
  `valor` varchar(150) NOT NULL,
  `resultado` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campanas_condicion`
--

INSERT INTO `campanas_condicion` (`id`, `campanas_id`, `comparo_con`, `comparo_campo`, `comparo_text`, `condicional`, `valor`, `resultado`) VALUES
(1, 8, 'campo', 26, '', '==', 'luis', 'esconder'),
(2, 8, 'campo', 26, '', '!=', 'luis', 'mostrar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campos`
--

CREATE TABLE `campos` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `tipos_id` bigint(20) NOT NULL DEFAULT '0',
  `listas_id` bigint(20) DEFAULT '0',
  `banderas_id` bigint(20) DEFAULT '0',
  `ayuda` text,
  `titulo_campo` varchar(200) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT '1',
  `orden` int(120) NOT NULL,
  `obligatorio` int(2) DEFAULT '0',
  `mail` int(2) DEFAULT '0',
  `visible_consulta` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `campos`
--

INSERT INTO `campos` (`id`, `campanas_id`, `tipos_id`, `listas_id`, `banderas_id`, `ayuda`, `titulo_campo`, `visible`, `orden`, `obligatorio`, `mail`, `visible_consulta`) VALUES
(1, 2, 1, 0, NULL, 'por favor nombre\r\nakjsdhajsbdhjasbhjasb\r\n', 'Nomre', 1, 1, 0, 0, 0),
(2, 2, 5, 0, NULL, 'lafehcasadas\r\nasdasd', 'fecha', 1, 2, 1, 0, 0),
(3, 1, 1, 1, NULL, 'ESPECIALIDAD', 'ESPECIALIDAD', 1, 1, 1, 0, 0),
(4, 3, 1, 0, NULL, 'dasdas', 'nombre', 1, 1, 0, 0, 0),
(5, 3, 5, 0, NULL, 'fecha', 'fecha', 1, 2, 1, 0, 0),
(6, 2, 6, 0, NULL, 'sss', 'sadad', 1, 3, 1, 0, 0),
(7, 2, 8, 0, NULL, 'asdsdd', 'aaaa', 1, 4, 1, 0, 0),
(8, 3, 1, 1, NULL, 'na', 'select', 1, 3, 1, 0, 0),
(9, 2, 4, 0, NULL, 'lalalalala', 'aa bb', 1, 5, 1, 0, 0),
(10, 4, 1, 0, NULL, 'sd', 'NUMERO DOCUMENTO', 1, 1, 1, 0, 0),
(11, 5, 3, 0, NULL, 'unoooooooo\r\nsdasd', 'uno', 1, 1, 1, 0, 0),
(12, 5, 2, 1, NULL, 'asdasdasdasd', 'dosss', 1, 2, 1, 0, 0),
(13, 5, 1, 0, NULL, 'asdasd', 'saddadasd', 1, 3, 1, 0, 0),
(14, 5, 2, 0, NULL, 'sdasdasd', 'w', 1, 5, 1, 0, 0),
(15, 6, 1, 0, NULL, 'por favor nombre\r\nakjsdhajsbdhjasbhjasb\r\n', 'Nomre', 1, 1, 0, 0, 0),
(16, 6, 5, 0, NULL, 'lafehcasadas\r\nasdasd', 'fecha', 1, 2, 1, 0, 0),
(17, 6, 6, 0, NULL, 'sss', 'sadad', 1, 3, 1, 0, 0),
(18, 6, 4, 0, NULL, 'lalalalala', 'aa bb', 1, 3, 1, 0, 0),
(19, 6, 8, 0, NULL, 'asdsdd', 'aaaa', 1, 5, 1, 0, 0),
(20, 7, 1, 0, NULL, 'por favor nombre\r\nakjsdhajsbdhjasbhjasb\r\n', 'Nomre', 1, 1, 0, 0, 0),
(21, 7, 5, 0, NULL, 'lafehcasadas\r\nasdasd', 'fecha', 1, 2, 1, 0, 0),
(22, 7, 6, 0, NULL, 'sss', 'sadad', 1, 3, 1, 0, 0),
(23, 7, 4, 0, NULL, 'lalalalala', 'aa bb', 1, 4, 1, 0, 0),
(24, 7, 8, 0, NULL, 'asdsdd', 'aaaa', 1, 5, 1, 0, 0),
(25, 2, 9, 0, NULL, 'color', 'color', 1, 1, 1, 0, 0),
(26, 8, 1, 0, 0, '', 'Titulo', 1, 1, 1, 1, 1),
(27, 8, 3, 0, 1, 'Tiempo estimado en horas', 'Estimado', 1, 2, 1, 1, 0),
(28, 8, 5, 0, NULL, 'Fecha de comienzo de desarrollo', 'Inicio', 1, 3, 1, 0, 0),
(29, 8, 1, 2, 1, '', 'Tipo', 1, 4, 1, 0, 0),
(30, 8, 2, 0, 2, '', 'Notas', 1, 5, 0, 1, 0),
(31, 8, 5, 0, NULL, 'fin de la tarea', 'Cierre', 1, 6, 0, 0, 0),
(32, 8, 1, 0, NULL, '', 'Estado', 1, 7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_banderas`
--

CREATE TABLE `condicion_banderas` (
  `id` bigint(20) NOT NULL,
  `banderas_id` bigint(20) NOT NULL,
  `campanas_condicion_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `condicion_banderas`
--

INSERT INTO `condicion_banderas` (`id`, `banderas_id`, `campanas_condicion_id`) VALUES
(2, 1, 1),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadro`
--

CREATE TABLE `cuadro` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `visible` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadro_campos`
--

CREATE TABLE `cuadro_campos` (
  `id` bigint(20) NOT NULL,
  `campos_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_2`
--

CREATE TABLE `denwa_2` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_1` varchar(200) DEFAULT NULL,
  `campo_2` varchar(200) DEFAULT NULL,
  `campo_6` varchar(200) DEFAULT NULL,
  `campo_7` varchar(200) DEFAULT NULL,
  `campo_9` varchar(200) DEFAULT NULL,
  `campo_25` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_2`
--

INSERT INTO `denwa_2` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_1`, `campo_2`, `campo_6`, `campo_7`, `campo_9`, `campo_25`) VALUES
(1, 1, 0, '22-05-2015', '06:10:47 PM', '0:8', 'luis', '2015-05-22', NULL, NULL, NULL, NULL),
(2, 1, 0, '25-05-2015', '11:23:38 AM', '0:8', 'aa', '2015-05-18', NULL, NULL, NULL, NULL),
(3, 1, 0, '25-05-2015', '11:23:47 AM', '0:6', 'bbbb', '2015-05-25', NULL, NULL, NULL, NULL),
(4, 1, 0, '27-05-2015', '10:00:26 AM', '0:17', 'luis', '2015-05-27', '2015-04', '2015-W19', NULL, NULL),
(5, 1, 0, '27-05-2015', '10:04:08 AM', '1:56', '', '', '', '', NULL, NULL),
(6, 1, 0, '28-05-2015', '09:00:39 AM', '0:22', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com', NULL),
(7, 1, 0, '28-05-2015', '09:58:46 AM', '0:1', '', '', '', '', '', NULL),
(8, 1, 0, '28-05-2015', '01:47:52 PM', '0', '', '', '', '', '', NULL),
(9, 1, 0, '28-05-2015', '01:54:18 PM', '0:1', '', '', '', '', '', NULL),
(10, 1, 0, '28-05-2015', '01:54:21 PM', '0', '', '', '', '', '', NULL),
(11, 1, 0, '28-05-2015', '01:54:25 PM', '0:1', '', '', '', '', '', NULL),
(12, 1, 0, '23-06-2015', '05:26:49 PM', '0:50', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com', NULL),
(13, 1, 0, '24-06-2015', '10:32:55 AM', '16:0', 'luis', '2015-06-24', '2015-06', '2015-W26', 'correo@correo.com', NULL),
(14, 1, 0, '19-08-2015', '01:33:14 PM', '0:26', 'luis', '2015-08-19', '2015-08', '2015-W34', 'correo@correo.com', '#0080c0'),
(15, 1, 0, '20-10-2015', '10:41:08 AM', '0:26', 'sadasd', '2015-10-20', '2015-11', '2015-W43', 'g@g.com', '#000000'),
(16, 1, 0, '20-10-2015', '12:23:09 PM', '0:18', 'sssdasdas', '2015-10-20', '2015-11', '2015-W43', 'g@g.com', '#0000ff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_3`
--

CREATE TABLE `denwa_3` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_4` varchar(200) DEFAULT NULL,
  `campo_5` varchar(200) DEFAULT NULL,
  `campo_8` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_3`
--

INSERT INTO `denwa_3` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_4`, `campo_5`, `campo_8`) VALUES
(1, 1, 1, '22-05-2015', '07:09:41 PM', '0:22', 'luis', '2015-05-22', NULL),
(2, 1, 2, '25-05-2015', '09:11:08 AM', '0:6', 'luis', '2015-05-25', NULL),
(3, 1, 1, '26-05-2015', '10:46:13 AM', '0:10', 'entrada', '2015-05-26', NULL),
(4, 1, 1, '27-05-2015', '10:23:20 AM', '0:13', 'luis', '2015-05-28', 'CIRUGÍA DE CABEZA Y CUELLO'),
(5, 1, 2, '28-05-2015', '10:00:42 AM', '0:19', 'luis', '2015-05-25', 'CIRUGÍA DE CABEZA Y CUELLO'),
(6, 1, 1, '28-05-2015', '01:39:00 PM', '0:1', '', '', 'ANESTESIOLOGÍA'),
(7, 1, 1, '24-06-2015', '10:40:50 AM', '0:11', 'luisbbbbbbbbbbbbbbbb', '2015-05-28', 'CIRUGÍA DE CABEZA Y CUELLO'),
(8, 1, 2, '15-10-2015', '10:58:35 AM', '0:7', 'luis', '2015-10-15', 'ORTEPEDIA ONCOLOGÍA'),
(9, 1, 2, '16-10-2015', '05:37:05 PM', '0:9', 'luis..........', '2015-10-15', 'ORTEPEDIA ONCOLOGÍA'),
(10, 1, 2, '19-10-2015', '05:32:26 PM', '0:10', 'luis...........', '2015-10-19', 'ENDOCRINOLOGÍA'),
(11, 1, 2, '20-10-2015', '08:42:22 AM', '0:12', 'luis..........', '2015-10-20', 'ENDOCRINOLOGÍA'),
(12, 1, 2, '20-10-2015', '10:14:57 AM', '0:4', 'luis...........', '2015-10-19', 'CIRUGÍA GENERAL'),
(13, 1, 3, '20-10-2015', '10:39:59 AM', '0:5', 'sadasdasd', '2015-10-05', 'CIRUGÍA DE SENO Y TEJIDOS BLANDOS'),
(14, 1, 1, '27-10-2015', '12:14:55 PM', '0:9', 'aaa', '2015-10-27', 'ENDOCRINOLOGÍA'),
(15, 1, 4, '27-10-2015', '03:04:23 PM', '0:6', 'luis', '2015-10-27', 'ANESTESIOLOGÍA'),
(16, 1, 1, '27-10-2015', '04:09:23 PM', '0:6', 'luisbbbbbbbbbbbbbbbb', '2015-10-27', 'CIRUGÍA DE CABEZA Y CUELLO'),
(17, 1, 1, '26-02-2016', '10:20:52 AM', '0:19', 'luis', '2016-02-26', 'CIRUGIA VASCULAR PERIFÉRICA'),
(18, 1, 3, '26-02-2016', '10:29:05 AM', '0:9', 'luis', '2016-02-26', 'ANESTESIOLOGÍA'),
(19, 1, 1, '26-02-2016', '11:43:03 AM', '0:8', 'luis', '2016-02-26', 'CIRUGIA VASCULAR PERIFÉRICA'),
(20, 1, 1, '03-10-2016', '01:38:06 PM', '12:42', 'luis', '2016-10-03', 'HEMATOLOGÍA PEDIÁTRICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_4`
--

CREATE TABLE `denwa_4` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_10` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_5`
--

CREATE TABLE `denwa_5` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_11` varchar(200) DEFAULT NULL,
  `campo_12` text,
  `campo_13` varchar(200) DEFAULT NULL,
  `campo_14` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_5`
--

INSERT INTO `denwa_5` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_11`, `campo_12`, `campo_13`, `campo_14`) VALUES
(1, 1, 0, '24-06-2015', '10:37:18 AM', '0:28', '1', 'INFECTOLOGÍA', 'lssss', 'dddddd'),
(2, 1, 0, '24-06-2015', '10:29:53 AM', '1:3', '1', 'UROLOGÍA', 'd', 'luis'),
(3, 1, 0, '23-06-2015', '04:48:08 PM', '0:0', '2', 'CIRUGÍA DE CABEZA Y CUELLO', 'cb', 'bg'),
(4, 1, 0, '23-06-2015', '04:48:08 PM', '0:0', '4', 'NUTRICIÓN', 'fv', 'vfv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_6`
--

CREATE TABLE `denwa_6` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_15` varchar(200) DEFAULT NULL,
  `campo_16` varchar(200) DEFAULT NULL,
  `campo_17` varchar(200) DEFAULT NULL,
  `campo_18` varchar(200) DEFAULT NULL,
  `campo_19` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_6`
--

INSERT INTO `denwa_6` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_15`, `campo_16`, `campo_17`, `campo_18`, `campo_19`) VALUES
(1, 1, 0, '24-06-2015', '12:58:36 PM', '0:34', 'luis', '2015-05-22', '2015-06', 'g@gmail.com', '2015-W26'),
(2, 1, 0, '25-05-2015', '11:23:38 AM', '0:8', 'aa', '2015-05-18', NULL, NULL, NULL),
(3, 1, 0, '25-05-2015', '11:23:47 AM', '0:6', 'bbbb', '2015-05-25', NULL, NULL, NULL),
(4, 1, 0, '27-05-2015', '10:00:26 AM', '0:17', 'luis', '2015-05-27', '2015-04', '2015-W19', NULL),
(5, 1, 0, '27-05-2015', '10:04:08 AM', '1:56', '', '', '', '', NULL),
(6, 1, 0, '28-05-2015', '09:00:39 AM', '0:22', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com'),
(7, 1, 0, '28-05-2015', '09:58:46 AM', '0:1', '', '', '', '', ''),
(8, 1, 0, '28-05-2015', '01:47:52 PM', '0', '', '', '', '', ''),
(9, 1, 0, '28-05-2015', '01:54:18 PM', '0:1', '', '', '', '', ''),
(10, 1, 0, '28-05-2015', '01:54:21 PM', '0', '', '', '', '', ''),
(11, 1, 0, '28-05-2015', '01:54:25 PM', '0:1', '', '', '', '', ''),
(12, 1, 0, '23-06-2015', '05:26:49 PM', '0:50', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com'),
(13, 1, 0, '24-06-2015', '10:32:55 AM', '16:0', 'luis', '2015-06-24', '2015-06', '2015-W26', 'correo@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_7`
--

CREATE TABLE `denwa_7` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_20` varchar(200) DEFAULT NULL,
  `campo_21` varchar(200) DEFAULT NULL,
  `campo_22` varchar(200) DEFAULT NULL,
  `campo_23` varchar(200) DEFAULT NULL,
  `campo_24` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_7`
--

INSERT INTO `denwa_7` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_20`, `campo_21`, `campo_22`, `campo_23`, `campo_24`) VALUES
(1, 1, 0, '22-05-2015', '06:10:47 PM', '0:8', 'luis', '2015-05-22', NULL, NULL, NULL),
(2, 1, 0, '20-10-2016', '04:58:18 PM', '0:4', '', '2015-05-20', '2016-08', 'guitarradeluis@gmail.com', '2016-W33'),
(3, 1, 0, '25-05-2015', '11:23:47 AM', '0:6', 'bbbb', '2015-05-25', NULL, NULL, NULL),
(4, 1, 0, '27-05-2015', '10:00:26 AM', '0:17', 'luis', '2015-05-27', '2015-04', '2015-W19', NULL),
(5, 1, 0, '27-05-2015', '10:04:08 AM', '1:56', '', '', '', '', NULL),
(6, 1, 0, '28-05-2015', '09:00:39 AM', '0:22', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com'),
(7, 1, 0, '28-05-2015', '09:58:46 AM', '0:1', '', '', '', '', ''),
(8, 1, 0, '28-05-2015', '01:47:52 PM', '0', '', '', '', '', ''),
(9, 1, 0, '28-05-2015', '01:54:18 PM', '0:1', '', '', '', '', ''),
(10, 1, 0, '28-05-2015', '01:54:21 PM', '0', '', '', '', '', ''),
(11, 1, 0, '28-05-2015', '01:54:25 PM', '0:1', '', '', '', '', ''),
(12, 1, 0, '23-06-2015', '05:26:49 PM', '0:50', 'luis', '2015-05-28', '2015-05', '2015-W19', 'correo@correo.com'),
(13, 1, 0, '24-06-2015', '10:32:55 AM', '16:0', 'luis', '2015-06-24', '2015-06', '2015-W26', 'correo@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denwa_8`
--

CREATE TABLE `denwa_8` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `saliente_id` bigint(20) DEFAULT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `campo_26` varchar(200) DEFAULT NULL,
  `campo_27` varchar(200) DEFAULT NULL,
  `campo_28` varchar(200) DEFAULT NULL,
  `campo_29` text,
  `campo_30` text,
  `campo_31` varchar(200) DEFAULT NULL,
  `campo_32` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `denwa_8`
--

INSERT INTO `denwa_8` (`id`, `usuarios_id`, `saliente_id`, `fecha`, `hora`, `tiempo`, `campo_26`, `campo_27`, `campo_28`, `campo_29`, `campo_30`, `campo_31`, `campo_32`) VALUES
(1, 1, 0, '25-09-2015', '11:15:54 AM', '0:43', 'Mensajeria', '18', '2015-09-23', 'Urgente', '', '', NULL),
(2, 1, 0, '25-09-2015', '11:16:53 AM', '0:53', 'Mensajeria', '18', '2015-09-23', 'Urgente', 'Creación de modulo seguimiento de mensajeria.', '2015-09-24', NULL),
(3, 1, 0, '25-09-2015', '11:19:19 AM', '2:18', 'Mensajeria', '18', '2015-09-23', 'Urgente', 'Creación de modulo seguimiento de mensajeria.', '', NULL),
(4, 1, 0, '25-09-2015', '11:20:09 AM', '0:26', 'Mensajeria', '18', '2015-09-22', 'Urgente', 'Creación de modulo seguimiento de mensajeria.', '2015-09-24', 'terminado'),
(5, 1, 0, '25-09-2015', '11:21:54 AM', '1:42', 'Mensajeria', '18', '2015-10-01', 'Normal', 'Traer la facturación la mensajerías junto con sus lista de costos de mensajería.', '', 'pendiente'),
(6, 1, 0, '25-09-2015', '11:23:37 AM', '1:39', 'Tecnologia tikec', '20', '2015-09-25', 'Urgente', 'Creación de tikec de tecnologia para el call y la atencionn de los mismos con lo cual se crearan registro historicos y idicadores', '', 'Iniciado'),
(7, 1, 0, '16-10-2015', '05:36:07 PM', '0:28', '1', '2', '2015-12-30', 'Normal', '123', '2015-12-31', 'pendiente'),
(8, 1, 0, '14-07-2016', '05:42:29 PM', '0:58', 'luis', '2', '2016-07-14', 'Normal', 'ssss', '2016-07-21', 'Iniciado'),
(9, 1, 0, '14-07-2016', '05:43:34 PM', '0:58', 'luis', '2', '2016-07-14', 'Normal', 'ssss', '2016-07-21', 'Iniciado'),
(10, 1, 0, '14-07-2016', '05:43:57 PM', '0:15', 'totuuu', '2', '2016-07-14', 'Normal', 'SSSSNOTAS', '2016-07-21', 'pendiente'),
(11, 1, 0, '14-07-2016', '05:45:39 PM', '0:28', 'luis', '2', '2016-07-14', 'Simple', 'notassss', '2016-07-21', 'pendiente'),
(12, 1, 0, '14-07-2016', '06:00:44 PM', '35:32', 'totuii', '12', '2016-07-14', 'Normal', 'sssnotass', '2016-07-21', 'pendiente'),
(13, 1, 0, '14-07-2016', '06:03:11 PM', '0:1', 'totuii', '12', '2016-07-14', 'Normal', 'sssnotass', '2016-07-21', 'pendiente'),
(14, 1, 0, '14-07-2016', '06:06:47 PM', '2:25', 'totuii', '12', '2016-07-14', 'Normal', 'sssnotass', '2016-07-21', 'pendiente'),
(15, 1, 0, '14-07-2016', '06:07:22 PM', '21:36', 'luis', '2', '2016-07-14', 'Simple', 'notassss', '2016-07-21', 'pendiente'),
(16, 1, 0, '14-07-2016', '06:07:34 PM', '2:25', 'totuii', '12', '2016-07-14', 'Normal', 'sssnotass', '2016-07-21', 'pendiente'),
(17, 1, 0, '14-07-2016', '06:08:10 PM', '0:34', 'luis', '2', '2016-07-14', 'Arreglo', 'luisssssssnnnnnnn', '2016-07-27', 'Iniciado'),
(18, 1, 0, '14-07-2016', '06:09:19 PM', '1:8', 'Tecnologia tikec', '3', '2016-07-14', 'Simple', 'eeeeee', '2016-07-28', 'terminado'),
(19, 1, 0, '14-07-2016', '06:11:55 PM', '0:14', 'erp', '123', '2016-07-14', 'Simple', 'ssss', '2016-07-28', 'Iniciado'),
(20, 1, 0, '01-08-2016', '12:11:02 PM', '0:8', 'agendamiento', '123', '2016-08-01', 'Normal', 'notas', '2016-08-03', 'pendiente'),
(21, 1, 0, '01-08-2016', '12:25:31 PM', '6:18', 'agendamiento', '123', '2016-08-01', 'Normal', 'notas', '2016-08-03', 'pendiente'),
(22, 1, 0, '17-08-2016', '11:57:49 AM', '8:53', 'nuevaagen', '123', '2016-08-17', 'Normal', 'notas', '2016-08-18', 'pendiente'),
(23, 1, 0, '17-08-2016', '11:59:25 AM', '8:53', 'nuevaagen', '123', '2016-08-17', 'Normal', 'notas', '2016-08-18', 'pendiente'),
(24, 1, 0, '17-08-2016', '11:59:59 AM', '8:53', 'nuevaagen', '123', '2016-08-17', 'Normal', 'notas', '2016-08-18', 'pendiente'),
(25, 1, 0, '17-08-2016', '12:00:30 PM', '8:53', 'nuevaagen', '123', '2016-08-17', 'Normal', 'notas', '2016-08-18', 'pendiente'),
(26, 1, 0, '17-08-2016', '12:26:09 PM', '2:4', 'asd', '12', '2016-08-17', 'Arreglo', 'sadasd', '2016-08-04', 'Iniciado'),
(27, 1, 0, '17-08-2016', '12:28:21 PM', '2:11', 'alalal', '1', '2016-08-18', 'Arreglo', 'notas luizzzz', '', 'Iniciado'),
(28, 1, 0, '17-08-2016', '01:19:01 PM', '50:38', 'agendamiento', '830', '2016-08-17', 'Normal', 'notasss', '2016-08-18', 'Iniciado'),
(29, 1, 0, '17-08-2016', '01:20:03 PM', '1:1', 'mediodia', '1230', '2016-08-17', 'Simple', 'sss', '2016-08-31', 'pendiente'),
(30, 1, 0, '17-08-2016', '03:56:27 PM', '0:31', 'una de tarde', '1', '2016-08-17', 'Arreglo', 'notas', '2016-08-19', 'Iniciado'),
(31, 1, 0, '17-08-2016', '03:58:00 PM', '1:32', 'a', '1', '2016-08-17', 'Simple', 'asdasdasdasda', '2016-08-16', 'Iniciado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listado_tiempos`
--

CREATE TABLE `listado_tiempos` (
  `id` bigint(20) NOT NULL,
  `orden` int(10) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `valor` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listado_tiempos`
--

INSERT INTO `listado_tiempos` (`id`, `orden`, `nombre`, `valor`) VALUES
(1, 1, '5 minutos', '00:05:00'),
(2, 2, '10 minutos', '00:10:00'),
(3, 3, '15 minutos', '00:15:00'),
(4, 4, '30 minutos', '00:30:00'),
(5, 5, '1 hora', '01:00:00'),
(6, 6, '1 hora 30 minutos', '01:30:00'),
(7, 7, '2 horas', '02:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaopciones`
--

CREATE TABLE `listaopciones` (
  `id` bigint(10) NOT NULL,
  `listas_id` bigint(10) NOT NULL,
  `opcion` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listaopciones`
--

INSERT INTO `listaopciones` (`id`, `listas_id`, `opcion`) VALUES
(1, 1, 'CIRUGÍA DE CABEZA Y CUELLO'),
(2, 1, 'HEMATOLOGÍA ADULTOS'),
(3, 1, 'CIRUGIA VASCULAR PERIFÉRICA'),
(4, 1, 'CIRUGÍA DE SENO Y TEJIDOS BLANDOS'),
(5, 1, 'ENDOCRINOLOGÍA'),
(6, 1, 'ONCOLOGÍA CLÍNICA'),
(7, 1, 'ANESTESIOLOGÍA'),
(8, 1, 'GINECOONCOLOGÍA'),
(9, 1, 'INFECTOLOGÍA'),
(10, 1, 'CLÍNICA DEL DOLOR Y CUIDADOS PALIATIVOS'),
(11, 1, 'CIRUGÍA PLÁSTICA'),
(12, 1, 'ORTEPEDIA ONCOLOGÍA'),
(13, 1, 'HEMATOLOGÍA PEDIÁTRICA'),
(14, 1, 'COLOPROCTOLOGÍA'),
(15, 1, 'DERMATOLOGÍA'),
(16, 1, 'CIRUGÍA GENERAL'),
(17, 1, 'ORTOPEDIA GENERAL'),
(18, 1, 'NUTRICIÓN'),
(19, 1, 'UROLOGÍA'),
(20, 1, 'PSICOLOGÍA'),
(21, 1, 'NEUROCIRUGÍA'),
(22, 1, 'TRANSPLANTE DE MÉDULA ÓSEA'),
(23, 1, 'CIRUGÍA DE TÓRAX'),
(24, 1, 'GASTROENTEROLOGÍA'),
(25, 2, 'Urgente'),
(26, 2, 'Normal'),
(27, 2, 'Arreglo'),
(28, 2, 'Simple'),
(29, 3, 'pendiente'),
(30, 3, 'Iniciado'),
(31, 3, 'terminado'),
(32, 4, 'aa'),
(33, 5, 'doc1'),
(34, 5, 'doc2'),
(35, 5, 'doc3'),
(36, 6, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

CREATE TABLE `listas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL DEFAULT '0',
  `creado` varchar(120) NOT NULL,
  `cambio` varchar(120) DEFAULT NULL,
  `orden_listas` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listas`
--

INSERT INTO `listas` (`id`, `nombre`, `creado`, `cambio`, `orden_listas`) VALUES
(1, 'ESPECIALIDADES', '22-05-2015', NULL, NULL),
(2, 'Prioridad', '25-09-2015', NULL, NULL),
(3, 'cierre', '25-09-2015', '16-10-2015', 1),
(4, 'ssssssasdasd', '16-10-2015', NULL, 1),
(5, 'Doctores', '26-02-2016', '26-02-2016', 2),
(6, 'Mediahora', '22-07-2016', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mail`
--

CREATE TABLE `mail` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `referente` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `cambio` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mail`
--

INSERT INTO `mail` (`id`, `usuarios_id`, `campanas_id`, `referente`, `email`, `cambio`) VALUES
(1, 1, 8, 'luis', 'guitarradeluis@gmail.com', '13-07-2016'),
(2, 1, 8, 'desarrollo', 'desarrollador1@primeholdingservice.com', '13-07-2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_listas`
--

CREATE TABLE `orden_listas` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orden_listas`
--

INSERT INTO `orden_listas` (`id`, `nombre`) VALUES
(1, 'dos'),
(2, 'doctores'),
(3, 'Agendamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametrosemail`
--

CREATE TABLE `parametrosemail` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `atributo` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `parametrosemail`
--

INSERT INTO `parametrosemail` (`id`, `nombre`, `atributo`) VALUES
(1, 'protocol', 'smtp'),
(2, 'smtp_host', 'ssl://smtp.gmail.com'),
(3, 'smtp_port', '465'),
(4, 'smtp_user', 'notificaciones@primeholdingservice.com'),
(5, 'smtp_pass', 'NT5240ph'),
(6, 'mailtype', 'html'),
(7, 'charset', 'utf-8'),
(8, 'copi', 'guitarradeluis@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pibotes`
--

CREATE TABLE `pibotes` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `activo` int(2) NOT NULL DEFAULT '1',
  `creado` varchar(50) NOT NULL,
  `cambio` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pibotes`
--

INSERT INTO `pibotes` (`id`, `nombre`, `activo`, `creado`, `cambio`) VALUES
(1, 'oficina', 1, '06-04-2016', '06-04-2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pibotesitems`
--

CREATE TABLE `pibotesitems` (
  `id` bigint(20) NOT NULL,
  `pibotes_id` bigint(20) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pibotesitems`
--

INSERT INTO `pibotesitems` (`id`, `pibotes_id`, `nombre`) VALUES
(1, 1, 'oficina uno'),
(2, 1, 'oficina dos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `tipo` varchar(129) NOT NULL,
  `email` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `campanas_id`, `nombre`, `titulo`, `tipo`, `email`) VALUES
(1, 1, 'luiz', 'ESPECIALIDADES', 'varchar(200)', 0),
(2, 1, 'tipodocumento', 'TIPO DE DOCUMENTO', 'varchar(200)', 0),
(3, 1, 'numerodocumento', 'NUMERO DOCUMENTO', 'varchar(200)', 0),
(4, 1, 'primerapellido', 'PRIMER APELLIDO', 'varchar(200)', 0),
(5, 1, 'segundoapellido', 'SEGUNDO APELLIDO', 'varchar(200)', 0),
(6, 1, 'primernombre', 'PRIMER NOMBRE', 'varchar(200)', 0),
(7, 1, 'segundonombre', 'SEGUNDO NOMBRE', 'varchar(200)', 0),
(8, 1, 'nacimiento', 'FECHA NACIMIENTO', 'varchar(200)', 0),
(9, 1, 'edad', 'EDAD', 'varchar(200)', 0),
(10, 1, 'sexo', 'SEXO', 'varchar(200)', 0),
(11, 1, 'EPS', 'EPS', 'text', 0),
(12, 1, 'cotizante', 'cotizante', 'varchar(200)', 0),
(13, 1, 'beneficiario', 'beneficiario', 'varchar(200)', 0),
(14, 1, 'categorias', 'CATEGORIAS', 'varchar(200)', 0),
(15, 1, 'DEPARTAMENTO', 'DEPARTAMENTO', 'varchar(200)', 0),
(16, 1, 'CIUDADES', 'CIUDADES', 'varchar(200)', 0),
(17, 1, 'DIRECCION', 'DIRECCION', 'varchar(200)', 0),
(18, 1, 'BARRIO', 'BARRIO', 'text', 0),
(19, 1, 'fijo', 'TEL FIJO_CONTACTO', 'text', 0),
(20, 1, 'celular', 'CELULAR CONTACTO', 'text', 0),
(21, 1, 'EMAIL', 'EMAIL', 'varchar(200)', 0),
(22, 1, 'estudio', 'NIVEL DE ESTUDIOS', 'varchar(200)', 0),
(23, 1, 'RELIGION', 'RELIGION', 'text', 0),
(24, 1, 'OCUPACION', 'OCUPACION', 'varchar(200)', 0),
(25, 1, 'nonapellidofamiliar', 'NOM Y_APELL_FAMILIAR', 'text', 0),
(26, 1, 'PARENTESCO', 'PARENTESCO', 'text', 0),
(27, 1, 'TELfamiliar', 'TEL FIJO_FAMILIAR', 'varchar(200)', 0),
(28, 1, 'CELULARfamiliar', 'CELULAR FAMILIAR', 'text', 0),
(29, 1, 'primeravez', 'PRIMERA VEZ CIOSAD', 'varchar(200)', 0),
(30, 1, 'primeraveespecialidad', 'PRIMERA VEZ CON ESTA ESPECIALIDAD', 'text', 0),
(31, 1, 'QUIMIOTERAPIA', 'QUIMIOTERAPIA', 'varchar(200)', 0),
(32, 1, 'OBSERVACIONES', 'OBSERVACIONES', 'text', 0),
(33, 1, 'tipificacion_llamada', 'tipificacion_llamada', 'varchar(200)', 0),
(34, 1, 'USUARIO', 'USUARIO', 'varchar(200)', 0),
(35, 1, 'fechadellamada', 'FECHA DE LA LLAMADA', 'varchar(200)', 0),
(36, 3, 'nombre', 'nombre', 'varchar(200)', 1),
(37, 3, 'numero', 'numero', 'varchar(200)', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saliente_1`
--

CREATE TABLE `saliente_1` (
  `id` bigint(20) NOT NULL,
  `leido` int(2) DEFAULT '0',
  `ESPECIALIDADES` varchar(200) DEFAULT NULL,
  `tipodocumento` varchar(200) DEFAULT NULL,
  `numerodocumento` varchar(200) DEFAULT NULL,
  `primerapellido` varchar(200) DEFAULT NULL,
  `segundoapellido` varchar(200) DEFAULT NULL,
  `primernombre` varchar(200) DEFAULT NULL,
  `segundonombre` varchar(200) DEFAULT NULL,
  `nacimiento` varchar(200) DEFAULT NULL,
  `edad` varchar(200) DEFAULT NULL,
  `sexo` varchar(200) DEFAULT NULL,
  `EPS` text,
  `cotizante` varchar(200) DEFAULT NULL,
  `beneficiario` varchar(200) DEFAULT NULL,
  `categorias` varchar(200) DEFAULT NULL,
  `DEPARTAMENTO` varchar(200) DEFAULT NULL,
  `CIUDADES` varchar(200) DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `BARRIO` text,
  `fijo` text,
  `celular` text,
  `EMAIL` varchar(200) DEFAULT NULL,
  `estudio` varchar(200) DEFAULT NULL,
  `RELIGION` text,
  `OCUPACION` varchar(200) DEFAULT NULL,
  `nonapellidofamiliar` text,
  `PARENTESCO` text,
  `TELfamiliar` varchar(200) DEFAULT NULL,
  `CELULARfamiliar` text,
  `primeravez` varchar(200) DEFAULT NULL,
  `primeraveespecialidad` text,
  `QUIMIOTERAPIA` varchar(200) DEFAULT NULL,
  `OBSERVACIONES` text,
  `tipificacion_llamada` varchar(200) DEFAULT NULL,
  `USUARIO` varchar(200) DEFAULT NULL,
  `fechadellamada` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `saliente_1`
--

INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(1, 0, 'CIRUG', 'CC', '35494232', 'PINZON', 'ARSINIEGAS', 'MARIA', 'DEL CARMEN', '09/04/1962', '52', 'FEMENINO', 'SALLUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL159-1738', 'VILLA MAGDALA', '3002673501', '3005572470', 'PINZON CARMENSA@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'INDEPENDIENTE', 'VANESA PEREZ PINZON', 'HIJA', '3005572470', '3182384995', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 11:05'),
(2, 0, 'HEMATOLOG', 'CC', '1015448448453', 'MURCIA', 'RODELO', 'JEYN', 'KHATERIN', '04/09/1994', '20', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL137#103C-52', 'BARRIO COSTA AZUL', '6846936', '3122948286', 'JANEKHATE_14@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'ESTUDIANTE', 'ROSALBA RODELO', 'MAMA', '6846936', '3118146710', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 11:24'),
(3, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '41345124', 'CARRE', 'DE RODELO', 'MARIA', 'RAMOS', '18/04/1943', '72', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA 110#40A-24', 'SUBA', '6876499', '3123525706821', 'NO TIENE', 'OTRO', 'CRISTIANA', 'HOGAR', 'ROSALBA RODELO', 'HIJA', '6846936', '3118146718', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 11:34'),
(4, 0, 'CIRUG', 'CC', '20956886', 'RODRIGUEZ', 'CORREA', 'MARIA', 'ELENA', '20/07/1969', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TABIO', 'SECTOR LA ESPERANZA', 'LURDES', '8647202', '3208425757', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'RAFAEL CARDENAS', 'ESPOSO', '8647202', '3193734788', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 11:42'),
(5, 0, 'HEMATOLOG', 'CC', '36550147', 'LOPEZ', 'GRANADOS', 'MANUELA', 'ESTER', '06/11/1963', '51', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 68D # 38 A -23 SUR', 'LA FRAGUA', '7109401', '3202407942', 'MANUELAL@VENTASYMARCAS.COM', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'RAMIRO FLORES', 'ESPOSO', '7109401', '3134401156', 'NO', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 12:00'),
(6, 0, 'ENDOCRINOLOG', 'CC', '20793304', 'BERNAL', 'GARCIA', 'NUVIA', 'CECILIA', '12/01/1956', '59', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'CLL 6 14-63', 'BELLA VISTA', '3143669541', '3143669541', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'TORRES MONTENEGRO HECTOR', 'ESPOSO', '3134068786', '3134068786', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 12:15'),
(7, 0, 'ENDOCRINOLOG', 'CC', '20677960', 'FLORES', 'ESCOBAR', 'ELSA', '', '02/01/1966', '49', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'LA CALERA', 'CARREARA #10-17', 'ESPUELAS', '3123232341', '3123232341', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'FLORES ESCOBAR MARIA', 'HERMANA', '8600099', '3115977817', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 12:25'),
(8, 0, 'ONCOLOG', 'CC', '51833483', 'BORQUEZ', 'ALFONSO', 'ARABELLA', '', '08/03/1966', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL86B#49C-03', 'PATRIA', '7597255', '3103175517', 'LASOARAL@HO', 'T', 'CATOLICA', 'HOGAR', 'NORA NES ALFONSO SERRANO', 'MAMA', '7597255', '7597255', 'SI', 'SI', 'NO', 'UN MES DE ESPERA EL AL CITA SIN RESPUESTA', '', 'Pedro Juli', '15/05/2015 12:44'),
(9, 0, 'ENDOCRINOLOG', 'CC', '31134657', 'PE', 'HERRERA', 'GLORIA', 'MILENA', '15/04/1947', '68', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL31A#16A-41', 'TEUSAQUILLO', '8052350', '3122702840', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'PE', 'HIJA', '8052350', '3125465855', 'SI', 'NO', 'NO', 'EN CASO DE NO ATENDER ENVIAR MENSAJE PASIENTE NO ESCUCHA BIEN', '', 'Pedro Juli', '15/05/2015 12:54'),
(10, 0, 'ANESTESIOLOG', 'CC', '52881977', 'LARA', 'VEGA', 'LEIDY', 'KATERINE', '24/07/1981', '33', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRASVERSAL7#7-13 ESTE', 'TURBAI AYALA', '3410475', '3223872368', 'LEIDYLARA@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'OPERARIA', 'BELTRAN MORENO LUIS ALLEJANDRO', 'ESPOSO', '3410475', '3213687743', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 13:04'),
(11, 0, 'GINECOONCOLOG', 'CC', '41390311', 'CORREDOR', '', 'MARIA', 'CRUZ', '01/05/1953', '62', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA 7ESTE #86B SUR', 'ALFONSO LOPEZ', '3108839835', '3108839835', 'NO TIENE', 'OTRO', 'CRISTIANA', 'HOGAR', 'SANDRA DURAN', 'HIJA', '3108839835', '3108839835', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 13:10'),
(12, 0, 'CIRUG', 'CC', '52037596', 'LADINO', 'GASPAR', 'MARIELA', '', '03/05/1970', '45', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG 68# 43A-28', 'CANDELARIA AL NUEVA', '7178442', '3103042382', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'MATA CECILIA LADINO', 'HERMANA', '7187687', '7187687', 'SI', 'NO', 'NO', 'PACIENTE DE CONTROL DE CIRUGIA', '', 'Pedro Juli', '15/05/2015 13:20'),
(13, 0, 'ONCOLOG', 'CC', '52054645', 'MALABER', '', 'MARIA', 'LUCI', '11/10/1967', '47', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA 24#44-77', 'SANTA LUCIA', '3132308188', '3132308188', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'GUANA MALAVER', 'HERMANA', '5762576', '3202720022', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 13:26'),
(14, 0, 'INFECTOLOG', 'CC', '80234096', 'MARTINEZ', '', 'JAVIER', '', '10/06/1980', '34', 'MASCULINO', 'CAPITAL SASUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 7MA ESTE # 43 -37 SUR', 'LA GLORIA', '3213608576', '3213608576', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'NINGUNA', 'MARTA MARTINEZ', 'MADRE', '3114470014', '3114470014', 'SI', 'SI', 'NO', 'REMITIDO POR EL ORTOPEDISTA', '', 'Laura Liliana Benitez Garc', '15/05/2015 13:39'),
(15, 0, 'CIRUG', 'CC', '41524272', 'TORRES', 'DE CASTA', 'MARGARIAT', '', '18/09/1951', '63', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'SIBAT', 'DIAGONAL 10 # 12-28', 'SAN MARTIN', '7250274', '3133139199', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JOSE CASTA', 'ESPOSOS', '7250274', '3008663531', 'NO', 'NO', 'NO', 'ES UNA CITA DECONTROL CON EL DOCTOR  RAUL SUGVE BUDUEN', '', 'Laura Liliana Benitez Garc', '15/05/2015 13:47'),
(16, 0, 'HEMATOLOG', 'CC', '9517191', 'GIRALANDO', 'GIL', 'HENRRY', 'ALEUDO', '08/05/1953', '61', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA 78B1-05 SUR', 'TECHO', '2934428', '3115173080', 'NO TIENE', 'OTRO', 'CATOLICA', 'CONDUCTOR', 'FRANCIA ELENA ROJAS', 'ESPOSA', '2934428', '3115173080', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 13:46'),
(17, 0, 'CL', 'CC', '1077149173', 'VENAVIDES', 'ABRIL', 'LUIS', 'FERNADO', '15/08/1996', '18', 'MASCULINO', 'CAFAM - SUBCIDIADO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLAPINZ', 'CRA 6TA # 3 -73', '20 DE JULIO', '3208742720', '3208742720', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'ADMINISTRADOR DE TALLER', 'MARIABLE ORJUELA', 'AMIGA', '3143282924', '3143282929', 'SI', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 13:56'),
(18, 0, 'CIRUG', 'CC', '2835685', 'NAVARRO', 'ORTIZ', 'SANTOS', '', '01/11/1944', '70', 'MASCULINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'BOYAC', 'PUERTO BOYAC', 'CRA 2DA # 17 -97', 'CARACOLI', '3124992287', '3124992287', 'ERIKITA-2690@HOTMAIL.COM', 'PRIMARIA', 'CATOLICO', 'HOGAR', 'ERIKA NABARRO', 'HIJA', '3124992287', '31249922887', 'SI', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 14:05'),
(19, 0, 'ONCOLOG', 'CC', '210214217', 'SARMIENTO', 'MARTINEZ', 'MARIELA', '', '13/12/1961', '54', 'FEMENINO', 'CCAFAM - SUBCIDIADO', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'TOCANCIP', 'CRA 8TVA # 9 -21', 'LOS PILOS', '3112202029', '3112202090', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'DIANA SORA', 'ASESORA', '8785158', '3113283673', 'NO', 'NO', 'NO', 'ESUN CONTROL ANUAL DE ONCOLOGIA', '', 'Laura Liliana Benitez Garc', '15/05/2015 14:39'),
(20, 0, 'CIRUG', 'CC', '34040960', 'BECERRA', 'RUIZ', 'ISABEL', '', '19/11/1954', '60', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 69A # 105 F -26', 'SAN BACILIO', '5425694', '3144878716', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'DIANA HENAO', 'HIJA', '3213225963', '3213225963', 'SI', 'SI', 'NO', 'SE REALIZO UNA ECOGRAFIAEN LACLINICA DEL SENO Y DE  AHI FUE REMITIDA A SAN DIEGO.', '', 'Laura Liliana Benitez Garc', '15/05/2015 14:47'),
(21, 0, 'CIRUG', 'CC', '20952696', 'RUGE', 'SOTELO', 'ROSA', 'MARIA', '04/08/1957', '0', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', '0', '0', '6843114', '3132341068', '0', 'UNIVERSITARIO', '0', '0', '0', '0', '0', '0', 'SI', 'NO', 'NO', 'PACIENTE ESPERANDO CITA DESDE EL  13 DE ABRIL PARA INGRESAR A CONTROL Y LE ASIGNEN UN TRATAMIENTO APROPIADO A SU CUADRO CLINICO', '', 'Daniela L', '15/05/2015 14:45'),
(22, 0, 'CIRUG', 'CC', '1026264872', 'LLANO', 'LONDO', 'CAROLINA', '', '27/05/1989', '25', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA1E#67A60-APTO402TORRE15', 'LA FISCALA', '4653785', '3208146174', 'CARO27_17@HOTMAIL.COM', 'TECN', 'CATOLICA', 'EMPLEADA', 'FLORALBA LONDO', 'MADRE', '4653785', '3142631957', 'NO', 'SI', 'NO', 'DESDE ABRIL ESTA LLAMADO', '', 'Sandra Liliana Agudelo', '15/05/2015 15:01'),
(23, 0, 'ORTEPEDIA ONCOLOG', 'TI', '4220109', 'PAEZ', 'ARIAS', 'JOSE', 'ROGELIO', '29/06/1940', '74', 'MASCULINO', 'ECOOPSOS', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'SILVANIA', 'VEREDA VICTORIA ALTA', 'NO', '3168219172', '8298316', 'NO', 'OTRO', 'CATOLICA', 'AGRICULTOR', 'ROSA MARIA PAEZ ARIAS', 'HERMANA', '3153983040', 'NO', 'SI', 'SI', 'NO', 'CITA PRIMERA VEZ', '', 'Carmenza Moreno Mendoza', '15/05/2015 14:33'),
(24, 0, 'HEMATOLOG', 'TI', '98050359484', 'URTADO', 'SANDOVAL', 'ANDRES', 'FELIPE', '03/05/1998', '17', 'MASCULINO', 'SALUDVIDAEPS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CLL9A#2A-64', 'CENTRO', '8864830', '3103125006', 'NO TIENE', 'OTRO', 'CATOLICA', 'ESTUDIANTE', 'SONIA BELTRAN', 'AMIGO', '8864830', '3204205585', 'NO', 'NO', 'NO', 'CITA DOCTOR JORGE CARO', '', 'Pedro Juli', '15/05/2015 14:58'),
(25, 0, 'HEMATOLOG', 'CC', '76968', 'GALINDO', 'BERNAL', 'ADOLFO', 'ARMANDO', '03/03/1929', '86', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 59 # 15-73', 'PUENTE ARANDA', '2606347', '3153400367', 'ORLANDOGALINDOT@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ORLANDO GALINDO', 'HIJO', '3153400367', '3153400367', 'SI', 'SI', 'NO', 'ESTA LLAMNDODESDE FEBRERO PARA SOLICITAR LA CITA Y NO SE LA ASIGANARON - EL PACIENTE MANIFIESTA DOLOR EXTEREMO Y SANGRADO', '', 'Laura Liliana Benitez Garc', '15/05/2015 15:00'),
(26, 0, 'COLOPROCTOLOG', 'CC', '5163284', 'CAMARGO', 'CASA', 'ANA', 'VILMA', '05/11/1960', '54', 'FEMENINO', 'COFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA80MBISA#66B-15SUR', 'BOSA', '7807171', 'NO', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'FRANCISCO RAMIREZ', 'ESPOSO', '2611295', 'NO', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '15/05/2015 15:27'),
(27, 0, 'CL', 'CC', '17346283', 'GUTIERREZ', 'MU', 'DIDIO', 'ALEJANDRO', '23/11/1977', '38', 'MASCULINO', 'CAJACOOP', 'NO', 'SI', 'A', 'META', 'VILLAVICENCIO', 'MANZANA26 CASA14', '13 DE MAYO', 'NO', '3163926991', 'NO TIENE', 'OTRO', 'CATOLICA', 'DESEMPPLEADP', 'MARLY MEDICO', 'ESPOSA', 'NO', 'NO', 'SI', 'SI', 'NO', '', '', 'Carmenza Moreno Mendoza', '15/05/2015 15:39'),
(28, 0, 'CIRUG', 'CC', '20093101', 'VARON', 'SAAVEDRA', 'EVELIA', '', '18/02/1931', '83', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'DIAGONA 866# 77 -46', 'ESPA', '5370486', '3125342357', 'NESABA21@YAHOO.ES', 'BACHILLER', 'CRISTIANA', 'AMA DE CASA', 'NELLY  SANCHEZ', 'HIJA', '5370486', '3125342357', 'NO', 'NO', 'NO', 'ES PARA LLEVAR UNOS RESULTADOS', '', 'Laura Liliana Benitez Garc', '15/05/2015 15:40'),
(29, 0, 'ONCOLOG', 'CC', '25616559', 'LAZO', 'MANCILLA', 'MARIA', 'CENIDES', '30/09/1939', '75', 'FEMENINO', 'CAFAM-SISBEN', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PUERTO BERR', 'CRA6#9-50', 'PUERTOSALGAR', '68573732', '3127248348-3147311811-31134981', 'MARIAT77@HOTMAIL.COM', 'PRIMARIA', 'ADVENTISTA', 'AMA DE CASA', 'MARIA TERESA USURIAGA', 'HIJA', 'NO', '3127248348', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '15/05/2015 15:41'),
(30, 0, 'HEMATOLOG', 'CC', '36379140', 'MEDINA', 'SANABRIA', 'LILIANA', 'NO', '30/08/1969', '45', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 43A SUR 72G-74 CASA 92', 'BOITA', '7598440', '3108670997', 'NESALI09@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ENFERMERA', 'NORBERTO CASTRO ANGEL', 'ESPOSA', '7598440', '3138350642', 'SI', 'SI', 'NO', '', '', 'Carmenza Moreno Mendoza', '15/05/2015 15:44'),
(31, 0, 'CIRUG', 'CC', '39787273', 'GONZALES', 'ADAN', 'MARELVIS', '', '14/05/1967', '48', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA80C#8C-45', 'BALLADOLI', '4121083', '3124537216', 'MAYUGO@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'LEIDY GIOVANA COTRINA', 'HIJA', '3115158888', '3115158888', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '15/05/2015 15:45'),
(32, 0, 'CIRUG', 'CC', '41596496', 'ATHORTUA', '', 'MARTHA', '', '05/08/1950', '64', 'FEMENINO', 'FAMISNAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAGONAL 13BIS SUR # 24 B -23', 'RESTREPO', '3106730393', '3106732393', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'JHON GARCIA', 'HIJO', '3134032696', '3003602597', 'NO', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 15:46'),
(33, 0, 'HEMATOLOG', 'CC', '20912838', 'VELASQUEZ', 'DE GAITAN', 'MARIA ANA', 'SILVIA', '23/05/1927', '88', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRETERA  CENTRAL 2-43 SASAIMA', 'SASAIMA', 'NO', '3202570253', 'CONTABILIDADBIL2012@GMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'ANA ISABEL GAITAN', 'HIJA', '3115388156', '2328867', 'NO', 'NO', 'NO', 'CITA URG. PACIENTE MEDICA', '', 'Carmenza Moreno Mendoza', '15/05/2015 15:50'),
(34, 0, 'HEMATOLOG', 'CC', '35487964', 'PEREZ', 'SANTIAGO', 'ROSA', 'MARIA', '04/07/1959', '55', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL365A#09-28', 'BARCELONA', '3728253', '3118580731', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'ESTELA PEREZ', 'HERMNA', '5684520', '568452', 'NO', 'NO', 'NO', '15 DIAS DE ESPRERA  PASIENTE DEPENDIENTE DE MEDICAMENTO EL TROMBOPAC', '', 'Pedro Juli', '15/05/2015 15:52'),
(35, 0, 'ONCOLOG', 'CC', '51716811', 'VALENCIA', 'PALACIOS', 'JUANA', 'FRANCISCA', '04/10/1983', '51', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIA38#37-19', 'SOACHA', '9008243', '3118580469', 'PA.TICO18@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'PATRICIA BARON', 'HIJA', '9008243', '3208415964', 'NO', 'SI', 'SI', 'CONTROL CON EL DOC ALEJAMDRO BUCHAR', '', 'Sandra Liliana Agudelo', '15/05/2015 15:54'),
(36, 0, 'ONCOLOG', 'CC', '20730142', 'GIL', 'VELANDIA', 'ANA', 'LAURA', '02/10/1970', '44', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CASANARE', 'CHOCONT', 'VEREDA SOATAMA', 'NO', 'NO', '3192369117', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'SE CORTO LLAMADA', 'SE CORTO LLAMADA', 'SE CORTO LLAMADA', 'NO', 'NO', 'NO', 'NO', '', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:00'),
(37, 0, 'CIRUG', 'CC', '52211477', 'HERNANDEZ', 'CASTILLO', 'LUZ', 'MIRIAM', '04/06/1975', '39', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA3B#73-19', 'CASA REY', '4785004', '3214692200', 'NO TIENE', 'UNIVERSITARIO', 'CRISTIANA', 'EMPLEADA', 'JULIO CUEVAS', 'ESPOSO', '0', '3106662455', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '15/05/2015 16:06'),
(38, 0, 'HEMATOLOG', 'CC', '3051682', 'WILCHES', 'CIFUENTES', 'GUILLERMO', '', '23/10/1952', '0', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', '0', '0', '7034914', '3112128666', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'SI', 'NO', 'NO', 'PACIENTE ESPERANDO CITA PRIORITARIA PARA CONTROL POST HOSPITALIZACION POR ANEMIA HEMOL', '', 'Daniela L', '15/05/2015 16:05'),
(39, 0, 'CIRUG', 'CC', '52635243', 'MURILLO', 'BARRETO', 'SARA', 'MARIA', '10/08/1973', '41', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 75C # 5 -67 ESTE SUR', 'SANTA LIBRADA', '2630771', '3219289719', 'MURILLOBARRETO@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'LEIDY MURILLO', 'HIJA', '2630771', '3164025937', 'SI', 'NO', 'NO', 'YA HA SIDO TRATADA POR LA ESPECIALIDA EN OTRAS CLINICAS', '', 'Laura Liliana Benitez Garc', '15/05/2015 15:53'),
(40, 0, 'ONCOLOG', 'CC', '2144807', 'ULLOOA', 'FAJARDO', 'HORACIO', '', '15/04/1934', '81', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE13A#166-50ETA3TORRE1APTO104', 'ARANJUEZ', '3053074', '3174323963', 'GLADISU22@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'AGRIULTOR', 'GLADIS ULLOA', 'HIJA', '3053074', '3174323963', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '15/05/2015 16:13'),
(41, 0, 'ENDOCRINOLOG', 'CC', '21057997', 'CORTES', 'TOCANCHON', 'FAUSTINA', 'NO', '28/05/1961', '54', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UBAL', 'KM 2 VEREDA SOATA', 'NO', 'NO', '3103125093', 'NANCYNCORTES@GMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'NANCY NIETO', 'HIJA', 'NO', '3202280002', 'NO', 'NO', 'NO', 'CITA PARA LEER EXAMEN', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:06'),
(42, 0, 'HEMATOLOG', 'CC', '21184889', 'BRAVO', 'ROMERO', 'ANA', 'LUBINDA', '18/06/1961', '53', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAQUEZA', 'NO', 'BARRIO PALMAR PLACITAS', 'NO', '3124657907', 'NO', 'PRIMARIA', 'NINGUNA', 'HOGAR', 'JOSE GUILLERMO PARDO', 'ESPOSO', 'NO', '3115431643', 'NO', 'NO', 'NO', '', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:13'),
(43, 0, 'GINECOONCOLOG', 'CC', '21056795', 'CASTIBLANCO', 'SANCHEZ', 'MARIA', 'DE JESUS', '25/11/1955', '60', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 17 # 14 - 54', 'CENTRO', '3416391', '3132343448', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'JAVIER LOPEZ', 'HIJO', '3416391', '3132366698', 'NO', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 16:20'),
(44, 0, 'HEMATOLOG', 'CC', '53017160', 'VEGA', 'BEJARANO', 'MONICA', 'ALEJANDRA', '16/04/1985', '0', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'BOYAC', 'GARAGOA', '0', '0', '0', '3143787549', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'NO', 'NO', 'SI', 'PACIENTE ESPERANDO CITA DE CONTROL PRIORITARIA PARA QUE EL M', '', 'Daniela L', '15/05/2015 16:26'),
(45, 0, 'CIRUG', 'CC', '41791077', 'MURILLO', 'BELANDI', 'MARIA', 'ELSA', '26/06/1958', '56', 'FEMENINO', 'FAMIZANTE', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA12G#19-67', 'SOACHA', '9001848', '3112759597', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'OSCAR  VELANDIA', 'HIJO', '9001848', '3108760522', 'NO', 'SI', 'NO', 'CONTROL PABLO JIMENES', '', 'Sandra Liliana Agudelo', '15/05/2015 16:24'),
(46, 0, 'ANESTESIOLOG', 'CC', '6682199', 'OLIVERO', 'ARIAS', 'ALCIDES', 'NO', '25/12/1937', '78', 'MASCULINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'META', 'GRANADA', 'MANZANA 8  CASA NUMERO 3', 'LA  SABANA', 'NO', '3209470532', 'NO', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'LINA  ALEJANDRA VERNAZA', 'NUERA', '3175577427', 'NO', 'NO', 'NO', 'NO', 'URG.  PACIENTE FUERA DE  BOGOTA  REQUIERE ATENCION INMEDIATA', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:32'),
(47, 0, 'CL', 'CC', '40380133', 'DELGADO', 'SABOGAL', 'ANA', 'CLEOTILDE', '10/03/1977', '48', 'FEMENINO', 'CAJACOPI', 'NO', 'SI', 'A', 'META', 'VILLAVICENCIO', 'CALLE 35 12-139', 'DESMOTADORA', 'NO', '3108728591', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'HECTOR  DELGADO', 'HIJO', 'NO', '3108728591', 'NO', 'NO', 'NO', 'CONTROL DRA ANGELA MARIA ALVAREZ', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:38'),
(48, 0, 'DERMATOLOG', 'CC', '293096', 'SATOQUE', 'MARTINEZ', 'ESTEBAN', '', '20/01/1922', '93', 'MASCULINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'LA CALERA', 'BEREDA LA OLLA', 'NO', '8757434', '3132853315', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'TRINIDAD SASTOQUE', 'HIJA', '8757434', '3132853315', 'NO', 'NO', 'NO', 'TIEMPO DE ESPERA DE UN MES SIN RESPUESTA', '', 'Pedro Juli', '15/05/2015 16:37'),
(49, 0, 'CIRUG', 'CC', '52811784', 'MEDINA', 'JIMENEZ', 'YAMILE', '0', '04/07/1982', '32', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 95A#34-39 SUR', 'KENNEDY', '3560888', '3132687449', 'YAMILITASER@HOTMAIL.ES', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'FREDDY GUITRAGO', 'ESPOSO', '0', '3105631058', 'NO', 'NO', 'NO', '', '', 'Daniela L', '15/05/2015 16:47'),
(50, 0, 'HEMATOLOG', 'RC', '049631256', 'CASTELLANOS', 'GARAVITO', 'ANDRES', 'FELIPE', '21/08/2010', '4', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARRERA 80 #26-24 SUR', 'FRANCISCO JOSE DE CALDAS', '2658726', '3138982689', 'DIANITAGARAVITO@YAHOO.COM.AR', 'OTRO', 'CATOLICO', 'ESTUDIANTE', 'DIANA MILENE GARAVITO TORRES', 'MAMA', '2658726', '3138982689', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 16:46'),
(51, 0, 'HEMATOLOG', 'CC', '1016089992', 'MEZA', '', 'MRYURI', 'LISTH', '17/09/1996', '18', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE8#9271', 'PITAL', '4491635', '3133541428', 'NYRI:@HOTMAILCOM', 'BACHILLER', 'CRISTIANA', 'ESDTUDIANTE', 'NURY PARADA', 'MAMA', '4491635', '3133541428', 'SI', 'SI', 'NO', 'HACE DOS MESE LLAMO POR CITA NO HA TENIDO RESPUESTA', '', 'Sandra Liliana Agudelo', '15/05/2015 16:44'),
(52, 0, 'CIRUG', 'CC', '28796646', 'BARON', 'JAIME', 'SENAIDA', '', '30/01/1961', '54', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL15-119A60', 'FONTIBON', '5794753', '3213614749', 'NO TIENE', 'OTRO', 'CATOLICA', 'OPERARIA', 'JAIRO QUIROGA', 'ESPOSO', '5794753', '3106770841', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '15/05/2015 16:56'),
(53, 0, 'CIRUG', 'CC', '28014411', 'GOZALEZ', 'RODRIGUEZ', 'MARIA', 'DEL CARMEN', '06/09/1952', '61', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'KRA3A#39D05SUR', 'GUACAMAYAS', '3674694', '3105854228', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JOSE FRANCISCO GOMEZ', 'ESPOSO', '3674694', '3105854228', 'SI', 'SI', 'NO', '', '', 'ADMINISTRADOR', '15/05/2015 16:59'),
(54, 0, 'CIRUG', 'CC', '20368972', 'MENDEZ', 'PATI', 'MARIELA', 'NO', '19/03/1965', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  61A  100A-73', 'BOSA EL RECREO', '7236858', '3219516571', 'MARIELIN_19@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'VENTAS', 'YURY JOHANNA RODRIGUEZ MENDEZ', 'HIJA', 'NO', '3124840162', 'SI', 'SI', 'NO', 'PACIENTE LLAMO DESDE MARZO  Y  NO  APARECE POR  FAVOR DAR PRIORIDAD LLEVA ESPERANDO MUCHO  TIEMPO', '', 'Carmenza Moreno Mendoza', '15/05/2015 16:59'),
(55, 0, 'HEMATOLOG', 'CC', '52048818', 'NAJI', 'TORRES', 'SONIA', 'PATRICIA', '12/06/1972', '42', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 111A  # 152C  -15', 'SUBA', '6929085', '3143497384', 'SONIAPATRICIANAJI@YAHOO.COM', 'BACHILLER', 'CRISTIANA', 'DESEMPLEADA', 'NICOLAS RUIZ', 'HIJO', '6800190', '3013296603', 'SI', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '15/05/2015 17:27'),
(56, 0, 'CIRUG', 'CC', '52663843', 'RAMOS', 'LADINO', 'YURY', 'CAROLINA', '12/11/1983', '31', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'CH', 'CALLE 19  14-54 INT 9', 'NO', '8638161', '3118095662', 'CAROLINERAMOS2001@YAHOO.ES', 'OTRO', 'CATOLICA', 'SICOLOGA', 'MARIA GILMA LADINO', 'MAMA', 'NO', '3174189941', 'NO', 'NO', 'NO', 'CONTROL POSTQUIRURGICO DR  IVAN  MARTIN', '', 'Carmenza Moreno Mendoza', '15/05/2015 17:33'),
(57, 0, 'HEMATOLOG', 'CC', '52207012', 'TIJO', 'CESPEDES', 'JULIA', 'ISABEL', '11/12/1974', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA  12I  31-34 SUR', 'RESURECCION', '7698433', '3219449676', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'BLANCA TIJO CESPEDES', 'HERMANA', '5674756', '3158463944', 'SI', 'SI', 'NO', '', '', 'Carmenza Moreno Mendoza', '15/05/2015 17:51'),
(58, 0, 'CIRUG', 'CC', '20320934', 'TORRES', 'MENESES', 'CARMEN', '0', '27/05/1943', '75', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 66A#57C-37 SUR', 'VILLA DEL RIO', '4647671', '3112116955', 'NUBYPUENTES@LIBERO.IT', 'NINGUNO', 'CATOLICO', 'INDEPENDIENTE', 'NUBIA PUENTES', 'HIJA', '0', '3112116955', 'SI', 'NO', 'NO', 'PACIENTE DESEA PROGRAMAR CITA PARA EL MES DE JUNIO QUE YA TENGA LOS RESULTADOS LISTOS.', '', 'Daniela L', '15/05/2015 18:37'),
(59, 0, 'HEMATOLOG', 'CC', '51822133', 'VARGAS', 'MURILLO', 'MARIA', 'YOLANDA', '27/09/1965', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALL9 93D#14H-30', 'MONTEBLANCO', '5693398', '3125367585', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'INDEPENDIENTE', 'FABIAN FLORES', 'HIJO', '0', '3208925437', 'NO', 'NO', 'NO', 'PACIENTE DESEA PROGRAMAR CITA PARA JUNIO PARA QUE EL MEDICO TRATANTE LE ASIGNE NUEVO TRATAMIENTO', '', 'Daniela L', '19/05/2015 07:04'),
(60, 0, 'HEMATOLOG', 'CC', '79537420', 'ROMERO', 'CORTES', 'JHON', 'ALEXANDER', '16/01/1971', '44', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 17 SUR # 24H - 27', 'RESTREPO', '5613724', '3153877472', 'JARC71@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'TRANASPORTADOR', 'LUCILA CORTEZ', 'MADRE', '5613724', '3106791090 -', 'NO', 'NO', 'NO', 'CON LADOCTORA SIRVIA MARGARITA ROJAS', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:10'),
(61, 0, 'ENDOCRINOLOG', 'CC', '52274247', 'BERNAL', 'ROBELES', 'YENITH', 'CONSTANZA', '14/11/1976', '38', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 32 # 69J - 85 SUR', 'ARBOLIZADORA ALTA', '4558179', '3144150151', 'YENITHBERNAL_32@HOTMAIL.COM', 'T', 'CATOLICA', 'EMEPLEADA', 'MARAI ROBLES', 'MADREA', '4558179', '3105830725', 'SI', 'SI', 'NO', 'YA LE TOMATON UNA ECOGRAFIA DE TIROIDES', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:21'),
(62, 0, 'CIRUG', 'CC', '52274427', 'BERNAL', 'ROBLES', 'YENITH', 'CONSTANZA', '########################################################################################################################################################################################################', '38', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 32 # 69J - 85 SUR', 'ARBORIZADORA ALTA', '4558179', '3144150151', 'YENNITHBERNAL@HOTMAIL.COM', 'T', 'CATOLICA', 'EMPLEADA', 'MARIA ROBLES', 'MADREA', '4558179', '3105830725', 'SI', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:30'),
(63, 0, 'CIRUG', 'CC', '53071809', 'CAICEDO', 'MARROQUI', 'ANGELA', 'MARCELA', '10/03/1984', '31', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 37BIS #68B-60 SUR', 'ALQUERIA', '7839598', '3107846911', 'ANGELA.CAICEDOM@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'ELSA MARROQUI', 'MAMA', '7839598', '3204436191', 'SI', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 07:43'),
(64, 0, 'INFECTOLOG', 'CC', '4898500', 'GUZMAN', 'GARCIA', 'EMILIO', '0', '04/03/1954', '61', 'MASCULINO', 'CAPRICOM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE 2C#13C BIS- 33', 'PABLO SEXTO', '0', '3208291566', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'JENNY LINARES', 'NUERA', '0', '3212346082', 'NO', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE ABRIL', '', 'Daniela L', '19/05/2015 07:54'),
(65, 0, 'HEMATOLOG', 'CC', '51856802', 'AVILA', 'AREVALO', 'PATRICIA', '0', '24/12/1965', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CARA 28A # 1B - 35', 'SANTA ISABEL', '3923434', '3134141875', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'NINGUNA', 'GILBERTO CUELLAR', 'ESPOSO', '3923434', '3163017188', 'NO', 'NO', 'NO', 'LA  DOCTORA ES SILVIA MARGARITA PORRAS,  ES UN CONTROL', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:36'),
(66, 0, 'CIRUG', 'CC', '5582065', 'ORELLANO', 'CENTENO', 'SANTANDER', '0', '14/09/1948', '70', 'MASCULINO', 'ENCOSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 137B # 153A - 61', 'SANTA RITA', '5382468', '3153254148', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'PENSIONADAO', 'MARIAN PERILLA', 'ESPOSA', '5382468', '3045555036', 'NO', 'SI', 'NO', 'ESTAESUNACITA DE CONTROL,ESPARA CIRUGIA DE CERRAMIENTO, TENIA UN TUMOR MALIGNO EN ELRECTO.', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:41'),
(67, 0, 'CIRUG', 'CC', '39705159', 'REYES', 'GOMEZ', 'AMANDA', '0', '25/02/1975', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 24 # 97 -43', 'COFRADIA', '2986679', '3213386099', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'ESTETICISTA', 'LIGIA DE REYES', 'MADRE', '2986679', '3115217406', 'SI', 'SI', 'NO', 'ESLA PRMIERA VEZ, EN 10 DIAS LE ENTREGAN LA BIOPSIA, FAVOR LA CITA PARA FINALES DE MAYO', '', 'Laura Liliana Benitez Garc', '19/05/2015 07:54'),
(68, 0, 'DERMATOLOG', 'CC', '21106750', 'MAECHA', 'DE RAMIREZ', 'LILIAN', '0', '04/06/1936', '78', 'FEMENINO', 'COLSUBSIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'VILLETA', 'VEREDA BALSAL', 'VEREDA BALSAL', '8444162', '3112413116', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'PENSIONADO', 'MARIA YAZMIN RAMIREZ', 'HIJA', '8444162', '3112413116', 'NO', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 08:02'),
(69, 0, 'HEMATOLOG', 'CC', '1019019709', 'HERRERA', 'HERRADA', 'CLAUDIA', 'ROCIO', '06/11/1987', '27', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 110BIS 64D-72', 'VILLAS DEL  DORADO', '6639665', '3142436272', 'CLAUDIAHE_1987@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'AUXILIAR CONTABLE', 'DANIEL  FORERO', 'ESPOSO', 'NO', '3133727643', 'SI', 'SI', 'NO', 'PACIENTE  LLAMANDO  DESDE LA  SEMANA  PASADA  POR  FVR PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 08:06'),
(70, 0, 'ORTOPEDIA GENERAL', 'CC', '2842137', 'TORREZ', 'PE', 'ALIRIO', '', '12/06/1942', '72', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CALL25A#3D-10', 'LA MACARANA', 'O', '3208432010', 'CYL09', 'PRIMARIA', 'CATOLICA', 'DESEMPLEADO', 'MIRIAM BELTRAN', 'NUERA', 'NO', '3102233744', 'NO', 'SI', 'NO', 'CONTROL JULIO JOSE ALBISTO', '', 'Sandra Liliana Agudelo', '19/05/2015 08:22'),
(71, 0, 'ORTOPEDIA GENERAL', 'CC', '20791745', 'MURILLO', 'ALVARADO', 'VIRGINIA', '0', '20/04/1953', '63', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CALLE13#10A-23', 'CENTRO', '8264590', '3134327716', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'HUGO HERNANADO GOMEZ', 'YERNO', 'NO', '3134327716', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 08:37'),
(72, 0, 'ONCOLOG', 'CC', '20800039', 'CONTRERAS', 'ROMERO', 'ALBA', 'NO', '04/05/1957', '64', 'FEMENINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 58G 47-47', 'LA  CORU', '4685915', '3115004335', 'LILITO_55@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'MARIA DEL CARMEN  CONTRERAS ROMERO', 'HERMANA', 'NO', '3115004335', 'SI', 'SI', 'SI', 'URGENTE PACIENTE DISCAPACITADO CON SITA PREORITARIA CONTROL DOCTOR BAYONA', '', 'Pedro Juli', '22/05/2015 12:03'),
(73, 0, 'CIRUG', 'CC', '80384559', 'CASTILLO', 'IBAGUE', 'CARLOS', 'FERNANDO', '24/07/1966', '49', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AVDA  ROJAS CRA 70  67B-29', 'BOSQUE POPULAR', '4809276', '3103418879', 'NO', 'OTRO', 'CATOLICA', 'CONDUCTOR', 'MARIA  EUGENIA IBAGUE  DE  CASTILLO', 'MAMA', '4100529', '3142377168', 'SI', 'SI', 'NO', 'MAS DE UN MES Y MEDIO DE ESPARA SIN RESPUESTA', '', 'Pedro Juli', '22/05/2015 12:47'),
(74, 0, 'CIRUG', 'CC', '1030568625', 'PIMENTEL', 'VASQUEZ', 'STEFANNY', 'JULIETH', '05/01/1990', '25', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 7  39-54', 'SAN ISIDRO', 'NO', '3202066941', 'NO', 'OTRO', 'NINGUNA', 'HOGAR', 'NORMA CONSTANZA  PIMENTEL', 'MAMA', 'NO', '3208532624', 'SI', 'NO', 'NO', 'PACIENTE  ESTA  LLAMANDO  HACE  UN  MES Y  REQUIERE  PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 08:39'),
(75, 0, 'HEMATOLOG', 'CC', '1015399365', 'SAMBRANO', 'LOZANO', 'CESAR', 'ANDRES', '30/04/1987', '28', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA48#150-61', 'VICTORIA', '0', '3012269776', 'NO TIENE', 'ESPECIALIZACI', 'CATOLICA', 'INGENIERO INDUSTRIAL', 'BOSSA QUI', 'ESPOSA', 'NO', '3014231066', 'NO', 'SI', 'NO', 'CONTROL SILVIA MARGARITA ROJAS', '', 'Sandra Liliana Agudelo', '19/05/2015 08:44'),
(76, 0, 'COLOPROCTOLOG', 'CC', '20938753', 'GARCIA', 'GOMEZ', 'BELLA', 'ELSA', '07/10/1949', '66', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GRANADA', 'VEREDA LA  22', 'GRANADA', '3143576192', '3143551026', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'RICARDO ORJUELA  AVILA', 'AMIGO', '3143551026', 'NO', 'NO', 'NO', 'NO', 'PACIENTE  ESPERA  LLAMADA  DESDE  HACE  DOS  SEMANAS  URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 08:48'),
(77, 0, 'HEMATOLOG', 'CC', '51628196', 'AGUDELO', 'ROJAS', 'ROSA', 'YOLANDA', '19/11/1961', '53', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 155A #7F-46', 'BARRANCA', '4718180', '3123662125', 'YOLIAGU19@HOTMAIL.COM', 'T', 'CATOLICO', 'INDEPENDIENTE', 'DIANA MAYA', 'HIJA', '0', '3013533557', 'SI', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE PRINCIPIOS DE MAYO, DESEA VERSE CON URGENCIA CON EL MEDICO DEBIDO A DETERIORO PROGRESIVO DE SU SALUD', '', 'Daniela L', '19/05/2015 08:33'),
(78, 0, 'DERMATOLOG', 'CC', '41511232', 'GONZALEZ', '', 'MARIA', 'MAGNOLIA', '20/11/1950', '64', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 78BSUR#18B-15', 'LUCERO ALTO', '7656642', '3125326268', 'NOTIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADA', 'LUZ NELLY GONZALEZ', 'HERMANA', '7656642-7913992', '3212870408', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 08:57'),
(79, 0, 'CIRUG', 'CC', '17185823', 'BORDA', 'PARRA', 'ENRIQUE', 'NO', '30/12/1947', '67', 'MASCULINO', 'SALUDTOTAL', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 45  4F-85', 'SAN  RAFAEL', '3058304', '3153422450', 'NO', 'BACHILLER', 'CATOLICA', 'PENSIONADO', 'GLADYS  JIMENEZ', 'ESPOSA', '3058304', 'NO', 'NO', 'NO', 'NO', 'PACIENTE URG.  ES POSTOPERATORIO URG. REQUIERE CITA DESDE  LA  SEMANA  PASADA  ESTA  LLAMANDO', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:04'),
(80, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '21129628', 'BERANAL', 'DE SALINA', 'ROSALBA', '0', '13/04/1934', '72', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 51 #4A-18', 'SAN RAFAEL', '4069206', '3204869466', 'NO TIENE', 'OTRO', 'CATOLICO', 'AMA DE CASA', 'ESPERANZA SALINA', 'HIJA', '6481293', '3204869466', 'SI', 'SI', 'NO', 'PACIENTE SOLICITA LA CITA DESPU', '', 'Daniela L', '19/05/2015 09:05'),
(81, 0, 'CIRUG', 'CC', '66870430', 'MEJIA', 'ARISTIZABAL', 'NELI', '', '02/08/1972', '42', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'TENJO', 'CRA3 #08-80', 'VILLA SOFIA', '3106251541', '312377626', 'MAURIFOR2014@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'ADMINISTRADORA', 'MAURICIO FOREO', 'ESPOSO', '3123707626', '3123707626', 'SI', 'SI', 'NO', '8 DIAS DE ESPERA SIN RESPUESTA', '', 'Pedro Juli', '19/05/2015 09:09'),
(82, 0, 'ONCOLOG', 'CC', '51825804', 'GIRALDO', 'RESTREPO', 'ROSA', 'ESPERANZA', '20/02/1966', '49', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA5A#2-23', 'LAS CRUCES', '2331163', '3202663830', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'FABIO GIRALDOQ', 'HIJO', 'NO', '3212117441', 'NO', 'SI', 'SI', '', '', 'Sandra Liliana Agudelo', '19/05/2015 09:12'),
(83, 0, 'HEMATOLOG', 'CC', '51575917', 'ESPINOZA', 'COLORADO', 'GLORIA', '0', '14/08/1960', '54', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANV 7 #32B-59 SUR', 'HORACIO ORJUELA', '3642478', '3115038826', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'CARLOS MORENO', 'ESPOSO', '3642478', '3142490464', 'NO', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 09:14'),
(84, 0, 'COLOPROCTOLOG', 'CC', '35333993', 'BASURTO', 'CALDERON', 'AMANDA', 'NO', '25/04/1952', '59', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANSV  18C  47A-13 SUR', 'SANTA LUCIA', '5651297', '3114928943', 'DVABAUNZA9@MISENA.EDU.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'VIVIANAABAUNZA', 'HIJA', '5651297', '3114928943', 'SI', 'SI', 'NO', 'URG.  LLEVA LLAMANDO VARIAS  VECES  Y  NECESITA URG.  LAS  CITA', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:12'),
(85, 0, 'CIRUG', 'CC', '41529837', 'SALAZAR', 'FERNADEZ', 'FLOR', 'ELISA', '09/07/1950', '64', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL 167#17-20', 'SANTA MONICA', '7037611', '3133145469', 'NO TIENE', 'OTRO', 'CATOLICA', 'SEVICIOS GENERALES', 'ELENI COTARIDI FENANDEZ', 'HIJA', '7037611', '3133145469', 'SI', 'SI', 'NO', '15 DIAS DE ESPERA SIN RESPUESTA', '', 'Pedro Juli', '19/05/2015 09:17'),
(86, 0, 'ONCOLOG', 'CC', '35333993', 'BASURTO', 'CALDERON', 'AMANDA', 'NO', '25/04/1952', '59', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANSV. 18C 47A-41', 'SANTA LUCIA', '5651297', '3114928943', 'DVABAUNZA9@MISENA', 'OTRO', 'CATOLICA', 'HOGAR', 'VIVIANA ABAUNZA', 'HIJA', '5651297', '3114928943', 'NO', 'NO', 'NO', 'URG', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:19'),
(87, 0, 'ONCOLOG', 'CC', '1056769830', 'VILLALOBOS', 'HERRERA', 'VALERIA', 'NO', '02/11/1986', '28', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 88A 8A-81', 'NUEVA CASTILLA', '2462070', '3146440818', 'PALESITA.1102@HOTMAIL.COM', 'TECN', 'CATOLICA', 'ASISTENTE  ADMINISTRATIVA', 'RICARDO  MELO', 'ESPOSO', '4110573', '3133473570', 'SI', 'SI', 'NO', 'CITA', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:24'),
(88, 0, 'CIRUG', 'CC', '39709838', 'HERNANDEZ', 'GUTIERRES', 'LORNA', '', '05/09/1960', '54', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA111C#87-08', 'COLSUBSIDIO', '809028', '3102775940', 'HERNANDEZLORNA_GUTIERREZ@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'BLANCA HERNANDEZ G', 'HERMANA', '2726415', 'NO', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 09:17'),
(89, 0, 'ORTOPEDIA GENERAL', 'CC', '28525857', 'QUIMBALLO', 'CALDERON', 'BLANCA', 'MARINA', '12/07/1940', '74', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA59C BIS #132-20', 'CIUDAD JARDIN NORTE', '3172503457', '3172503457', 'NO TIENE', 'T', 'EVANGELICA', 'HOGAR', 'RIVERO EDGAR IVAN', 'ESPOSO', '3144455981', '3144455981', 'NO', 'NO', 'NO', 'CITA POR CONTROL CON EL MEDICO JUIO JOSE ALVIS', '', 'Pedro Juli', '19/05/2015 09:24'),
(90, 0, 'HEMATOLOG', 'CC', '80803600', 'GASPAR', 'CASTILLO', 'YAIRO', '', '05/10/1985', '29', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 92B#42G32 SUR', 'DINDALITO', '2652747', '3204597043', 'ZOEY_1202@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'MESERO', 'CINDY PEREZ', 'ESPOSA', '2652747', '3204597043', 'NO', 'NO', 'NO', '15 DIAS SIN RESPUESTA URGENTE', '', 'Pedro Juli', '19/05/2015 09:37'),
(91, 0, 'HEMATOLOG', 'CC', '51755659', 'SAMUDIO', 'SALGADO', 'ROSALBA', '', '20/07/1956', '58', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CRA9C#15-130', 'SANTA ANA', '7812465', 'NO', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'SAMUDIO SALGADO', 'HERMANA', '7812465', 'NO TIENE', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 09:31'),
(92, 0, 'HEMATOLOG', 'CC', '28262430', 'NEIRA', 'BLANCO', 'MARIA', 'DEL  CARMEN', '29/07/1971', '43', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AVDA CALLE  3  25A-35', 'SANTA ISABEL', '4604764', '3115099593', 'CNEIRABLANCO@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'SICOLOGA SOCIAL', 'XIMENA GONZALEZ', 'CU', '3061295', '3006830132', 'SI', 'SI', 'NO', 'CITA  URG. NECESITA TRATAMIENTO DE  YODOTERAPIA LLEVA LLAMANDO DESDE  LA  SEMANA PASADA', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:29'),
(93, 0, 'CIRUG', 'CC', '41331470', 'RUIZ', 'CANTOR', 'MARIA', 'ESTELA', '18/05/1945', '70', 'FEMENINO', 'CAFESALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL41 SUR#12G-35', 'CLARET', '3613158', '3208505783', 'ANDY-ESTEB1410@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'LUIS TORRES', 'HIJO', '3613158', '3208505783', 'SI', 'SI', 'NO', 'EN CASO DE NO ENCONTRAR AL PACIENTE LLAMAR AL NUMERO 3008961343 WILSON LOSANO', '', 'Pedro Juli', '19/05/2015 09:37'),
(94, 0, 'HEMATOLOG', 'CC', '80343963', 'GARZON', 'CRUZ', 'PEDRO', 'MARIA', '02/06/1974', '39', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE16ESTE#2-16SUR', 'SAN ANTONIO', 'NO', '3118259720', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'COMERCIANTE', 'LUZ ESTELLA DE GARZON', 'ESPOSA', 'NO', '3118259720', 'SI', 'SI', 'NO', 'CONTROL SILVIA PRATO', '', 'S', '19/05/2015 09:40'),
(95, 0, 'HEMATOLOG', 'CC', '1126824059', 'SOPO', 'DANIELS', 'LUIS', 'ARMANDO', '25/04/1985', '30', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'MOSQUERA', 'CALLE 10 #4E-23 MANZANA 7', 'EL TREBOL', '8291613', '3213810172', 'LUCHOS325@HOTMAIL.COM', 'T', 'CATOLICO', 'EMPLEADO', 'LUIS CASTELLANOS', 'P', '0', '3213938418', 'SI', 'SI', 'NO', 'PACIENTE SE HA COMUNICADO EN 2  OPORTUNIDADES DONDE OTORG', '', 'Daniela L', '19/05/2015 09:31'),
(96, 0, 'HEMATOLOG', 'CC', '52501979', 'PARRA', '0', 'CLAUDIA', 'PATRICIA', '20/07/1976', '38', 'FEMENINO', 'COMFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 69 SUR #87C-16', 'BOSA', '0', '3132429583', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'JORGE BORGES', 'ESPOSO', '0', '3202847421', 'NO', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 09:41'),
(97, 0, 'HEMATOLOG', 'CC', '20576188', 'PEREZ', 'DE GALINDO', 'MARIA', 'DEL  CARMEN', '16/07/1950', '64', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'TRANSV.  1  BIS  ESTE 17-30', 'AIRES DEL QUININI', 'NO', '3114784466', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LILIA  PEREZ MONTOYA', 'PRIMA', 'NO', '3113233940', 'NO', 'NO', 'NO', 'CONTROL', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:46'),
(98, 0, 'ANESTESIOLOG', 'CC', '10766558', 'ARIAS', 'GARZON', 'YENNY', 'ROSIO', '05/05/1992', '22', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'UBAL', '0', 'TAUSABITA ALTO', '3112425114', '3112425114', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'FLORES', 'ROSELENA GARZON JULIO', 'TIA', '7855362', '3115601808', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 09:46'),
(99, 0, 'ONCOLOG', 'CC', '41468671', 'ENCISO', 'NO', 'SALOME', 'NO', '30/09/1950', '64', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  52A  4B-29  ESTE', 'SANTA RITA SUR  ORIENTAL', '3657807', '3107605556', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'DAYSI FAJARDO', 'HIJA', '3657807', '3107605556', 'NO', 'NO', 'NO', 'CONTROL  URG.  SE  HA  HECHO  EXAMENES DOS  VECES Y LOS  HA PERDIDO', '', 'Carmenza Moreno Mendoza', '19/05/2015 09:51'),
(100, 0, 'CIRUG', 'CC', '1069852115', 'URREGO', 'MENDEZ', 'AMPARO', 'MILENA', '14/09/1986', '28', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'JUN', 'CALLE15A#81-23', 'ANDALUCIA', '4246624', '3108601097', 'RAURREGO@YAHOO.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'RODRIGO ACOSTA', 'AMIGOS', '3386660EXT1529', '3112031889', 'NO', 'SI', 'NO', 'CONTROL PABLO JIMENES', '', 'Sandraliliana Agudelo', '19/05/2015 09:48'),
(101, 0, 'NUTRICI', 'CC', '29807449', 'GONZALEZ', 'DE  ROSAS', 'MARIA', 'CENEIRA', '04/02/1953', '62', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PUERTO SALGAR', 'CALLE  5  15-52', '3  ESQUINAS', 'NO', '3137612987', 'NO', 'NINGUNO', 'NO', 'HOGAR', 'ROCIO ROSAS GONZALEZ', 'HIJA', 'NO', '3137612987', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:02'),
(102, 0, 'UROLOG', 'CC', '2882041', 'BOTERO', 'QUIROGA', 'MANUEL', 'ARTURO', '01/06/1935', '79', 'MASCULINO', 'CAFESALUD', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CLL59A#17-49', 'GALERIAS', '4755724', '3124143486', 'HALCON_24@HOTAMIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'RANDOL BOTERO REYF', 'HIJO', '4755724', '3124143486', 'NO', 'NO', 'SI', 'CITA CON EL DOCTOR GERMAN FABIAN GODOI PEREZ  UROLOGIA E UNCOLOGIA', '', 'Pedro Juli', '19/05/2015 09:56'),
(103, 0, 'HEMATOLOG', 'CC', '1071628113', 'MOLANO', 'TORRES', 'YADIRA', 'ESPERANZA', '02/06/1985', '29', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  64 F 85J-26', 'LA  ISABELLA', 'NO', '3132686636', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'JULIE  AMANDA MOLANO  TORRES', 'HERMANA', '6448260', '3143508250', 'NO', 'NO', 'NO', 'HACE  20 DIAS  ESTA LLAMANDO Y  SE  LE  VAN  A VENCER LOS  EXAMENES', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:07'),
(104, 0, 'HEMATOLOG', 'CC', '1019014400', 'ESPINEL', 'JAIMES', 'DIANA', 'PATRICIA', '18/04/1987', '21', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE129#91-22', 'SUBA', '6859057', '3144564852', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'ASESORA COMERCIAL', 'OSCAR CAMACHO', 'ESPOSO', 'O', '3106890414', 'NO', 'SI', 'NO', 'CONTROL DOCTOR DANIEL BERMUDEZ', '', 'Sandra Liliana Agudelo', '19/05/2015 10:02'),
(105, 0, 'CIRUG', 'CC', '19245036', 'RIOS', 'CASTRO', 'ISMAEL', 'ANTONIO', '31/05/1952', '62', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AV28#20-73', 'LA ESTRELLA', '7612355', '3192499144', 'LIZ5231@YAHOO.ES', 'BACHILLER', 'CATOLICA', 'VENDEDOR', 'ELIZABETH REINA', 'ESPOSA', '7612355', '3192499144', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 10:14'),
(106, 0, 'CIRUG', 'CC', '51954509', 'DIAZ', 'GONZALES', 'OLGA', 'LUCIA', '20/10/1968', '46', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAGONAL 86A #101-40', 'BOCHICA|', '4034616', '3017186011', 'OLGALU.OCT@GMAIL.COM', 'T', 'CATOLICO', 'EMPLEADO', 'JESSICA LOZANO', 'HIJA', '4034616', '3016653086', 'SI', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE EL 27 DE ABRIL HA OTORGADO SUS DATOS COMPLETOS EN DOS OPORTUNIDADES, DICHA CITA ES NECESARI PARA QUE SE ORDENE LA CIRUG', '', 'Daniela L', '19/05/2015 10:14'),
(107, 0, 'ONCOLOG', 'CC', '80733977', 'VALBUENA', 'DIAZ', 'JOHN', 'ALEXANDER', '25/09/1982', '32', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  6D CRA 79A-56', 'INT 5 APTO 338 CASTILLA', '5715003', '3013313166', 'JOHNVALE41@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'LUZ MARINA  DIAZ FERNANDEZ', 'MAMA', '5715003', '3112735502', 'NO', 'NO', 'NO', 'CITA  CONTROL  PARA  LOS  PRIMEROS  DE  JUNIO', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:12'),
(108, 0, 'HEMATOLOG', 'CC', '19122449', 'GRIJALBA', 'RAMIREZ', 'HERNADO', '', '14/01/1947', '68', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA64A#4-45', 'PRADERA', '2606913', '3108071844', 'SEGURIDADINDUSTRIALSG_@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'HOGAR', 'MARIA EDILMA ORTIS DE GRIGALBA', 'ESPOSA', '2606913', '3203025273', 'SI', 'SI', 'NO', 'CANSELA LA CITA POR HOSPITALISACION', '', 'Pedro Juli', '19/05/2015 10:08'),
(109, 0, 'NUTRICI', 'CC', '21117178', 'LOPEZ', 'DE TORRES', 'ANA', 'OLIVIA', '26/03/1958', '57', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'BIOTA', 'LA PRADERA', '2502386', '3144479191', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'NINGUNO', 'JOSEFINA LOPEZ', 'HERMANA', '2502386', '3144479191', 'NO', 'NO', 'SI', 'ESTA EN LACUARTAQUIMIOTERAPIA, PPOR ESTA RAZON ES UNA CITA PRIORITARIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 08:05'),
(110, 0, 'CIRUG', 'CC', '31253551', 'BORJA', 'ESPINOZA', 'CARMEN', 'JULIA', '10/09/1950', '64', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'VALLE DEL CAUCA', 'CALI', 'CALLE 1RAOESTE # 21A - 12', 'SOLAR DELAS GARZAS', '2882456', '3183917110', 'JULIBORJAES@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'PENSONADA', 'JAIRO GONZALEZ', 'ESPOSO', '2882456', '3155579360', 'SI', 'SI', 'NO', 'ESTA SOLICITANDO LACITAPARA VALORACION, YA TIENE TODOLOS EXAMNES - CITA PRIORI5TARIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 08:25'),
(111, 0, 'ANESTESIOLOG', 'CC', '65742576', 'PISA', 'NIETO', 'CELIA', '0', '10/12/1967', '47', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAGONAL 67 BSUR # 28 - 21', 'CANDELARIA', '3043707', '3138849437', 'CELYPISA@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'OPERARIA', 'DAEWIN DUQUE', 'HIJO', '3043707', '3124443373', 'NO', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 08:33'),
(112, 0, 'UROLOG', 'CC', '17338921', 'MORERA', 'MANJARRES', 'LUIS', 'FERNADO', '03/04/1968', '47', 'MASCULINO', 'PARTICULAR', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 17 # 96A - 28', 'FONTOBON', '2987508', '3118944174', 'LUFEMO-68@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'CONDUCTOR', 'NORELA GUTIERREZ', 'ESPOSA', '2987508', '3118944174', 'NO', 'NO', 'NO', 'ES UNACITA PARTICULAR PARA UROLOGIA ONCOLOGIAC, DECIDE TOMARLA PARTICULAR PUESTO QUE NO SALUDCOOP NO LE ABRE AJENDA. PRIORITARIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 08:44'),
(113, 0, 'HEMATOLOG', 'CC', '52330526', 'RODRIGUEZ', 'GARCIA', 'MARTA', 'INES', '17/04/1965', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 105A # 72- 15', 'ALAMOS NORTE', '2296791', '3157126706', 'RODRIGUEZMARTAINEZ@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADO', 'MARLEN GARCIA', 'TIA', '7680460', '7680460', 'NO', 'NO', 'NO', 'ESTA EN UN TRATAMIENTO PARA PLAQUETAS, ES UN CITA DE CONTROL CON LA DOCTORA SILVIA ROJAS , FAVOR CITAR PARA MEDIADO DE JUNIO', '', 'Laura Liliana Benitez Garc', '19/05/2015 09:06'),
(114, 0, 'CIRUG', 'CC', '51640193', 'ORTEGA', 'DE SIERRA', 'MARIA', 'GUILLERMINA', '13/05/1961', '54', 'FEMENINO', 'ECOPSOS', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE 6TA SUR # 8 - 17', 'DUCALES', '5635977', '3103208754', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NELSY CIERRA', 'HIJA', '5635977', '3164708333', 'NO', 'NO', 'NO', 'ES UN CONTROL,  YA TIENE LA ECOGRAFIA PARA SER VISTA POR LA DOCTORA LUZ CUBILLOS - LLEVA  UN MES ESPERANDO LACITA', '', 'Laura Liliana Benitez Garc', '19/05/2015 09:14');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(115, 0, 'DERMATOLOG', 'CC', '20561252', 'VILLAVA', 'DE NARANJO', 'ANA', 'GRACIELA', '16/02/1944', '71', 'FEMENINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CALLE 1DA # 2A - 19', 'CEDRITOS', '3202643735', '3202643735', 'KARLYCASTILLO1968@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'EMPLEADO', 'YOLIMA NARANJO', 'HIJA', '3124868443', '3124868443', 'SI', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 09:32'),
(116, 0, 'CIRUG', 'CC', '53067210', 'MARTINEZ', 'HERRERA', 'LEYDY', 'JANTH', '03/09/1984', '30', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 90A # 72D - 37', 'LAS PALMAS', '4381931', '3142271203', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARIA HHERERA', 'MADRE', '4381938', '4381838', 'SI', 'SI', 'NO', 'LLEVA ESPERANDO 20 DIASPOR UNA CITA, LA PACIENTE ESTA EN EMBARAZO Y MANIFIESTA DOLOR  EN ELCUELO, AJENDAR CON PRIORIODAD', '', 'Laura Liliana Benitez Garc', '19/05/2015 09:45'),
(117, 0, 'ANESTESIOLOG', 'CC', '52431437', 'ROJAS', 'SARMIENTO', 'PAOLA', 'KARINA', '21/10/1976', '38', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6TSC # 94A - 40', 'CIUDAD TINTAL 2', '88331358', '3186007640', 'PAOLAKROJASS@YAHOO.COM', 'UNIVERSITARIO', 'MORMONA', 'DOCENTE', 'LUZ SARMIENTO', 'MADREA', '4591101', '3214987025', 'SI', 'SI', 'NO', 'EJENDAR EN LO POSIBLE  DESPUES DE LAS  EN DIAS PAR PARA EL PICO Y PLACA  EN HORAS DE LA TARDE', '', 'Laura Liliana Benitez Garc', '19/05/2015 09:51'),
(118, 0, 'ANESTESIOLOG', 'CC', '1016023824', 'DIAZ', 'BERNAL', 'ERIKA', 'JHOANA', '30/11/1989', '25', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 120A # 22L - 28', 'REFUJIO -FONTIBON', '4158030', '3102425759', 'ERIKA.FACTORY@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'ASISTENTE DE CONTRATACION', 'ISMAEL DIAS', 'PADRE', '4158030', '3143400376', 'NO', 'SI', 'NO', 'LLEVAESPERANDO 2 SEMANAS POR UNA CITA - ES PRIORITARIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:02'),
(119, 0, 'UROLOG', 'CC', '1032845', 'MU', 'CASAS', 'GILBERTO', 'ALFONSO', '06/10/1940', '75', 'MASCULINO', 'CAFE SALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6TA # 79-36', 'PIO 12', '2928172', '3144214207', 'YAS2393@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JAZMIN MU', 'HIJA', '2928172', '3214231528', 'NO', 'NO', 'NO', 'ES UN CONTROL CON ELDOCTOR  JUAN PABLO MONCADA. CI', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:16'),
(120, 0, 'HEMATOLOG', 'CC', '37231908', 'JAIMES', 'DE CHASIN', 'ANGELA', 'ROSA', '25/12/1951', '63', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'FUNZA', 'CALLE 15 # 28 - 20', 'VILLAPAOLA', '8234348', '3112377621', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'LINETH SASIN', 'NIETA', '8234348', '3134223809', 'SI', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:23'),
(121, 0, 'CIRUG', 'CC', '28741171', 'NARVAEZ', 'NARANJO', 'MARIA', 'AURORA', '19/06/1956', '58', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'TOLIMA', 'FRESNO', 'CRA5#9-55', 'JUNBCORTES', '0', '3133054672', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ZORANI ARDILA', 'HIJA', '0', '3117970862', 'NO', 'SI', 'NO', 'CONTROL', '', 'Sandra Liliana Agudelo', '19/05/2015 10:24'),
(122, 0, 'HEMATOLOG', 'CC', '1023911960', 'MESA', 'MANCIPE', 'ANGIE', 'ESTEFANIA', '12/10/1991', '24', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 15 5-32 SUR', 'VELODROMO', '2783770', '3215160372', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MERCEDES  MESA  MANCIPE', 'MAMA', '2783770', '3112274093', 'NO', 'NO', 'NO', 'ESTA  ESPERANDO  ESTE  CONTROL  HACE  3  MESES ES  URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:26'),
(123, 0, 'CIRUG', 'CC', '28844657', 'BARRAGAN', 'DE  ORTIZ', 'MARIA', 'INES', '27/04/1961', '54', 'FEMENINO', 'MEDICOSALUD', 'NO', 'SI', 'A', 'TOLIMA', 'MELGAR', 'CALLE  8  26-41', 'CENTRO', 'NO', '3156499569', 'ANAORTIZ1843@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ANANIAS ORTIZ MONROY', 'ESPOSO', 'NO', '3158162464', 'NO', 'NO', 'NO', 'CONTROL PARA  EXAMENES DRA CLAUDIA CUBILLOS', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:35'),
(124, 0, 'CIRUG', 'CC', '39782106', 'LOPEZ', 'TORREZ', 'MARIA', 'TRANSITO', '06/03/1969', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAJIC', 'PUENTE BARRIO', 'PUNETE BARRIO', '8666875', '3138463663', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'YULIETHCATERINE AYALA', 'HIJA', '0', '3208419756', 'SI', 'SI', 'NO', 'CONTROL CASTEBLANCO SIERREA JULIAN', '', 'Sandra Liliana Agudelo', '19/05/2015 10:33'),
(125, 0, 'ONCOLOG', 'CC', '434642', 'ROMERO', 'HERNADEZ', 'AQUILINO', '', '19/05/1934', '82', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UNE', 'CLL1#15', 'UNE CENTRO', '3166501317', '3166501317', 'ROMEROJULIS@HOTMAIL.COM', 'OTRO', 'CATOLICO', 'HOGAR', 'JULIA ROMERO', 'HIJA', '316650317', '3166500317', 'NO', 'NO', 'SI', 'PROCESO DE QUIMIOTERAPIA A LA ESPERA DE LA SIGUIENTE FORMULACION CON CON 15DIAS DE ESPERA SIN RESPUESTA', '', 'Pedro Juli', '19/05/2015 10:26'),
(126, 0, 'GINECOONCOLOG', 'CC', '52026540', 'ESCOBAR', 'ORTIZ', 'JUDITH', 'MATILDE', '########################################################################################################################################################################################################', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6A #94A-26', 'TINTAL', '4679070', '3116437674', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'SANTIGO CHACON', 'ESPOSO', '0', '3115012801', 'SI', 'SI', 'NO', 'PACIENTE CON URGENCIA PARA PROGRAMAR CITA DEBIDO AL TAMA', '', 'Daniela L', '19/05/2015 10:24'),
(127, 0, 'CIRUG', 'CC', '51768095', 'VEGA', '0', 'GLORIA', 'NANCY', '26/02/1963', '52', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 34A#4A-44', 'VILLA DE LOS ALPES', '3832108', '3103208506', 'GOYA2602@OUTLOOK.COM', 'T', 'CATOLICO', 'EMPLEADO', 'FELIX A. GIL', 'ESPOSO', '0', '3213046277', 'SI', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 10:43'),
(128, 0, 'HEMATOLOG', 'CC', '20152423', 'ROMERO', 'DE  CASTILLO', 'DORA', 'INES', '10/06/1939', '75', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 72B  9-14', 'CASTILLA', '2920668', '3115834296', 'LICARO16@HOTMAIL.COM', 'PRIMARIA', 'EVANGELICA CRISTIANA', 'HOGAR', 'LILIANA  CASTILLO', 'HIJA', '4688833', '3115834296', 'NO', 'NO', 'NO', 'CONTROL', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:45'),
(129, 0, 'ANESTESIOLOG', 'CC', '21060592', 'CHINGATE', 'DIMATE', 'FLOR', 'MARIA', '25/07/1955', '59', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UNE', 'AVE 6TS 3 6 -60', 'UNE CENTRO', '3125460198', '3125460192', 'NO TIENE', 'PRIMARIA', 'CRISTIAN', 'AMA DE CASA', 'VIKY HERNADEZ', 'HIJA', '3125460192', '3125460192', 'NO', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:29'),
(130, 0, 'ANESTESIOLOG', 'CC', '20792124', 'DURAN', 'DE BAUTISTA', 'MARIA', 'BENEDICTA', '19/08/1943', '71', 'FEMENINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'CALLE 73 # 85 -63', 'ALMERIA', '4624281', '3142560386', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'BLANCA DURAN', 'HERMANA', '4623142', '4623142', 'NO', 'NO', 'NO', 'ES LA SEGUNDA CIRUGIA, CITA PRIORITARIA POR QUE LA PACXINEWTMANIFUESTA UN FUERTE DOLOR.', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:34'),
(131, 0, 'CIRUG', 'CC', '20847804', 'FLORES', 'DE BELTRAN', 'CARMEN', '0', '20/04/1944', '71', 'FEMENINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'QUEBRADANEGRA', 'VEREDA NACEDEROS', 'FINCA LLANADA', '2983107', '3103364401', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NUBIA BELTRAN', 'HIJA', '4188651', '3133703641', 'NO', 'NO', 'NO', 'LLEVADOSSEMNAS ESPERANDO PARA LA CITA', '', 'Laura Liliana Benitez Garc', '19/05/2015 10:45'),
(132, 0, 'HEMATOLOG', 'TI', '1003711088', 'SANCHEZ', 'LAMPREA', 'ANGIE', 'MARCELA', '19/11/2001', '13', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'VEREDA  EL  CARBON', 'PACHO', '8540825', '3105774092', 'NO', 'BACHILLER', 'CATOLICA', 'ESTUDIANTE', 'JUDITH YALILE  LAM PREA PINZON', 'MAMA', 'NO', '3105774092', 'SI', 'SI', 'NO', 'CITA', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:49'),
(133, 0, 'UROLOG', 'CC', '387404', 'ROBAYO', 'NO', 'JOSE', 'MANUEL', '01/05/1935', '80', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SIMIJACA', 'SECTOR  PUEBLO  VIEJO', 'SIMIJICA', 'NO', '3144329021', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'CESAR MORATO', 'NIETO', 'NO', '3115898998', 'NO', 'NO', 'NO', ' CITA  CONTROL  LECTURA DE  EXAMENES', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:54'),
(134, 0, 'ONCOLOG', 'CC', '39557259', 'PUENTES', 'ACOSTA', 'ELIZABETH', '', '23/03/1963', '52', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GIRARDOTA', 'CALLE10#3-40', 'ALTO DE LA CRUZ', 'O', '3133882515', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'CAROL ORTIZ', 'AMIGA', '0', '3166930411', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 10:45'),
(135, 0, 'CIRUG', 'CC', '3287336', 'HERNANDEZ', '', 'PEDRO', 'ENRIQUE', '21/08/1940', '75', 'MASCULINO', 'CAFAM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'PARATEBUENO', 'CRA9#1-47', 'CENTRO', '0', '3102415963', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA HERNANDEZ', 'HIJA', '0', '3126827487', 'NO', 'SI', 'NO', 'CONTROL DOCTOR PABLO JOSE JIMENES', '', 'Sandra Liliana Agudelo', '19/05/2015 11:00'),
(136, 0, 'CIRUG', 'CC', '80436572', 'VILLAMIL', 'GUEVARA', 'JAEL', 'FABIAN', '20/01/1970', '45', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 60 #17M-11 SUR', 'SAN LUIS', '7907140', '3133569314', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'OLGA CORTEZ', 'CU', '7907140', '0', 'SI', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 10:50'),
(137, 0, 'ONCOLOG', 'CC', '35332629', 'MOSQUERA', 'VARGAS', 'ANA', 'MARIA', '12/04/1954', '60', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  135  49-13', 'SAN JOSE SPRING', '4585898', '3133714406', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'DORIS BARRETO  GIRALDO', 'NUERA', '4585898', '3123138005', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.  PIERE PACIENTE LLAMA  HACE  UN  MES', '', 'Carmenza Moreno Mendoza', '19/05/2015 10:59'),
(138, 0, 'CIRUG', 'CC', '80221628', 'SALGADO', '', 'JESUS', 'ANTONIO', '19/02/1982', '33', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'KRA 78B#58I-22SUR', 'VILLANORA', '4812290', '3143832333', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AUXILIAR DE BODEGA', 'NIDIA ESTELLA SALGADO', 'HERMANA', '4812290', '3213966299', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 11:07'),
(139, 0, 'CIRUG', 'CC', '35332629', 'MOSQUERA', 'VARGAS', 'ANA', 'MARIA', '12/04/1954', '60', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 134 49-13', 'SAN  JOSE SPRING', '4585898', '3133714406', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'DORIS BARRETO', 'NUERA', '4585898', '3123138005', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:12'),
(140, 0, 'CIRUG', 'CC', '41569312', 'BERMUDEZ', 'RODRIGUEZ', 'AIDE', '0', '20/04/1952', '63', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 42 SUR #28 -15', 'CLARET', '4614295', '3164668860', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'PENSIONADO', 'MARITZA RAMIREZ', 'PRIMA', '4614295', '3214172420', 'NO', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 11:16'),
(141, 0, 'CIRUG', 'CC', '1030536909', 'CAMPUZANO', 'ZAPATA', 'DIANA', 'CAROLINA', '07/03/1987', '28', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  74  61-19', 'SAN FERNANDO', '6071870', '3155504197', 'JAFADA_KA@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'SECRETARIA', 'MARLEN ZAPATA', 'MAMA', 'NO', '3005035323', 'NO', 'NO', 'NO', 'CITA  PARA  CONTROL ESTA  LLAMANDO  HACE  UN  MES  URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:16'),
(142, 0, 'ANESTESIOLOG', 'CC', '53053602', 'PAEZ', 'MENESES', 'SANDRA', 'MILENA', '24/06/1984', '30', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA68H#67D-65', 'BELLAVISTA', '4781435', '3115117404', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'MARTA MENESES', 'MAMA', '4781435', '3132694336', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 11:14'),
(143, 0, 'INFECTOLOG', 'CC', '80383582', 'TENJO', 'HERRERA', 'MAURICIO', '0', '06/01/2019', '49', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TENJO', 'VEREDA JACALITO', 'VEREDA JACALITO', '0', '3103403897', 'NO TIENE', 'NINGUNO', 'CRISTIANA', 'EMPLEADO', 'JEIMI TENJO', 'HIJA', '0', '3142735310', 'NO', 'NO', 'NO', 'PACIENTE SOLICITANDO CITA PARA MES DE JUNIO POR CONTROL Y CONTINUACI', '', 'Daniela L', '19/05/2015 11:20'),
(144, 0, 'CIRUG', 'CC', '40431262', 'GUERRERO', 'GARZON', 'EDITH', 'YAMILE', '16/06/1978', '36', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'META', 'ACAC', 'CRA 27 16C-63', 'EL  BOSQUE', '6561426', '3103030435', 'YAMILEG2@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ALCALDIA DE  ACACIAS', 'TERESA GARZON', 'MAMA', '6561426', '3146714901', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:20'),
(145, 0, 'CIRUG', 'CC', '41378765', 'DEVIA', 'HERRERA', 'EDELM IRA', 'NO', '20/07/1944', '70', 'FEMENINO', 'CAPITASALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE63  97B-42SUR', 'BOSA LAS ATALAYAS', '7834382', '3102809567', 'NO', 'PRIMARIA', 'CRISTIANA', 'HOGAR', 'LUZ  STELLA  FIERRO  DEVIA', 'HIJA', '7834382', '3102809567', 'NO', 'NO', 'NO', 'CITA CONTROL SENORA  ESTA LLAMANDO DESDE LA SEMANA PASADA  ES URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:30'),
(146, 0, 'CIRUG', 'CC', '41351411', 'GOMEZ', 'PE', 'MARCELENDA', '', '01/09/1944', '74', 'FEMENINO', 'COLSUBSIDIO SUBCIDIADO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLETA', 'VEREDA BAGASA', 'VEREDA BAGASAL', '8478689', '3107557761', 'NO TIENE', 'OTRO', 'CRISTIANA', 'HOGAR', 'BLANCA SECILIA GOMEZ GOMEZ', 'HIJA', '8478689', '3107557761', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '19/05/2015 11:10'),
(147, 0, 'ONCOLOG', 'CC', '65762551', 'CANISALES', '', 'NORMA', 'ESPERANZA', '24/09/1970', '44', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'TOLIMA', 'IBAGU', '0', 'AGUSTO MEDINA', '9023031', '3222808877', 'NO TIENE', 'PRIMARIA', 'EVANGELICA', 'EMPLEADA', 'NAYIBE OTAVO CA', 'HIJA', '9023031', '3222808877', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 11:22'),
(148, 0, 'CIRUG', 'CC', '20492645', 'CAMARGO', 'FONSECA', 'CLARA', 'LILIANA', '20/04/1968', '47', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 18C  2-22', 'EDUARDO  SANTOS', 'NO', '3153107746', 'CLARALILIANACAMARGO@GMAIL.COM', 'TECN', 'CATOLICA', 'EMPLEADA', 'WILLIAM SUAREZ ARENAS', 'ESPOSO', 'NO', '3165363440', 'NO', 'NO', 'NO', 'CITA CONTROL URG.  DRA CLAUDIA CUBILLOS  ESTA LLAMANDO  DESDE LA  SEMANA PASADA', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:36'),
(149, 0, 'CIRUG', 'CC', '52106129', 'ARAS', 'AMAYA', 'CAROLINA', '', '21/12/1971', '44', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE158A#96-05', 'SUBA', '0', '3124898896', 'GERSONSOLER@HOTMAIL.COM', 'BACHILLER', 'CRISTIANA', 'TRABAJADORA', 'GERSON SOLER', 'HIJO', '0', '3212659439', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 11:39'),
(150, 0, 'HEMATOLOG', 'CC', '80810535', 'TAUTA', 'SANDOVAL', 'WUALTER', '', '23/12/1983', '31', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA13#72A44 SUR', 'JUAN REY 2', '3653390', '3202272047', 'NO TIENE', 'BACHILLER', 'NINGUNA', 'COMERCIANTE', 'MARIA DEL CARMEN SANDOVAL', 'MADRE', '3653390', '3653390', 'NO', 'NO', 'NO', 'UN MES DE ESPERA SIN RESPUESTA', '', 'Pedro Juli', '19/05/2015 11:53'),
(151, 0, 'CIRUG', 'CC', '80384559', 'CASTILLO', 'IBAGUE', 'CARLOS', 'FERNANDO', '24/07/1966', '48', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 70  67B-29', 'EL  LAUREL', '4809276', '3103418879', 'NO', 'BACHILLER', 'CATOLICA', 'CONDUCTOR', 'MARIA ISABEL FORERO', 'ESPOSA', '4809276', '3106759522', 'SI', 'SI', 'NO', 'CITA  URG. MUY  URG.  HACE MES  Y  MEDIO  ESTA  LLAMANDO', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:40'),
(152, 0, 'ANESTESIOLOG', 'CC', '80384559', 'CASTILLO', 'IBAGUE', 'CARLOS', 'FERNANDO', '24/07/1966', '48', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 70 67B-29', 'EL  LAUREL', '4809276', '3103418879', 'NO', 'BACHILLER', 'CATOLICA', 'CONDUCTOR', 'MARIA ISABEL FORERO', 'ESPOSA', '4809276', '3106759522', 'SI', 'SI', 'NO', 'CITA URG. PARA  CIRUGIA PENDIENTE Y ESTA LLAMANDO HACE  RATO', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:51'),
(153, 0, 'ENDOCRINOLOG', 'CC', '20993461', 'LUQUE', 'MONTOYA', 'ROSA', 'ELVIA', '21/06/1956', '57', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'TENJO', 'CRA 1  5-05', 'CENTRO', '8654075', '3115455524', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'VIVIANA  MIRANDA', 'HIJA', '8654075', '3123357482', 'SI', 'SI', 'NO', '', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:54'),
(154, 0, 'CIRUG', 'CC', '20993461', 'LUQUE', 'MONTOYA', 'ROSA', 'ELVIA', '21/06/1956', '57', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'TENJO', 'CRA 1 5-05', 'CENTRO', '8654075', '3115455524', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'VIVIANA MIRANDA', 'HIJA', '8654075', '3123357482', 'SI', 'SI', 'NO', 'CITA  URG.,', '', 'Carmenza Moreno Mendoza', '19/05/2015 11:58'),
(155, 0, 'ONCOLOG', 'CC', '1126225', 'GAMBOA', 'SOTELO', 'JOSE DE', 'JESUS', '17/10/1931', '83', 'MASCULINO', 'CAFAM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA34A#14-32', 'SANTA ISABEL', '0', '3118288770', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'CASA', 'MARIA EDILMA GAMBOA VILLAMIL', 'HIJA', '2298146', '3118288770', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 11:45'),
(156, 0, 'DERMATOLOG', 'CC', '19396711', 'SARMIENTO', 'AMAYA', 'DOMINGO', 'ANTONIO', '14/07/1958', '56', 'MASCULINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CRA 16 ESTE 32-85', 'SAN MATEO EL BOSQUE', '7125947', '3115207476', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'BLANCA AMALIA GALVIZ', 'ESPOSA', 'NO', '3193842479', 'NO', 'NO', 'NO', 'CITA DE CONTROL  URG.  HACE 15  DIAS ESTA LLAMANDO', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:01'),
(157, 0, 'CIRUG', 'CC', '79365738', 'CHAVEZ', 'BUITRAGO', 'GERMAN', 'ALBERTO', '31/10/1965', '49', 'MASCULINO', 'SALUD TOTLA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 107C  # 63A - 29', 'LASMERCEDES', '5474716', '3143078812', 'CHARLIDM@HOTMAIL.COM', 'TECN', 'CATOLICO', 'TRANSPORTADOR', 'MARIA MONTA', 'ESPOSA', '5474716', '3124720271', 'SI', 'NO', 'NO', 'ES UNA CITA DE CONTROL', '', 'Laura Liliana Benitez Garc', '19/05/2015 11:00'),
(158, 0, 'ONCOLOG', 'CC', '3012073', 'RUBIANO', 'RODRIGUEZ', 'JOSE', 'MIGUEL', '25/01/1943', '72', 'MASCULINO', 'ENCOSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 155 # 9 -50', 'VILLAS DELMEDITERRANE', '6495109', '3155837543', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'PENSIONADO', 'ASEUSENA DE RUBIANO', 'ESPOSA', '6495109', '3162679436', 'NO', 'NO', 'NO', 'ACTUALMENTE ESTA EN RADIO TERAPIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 11:33'),
(159, 0, 'HEMATOLOG', 'CC', '1108992', 'VILLAMIL', '0', 'ABDENAGO', '0', '15/02/1938', '76', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 163# 54 - 15', 'SOTAVENTO', '6740237', '3204959862', 'YANETH.VILLAMIL@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'OFICIOS VARIOS', 'AMINTA VILLAMIL', 'HIJA', '6740237', '3157394108', 'NO', 'NO', 'NO', 'ES UN CONTROL CON LADOCTORA SILVIA ROJAS - LA PACIENTE MANIFIESTA MUCHO ERRORES EN LASIGNACION DE LA CITA', '', 'Laura Liliana Benitez Garc', '19/05/2015 11:50'),
(160, 0, 'ONCOLOG', 'CC', '21065338', 'AGULERA', 'BELTRAN', 'ELSA', '0', '01/09/1938', '76', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 81 # 73 - 74', 'BOYACA', '6975770', '3115559028', 'MCARMELA_7@HOTMAIL.COM', 'PRIMARIA', 'CRISTIANA', 'HOGAR', 'CARMEN BALLESTEROS', 'CU', '6975770', '3115559028', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL  PARA AGENDAR QUIMIOTERAPIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 11:58'),
(161, 0, 'UROLOG', 'CC', '83035061', 'MENDES', 'HERRERA', 'RUFINO', '', '01/01/2015', '52', 'MASCULINO', 'COLSUBSIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'LAS MARGARITAS', 'LAS MARGARITAS', '7828507', '3125838931', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'MARIA ERMINDA MORA', 'CU', '7828507', '3125838931', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 12:02'),
(162, 0, 'CIRUG', 'CC', '28005576', 'RANGEL', 'MURCIA', 'MARIA', 'DORA', '17/09/1938', '76', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 8C  186-67 TORRE 11 APTO 201', 'SANTA FE  REAL', '4728982', '3125434951', 'FERNANDOPINILLA@HOTMAIL.COM', 'T', 'CATOLICA', 'HOGAR', 'OMAR FERNANDEZ', 'SOBRINO', '2136096', '3132826650-3153339553', 'NO', 'NO', 'NO', 'CITA MUY URG. PACIENTE CON  MUCHO DOLOR  Y  NO  AGUANTA MAS TIEMPO Y  NECESITA  QUE  EL  DR.  VEA  LOS EXAMENES  Y  HAN  LLAMADO EN  VARIAS OPORTUNIDADES', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:06'),
(163, 0, 'CIRUG', 'CC', '20903973', 'BERNAL', '', 'ELVIA', '', '07/08/1951', '63', 'FEMENINO', 'ECOPS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SAN JUAN DE R', 'CRA8#4-03', 'CENTRO', '3114402157', '3114402157', 'NO TIENE', 'OTRO', 'CATOLICO', 'HOGAR', 'GINA CALA', 'AMIGA', '8465575', '314375687', 'SI', 'SI', 'NO', 'UN MES DE ESPERA SIN RESPUESSTA', '', 'Pedro Juli', '19/05/2015 11:53'),
(164, 0, 'HEMATOLOG', 'CC', '28709984', 'CARDOZO', 'DE  BARRERO', 'OLIVA', 'NO', '15/05/1944', '71', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'B', 'TOLIMA', 'IBAGU', 'CRA 7 4-35', 'BELEN', 'NO', '3143306519', 'NO', 'BACHILLER', 'CATOLICA', 'PENSIONADA', 'CEFERINO BARRERO SANCHEZ', 'ESPOSO', 'NO', '3017801502', 'NO', 'NO', 'NO', 'CITA  CONTROL  DRA  SILVIA  ROJAS  HA  LLAMADO  VARIAS  VECES Y ES  URG.  TERMINA  TRATAMIENTO Y  NECESITA  LA  CITA  PARA LOS PRIMEROS  DE  JUNIO PARA  CONTINUAR', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:21'),
(165, 0, 'ENDOCRINOLOG', 'CC', '39780579', 'LANCHEROS', 'SANTANA', 'RUTH', 'ESTELLA', '18/04/1969', '46', 'FEMENINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA12B#161-45', 'PRADERAS', '6707027', '3154016410', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'DANIEL GUERRA', 'ESPOSO', '7613941', '3158424982', 'NO', 'SI', 'NO', 'CONTROL WUILSON', '', 'Sandra Liliana Agudelo', '19/05/2015 12:13'),
(166, 0, 'HEMATOLOG', 'CC', '46380768', 'SALAMANCA', 'HERNADEZ', 'IVON', 'MARCELA', '27/07/1981', '33', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA84#71-78', 'LA CLARITA', '2528365', '3115109020', 'IVON.SALAMANACA@GMAIL.COM', 'T', 'CATOLICA', 'MODISTA', 'ANDRES HGUIO', 'ESPOSO', '2528375', '3134288947', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 12:25'),
(167, 0, 'CIRUG', 'CC', '24078520', 'CETINA', 'SANABRIA', 'MARIA', 'ELENA', '14/10/1958', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 78 F BIS  109-33', 'GARCES NAVAS ', '4680305', '3156057081', 'MCETINA@BANCODEBOGOTA.COM.CO', 'ESPECIALIZACI', 'CATOLICA', 'EMPLEADA', 'CLARA VICTORIA CETINA', 'HERMANA', '4680305', '3213668765', 'SI', 'SI', 'NO', 'CITA  EN  VARIAS OPORTUNIDADES  POR  FAVOR  PRIORIDAD   ES URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:27'),
(168, 0, 'HEMATOLOG', 'CC', '39780579', 'LANCHEROS', 'SANTANA|', 'RUTH', 'ESTELLA', '18/04/1969', '46', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA12B#161-45', 'PRADERAS', '6707027', '3154016410', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'DANIEL GUERRA', 'ESPOSO', '7613941', '3158424982', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 12:32'),
(169, 0, 'GINECOONCOLOG', 'CC', '20988953', 'MALDONADO', 'NO', 'MARGOTH', 'NO', '25/05/1955', '60', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'LA MESA', 'VEREDA TENA CENTRO', 'NO', 'NO', '3202622134', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JOHN MALDONADO', 'HIJO', 'NO', '3124726063', 'NO', 'NO', 'NO', 'CITA CONTROL  URG.  ESTA LLAMANDO DESDE  EL  5  DE  MAYO  POR FAVOR  PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:34'),
(170, 0, 'HEMATOLOG', 'CC', '19335343', 'ARIAS', 'BUSTOS', 'HERNAN', '0', '21/08/1958', '56', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAGONAL 31 SUR #12 -55', 'RAMAJAL', '3646303', '3004881750', 'NO TIENE', 'T', 'CATOLICO', 'INDEPENDIENTE', 'LIGIA SANCHEZ', 'ESPOSA', '3646303', '3007119348', 'NO', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 12:28'),
(171, 0, 'ANESTESIOLOG', 'CC', '1030553574', 'CONTRERAS', 'RAMIREZ', 'DIANA', '', '14/02/1989', '26', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE6A#87A-51INT12APTO501', 'TINTAL', '0', '3192683409', 'CONTRERASDIANA@LAIF.COM', 'UNIVERSITARIO', 'CATOLICA', 'TENICA', 'ESPERANZA RAMIREZ', 'MAMA', '0', '3194501756', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 12:36'),
(172, 0, 'ANESTESIOLOG', 'CC', '21060592', 'CHINGATE', 'DIMATE', 'FLOR', 'MARIA', '25/07/1955', '59', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UNE', 'CALLE 3 #6-64', 'UNE CENTRO', '0', '3214709391', 'DPHG0712@GMAIL.COM', 'NINGUNO', 'CRISTIANO', 'AMA DE CASA', 'DIANA HERNANDEZ', 'SOBRINA', '8488030', '3214709391', 'NO', 'SI', 'NO', 'PACIENTE SOLICITA AGENDAMIENTO INMEDIATO YA QUE YA DEBI', '', 'Daniela L', '19/05/2015 12:42'),
(173, 0, 'COLOPROCTOLOG', 'CC', '1075655365', 'TORRES', 'CANO', 'ANGELA', 'CAROLINA', '04/01/1988', '27', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA7#0-20', 'ZIPAQUIRA', '6468000', '3145597708', 'CIOT@CAFAM.COM.CO', 'OTRO', 'CATOLICA', 'HOGAR', 'LUUZ SANCHEZ', 'AMIGA', '6468000EXT280', '3174393378', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '19/05/2015 12:32'),
(174, 0, 'ONCOLOG', 'CC', '11330592', 'TORRES', 'CRUZ', 'ROBERTO', 'NO', '10/02/1944', '71', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'VEREDA NO  SABE', 'NO', 'NO', '3209917637', 'NO', 'BACHILLER', 'CATOLICA', 'AGRICULTOR', 'MARIA PAZ TORRES', 'HERMANO', 'NO', '3107952736', 'SI', 'SI', 'SI', 'CITA PARA  CIRUGIA URG.  POR FAVOR  DARLE  PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:41'),
(175, 0, 'ORTOPEDIA GENERAL', 'CC', '1019005274', 'BERDUGO', 'PAEZ', 'CLAUDIA', 'LORENA', '05/04/1986', '27', 'FEMENINO', 'CAPRESOCA', 'NO', 'SI', 'A', 'CASANARE', 'VILLANUEVA', 'MORICHAL', 'MORICHAL', '0', '3102501021', 'LAURACRIS1980@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'ELBA MARIA PAEZ', 'MAMA', '0', '3103365688', 'NO', 'SI', 'NO', 'CONTROL DOCTOR GOMEZ', '', 'Sandra Liliana Agudelo', '19/05/2015 12:43'),
(176, 0, 'ANESTESIOLOG', 'CC', '21109594', 'CORTES', 'DIAZ', 'MARIA', 'TERESA', '20/03/1953', '62', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLETA', 'CALLE  6  8-124', 'CENTRO', 'NO', '3108688211', 'NO', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'MARITZA  HERNANDEZ', 'HIJA', 'NO', '3005082860', 'SI', 'SI', 'NO', 'CITA  URG. EL  PACIENTE  VIVE  FUERA  DE  BOGOTA  Y  YA  TIENE LOS E XAMENES  ESTA  LLAMANDO HACE 19  DIAS  POR  FAVOR  DAR  PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:49'),
(177, 0, 'GINECOONCOLOG', 'CC', '23741392', 'ROBLES', 'FUENTE', 'NUBIA', '0', '02/05/5555', '56', 'FEMENINO', 'CAPRESOCA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 93D #71-49', 'RECREO', '7855791', '3143939747', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'MARIA TUMAI', 'PRIMA', '7855791', '3142613995', 'SI', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 12:52'),
(178, 0, 'ANESTESIOLOG', 'CC', '52707576', 'CORREA', 'JARA', 'ANDREA', 'NO', '27/10/1979', '35', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  143F  126-50 BLOQUE  6  CASA  16', 'VILBAO', '3929350', '3203360214', 'ANGICO-2010@HOTMAIL.COM', 'BACHILLER', 'NINGUNA', 'EMPLEADA', 'GIOVANNY  OBANDO', 'SOBRINO', '3320032 EXT  41213', '3155839708', 'SI', 'SI', 'NO', 'CITA  PARA  CIRUGIA  URG  POR FAVOR  DAR PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 12:54'),
(179, 0, 'CIRUG', 'CC', '13340697', 'GALVIS', 'MARTINEZ', 'ALFREDO', '', '13/04/1957', '58', 'MASCULINO', 'CAFASALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL42#26A-29 SUR', 'CLARET', '7501445', '3133999087', 'NO TIENE', 'OTRO', 'CATOLICO', 'HOGAR', 'OSORIO CARO MARIA', 'ESPOSA', '7501445', '3144135767', 'NO', 'NO', 'SI', 'TRES MESES SIN RESPUESTA', '', 'Pedro Juli', '19/05/2015 12:59'),
(180, 0, 'HEMATOLOG', 'CC', '1030568572', 'CALDERON', 'RODRIGUES', 'YEIMY', 'YOLIMA', '12/02/1990', '25', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA102B#154-18', 'SUBA', '5600449', '3143448945', 'YY_1290@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'LUZ DARY CALDERON', 'CU', '5600449', '3138603548', 'NO', 'NO', 'NO', 'CONTROL DOCTORA SILVIA MARGARITA ROJAS', '', 'Sandra Liliana Agudelo', '19/05/2015 12:53'),
(181, 0, 'CIRUG', 'CC', '21016664', 'ORTIZ', 'GARAZON', 'LIL', 'ARELIS', '09/05/1972', '43', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 21A #6-55', 'LA PEPITA', '0', '3134758321', 'LYAROGA@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'EMPLEADA', 'YANET ORTIZ', 'HERMANA', '0', '3105615717', 'SI', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE DOS SEMANA, HA OTORGADO SUS DATOS COMPLETOS 3 VECES. DESEA PRESENTAR LOS EXAMENES AL M', '', 'Daniela L', '19/05/2015 12:57'),
(182, 0, 'CIRUG', 'CC', '52267794', 'LOPEZ', 'TOVAR', 'CONSUELO', 'NO', '13/09/1976', '38', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  37 B  SUR  68D-68', 'ALQUERIA  LA FRAGUA', 'NO', '3132725045', 'CONSUELO1976@OULUT.ES', 'BACHILLER', 'CATOLICA', 'VENDEDORA', 'VICTOR  HUGO OSORIO', 'ESPOSO', 'NO', '3125017483', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ  PARA  PROGRAMACION DE  CIRUGIA POR FAVOR  DARLE  PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 13:00'),
(183, 0, 'ORTEPEDIA ONCOLOG', 'CC', '321086092', 'MENDEZ', 'MU', 'MARGARITA', '0', '25/09/1942', '73', 'FEMENINO', 'CAPRICO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'VILLETA', 'BARRIO PARAISO', 'BARRIO PARAISO', '4886714', '3143017134', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'AMA DE CASA', 'OLGA VILLEGAS', 'NUERA', '4886714', '3143017134', 'NO', 'NO', 'NO', 'PACIENTE DESEA CONCERTAR CITA PARA CONTROL POST OPERATORIO, PACIENTE ESPECIFICA QUE TIENE DOLOR CR', '', 'Daniela L', '19/05/2015 13:12'),
(184, 0, 'HEMATOLOG', 'CC', '79793689', 'ORTIZ', 'LEON', 'JUAN', 'MANUEL', '05/10/1977', '37', 'MASCULINO', 'SALUDTOTAL', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 17  173-52 TORRE 1  APTO 1202', 'LA ALAMEDA', '6949286', '3158308124', 'JMOB240@YAHOO.COM', 'UNIVERSITARIO', 'CATOLICA', 'DISCAPACITADO', 'MARCO ANTONIO  ORTIZ', 'PAPA', 'NO', '3004598956', 'SI', 'SI', 'NO', 'CITA MUY  URG.  POR  FAVOR  DAR  PRIORIDAD PACIENTE  ESTA LLAMANDO  HACE  DOS  SEMANAS', '', 'Carmenza Moreno Mendoza', '19/05/2015 13:07'),
(185, 0, 'CIRUG', 'CC', '39722825', 'FONSECA', 'BERNAL', 'ANA', 'YOMAR', '21/02/1968', '46', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA18K BIS#61-22SUR', 'ALTOS DE JALISCO', '7662241', '3219282941', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'FONSECA BERNAL STEVEN', 'HIJO', '7662241', '3004776321', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '19/05/2015 13:27'),
(186, 0, 'ONCOLOG', 'CC', '406417', 'PAEZ', 'FIGUEROA', 'LUIS', 'HERNANDO', '02/06/1949', '67', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CARMEN DE CARUPA', 'VEREDA EL  HATO', 'NO', 'NO', '3123162408', 'NO', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'NANCY CLARIBEL PAEZ GUZMAN', 'HIJA', 'NO', '3123162408', 'NO', 'NO', 'NO', 'CITA  CON  EL DR. BERMUDEZ  URG  PARA  TRANSPLANTE  DE  MEDULA  ESTAN  LLAMANDO  HACE  DOS  MESES', '', 'Carmenza Moreno Mendoza', '19/05/2015 13:21'),
(187, 0, 'ENDOCRINOLOG', 'CC', '91159330', 'GARNICA', 'LEON', 'HERMES', 'JOHANNY', '05/10/1980', '34', 'MASCULINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL3#69BA71SUR', 'IMPOTECHO', '4857934', '3017398739', 'FEMIOXAMTOSSANTOS@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANO', 'SISTEMAS', 'HELEN GARNICA', 'ESPOSA', '4857934', '3012343378', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 13:27'),
(188, 0, 'GINECOONCOLOG', 'CC', '1069717884', 'ALVAREZ', 'SANTOYA', 'LUZ', 'ANGELICA', '30/07/1986', '28', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'DIAG.  19A  2E-26', 'PARDO LEAL', 'NO', '3108530739', 'NO', 'BACHILLER', 'CATOLICA', 'NINGUNA', 'ALCIRA  SANTOYA  BELTRAN', 'M AMA', 'NO', '3108530739', 'NO', 'NO', 'NO', 'CONTROL  DE UNA  CIRUGIA URG.', '', 'Carmenza Moreno Mendoza', '19/05/2015 13:31'),
(189, 0, 'GINECOONCOLOG', 'CC', '41526025', 'LUZARDO', 'VALERA', 'ZAIRA', '0', '19/07/1950', '64', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'PALERMO', 'DIAGONAL 44BIS ##16-57', '2457558', '3209256483', 'FELICE54@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'DANIEL CAMPOS', 'HIJO', '0', '3134060851', 'SI', 'SI', 'NO', 'PACIENTE DESEA PROGRAMAR CITA CON GINECOLOG', '', 'Daniela L', '19/05/2015 13:34'),
(190, 0, 'GINECOONCOLOG', 'CC', '51842837', 'DONOSO', 'GONZALES', 'MARIA', 'JHAKELIN', '09/08/1966', '48', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'COGUA', 'VEREDA RODAMONTAL', 'VEREDA RODA MONNTAL', '3208873483', '3208873483', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ANGIE JIMENEZ', 'HIJA', '3167947545', '3167947545', 'NO', 'NO', 'NO', 'ASIGNAR CIT DESPUES DE LAS 9 DE LA NOCHE', '', 'Pedro Juli', '19/05/2015 13:35'),
(191, 0, 'ONCOLOG', 'CC', '51842837', 'DONOSO', 'GONZALES', 'MARIA', '', '09/08/1966', '48', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'COGUA', 'VEREDARODAMONTA', 'VEREDA RODA MONTA', '3208873483', '3208873483', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ANGIE JIMENEZ', 'HIJA}', '3167947545', '3167947545', 'NO', 'NO', 'NO', 'ASIGNAR CITA DESPUES DE LLAS 9 AM', '', 'Pedro Juli', '19/05/2015 13:47'),
(192, 0, 'HEMATOLOG', 'CC', '24031342', 'SEPULVEDA', 'MEDINA', 'MARIA', 'ISABEL', '24/04/1974', '41', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE59SUR#936C-46CASA46', 'PORTAL DEL PORVENIR ETA1BOSA', '7831787', '3112783231', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'EMPLEADA', 'ROSA RINCON', 'SOBRINA', '4581044', '3107896720', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 13:55'),
(193, 0, 'CIRUG', 'CC', '206458776', 'ALFONSO', 'AGUILERA', 'ILDA', 'MILENA', '07/04/1982', '33', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GUASCA', 'CRA72B#11B-82', 'CASTILLA', '4243070', '3125289457', 'NO TIENE', 'T', 'CATOLICA', 'AMA DE CASA', 'CLARA INES RAMOS', 'CU', '4243070', '3125289457', 'NO', 'SI', 'NO', 'CONTROL CON DOCTOR  PABLO JIMENES', '', 'Sandra Liliana Agudelo', '19/05/2015 14:01'),
(194, 0, 'ENDOCRINOLOG', 'CC', '41695823', 'CLAVIJO', 'MU', 'SARA', '', '06/01/1955', '60', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA123#130C-56BLOQUE41APT104', 'SUBA NUEVA TIBABUYES', '3034188', '3102201963', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'PENSIONADA', 'DIEGO FELIPE BOCANEGRA', 'HIJO', '3034188', '3102148555', 'NO', 'SI', 'NO', 'CONTROL DOCTORA SILVIA', '', 'Sandra Liliana Agudelo', '19/05/2015 14:18'),
(195, 0, 'CIRUG', 'CC', '41412869', 'ZORRO', 'LEE', 'NATIVIDAD', '0', '02/07/1948', '66', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAJIC', 'CALLE 7MA #7AE-83', 'GRANJITAS', '8662019', '3142276783', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'AMA DE CASA', 'JOHAN BERNAL', 'NIETO', '8662019', '3174387987', 'SI', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 14:14'),
(196, 0, 'ANESTESIOLOG', 'CC', '30562626', 'MARTINEZ', 'ALVARADO', 'DORIS', '', '08/07/1956', '58', 'FEMENINO', 'SALUDCAPITAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE24#19-57', 'SANTAFE CENTRO', '4643790', '3105820015', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'DORIS JIMENES', 'HIJA', '0', '3133129952', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 14:25'),
(197, 0, 'HEMATOLOG', 'CC', '51922082', 'FONSECA', 'DURAN', 'MARIA', 'ELISA', '28/07/1966', '48', 'FEMENINO', 'SALUD TOTAL', 'SI', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 7E#48-64 SUR', 'ANTIOQUIA', '3719982', '3123750598', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'INDEPENDIENTE', 'PEDRO LOPEZ', 'ESPOSO', '3719982', '3173965101', 'SI', 'NO', 'NO', 'PACIENTE SE HA COMUNICADO EN REPETIDAS OPORTUNIDADES, HA OTORGADO LOS DATOS SIN EXITO. PACIENTE CON RESULTADOS LISTOS DESEA PRESENTARLOS ANTE EL MEDICO TRATANTE PARA QUE NO PIERDAN VIGENCIA', '', 'Daniela L', '19/05/2015 14:27'),
(198, 0, 'CIRUG', 'CC', '20645876', 'ALFONSO', 'AGUILERA', 'HILDA', 'MILENA', '07/04/1982', '33', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GUASCA', 'CRA 72B  11B-82', 'CASTILLA BTA', '4243070', '3125289457', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'CLARA INES RAMOS PINZON', 'CU', '4243070', '3125289457', 'NO', 'NO', 'NO', 'CONTROL DR. PABLO  JIMENEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 14:35'),
(199, 0, 'DERMATOLOG', 'CC', '23893492', 'BARRAGAN', 'DE GUARIN', 'MARIA', 'DEL CARMEN', '19/03/1937', '78', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'BOYAC', 'PUERTO BOYAC', 'CRA5#16-65', 'ALFONSO LOPEZ', '0', '3107767044', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'AMA DE CASA', 'JOSE ANTONIO GUARIN', 'HIJO', '0', '3146846648', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 14:34'),
(200, 0, 'CIRUG', 'CC', '1016024715', 'LOZANO', 'RIVERA', 'YENIFER', 'CONSTANZA', '06/02/1990', '25', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 86 #65-06', 'BOSA', '0', '3173652892', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'JHON CORTEZ', 'ESPOSO', '0', '3203840195', 'NO', 'NO', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE M', '', 'Daniela L', '19/05/2015 14:36'),
(201, 0, 'HEMATOLOG', 'CC', '51857272', 'CELI', 'LOPEZ', 'ANA', 'OLIVIA', '04/08/1967', '47', 'FEMENINO', 'COLSUBSIDIO', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE  51B  4-38 ESTE', 'SANTA RITA SUR ORIENTAL', '3659731', '3112359273', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'RICARDO GARZON', 'ESPOSO', 'NO', '3112359273', 'NO', 'NO', 'NO', 'CONTROL  PARA  LECTURA DE E XAMES  DRA SILVIA MARGARITA  ROJAS', '', 'Carmenza Moreno Mendoza', '19/05/2015 14:40'),
(202, 0, 'ONCOLOG', 'CC', '46645341', 'MARTINEZ', '', 'MARIA', 'YISEL', '30/06/1972', '42', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'BOYAC', 'PUERTO BOYAC', 'CRA7#23-81', 'LAS MIL QUINIENTAS', '0', '3134464913', 'YISELMARTINEZ97@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ARQUIMEDES PALACIO', 'ESP', '0', '3188740592', 'NO', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 14:42'),
(203, 0, 'CIRUG', 'CC', '20179034', 'MOLANO', 'DE  PE', 'MARINA', 'NO', '28/04/1933', '82', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 27 B  BIS  65-18', '7  DE  AGOSTO', '4665197', 'NO', 'ANGIE1152@HOT.MAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARY  PE', 'HIJA', '4665197', 'NO', 'NO', 'NO', 'NO', 'CONTROL  PARA ENTREGA  DE EXAMENES  LLEVA LLAMANDO  DESDE  LA  SEMANA PASADA ES URG. DR.  IVAN  DARIO GONZALEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 14:47'),
(204, 0, 'HEMATOLOG', 'CC', '52241598', 'BETANCOURT', 'TRIANA', 'LILIANA', '0', '20/11/1977', '37', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAGONAL 62 #19B-29 SUR', 'SAN FRANCISCO', '3870343', '3118125859', 'MINCHO.BA@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'MIGUEL VALLEN', 'ESPOSO', '3870343', '3124072966', 'NO', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE M', '', 'Daniela L', '19/05/2015 14:46'),
(205, 0, 'UROLOG', 'CC', '19104907', 'GALINDO', 'BRAVO', 'SALOMON', '0', '13/04/1948', '67', 'MASCULINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CRA 14 # 1A - 14', 'GAITAN', '3133187293', '3133187293', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'HOGAR', 'EDITH GALINDO', 'HERMANA', '3166015706', '3166015706', 'NO', 'NO', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 13:54'),
(206, 0, 'ONCOLOG', 'CC', '452113', 'PALACIOS', 'ATUESTA', 'ANCELMO', '0', '20/04/1929', '86', 'MASCULINO', 'COLSUBCIDO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLETA', 'VERADA VAGAZAL', '0', '3134868936', '3164868936', 'AMAVEG_98@HOTMAIL.COM', 'NINGUNO', 'CATOLICA', 'AGRICULTOR', 'AMADA VERANO', 'SOBRINA', '3008011501', '3008011505', 'NO', 'NO', 'NO', 'CON ELDOCTOR ALEJANDRO ABUCHAR - AJENDAR PARA EL 20 JUNIO', '', 'Laura Liliana Benitez Garc', '19/05/2015 14:30'),
(207, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '52225655', 'HURTADO', 'ESLAVA', 'ENID', '0', '26/01/1975', '40', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'META', 'VISTAHERMOSA', 'VERDA CAMPO ALEGRE', '0', '3204965962', '3204965962', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'ADVENTISTA', 'JHON HURTADO', 'HERMANA', '3127543278', '3127543878', 'SI', 'SI', 'NO', '', '', 'Laura Liliana Benitez Garc', '19/05/2015 14:42'),
(208, 0, 'ONCOLOG', 'CC', '23443738', 'RINCON', 'MORA', 'VALVINA', '0', '03/02/1972', '53', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CARMEN DE CARUPA', 'VEREDA APICO INEA', 'FINCA RESGUARDO', '3113564489', '3113564489', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA  DE CASA', 'SANDRA  DELGADO', 'NUERA', '3122478218', '3122478218', 'NO', 'NO', 'NO', 'LLEVA ESPERANDO 1 MES PARA UNA CITA DE CONTROL', '', 'Laura Liliana Benitez Garcia', '19/05/2015 14:52'),
(209, 0, 'CIRUG', 'CC', '39735437', 'BANQUEBA', 'RODRIGUEZ', 'MARIA', 'ROSALBA', '18/08/1957', '57', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FUNZA', 'CALLE15#10-50', 'FUNZA', '8218043', '3203275857', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADA|', 'BERNAL JOSE DE JESUS', 'ESPOSO', '821743', '3134424605', 'NO', 'SI', 'NO', 'CONTROL DOCTOR PABLO JIMENES', '', 'Sandra Liliana Agudelo', '19/05/2015 14:47'),
(210, 0, 'ANESTESIOLOG', 'CC', '11345611', 'MORALES', '', 'ENRIQUE', '', '24/10/1968', '46', 'MASCULINO', 'COLSUBSIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'TAUSA', 'VEREDA EL CHORRILLO', 'VEREDA EL CHORRILLO', '0', '3115260076', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'AGRICULTOR', 'MARTHA RODRIGUEZ MORALES', 'PRIMA', '0', '3138400888', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 15:00'),
(211, 0, 'CIRUG', 'CC', '39781905', 'ESPINOSA', 'REYES', 'ADELA', 'NO', '15/05/1969', '46', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 163  1A-50 ESTE INT. 1', 'SANTA CECILIA ALTA PARTE NORTE', '6776451', '3214351343', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LUIS  JAVIER ROA', 'ESPOSO', 'NO', '3115960437', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA  VEZ  URG.  POR  FAVOR  DAR PRIORIDAD  SE', '', 'Carmenza Moreno Mendoza', '19/05/2015 14:53'),
(212, 0, 'CIRUG', 'CC', '1019048745', 'BORRAI', 'GONZALES', 'JENIFER', 'JICEL', '23/07/1990', '24', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 113#129-25', 'LA TOSCANA', '3105680836', '3105680836', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AUXILIAR DE ALIMENTOS', 'JOSE REINELBOLAI CASTELLANOS', 'PAPA', '3103398698', '3103398698', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 13:53'),
(213, 0, 'ONCOLOG', 'CC', '35405432', 'SUAREZ', 'DE GALEANO', 'VITELVINA', '', '19/02/1951', '54', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA3#4-44', 'LA CONCEPCION', '0', '3102655072', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'YOHANNA GALEANO', 'HIJO', '0', '3102755072', 'NO', 'SI', 'SI', 'CONTROL EDY PIERRR', '', 'Sandra Liliana Agudelo', '19/05/2015 15:08'),
(214, 0, 'CIRUG', 'CC', '51586690', 'RAMOS', 'CORREDOR', 'MARIA', 'DOLORES', '13/09/1957', '57', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG. 38D SUR 1A-23 ESTE', 'GUACAMAYAS  PRIMER SECTOR', '3634011', '3125473248', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NANCY  MENDEZ', 'HIJA', '5683439', 'NO', 'SI', 'SI', 'SI', 'CITA  POR  PRIMERA  VEZ', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:11'),
(215, 0, 'CIRUG', 'CC', '217526', 'HUERFANO', 'ORTUA', 'ALFONSO', '', '01/08/1937', '78', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHIPAQUE', 'VEREDA SIECHA', 'CHIPAQUE', '3153886205', '3152886205', 'NO TIENE', 'OTRO', 'CATOLICO', 'HOGAR', 'HUERFANO GUAVITA LUIS ALFONSO', 'HIJO', '31538886205', '3158886205', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 15:11'),
(216, 0, 'HEMATOLOG', 'CC', '51607735', 'PINZON', 'CANSINO', 'PATRICIA', 'ISABEL', '08/03/1961', '54', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 69B#24-10INT33APT301', 'SALITRE', '2955421', '3214384156', 'PATPICAN@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ODONTOLOGA', 'HUGO PINZON', 'HERMANO', '2955421', '3115058403', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 15:14'),
(217, 0, 'ONCOLOG', 'CC', '17153332', 'MENDOZA', 'GARZON', 'ALFONSO', 'NO', '28/04/1946', '69', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE  71A  29B-14', 'LA MERCED  NORTE', '5498947', '3212073130', 'ESPERANZARIOS0804@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'PENSIONADO', 'CAROLINA MENDOZA RIOS', 'HIJA', 'NO', '3115742768', 'SI', 'SI', 'NO', 'CITA', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:15'),
(218, 0, 'CIRUG', 'CC', '11230328', 'RAMOS', 'RAMOS', 'LUIS', 'ENRIQUE', '11/09/1964', '50', 'MASCULINO', 'FAMISANAR', 'SI', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA13ESTE#97-30', 'SAN ISIDRO ALTO', '5202239', '31334460590', 'NO TIENE', 'OTRO', 'CATOLICO', 'OPERADOR SIPT', 'RUBIA NI GARCIA', 'ESPOSA', '5202239', '3133450433', 'NO', 'NO', 'NO', '', '', 'Pedro Juli', '19/05/2015 15:17'),
(219, 0, 'HEMATOLOG', 'TI', '97121003302', 'CARMONA', 'FLOREZ', 'JOHN', 'MAURICIO', '10/12/1997', '17', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CRA 2 38-80 MANZ. E CASA 258', 'SAN MATEO', '8212223', '3213870543', 'LUZAY0583@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'ESTUDIANTE', 'LUZ AIDA FLOREZ', 'MAMA', '8212223', '3213870543', 'NO', 'NO', 'NO', 'CITA  CONTROL DRA SILVIA MARGARITA', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:20'),
(220, 0, 'DERMATOLOG', 'CC', '20704619', 'ROMERO', 'NO', 'BLANCA', 'MARIA', '05/03/1953', '62', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CRA 16  14-21', 'EL LAGO', 'NO', '3118226173', 'YOBELYNANA@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NELSON PAEZ TOVAR', 'ESPOSO', 'NO', '3114710009', 'NO', 'NO', 'NO', 'CITA  CONTROL', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:26'),
(221, 0, 'GINECOONCOLOG', 'CC', '52620901', 'GUTIERREZ', 'TOVAR', 'NANCY', '0', '30/06/1979', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 98A #61-53', 'SANTIAGO DE ATALAYA', '0', '3209744726', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'AMA DE CASA', 'JUAN CARLOS SILVA', 'ESPOSO', '0', '3124893431', 'SI', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 15:08'),
(222, 0, 'ENDOCRINOLOG', 'CC', '39982509', 'LEAL', 'SANCHEZ', 'EULICE', '0', '04/04/4444', '43', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 7MA #93-35', 'CIUDAD TINTAL', '4600545', '3103308171', 'NO TIENE', 'BACHILLER', 'TESTIGO DE JEOVA', 'AMA DE CASA', 'NANCY LEAL', 'HIJA', '0', '3209641560', 'SI', 'NO', 'NO', '', '', 'Daniela L', '19/05/2015 15:26'),
(223, 0, 'HEMATOLOG', 'CC', '1067723800', 'PEREZ', 'ROJAS', 'LUIS', 'MIGUEL', '01/04/1993', '22', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 30#22-83 SUR', 'SAN JORGE CENTRAL', '4820443', '3204398456', 'VERCION20092010@HOTMAIL.COM', 'T', 'CRISTIANO', 'ALMACENISTA', 'GLADIS ROJAS BONILLA', 'TIA', '3162498748', '3162498748', 'SI', 'SI', 'NO', '', '', 'Pedro Juli', '19/05/2015 15:29'),
(224, 0, 'CIRUG', 'CC', '65498463', 'HERNANDEZ', 'VARGAS', 'DORALBA', 'NO', '04/04/1963', '53', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 73 SUR 92-85 TORRE 35  APTO 603', 'BOSA EL  RECREO', '3051181', '3177765130', 'DIEGOGARZON1824@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'EMPLEADA', 'DIEGO ESTEBAN  GARZON', 'HIJO', 'NO', '3164197995', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ  URG. PACIENTE LLAMANDO DESDE  EL  5  DE MARZO POR  FAVOR PRIORIDAD', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:33'),
(225, 0, 'HEMATOLOG', 'CC', '51809214', 'RAMIREZ', 'ROMERO', 'GLADYS', '0', '18/11/1964', '50', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CRA 74 # 48 -28', 'NORMANDIA', '4760530', '3133945156', 'GLARARO07@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANO', 'AMA DE CASA', 'MOISES MU', 'ESPOSO', '4760530', '3132180789', 'NO', 'SI', 'NO', 'ESTUVO HISPITALUIZADA POR TROMBO FLEBITOS Y POR ANEMIA', '', 'Laura Liliana Benitez Garc', '19/05/2015 14:59'),
(226, 0, 'GINECOONCOLOG', 'CC', '32768333', 'MAEQUEZ', 'LOPEZ', 'NELLY', 'LETICIA', '20/06/1975', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'LA VEGA', 'CRA 2DA # 23 - 07', 'LOS COCOBOS', '3214866440', '3214866440', 'MARLOMILE@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'FISIOTERAPEUTA', 'DAVID VARGAS', 'ESPOSO', '3112120025', '3112120025', 'SI', 'SI', 'NO', 'LLEVA UN MESESPERANDO LA CITA - FAVOR AJENDAR URGENTE', '', 'Laura Liliana Benitez Garc', '19/05/2015 15:13');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(227, 0, 'ONCOLOG', 'CC', '21109221', 'PEREZ', 'DE BOHORQUEZ', 'LUZ', 'ARGELIDA', '16/09/1953', '61', 'FEMENINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLETA', 'VEREDA EL VALSAL', 'FINCA SAN ANTONIO', '3103071972', '3103071972', 'STELLITA1972@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'STELLA BOHORQUEZ', 'HIJA', '3103071972', '3103071972', 'NO', 'NO', 'NO', 'AGENDAR EN 20 DIAS - CITA CON EL DOCTOR PIERRE - ESTA CITA ESPRA LLEVAR RESULTADOS', '', 'Laura Liliana Benitez Garc', '19/05/2015 15:22'),
(228, 0, 'ANESTESIOLOG', 'CC', '39639932', 'MORENO', '0', 'BLANCA', 'ESTRELLA', '16/05/1964', '51', 'FEMENINO', 'CAFAM', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'FUNZA', 'CALLE 20# 2 -38', 'EL HATO', '8235131', '3204104299', 'JHOANAPALACIOSM@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'JHOANA PALACIOS', 'HIJA', '8235131', '3214244177', 'NO', 'SI', 'NO', 'CITA PRIORITARIA -', '', 'Laura Liliana Benitez Garc', '19/05/2015 15:34'),
(229, 0, 'HEMATOLOG', 'CC', '1070948914', 'GALINDO', 'ORTIZ', 'HAROLD', 'ANDRES', '18/12/1987', '27', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FACATATIV', 'TRANSV 9 #2-14 ESTE', 'ARBOLEDA', '8430279', '3057134303', 'YUCAFERO@GMAIL.COM', 'TECN', 'CRISTIANO', 'EMPLEADO', 'JULIANA MENDEZ', 'ESPOSA', '8437005', '3104820318', 'SI', 'SI', 'NO', 'CITA PRIORITARIA DE ACUERDO A LA AUTORIZACI', '', 'Daniela L', '19/05/2015 15:36'),
(230, 0, 'HEMATOLOG', 'CC', '80017225', 'SANTAMARIA', 'SANTAMARIA', 'EDISON', '', '12/11/1977', '37', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE76A#99B-62', 'VILLAS DEL MADRIGAL', '5481132', '3118409581', 'RUBYSAMTAMA@HOTMAIL.COM', 'ESPECIALIZACI', 'CATOLICA', 'INGENIERO SISTEMAS', 'MARIA RUBIELA SANTAMARIA', 'MADRE', '5481132', '3118409581', 'SI', 'SI', 'NO', 'HACE MAS DE 15 DIAS QUE ESTA LLAMANDO POR CITA', '', 'sandraliliana agudelo', '19/05/2015 15:22'),
(231, 0, 'GINECOONCOLOG', 'CC', '52015139', 'GORDILLO', 'SANCHEZ', 'FLOR', 'MIRYAM', '22/10/1969', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 93B  71-49', 'EL  RECREO', '7856117', '3102951682', 'MIRIAN0320091@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'ESTILISTA', 'DELIO MANIOS', 'ESPOSO', '7856117', 'NO', 'SI', 'SI', 'NO', 'CITA URG POR  PRIMERA VEZ  Y  ESTA LLAMANDO HACE  15  DIAS,  AGENDAR URG.  PARA  CIRUGIA', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:39'),
(232, 0, 'CIRUG', 'CC', '63354160', 'POBEDA', 'DELGADO', 'DORA', 'LIBIA', '04/03/1970', '45', 'FEMENINO', 'SALUTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA79#10D-59', 'ALSASIA', '4117695', '3115252428', 'DOLI-354@HOTMAIL.COM', 'T', 'CATOLICA', 'COMERCIANTE', 'ALBEIRO CHAPARRO', 'ESPOSO', '4125490', '3102230618', 'SI', 'SI', 'NO', '4 MESE DE ESPERA EN LAS Q SE A COMUNICADO EN REPETIDAS VECES SIN EXITO CON EL AGRABANTE DE VENOIR DEL HOSPITAL DE SAN JOSE CON ESPERA DE UN A', '', 'Pedro Juli', '19/05/2015 15:39'),
(233, 0, 'CIRUG', 'CC', '20380671', 'CRISTANCHO', 'NO', 'ANGELA', 'NO', '08/03/1962', '53', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CALLE 15  8-40', 'PENSILVANIA', 'NO', '3208997753', 'CINDY.AMACRI@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'CINDY AMAYA', 'HIJA', 'NO', '3208997753', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ PACIENTE LLAMANDO HACE DOS SEMANAS POR  FAVOR  CITA  PRIORITARIA', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:44'),
(234, 0, 'CIRUG', 'CC', '27141599', 'RUIZ', 'ADARMIS', 'MARIA', 'LUCIA', '08/07/1960', '55', 'FEMENINO', 'UNICAJA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 1 #6-13 ESTE', 'EL DORADO BAJO', '3335484', '3144412466', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'EMPLEADO', 'ENRIQUE CAMARGO', 'HIJO', '3335484', '3164080835', 'NO', 'SI', 'NO', '', '', 'Daniela L', '19/05/2015 15:43'),
(235, 0, 'PSICOLOG', 'CC', '1020786053', 'MORAD', 'QUINTERO', 'FELIPE', '0', '12/10/1993', '21', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 52#116-30', 'ALAMBRA', '6127476', '3128803718', 'NO TIENE', 'UNIVERSITARIO', 'CRISTIANO', 'ESTUDIANTE', 'CONSUELO QUINTERO', 'MADRE', '6127476', '3128803718', 'SI', 'SI', 'NO', 'PACIENTE CON CRISIS DEPRESIVA', '', 'Daniela L', '19/05/2015 15:52'),
(236, 0, 'HEMATOLOG', 'CC', '41382812', 'MORA', 'NO', 'MARIA', 'HELIODORA', '02/09/1946', '68', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'C ALLE  98B  70C-38', 'PONTEVEDRA', '5332628', '3166172070', 'MARITZAHDV@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'MARITZA MANRIQUE', 'HIJA', 'NO', '3166172070', 'NO', 'NO', 'NO', ' CITA  CONTROL  SILVIA  MARGARITA ROJAS POR  FAVOR  DAR PRIORIDAD PACIENTE  LLAMANDO  DESDE  LA  SEMANA  PASADA', '', 'Carmenza Moreno Mendoza', '19/05/2015 15:52'),
(237, 0, 'CIRUG', 'CC', '27141599', 'RUIZ', 'ADARNE', 'MARIA', 'LUCIA', '08/07/1960', '55', 'FEMENINO', 'UNICAJAS FACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE1#6-13ESTE', 'DORADO', '3335484', '3144412466', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'EMPLEADA', 'CARLOS  CAMARGO', 'HIJO', '3335484', '3164080835', 'SI', 'SI', 'NO', '', '', 'Sandra Liliana Agudelo', '19/05/2015 15:43'),
(238, 0, 'CIRUG', 'CC', '20440892', 'CLAVIJO', 'DE  BENITO', 'BERTHA', 'MARINA', '23/06/1953', '63', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'CAQUEZA', 'VEREDA  GIRON', 'DEL RESGUARDO', '7809879', '3124987588', 'AZUCENABENITO128@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'AZUCENABENITOCLAVIJO', 'HIJA', '7809879', '3118853511', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ  ES URG.', '', 'ADMINISTRADOR', '19/05/2015 16:45'),
(239, 0, 'COLOPROCTOLOG', 'CC', '65728297', 'TORRES', 'BENAVIDEZ', 'MIRYAM', 'NO', '18/04/1965', '50', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 182A 8D-26', 'SAN ANTONIO', '7960644', '3154923429', 'TANIAGMONOZTORRES@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'MADRE COMUNITARIA', 'TANIA GERALDINE MU', 'HIJA', 'NO', '3015654404', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA', '1ra Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 17:04'),
(240, 0, 'CIRUG', 'CC', '102362952', 'CESPEDES', 'CARDENAS', 'INGRID', 'CAROLINA', '04/03/1990', '25', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA81G # 73 F - 55 SUR', 'BOSA', '4684366', '3045808793', 'CAROLINAGUZMAN0304@GMAIL.COM', 'BACHILLER', 'NINGUNA', 'RECEPCIONISTA', 'DIANA CARDENAS', 'MADRE', '4684366', '3175030049', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:02'),
(241, 0, 'CIRUG', 'CC', '1022329207', 'SAMORA', 'BEELTRAN', 'EFIGENIA', 'NO', '06/01/1987', '28', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 31C#19A-23SUR', 'QUIROGA', '2780988', '3113212406', 'HUMBERTO3487@HOTMAIL.COM', 'T', 'CATOLICA', 'ENFERMERA', 'HUMBERTO ZAPATA', 'ESPOSO', '2780988', '3143732720', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '19/05/2015 17:11'),
(242, 0, 'ONCOLOG', 'CC', '24138009', 'MATIZ', 'PALACIOS', 'MARIA', 'MERCEDES', '04/10/1954', '61', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 40 68 I - 20 SUR', 'VILLA NUEVA', '3057179', '3144557499', 'N', 'BACHILLER', 'CATOLICA', 'HOGAR', 'AIDAPE', 'SOBRINA', 'NO', '3213961639', 'SI', 'SI', 'NO', 'CITA  PRIMERA VEZ PACIENTE ESTA LLAMANDO HACE DOS SEMANAS', '4ta Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 17:12'),
(243, 0, 'HEMATOLOG', 'CC', '19212858', 'DUQUE', 'RAMIREZ', 'LUIS', 'CARLOS', '31/05/1953', '62', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG89B#118-45', 'CIUDADELA COLSUBSIDIO', '8064307', '3168643632', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'CONDUCTOR', 'CECILIA HERNADEZ', 'ESPOSA', '8064307', '3158862130', 'NO', 'NO', 'NO', '4 MESES PIDIENDO CITA SIN RESPUESTA PACIENTE CON TRATAMIENTO SUSPENDIDO POR FALTA DE CONTROL CON LA DOCTORA SILVIA MARGARITA PORRAS', '2da Llamada', 'Pedro Juli', '19/05/2015 17:14'),
(244, 0, 'ONCOLOG', 'CC', '20390549', 'ACU', 'RODRIGUEZ', 'ROSA', 'NO', '28/12/1932', '53', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ARBEL', 'DIAG159B#14A-40INTE22APTO201', 'VILLAS DE MEDITERRANEO', '6696966', '3123515601', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'JESUS ACU', 'HERMANO', '6696966', '3123515601', 'NO', 'SI', 'NO', 'CONTROL DOCTOR GUSTAVO MARQUEZ', '2da Llamada', 'Sandra Liliana Agudelo', '19/05/2015 17:24'),
(245, 0, 'UROLOG', 'CC', '17156912', 'BARRERO', 'CHAVES', 'JOSE', 'IGNACIO', '01/09/1946', '68', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CALLE 13  SUR  11A-69 BLOQUE K APTO 301', 'CIUDAD JARDIN SUR', '2094496', '3137684650', 'NO', 'BACHILLER', 'CATOLICA', 'COMERCIANTE', 'CARLOS ANDRES BARRERO PANESO', 'HIJO', 'N O', '3138850489', 'SI', 'SI', 'NO', 'CITA POR PRIMERA PRIORITARIA POR  CIRUGIA', '1ra Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 17:28'),
(246, 0, 'CIRUG', 'CC', '51932125', 'OSPINA', 'RIA', 'SANDRA', 'PATRICIA', '20/06/1967', '47', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA47-144-24', 'PRADO PINZON', '6271465', '3224119412', 'POSPINA@SITCARSA.COM', 'BACHILLER', 'CATOLICA', 'AUXILIAR DE TRAMITS', 'OSPINA RIA', 'HIJO', '3133347250', '3133347250', 'SI', 'SI', 'NO', 'UN MES DE ESPERA EN LA CITA SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '19/05/2015 17:30'),
(247, 0, 'ENDOCRINOLOG', 'CC', '51960537', 'ARIAS', 'ARGOTE', 'YAQUELIN', '', '01/02/1979', '46', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'AV CARACAS#55-66', 'CHAPINERO', 'NO', '3153164439', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'AUXILIAR ODONTOLOGA', 'MALORI ROJAS', 'HIJA', 'NO', '3182711808', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '19/05/2015 17:30'),
(248, 0, 'ONCOLOG', 'CC', '21029837', 'NEIRA', 'DE VALERA', 'ELSA', '0', '21/07/1940', '74', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 103B #82-31', 'OLIVIA', '8054004', '3114522915', 'NO TIENE', 'T', 'CRISTIANA', 'PENSIONADA', 'MELISA PEREZ', 'NIETA', '8054004', '3186036842', 'NO', 'SI', 'NO', '0', '1ra Llamada', 'Daniela L', '19/05/2015 17:06'),
(249, 0, 'HEMATOLOG', 'CC', '17064080', 'LUQUE', 'TINJACA', 'JUSTINO', 'MIGUEL', '25/08/1942', '72', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 2 69B-04', 'CENTRO AMERICAS', '2905529', '3214827232', 'NO', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'MAGDALENA LUQUE ARANZA', 'HIJA', '2905529', '3214827232', 'NO', 'NO', 'SI', 'CONTROL DESPUES DE  QUIMIOTERAPIA PARA EL  1 DE JUNIO DRA SILVIA MARGARITA', '1ra Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 17:43'),
(250, 0, 'HEMATOLOG', 'CC', '53932283', 'GUEVARA', 'ROZO', 'LEIDY', 'MARCELA', '21/07/1985', '30', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CR 4TA ESTE #39-91', 'SAN MATEO', '8213198', '3102165571', 'LEIMAR85@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'JOSE WILIAM MATIZ', 'ESPOSO', '8213198', '3118924268', 'SI', 'SI', 'NO', 'PACIENTE CON PROBLEMAS DE TROMBOSIS QUE PRESENTA MORADOS EN EL CUERPO Y DESEA SER DIAGNOSTICADO', '1ra Llamada', 'Daniela L', '19/05/2015 17:44'),
(251, 0, 'CIRUG', 'RC', '1023941503', 'MILLAN', 'OROZCO', 'PAULA', 'VALENTINA', '22/03/2013', '2', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AVENI1#5A-04', 'LAS CRUCES', '5517204', '3125536890', 'VANEOROSCO1945@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'VANESA OROSCO', 'MADRE', '5517204', '3209662203', 'SI', 'SI', 'NO', '22 DIAS DE ESPERA SIN RESPUESTA URGENTE', '2da Llamada', 'Pedro Juli', '19/05/2015 17:39'),
(252, 0, 'CIRUG', 'CC', '52966131', 'CAICEDO', 'LEON', 'LEIDY', 'VIVIANA', '12/11/1983', '31', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CALLE 167 # 56 -25', 'BRITALIA NORTE', '3115456084', '3115456084', 'VIVICAICEDOLE@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'CONTADORA', 'MARTA LEON', 'MADRE', '3144707040', '3144707040', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:18'),
(253, 0, 'CIRUG', 'CC', '51791522', 'MOJICA', '0', 'SARA', 'CARMEN', '19/02/1963', '52', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 11B # 49 -01 SUR', 'MOLINOS DE LA CARACAS', '6637080', '3134985979', 'MOJICASRACARMEN@YAHOO.COM.', 'BACHILLER', 'CATOLICA', 'SECRETARIA', 'JENNIFER GONZALES', 'HIJA', '6637080', '3012453649', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:26'),
(254, 0, 'CIRUG', 'CC', '19202078', 'ROA', 'BARRAGAN', 'ALFONSO', '0', '07/03/1953', '72', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 57 # 46 -35', 'ESMERALDA', '2214241', '3108175903', 'AROAB53@GMAIL.COM', 'ESPECIALIZACI', 'CATOLICA', 'PENSIONADO', 'VIVA DEVIA', 'ESPOSA', '2214142', '3214946603', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:34'),
(255, 0, 'CIRUG', 'CC', '32422102', 'RAMIREZ', 'DE CADAVID', 'OFELIA', 'DEL SOCORRO', '29/05/1945', '69', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 55# 152 -40', 'MAZUREN', '6960691', '3143684719', 'OFELIADECADAVID@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'PENSIONADA', 'VICTORIA CADAVID', 'HIJA', '7031494', '3142407467', 'SI', 'NO', 'NO', 'TIENE ANTECEDENTESDE CANCER FAMILIAR', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:43'),
(256, 0, 'COLOPROCTOLOG', 'CC', '20545734', 'ROZO', '', 'ANA', 'VITALIA', '19/04/1956', '59', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CALAMAR', 'KM5 VIA LA CALERA', 'SAN LUIS', '5235298', '3132047107', 'NO TIENE', 'PRIMARIA', 'NINGUNA', 'AMA DE CASA', 'NELSON HERNANDEZ', 'HIJO', 'NO', '3102350673', 'NO', 'SI', 'NO', 'CONTROL DOCTOR MONROY', '7ma Llamada', 'Sandra Liliana Agudelo', '19/05/2015 17:42'),
(257, 0, 'CIRUG', 'CC', '3098671', 'MENDEZ', 'NO', 'JOSE', 'ELIANO', '17/06/1957', '58', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MEDINA', 'NO', 'NO', 'NO', '3213961639', 'NO', 'OTRO', 'CATOLICA', 'AGRICULTOR', 'AIDA PE', 'SOBRINA', 'NO', '3213961639', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ LLEVA VARIAS SEMANAS LLAMANDO', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '19/05/2015 17:47'),
(258, 0, 'CIRUG', 'CC', '1030623541', 'ARVELAES', 'ARTEAGA', 'SONIA', 'PATRICIA', '06/04/1993', '22', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 79F #48A-15 SURQ', 'KENNEDY', '4743822', '3124086322', 'ARTEAGASONIA1@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'EMPLEADO', 'CECILIA ARTEAGA', 'MADRE', '4743822', '3213063531', 'SI', 'NO', 'NO', 'PACIENTE ESPERANDO CONTROL DESDE ABRIL', '2da Llamada', 'Daniela L', '19/05/2015 17:47'),
(259, 0, 'ONCOLOG', 'CC', '21030123', 'HUERTAS', 'DE ACOSTA', 'ANA', 'SOILA', '25/08/1943', '71', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UBAL', 'CALLE 131 F  # 91 -24', 'SANTA ANA', '5363156', '3157817806', 'VIRGINIA.ACOSTA.HUERTAS@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'VIRGINI ACOSTA', 'HIJA', '5363156', '3157817806', 'SI', 'SI', 'NO', 'REMITIDA AL ONCOLOGO', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:49'),
(260, 0, 'HEMATOLOG', 'CC', '80411666', 'ACEVEDO', 'ORTIZ', 'JOSE', 'VICENTE', '15/08/1967', '48', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE166A#3-21', 'DORATAMA', '4756100', '3132289663', 'NACEVEDOVICENTE6640@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'ANA MARIA JIMENES', 'ESPOSA', '4756100', '3142639377', 'NO', 'SI', 'NO', 'CONTROL DOCTORA SILVIA MARGARITA', '3ra Llamada', 'Sandra Liliana Agudelo', '19/05/2015 17:49'),
(261, 0, 'CIRUG', 'CC', '39535477', 'VASQUEZ', 'RODRIGUES', 'SONIA', 'CRISTINA', '27/05/1965', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL40GSUR#81B-20', 'LA AMPARO', '5707674', '3107599508', 'NO TIENE', 'BACHILLER', 'TESTIGO DE JHEOVA', 'OPERARIA', 'CAMPO ELIAS VERNA', 'ESPOSO', '5706674', '3107599508', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '19/05/2015 17:49'),
(262, 0, 'ONCOLOG', 'CC', '207301402', 'GIL', 'VELANDIA', 'ANA', 'LAURA', '02/10/1970', '44', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHOCONT', 'SOATAMA', 'SOATAMA', '3192369117', '3192369117', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'VICTOR GIL', 'ESPOSO', '3192369117', '3192369117', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '19/05/2015 17:57'),
(263, 0, 'CIRUG', 'CC', '1012362952', 'CESPEDES', 'CARDENAS', 'INGRID', 'CAROLINA', '04/03/1990', '25', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 81G # 73F - 55SUR', 'BOSA', '4684366', '3045808793', 'CAROLINAGUZMAN0304@GMAIL.COM', 'BACHILLER', 'NINGUNA', 'RECEPCIONISTA', 'DIANA CARDENAS', 'MADRE', '4684366', '3175030049', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '19/05/2015 17:57'),
(264, 0, 'UROLOG', 'CC', '207301402', 'GIL', 'VELANDIA', 'ANA', 'LAURA', '02/10/1970', '44', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHOCONT', 'SOATAMA', 'SOATAMA', '3192369117', '3192369117', 'NOTIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'VICTOR GIL', 'ESPOSO', '3192369117', '3192369117', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '19/05/2015 18:01'),
(265, 0, 'HEMATOLOG', 'CC', '28576581', 'VELASQUEZ', 'BARRERO', 'ESMERALDA', 'NO', '24/06/1975', '39', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 26 SUR 95A-49', 'TIERRA BUENA', '4489024', '3107793834', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'ALEJANDRO BLANCO', 'HIJO', 'NO', '3192124791', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ URG', '1ra Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 18:04'),
(266, 0, 'COLOPROCTOLOG', 'CC', '11517513', 'OLARTE', 'MAECHA', 'PEDRO', 'JULIO', '07/08/1961', '53', 'MASCULINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'CALLE 9 #21-22', 'LA PALMITA', '0', '3214102301', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'DESEMPLEADO', 'BLANCO OLARTE', 'HERMANA', '0', '3115719240', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Daniela L', '19/05/2015 17:51'),
(267, 0, 'COLOPROCTOLOG', 'CC', '37214966', 'MORENO', 'DE RIVERA', 'ADELA', '0', '08/11/1945', '70', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'NORTE DE SANTANDER', 'CUCUTILLA', 'AV 11C #8-26', 'TORCOROMA', '5761840', '3013508796', 'NO TIENE', 'PRIMARIA', 'NO ESPECIFICA', 'AMA DE CASA', 'LISSETH MONROY', 'ASESORA EPS', '5190088', '31766827393', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Daniela L', '19/05/2015 18:03'),
(268, 0, 'ANESTESIOLOG', 'CC', '52708286', 'CUERVO', 'GUTIERREZ', 'LUZ', 'DEYANIRA', '22/03/1985', '35', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 71A #20-37', 'BARRIOS UNIDOS', '2104178', '3102100865', 'BRUJAFELIZ@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADA', 'MARIEL GUTIERREZ', 'MADRE', '2104178', '3123405886', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '19/05/2015 18:08'),
(269, 0, 'ANESTESIOLOG', 'CC', '20863646', 'GIL', 'DE  HERNANDEZ', 'ANA', 'BERTILDA', '22/11/1940', '75', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 65A 74-87', 'REAL', '4381276', '310209927', 'NO', 'NINGUNO', 'CATOLICA', 'HOGAR', 'DORIS HERNANDEZ', 'HIJA', 'NO', '3124313556', 'NO', 'NO', 'NO', 'CITA URG.NECESITA UNA  CIRUGIA', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '19/05/2015 18:08'),
(270, 0, 'DERMATOLOG', 'CC', '35334313', 'CAVIEDES', 'GUILLEN', 'MARIA', 'DEL  CARMEN', '12/03/1953', '62', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANSV 16C 49-31SUR', 'MARCO FIDEL SUAREZ', 'NO', '3144049257', 'NO', 'NINGUNO', 'CATOLICA', 'HOGAR', 'LUIS FERNANDO BARRERA', 'ESPOSO', 'NO', '3144049257', 'NO', 'NO', 'NO', 'PACIENTE REQUIERE CRIOTERAPIA URG.', '4ta Llamada', 'Carmenza Moreno Mendoza', '19/05/2015 18:12'),
(271, 0, 'CL', 'CC', '20253822', 'PAREDES', '', 'ANGELICA', '', '13/04/1929', '86', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL37SUR6C-47ESTE', 'BELLA VISTA', '3679303', '3103227345', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'JORGUE ROSAS', 'ESPOSO', '3679303', '3103227345', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '19/05/2015 18:05'),
(272, 0, 'COLOPROCTOLOG', 'CC', '79658429', 'GALVAN', 'DIAS', 'MIGUEL', '0', '05/01/1973', '42', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CALLE 74A SUR # 14A -13', 'SANTA LIBRADA', '761270', '310349847', 'NO TIENE', 'PRIMARIA', 'CRISTIANO', 'COMERCIANTE', 'ROSA ROMERO', 'CU', '7611270', '3138456737', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL CON ELDOCTOR  ANDRES MONROY, EL PACIENTE ESTA SANGRANDO FAVOR TRATAR COMO URGENCIA', '2da Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 07:10'),
(273, 0, 'ONCOLOG', 'CC', '28994518', 'MATEUS', 'LUENGAS', 'MARIA', 'YOLANDA', '04/09/1962', '52', 'FEMENINO', 'COLSUBCIDIO', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'FUSAGASUG', 'CALLE 21 # 48A 25', 'GRAN COLOMBIA', '3108011734', '3108011734', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'MARTA SANCHEZ', 'CU', '8046282', '3143424940', 'NO', 'NO', 'NO', 'ES UN CONTRO ANUAL , LLEVA ESPERANDO UN MES', '4ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 07:18'),
(274, 0, 'UROLOG', 'CC', '69113467', 'CARRE', 'BARRERA', 'DAGOBERTO', '0', '26/08/1958', '56', 'MASCULINO', 'CAFE SALUD', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 68B BIS # 3 -35 SUR', 'FLORESTA SUR', '4462635', '30122290960', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'PENSIONADO', 'MARIA CORDOBA', 'ESPOSA', '4462635', '3156170324', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 07:25'),
(275, 0, 'UROLOG', 'CC', '79113467', 'CARRE', 'BARRERA', 'DAGOBERTO', '0', '26/08/1958', '56', 'MASCULINO', 'CAFE SALUD', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 68B BIS # 3 -35', 'FLORESTA SUR', '4462635', '3012229060', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'PENSIONADO', 'MARIA CORDOBA', 'ESPOSA', '4462635', '3156170324', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 07:44'),
(276, 0, 'CIRUG', 'CC', '1061762912', 'PEREZ', 'MONTILLA', 'LEYDY', 'GOHANNA', '04/06/1993', '21', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA68DBIS#38C-11SUR', 'ALQUERIA', '4032390', '3045288623', 'LEIDYJOHANA406@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'OFELIA MEDINA', 'AMIGA', '5635125', '3143912373', 'NO', 'NO', 'NO', 'CONTROL CON LA DOCTORA CUBILLOS', '2da Llamada', 'Sandra Liliana Agudelo', '20/05/2015 07:51'),
(277, 0, 'HEMATOLOG', 'CC', '12103842', 'ROJAS', 'AGUILAR', 'CONSTANTINO', '', '06/05/1952', '63', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA87JBIS#53-14SUR', 'BOSA', '7831224', '3132934253', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'LUCY MOLLANO HERNANDEZ', 'ESPOSA', '7831224', '3132934253', 'NO', 'SI', 'NO', 'CONTROL DOCTORASILVIA MARGARITA ROJAS', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 08:00'),
(278, 0, 'HEMATOLOG', 'CC', '2232212', 'SANCHEZ', 'RAMOS', 'ARTURO', '0', '10/08/1927', '88', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 140 #111A-12', 'LAS FLORES', '6887541', '3156065951', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'PENSIONADO', 'LIGIA SANCHEZ', 'HIJA', '0', '3156065951', 'NO', 'SI', 'NO', 'PACIENTE SOLICITANDO CITA CONTROL DESDE 13 DE MARZO. PACIENTE DE EDAD AVANZADA DEBE VERSE CON EL M', '4ta Llamada', 'Daniela L', '20/05/2015 08:09'),
(279, 0, 'HEMATOLOG', 'CC', '19493351', 'SUAREZ', 'ZANABRIA', 'WILLIAN', '0', '11/09/1956', '58', 'MASCULINO', 'FAMISANR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 39C # 26 -36 SUR', 'LA GUACA', '4580982', '3112170097', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'COMERCIANTE', 'JAIRO FERNADEZ', 'CU', '2792937 - 4580982', '3115327437', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL CON ELDOCTOR DANIELBERMUDEZ', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 07:58'),
(280, 0, 'CIRUG', 'CC', '41644600', 'CEPULVEDA', 'DE MARTINEZ', 'ELVINA', 'ESTER', '15/08/1952', '62', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'TRANSVERSAL 6TA B BIS ESTE # 32C - 03 SUR', 'ORACIO ORJUELA', '4657506', '3157636215', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'ALEJANDRA CARDONA', 'HERM,ANA', '3107692100', '3107692100', 'NO', 'NO', 'NO', '', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:03'),
(281, 0, 'CIRUG', 'CC', '35329976', 'ALFARO', 'PEREA', 'LUZ', 'MARINA', '16/12/1960', '54', 'FEMENINO', 'CAPITAL  SALUD', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CALLE 73  30-40 PISO4', '12 DE  OCTUBRE', '6616436', '3143931132', 'LUZMARINAALFAROPEREA@YAHO.ES', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'HECTOR MANUEL  CUBILLOS MENDEZ', 'ESPOSO', 'NO', '3123342331', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 08:14'),
(282, 0, 'HEMATOLOG', 'CC', '7334885', 'MARTINEZ', 'LESMES', 'FABIO', '', '19/10/1978', '36', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE35#35-27', 'CIUD VERDE', '9000298', '3134735526', 'JULYFABE28@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'ORFEBRERIA', 'ANI CASTEBLANCO', 'ESPOSA', '4477295', '3202927782', 'NO', 'SI', 'SI', 'CONTROL BERMUDEZ', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 08:06'),
(283, 0, 'CIRUG', 'CC', '41644600', 'CEPULVEDA', 'DE MARTINEZ', 'ELVINA', 'ESTER', '15/08/1952', '62', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'TRANS 6TS B BIS  ESTE # 32C - 04 SUR', 'ORACIO ORJUELA', '4657506', '3157636215', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'ALEJANDRA CARDONA', 'HERMANA', '3107692100', '3107692100', 'NO', 'SI', 'NO', '', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:19'),
(284, 0, 'ONCOLOG', 'CC', '3068301', 'SANTIAGO', '', 'NOLBERTO', 'ENRIQUE', '02/11/1944', '70', 'MASCULINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'LA CAPILLA', 'CRA11#9-40', 'VILLA SETENTA', '8756285', '3125496502', 'BIMILNA.02@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'DIANA AVILAN', 'AMIGA', '8756285', '3142581152', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 08:21'),
(285, 0, 'ONCOLOG', 'CC', '41644600', 'CEPULVEDA', 'DE MARTINEZ', 'ELVINA', 'ESTER', '15/08/1952', '62', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'TRANS 6TA B BIS ESTE # 32 - 03 SUR', 'ORACIO SEPULVEDA', '4657506', '3157636215', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'ALEJANDRA  CARDONA', 'HERMANA', '3107692100', '3107692100', 'NO', 'NO', 'SI', '', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:24'),
(286, 0, 'CL', 'CC', '41644600', 'CEPULVEDA', 'DE MARTINEZ', 'ELVINA', 'ESTER', '15/08/1952', '62', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'TRANS 6TA BIS ESTE # 32C - 03 SUR', 'ORACIO SEPULVEDA', '4657506', '3157636215', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'ALEJANDRA  CARDONA', 'HERMANA', '3107692100', '3107692100', 'NO', 'SI', 'NO', 'ES LA  TERCERA VEZ QUE LLAMA PARA PEDIR ESTAS  CITAS - LA ORDEN SE LE VENCE EN 20 DIAS - FAVOR AJENDAR LOMAS PRONTO POSIBLE.', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:27'),
(287, 0, 'CIRUG', 'CC', '41642741', 'ROJAS', 'NI', 'MARIA', 'MERCEDES', '13/04/1954', '61', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AVDA CRA 91  131-12 BLOQUE 9  APTO 420', 'LA PALMA SUBA', '6926599', '3133246069', 'MECHAS1890@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'MARIA MERCEDES REINEL  ROJAS', 'HIJA', '6926599', '3208728737', 'SI', 'SI', 'NO', 'NECESITA  URG. ORDEN DE  EXAMENES SENORA HA  LLAMADO  DESDE  EL  15 DE ABRIL DOS VECES POR  SEMANA  MUY  INCONFORME CON  EL  SERVICIO NECESITA URG LA  CITA  MANIFIESTA  PONER  TUTELA  Y  DERECHO DE  PETICION  SE DA EXPLICACION POR AGENDA DEMORADA', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '20/05/2015 08:20'),
(288, 0, 'HEMATOLOG', 'CC', '21051000', 'GOMEZ', 'DE ROZO', 'LUCILA', 'NO', '27/02/1932', '83', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 8  78-13', 'CASTILLA', '7515150', '3142126498', 'NO', 'BACHILLER', 'CATOLICA', 'PENSIONADA', 'MARIA ESPERANZA ROZO GOMEZ', 'HIJA', 'NO', '3102269753', 'NO', 'NO', 'NO', 'CITA  DE  CONTROL  PARA LECTURA DE EXAMENES URG.  DRA SILVIA MARGARITA ROJAS URG   PRIORIDAD', '4ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 08:37'),
(289, 0, 'HEMATOLOG', 'CC', '1018484106', 'CARVAJAL', 'VERANO', 'NATALIA', 'ISABEL', '15/03/1996', '19', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 16 #10A-84', 'LUNAPARK', '6044906', '3115945821', 'VERANO@JAVERIANA.EDU.COM', 'UNIVERSITARIO', 'CATOLICO', 'ESTUDIANTE', 'CLAUDIA VERANO', 'MADRE', '3208320 EXT 5199', '3115945822', 'NO', 'SI', 'NO', 'URGENTE- PACIENTE ESPERANDO CITA DESDE EL 23 DE FEBRERO SIN EXITO. DESEA SE LE SEA ASIGNADA CON URGENCIA DEBIDO A QUE SE LE VENCE SU AUTORIZACI', '3ra Llamada', 'Daniela L', '20/05/2015 08:24'),
(290, 0, 'ORTOPEDIA GENERAL', 'CC', '3072811', 'JUCINICO', '', 'PEDRO', 'ANTONIO', '29/12/1952', '62', 'MASCULINO', 'UNICAJA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 78 SUR #44A-26', 'POTOSI', '7172447', '3204524987', 'PEDROJ_1523@HOTMAIL.COM', 'PRIMARIA', 'CATOLICO', 'DESEMPLEADO', 'ANDREA JUCINICO', 'HJA', '7172447', '3204524987', 'SI', 'NO', 'NO', 'PACIENTE SE HA COMUNICADO DESDE ABRIL, YA POSEE LOS RESULTADOS DE EXAMENES SOLICITADOS POR EL ESPECIALISTA. PACIENTE REMITIDO DESDE EL 3 DE FEBRERO Y LA AUTORIZACI', '3ra Llamada', 'Daniela L', '20/05/2015 08:37'),
(291, 0, 'HEMATOLOG', 'CC', '52409333', 'SUAREZ', 'NO', 'DIANA', 'MARCELA', '10/09/1978', '36', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 81 I  73B-39 SUR', 'BOSA', '3602300', '3174703021', 'DIAMAR2507@HOTMAIL.COM', 'TECN', 'CASTOLICA', 'ASISTENTE DE  TESORERIA', 'HECTOR ALIRIO RODRIGUEZ NOVOA', 'ESPOSO', 'NO', '3172750121', 'NO', 'NO', 'NO', 'CITA  CONTROL URG.   PACIENTE LLEVA ESPERANDO  CITA  DESDE FINAL DE ABRIL  Y  NO SE LA HAN ASIGNADO PRIORIDAD', '4ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 08:46'),
(292, 0, 'NEUROCIRUG', 'CC', '21173171', 'MORALES', 'DE POSADA', 'ELIZABETH', '', '08/12/1953', '61', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'META', 'ACAC', 'CALLE15#24-50', 'ANCACIAS', '6566767', '3115624734', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'JAIME POSADA', 'ESPOSO', '0', '3103289099', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 08:29'),
(293, 0, 'HEMATOLOG', 'CC', '80275297', 'BELTRAN', 'LOPEZ', 'JUSTO', 'CESAR', '19/06/1960', '54', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'MADRID', 'CALLE 4TA A # 16 -39', 'PRADOS DEMADRID', '3115835215', '3115835215', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'OPERARIO', 'DORA SEGURA', 'ESPOSA', '3115839020', '3115839020', 'NO', 'NO', 'NO', 'YA ESTIVO EN MEDICINA FAMILIAR PUESTO QUE LOS EXAMENES NO SALIERON BIEN,ESTA CITA ES DE URGENCIA -ES UN CONTROL DE HEMATOLOGIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:35'),
(294, 0, 'HEMATOLOG', 'CC', '52622605', 'PUERTO', 'RUBIO', 'ROSA', 'INES', '28/07/1973', '41', 'FEMENINO', 'FAMISANR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 8TAVA A BIS # 160 B -  12', 'SAN CRISTOBALNORTE', '6731586', '3123101229', 'ROSITAPUER@HOTMAIL.COM', 'T', 'CATOLICO', 'HIGIENE ORAL', 'HERNADO PUERTOS', 'PADREE', '6799268', '3106284014', 'NO', 'NO', 'NO', 'ES UNA CITA DECONTROL CON LA DOCTORA SILVIA ROJAS', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:41'),
(295, 0, 'CIRUG', 'CC', '51719664', 'SUAREZ', 'LISARAZO', 'GLORIA', 'ENCARNACION', '16/10/1959', '55', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 69B # 68 - 27', 'ESTRADA', '7507071', '3152493134', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'NORA SUAREZ', 'HERMANA', '4714073', '3143243030', 'NO', 'NO', 'NO', 'ES PRIORITARIA, ES UN CONTROL CON EL DOCTOR PABLO JOSE JIMENES', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:50'),
(296, 0, 'ONCOLOG', 'CC', '41343793', 'TAVERA', 'CASTRO', 'ISABEL', 'NO', '13/01/1943', '72', 'FEMENINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 1 BIS  2-50', 'EL TRIUNFO', '2331183', '3003009342', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MERCEDES TAVERA', 'HIJA', '2864743', '3003009342', 'NO', 'NO', 'SI', 'CITA PARA CONTROL DR.  PIERRE', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 08:53'),
(297, 0, 'CIRUG', 'CC', '41599039', 'IBA', '', 'ALCIRA', '', '23/11/1944', '70', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE8D#79-64', 'CASTILLA', '4724196', '3143643705', 'NOT IENE', 'NINGUNO', 'CATOLICA', 'AMA DE CASA', 'BETTY BARRERA', 'SOBRINA', '4724196', '3143643705', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 08:53'),
(298, 0, 'HEMATOLOG', 'CC', '79275080', 'PRIETO', 'APONTE', 'NICOLAS', 'RICARDO', '12/04/1963', '52', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 169 # 16C - 10', 'SANTA MONICA', '7494116', '3102526822', 'NRPRIETOA@GMAIL.COM', 'T', 'CATOLICA', 'INDEPENDIENTE', 'MARI VARGAS', 'ESPOSA', '7494116', '3103051008', 'NO', 'NO', 'NO', 'ES UN CONTRO DE HEMATOLOGIA, LLEVA ESPERANDO 1 MESPOR LA CITA - URGENTE', '4ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 08:59'),
(299, 0, 'DERMATOLOG', 'CC', '41599039', 'IBA', '', 'ALCIRA', '', '23/11/1944', '70', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE8D#79-64', 'CASTILLA', '4724196', '3143643705', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'AMA DE CASA', 'BETTY BARRERA', 'SOBRINA', '4724196', '3143643705', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 09:04'),
(300, 0, 'NUTRICI', 'CC', '429795', 'RODRIGUEZ', 'VIGOYA', 'JOSE ANTONIO', 'SAMUEL', '10/05/1954', '65', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UBAQUE', 'VEREDA RIO NEGRO', 'VEREDA RIO  NEGRO', '8487101', '3115322260', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'CONDUCTOR', 'LUIS HERNANDO VARELA', 'AMIGO', '8487101', '3112691690', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 09:09'),
(301, 0, 'HEMATOLOG', 'CC', '3153389', 'SANABRIA', 'NO', 'GERMAN', 'EUCLIDES', '27/04/1959', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 72B 12-09', 'EL  PERDOMO', '8049044', '3014317982', 'MARGARITACRUZNIETO@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARGARITA CRUZ', 'CU', '8049044', '3014317982', 'NO', 'NO', 'SI', 'CONTROL DR. BERMUDEZ  HA  LLAMADO  VARIAS OPORTUNIDADES URG.  PARA CONTROL DE QUIMIOTERAPIA', '4ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 09:00'),
(302, 0, 'ORTEPEDIA ONCOLOG', 'CC', '41378093', 'RIVERA', 'RODRIGUEZ', 'MARIA', 'BARBARA', '28/03/1946', '69', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TENJO', 'VEREDA QUINCE', 'VEREDA QUINCE', '0', '3134345029', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'DORA LIGIA VANEGAS', 'HIJA', '0', '3125412757', 'NO', 'SI', 'NO', 'CONTROL DOC LUI CARLOS GOMEZ NIETO', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 09:16'),
(303, 0, 'ONCOLOG', 'CC', '21021417', 'SARMIENTO', 'MARTINEZ', 'MARIELA', 'NO', '13/12/1961', '54', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TOCANCIP', 'CENTRO LOS  TILOS', 'NO', 'NO', '3204750340', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'DIANA SORA', 'FUNCIONARIA DE CAFAM', '8785158', '3113283673', 'NO', 'NO', 'NO', 'CITA CONTROL URG DR.  PIERRE', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 09:17'),
(304, 0, 'CIRUG', 'CC', '52840786', 'RODRIGUEZ', 'MENDOZA', 'ANNY', 'BRIGITTE', '11/08/1981', '33', 'FEMENINO', 'FAMISA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG49#86-40SURCASA626', 'PORTAL DE LAS AMERICAS', '7236743', '3118054418', 'ANIMARIARODRIGUEZ@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'LUZ MARINA CASTRO', 'MAMA', '7236743', '3125401408', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 09:22'),
(305, 0, 'HEMATOLOG', 'CC', '41530382', 'ARIAS', 'NO', 'CILIA', 'LEONOR', '23/07/1940', '74', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  142A  113C-50', 'SUBA', '6908095', '3202650321', 'SOFIAJANNETH@YAHOO.COM', 'PRIMARIA', 'CRISTIANO', 'HOGAR', 'SOFIA JANNETH TRIANA', 'HIJA', '6908095', '3202650321', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ  URG. ESTA LLAMANDO DESDE  ABRIL  Y  NO  HA  SIDO  ASIGNADO  LA  CITA  ES URG.', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '20/05/2015 09:23'),
(306, 0, 'ONCOLOG', 'CC', '3268331', 'ORJUELA', 'MALDONADO', 'JAIME', 'DE JESUS', '04/05/1943', '72', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SESQUIL', 'VEREDA EL UBAL', 'EL UBAL', '0', '3112941410', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'HOGAR', 'ANA ORJUELA', 'HIJA', '0', '3112941410', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '20/05/2015 08:46'),
(307, 0, 'HEMATOLOG', 'CC', '3252778678', 'DURAN', 'AVILA', 'MARCELA', '', '22/06/1983', '31', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 62A #91A-24', 'BOSA LAS MARGARITAS', '0', '3204568939', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'EMPLEADA', 'MARTHA AVILA', 'MADRE', '7837573', '0', 'NO', 'NO', 'NO', 'CITA CONTROL PARA VERIFICACION DE RESULTADOS DE EXAMENES', '1ra Llamada', 'Daniela L', '20/05/2015 09:11'),
(308, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '52919390', 'VALENTIN', 'PAEZ', 'ANAYIBE', '', '12/01/1985', '30', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 54F SUR #93-42', 'PORVENIR', '7230454', '3134838743', 'NO TIENE', 'OTRO', 'CATOLICO', 'EMPLEADA', 'REINALDO GUILLEN', 'ESPOSO', '7230454', '3143779925', 'SI', 'SI', 'NO', 'PACIENTE REMITIDO CON RESULTADOS LISTOS', '1ra Llamada', 'Daniela L', '20/05/2015 09:30'),
(309, 0, 'ONCOLOG', 'CC', '10156399', 'PAVA', '', 'AGUSTIN', '', '12/03/1947', '68', 'MASCULINO', 'ECOSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALL2C#37-B-70', 'VILLA INES', '2012199', '3103237257', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADO', 'BLANCA CECILIA DAZA', 'ESPOSA', '2012199', '3103237257', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 09:30'),
(310, 0, 'HEMATOLOG', 'CC', '20300798', 'YAYA', 'DE MELO', 'BLANCA', 'INES', '10/06/1941', '73', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA93-130C30', 'SUBA RINCON', '6816193', '3104830428', 'YM712008@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'LUZ MARINA MELO YAYA', 'HIJA', '4584644', '3112351864', 'SI', 'SI', 'NO', 'UNA SEMANA DE ESPERA SIN RESPUESTA', '2da Llamada', 'Pedro Juli', '20/05/2015 09:44'),
(311, 0, 'HEMATOLOG', 'CC', '20956288', 'LOPEZ', 'BALLEN', 'FANNY', '', '22/04/1963', '52', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SUBACHOQUE', 'CALL5A#5-02', 'SIGLO 21', '0', '3124782353', 'SANDRACAMARGO11@HOTMAIL.COM*', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'MARIA ELVIA BALLEN LOPEZ', 'MAMA', '0', '3124782353', 'SI', 'SI', 'NO', '', '3ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 09:37'),
(312, 0, 'CIRUG', 'CC', '51712158', 'BOHORQUEZ', 'PAEZ', 'MERY', 'ESPERANZA', '07/02/1964', '51', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CALLE 20  15B-19', 'NUEVA CASTILLA', '8298376', '3203278593', 'MERY.BOHORQUEZ.CONTRACTOR@BBVA.COM', 'OTRO', 'CATOLICA', 'INDEPENDIENTE', 'ALIRIO CORTES HERRERA', 'ESPOSO', 'NO', '3107886482', 'SI', 'SI', 'NO', 'SE', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '20/05/2015 09:34'),
(313, 0, 'CIRUG', 'CC', '40328360', 'CABRA', 'HUERFANO', 'VIVIANA', 'KATERIN', '05/12/1983', '31', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'META', 'VILLAVIEJA', 'MANZKCASA25NUEVA COLOMBIA 2', 'NUEVA COLOMBIA 2|', '0', '3118350853', 'KATVIVI05@HOTMAIL.COM', 'T', 'CATOLICA', 'INDEPENDIENTE', 'LUZ MILA HUERFANO', 'MAMA', '0', '3112365414', 'NO', 'SI', 'NO', 'CONTROL FABIO JIMENES', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 09:50'),
(314, 0, 'ORTEPEDIA ONCOLOG', 'CC', '4220109', 'PAEZ', 'ARIAS', 'JOSE', 'ROGELIO', '29/06/1940', '74', 'MASCULINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CRA 13  21B-69 LOCAL UNO', 'LA ARBOLEDA', '8298316', '3153983040', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ROSA MARIA PAEZ', 'HERMANA', 'NO', '3153983040', 'SI', 'SI', 'NO', 'CITA  URG POR  PRIMERA VEZ  URG.  HA  LLAMANDO POR  FAVOR  DAR  PRIORIDAD', '2da Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:06'),
(315, 0, 'HEMATOLOG', 'CC', '80543008', 'FANDI', 'CASTELLANOS', 'DANIEL', 'FERNANDO', '14/09/1978', '36', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA 12  20-62', 'SAN RAFAEL', 'NO', '3114785533', 'ANYVELAND@YAHOO.COM', 'OTRO', 'CATOLICA', 'EMPLEADO  RAMA JUDICIAL', 'ANA ELIZABETH VELANDIA', 'ESPOSA', 'NO', '3114785533', 'NO', 'NO', 'NO', 'CITA PARA  CONTROL  URG.  PACIENTE LLAMANDO  DESDE FINALES DE  ABRIL ES URG.', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:13'),
(316, 0, 'COLOPROCTOLOG', 'CC', '11517503', 'DUARTE', 'MAHECHA', 'PEDRO', 'JULIO', '07/09/1962', '53', 'MASCULINO', 'CAFESALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'PACHO', 'CRA80J#73G-33', 'BOSA', '7785602', '3138856867', 'JOSEOLARTE@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'INDEPENDIEWNTE', 'JOSE OLARTE', 'SOBRINO', '7785602', '3138856867', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 10:05'),
(317, 0, 'HEMATOLOG', 'CC', '1011218234', 'PE', 'RINCON', 'VALERIA', '', '28/04/2012', '3', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 149A #117-56', 'SUBA', '407923', '3114630498', 'FERCHO_2805@HOTMAIL.COM', 'NINGUNO', 'NO INDICA', 'NO INDICA', 'LUIS FERNANDO PE', 'PADRE', '407923', '3114630498', 'SI', 'SI', 'NO', 'PACIENTE HOSPITALIZADA  BAJO SOSPECHA DE ENFERMEDAD ONCOL', '1ra Llamada', 'Daniela L', '20/05/2015 10:18'),
(318, 0, 'HEMATOLOG', 'CC', '41517812', 'FORIGUA', 'NO', 'MARIA', 'BLANCA', '02/06/1951', '63', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 70C 110-33', 'BOSQUES  DE MARIANA', '4424898', '3138530970', 'NO', 'PRIMARIA', 'CATOLICA', 'OFICIOS  GEN ERALES', 'FERNANDO  CORTES', 'HIJO', 'NO', '3102073124', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:20'),
(319, 0, 'HEMATOLOG', 'CC', '79565830', 'CONTRERAS', 'VIVAS', 'FERNANDO', 'NO', '16/12/1971', '43', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 100  148-57 TORRE 2  APTO 603', 'LA  CAMPI', '4687126', '3115015835', 'F-241@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'OPERADOR  DE  BUS  ARTICULADO', 'MONICA  ALEXANDRA ROJAS', 'ESPOSA', 'NO', '3132301705', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ  URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:30'),
(320, 0, 'HEMATOLOG', 'CC', '23490438', 'VILLAMIL', 'DE SANCHEZ', 'MARIA', 'DEL  CARMEN', '09/07/1940', '74', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA31#53-12 SUR', 'SAN VICENTE', '4600712', '3132359372', 'ELINANSV77@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'ELINA SANCHEZ VILLAMIL', 'HIJA', '7104176', '3115735297', 'NO', 'NO', 'NO', 'PACIENTE CON OXIGENO PERMANENTE', '1ra Llamada', 'Pedro Juli', '20/05/2015 10:01'),
(321, 0, 'UROLOG', 'CC', '439340', 'URIBE', 'RODRIGUEZ', 'FELIX', 'ANTONIO', '10/05/1933', '82', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SIBAT', 'CRA2#9B-24', 'LLA INMACULADA', '52989063', '3213172564', 'NO TINE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ANA BEATRIZ URIBE', 'HIJA', '5298670', '3213172564', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 10:25'),
(322, 0, 'ONCOLOG', 'CC', '51556503', 'BAUTISTA', 'BENAVIDEZ', 'MARTHA', 'LUCIA', '16/09/1957', '58', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 13  80D-15', 'SANTA CATALINA', '4117099', '3004552642', 'JEEB43127@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'JULIO ERNESTO ESCOBAR', 'HIJO', 'NO', '3004552642', 'NO', 'NO', 'NO', 'CITA PARA  CONTROL POSTQUIRURGICO  URG.  POR FAVOR  DAR PRIORIDAD', '2da Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:34'),
(323, 0, 'COLOPROCTOLOG', 'CC', '17065754', 'ORTES', 'GUERRERO', 'JOSE', 'IGNACIO', '03/07/1942', '73', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'LA CALERA', 'CLL7-6-83', 'ALTO DE LA VIRGUEN', '8751343', '3115651850', 'NO TIENE', 'OTRO', 'CATOLICO', 'HOGAR', 'ELSA CORTES', 'HIJA', '8751343', '311561850', 'NO', 'NO', 'SI', '20 DIAS DE ESPERA SIN RESPUESTA CITA CON EL DOCTOR CARLOS FIGUEROA', '2da Llamada', 'Pedro Juli', '20/05/2015 10:37'),
(324, 0, 'CIRUG', 'CC', '41402919', 'DOMINGUEZ', '0', 'DORA', 'ALICIA', '24/02/1948', '67', 'FEMENINO', 'CRUZ BLANCA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 12 BIS # 20 - 45 SUR', 'SAN JOSE', '5606337', '3123213783', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'MARIA MOLINA', 'CU', '2671326', '2671326', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL PARA MIRAR UNOSEXAMNES POR QUISTES EN LA TIROIDES', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 09:11'),
(325, 0, 'ONCOLOG', 'CC', '4245931', 'GARCIA', 'LEON', 'JULIO', 'CESAR', '19/01/1979', '37', 'MASCULINO', 'COLSUBCIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 127 # 65 - 04', 'RINCON', '3124986139', '6814470', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'AMALIA BECERRA', 'ESPOSA', '3134406148', '3134406149', 'NO', 'NO', 'NO', 'ES UN CONTROL PARA MOSTRAR LOS EXAMNES AL DOCTOR  CARLOS BERMIDEZ', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 09:16'),
(326, 0, 'COLOPROCTOLOG', 'CC', '51647435', 'QUINCOSIS', 'ESTUPI', 'GRISELDA', '0', '14/06/1962', '52', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG 565 # 56 -29', 'VENECIA', '318380539', '3183805389', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'EMPLEADA', 'GILMA QUINOSIS', 'HERMANA', '6898776', '6898776', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 09:23'),
(327, 0, 'HEMATOLOG', 'CC', '51667412', 'MARTINEZ', 'NI', 'NIDIA', 'CESILIA', '10/09/1961', '53', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 98 BIS # 70C - 39', 'MONTE BELLO', '2261673', '3153200159', 'NELLMARN', 'BACHILLER', 'CATOLICA', 'HOGAR', 'NELLY MARTINEZ', 'HERMANA', '2261676', '3153200159 - 3134731745', 'NO', 'NO', 'NO', 'ES UN CONTROL CON LA DOCTORA SILVIA MARGARITA ROJAS', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 09:31'),
(328, 0, 'GINECOONCOLOG', 'CC', '41687905', 'SAINEA', 'POVEDA', 'GLADIS', '', '25/12/1955', '59', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANSV 3RS ESTE # 6D .-52 SUR', 'BUENOS AIRES', '2800141', '2800141', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ORLANDO GARCIA', 'ESPOSA', '3182025910', '3182025910', 'NO', 'NO', 'NO', 'ES UNA CITA DECONTROL PARA MOSTRAR EXAMNES', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 09:41'),
(329, 0, 'CIRUG', 'CC', '65498463', 'HERNADEZ', 'VARGAS', 'SOR', 'ALBA', '04/04/1963', '52', 'FEMENINO', 'FAMISANR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 73 SUR # 92 -85', 'BOSA', '2362411', '3177765130', 'DIEGOGARZON1824@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'EMPLEADO', 'DIEGO GARZON', 'HIJO', '2362411', '3164197995', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 10:05'),
(330, 0, 'DERMATOLOG', 'CC', '52116721', 'AROCA', 'UCURU', 'MARIA', 'NOELIS', '15/04/1973', '42', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 74C  SUR # 15 -62 ESTE', 'JUAN REY LA FLORA', '3654451', '3108016409', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'DAVID ROSO', 'ESPOSO', '3123008814', '3123008814', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 10:10'),
(331, 0, 'ONCOLOG', 'CC', '432876', 'VAQUERO', 'POLGA', 'ALVARO', '0', '28/04/1938', '77', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLA DE SAN DIEGO DE UBATE', 'CALLE 4TA # 8 -24', 'SAN FRANCISISCO', '3014453', '3112818955', 'ANBARO79@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANGELICA VAQUERO', 'HIJA', '3112818955', '3112818955', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL CON EL DOCTOR PIERRE -  - FAVOR AJENDAR PARA PRINCIPIOS DE JUNIO', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 10:24'),
(332, 0, 'CIRUG', 'CC', '432876', 'VAQUERO', 'POLGA', 'ALVARO', '0', '28/04/1938', '77', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLA DE SAN DIEGO DE UBATE', 'CALLE 4TA# 8 - 24', 'SAN FRANCISCO', '3014453', '3112818955', 'ANBARO79@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANGELICA VAQUERO', 'HIJA', '3112818955', '3112818955', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 10:41'),
(333, 0, 'ONCOLOG', 'CC', '262093', 'ORTIZ', 'DIAZ', 'NERY', 'ALBERTO', '27/05/1931', '84', 'MASCULINO', 'ENCOSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 103 64-75 INT 3  APTO 302', 'ANDES RESERVADO', '6942890', '3006005919', 'CARAYOR.ORTIZ@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'PENSIONADO  DE FERROCARRILES', 'CARMEN AIDE ORTIZ GARCIA', 'HIJA', '6942890', '3006005919', 'NO', 'NO', 'NO', 'CITA PARA CONTROL PARA  DETERMINAR  MEDICAMENTO DR.  ALEJANDRO ABUCHAR', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:40'),
(334, 0, 'CIRUG', 'CC', '1070955648', 'MONSALVE', 'SERRATO', 'CAROLINA', 'NO', '15/10/1989', '25', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 117  89A-25 INT 11 APTO 301', 'CORTIJO LOS  MANZANOS', 'NO', '3138376290', 'CARITTO_MO_89@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'JORGEVALDERRAMA', 'ESPOSO', 'NO', '3138376290', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:46');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(335, 0, 'ANESTESIOLOG', 'CC', '2956469', 'DUARTE', 'VELOZA', 'HECTOR', 'ADRIANO', '25/08/1977', '38', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 38 #9-39 SUR', 'CIUDAD MONTES', '2025496', '3107528317', 'MARDU-2003@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'MARCELA DUARTE', 'HERMANA', '2025496', '3115592670', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '20/05/2015 10:45'),
(336, 0, 'CIRUG', 'CC', '53905145', 'MARTINEZ', 'AYALA', 'YULEIDI', '', '13/02/1980', '35', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'KRA91CALLE42B-06SUR', 'DINDALITO', '2703207', '3203232990', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'YERI MARTINEZ', 'HERMANO', '0', '3134572721', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 10:40'),
(337, 0, 'CIRUG', 'CC', '14267908', 'PEREZ', 'PICORA', 'JUAN', 'VIANEY', '05/04/1957', '58', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'TRANSV 17 5B-10 SUR  LA  EMPRESA', 'COMPARTIR', '7120443', '3115782791', 'NO', 'BACHILLER', 'CATOLICA', 'SEGURIDAD', 'JAVIER PEREZ', 'HERMANO', '7782248', 'NO', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:51'),
(338, 0, 'ONCOLOG', 'CC', '22444526', 'LOPEZ', 'SANCHEZ', 'AMADA', 'ISABEL', '28/01/1968', '47', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SILVANIA', 'URBANIZACION EL  TAMBO  MANZ  J  CASA 8', 'SILVANIA', 'NO', '3214091989', 'NO', 'BACHILLER', 'CRISTIANA', 'OFICIOS VARIOS', 'MARIA  DEL ROSARIO  LOPEZ SANCHEZ', 'HERMANOS', 'NO', '3128480008', 'NO', 'NO', 'NO', 'CITA  PARA  CONTROL  URG.  SE  VENCE LA ORDEN  LLEVA DOS  SEMANAS LLAMANDO  POR  FAVOR  DAR PRIORIDAD A LA  CITA', '10ma Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 10:58'),
(339, 0, 'CIRUG', 'CC', '1022984102', 'ROSO', 'ROCHA', 'INGRID', 'PAOLA', '22/02/1993', '22', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG69#1B72 ESTE', 'SANTA MARTA', '7622741', '3138819704', 'RROUS-IP@HOTMAIL.COM', 'T', 'CRISTIANA', 'SECRETARIA', 'FLOR YANET ROCHA', 'MAMA', '2353130', '3117145857', 'SI', 'SI', 'NO', 'DOS MESES SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '20/05/2015 10:47'),
(340, 0, 'CIRUG', 'CC', '41688766', 'MORENO', 'DE GUTIERREZ', 'DORA', 'ELCI', '08/08/1958', '57', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA105I#64B-42', 'EL MUELLE ENGATIVA', '6080374', '3142696270', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADA', 'PEDRO GUTIERREZ', 'ESPOSO', '6080374', '3142696270', 'NO', 'SI', 'NO', 'CONTROL FABIO JIMENES', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 10:58'),
(341, 0, 'HEMATOLOG', 'CC', '34961218', 'BURGOS', 'NO', 'EDELMIRA', 'NO', '16/05/1950', '65', 'FEMENINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 132 151A-75', 'LISBOA  SUBA', '5380297', '3103400849', 'ENRIQUETA35@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ENRIQUETA PE', 'HIJA', '5380297', '3177184246', 'NO', 'NO', 'NO', 'CITA  PARA ENTREGA  DE EXAMENES DRA SILVIA MARGARITA ROJAS', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:03'),
(342, 0, 'HEMATOLOG', 'CC', '41412867', 'CHACON', 'CHACON', 'CELIA', 'NO', '05/12/1946', '68', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CALLE 7  5-51 INT 2 APTO 501', 'NUEVA SANTAFE', '3281878', '3123863419', 'LUNESDESOL@YAHOO.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ELSY  TAMARA CHACON', 'HIJA', '3281878', '3123863419', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:09'),
(343, 0, 'TRANSPLANTE DE M', 'CC', '19405888', 'GALINDO', 'LEON', 'JUAN', 'ROBERTO', '28/07/1960', '54', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA107ABIS#70-44}}}', 'BOSQUES DE MARIANA', '4404138', '3102739167', 'BSPRIETOR@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'BLANCA SOFIA PRIETO', 'ESPOSA', '4404138', '3163620775', 'NO', 'NO', 'SI', '', '2da Llamada', 'Pedro Juli', '20/05/2015 11:04'),
(344, 0, 'GINECOONCOLOG', 'CC', '52163113', 'PEDRAZA', 'RUIZ', 'YOLANDA', '', '20/02/1974', '41', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE49C#26-39', 'INGLES', '2036860', '3118854836|', 'YOLIS.COORDINADORA@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'COORDINADORA', 'NUBIA PEDRAZA', 'TIA', '2036860', '3147815291', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 11:05'),
(345, 0, 'ORTOPEDIA GENERAL', 'CC', '20316891', 'MEJIA', 'NO', 'ALCIRA', 'NO', '17/04/1941', '74', 'FEMENINO', 'COLSUBSIIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CALLE 5 A 2A-14 SUR', 'LAS MERCEDES', 'NO', '3202301920', 'NO', 'PRIMARIA', 'CRISTIANA', 'HOGAR', 'NUBIA MEJIA', 'HIJA', 'NO', '3125519699', 'NO', 'NO', 'NO', 'CITA  CONTROL POSTQUIRURGICO  DR.  JULIO JOSE ALVIZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:16'),
(346, 0, 'CIRUG', 'CC', '51985713', 'HERNANDEZ', 'SANTACRUZ', 'YAQUELIN', '', '03/09/1970', '44', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA103#13D-76', 'FONTIBON', '4158645', '3124782353', 'JAQUELINEBETO1970@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'LUIS HUMBERTO MONTERO F', 'ESPOSO', '4158645', '3104736413', 'NO', 'SI', 'NO', 'CONTROL DOC CLAUDI CUBILLOS', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 11:17'),
(347, 0, 'HEMATOLOG', 'CC', '65800098', 'PRIETO', 'CARDOSO', 'ALBA', 'LILIANA', '08/12/1979', '35', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 94 # 60B - 36', 'RIO NEGRO', '5478201', '3143011545 - 3112654707', 'LILIPRIETOCA@HOTMAIL.COM', 'T', 'CATOLICA', 'EMPLEADA', 'HECTOR CASTIBLANCO', 'ESPOSO', '5478201', '3143564254', 'NO', 'SI', 'NO', 'LLEVAESPERANDOPOR LA 1 MES  - FAVOR AJENDAR', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 10:49'),
(348, 0, 'CIRUG', 'CC', '41578830', 'RINCON', '0', 'MARIA', 'JULIA', '31/10/1940', '74', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 94# 91A- 79', 'LUIS CARLOS GALAN', '4351531', '3115643117', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'HOGAR', 'SOLEDAD MONTA', 'HIJA', '4351531', '3115643117', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:09'),
(349, 0, 'ONCOLOG', 'CC', '79118513', 'BELLON', 'GARZON', 'ARTURO', '0', '11/11/2011', '54', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CALLE 18 A # 4A06', 'SAMARCANDA', '8265798', '3125188481', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'ORNAMENTADOR', 'LILIA PINZON', 'CU', '8265798', '3125188481', 'NO', 'NO', 'NO', 'ES PRIORITARIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:13'),
(350, 0, 'ANESTESIOLOG', 'CC', '498403', 'LOSADA', 'MENDES', 'MARCO', 'ANTONIO', '07/08/1933', '82', 'MASCULINO', 'COLSUBCIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SASAIMA', 'VEREDA SANTA ANA', 'FINCA ELPORVENIR', '4601215', '3124503321', 'LUZDYSWS@YAHOO.ES', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'LUZ LOSADA', 'HIJA', '7470153 EXT 109', '3107991223', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:21'),
(351, 0, 'ONCOLOG', 'CC', '80466907', 'QUEVEDO', 'RAMOS', 'PEDRO', 'ANTONIO', '20/02/1976', '39', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VILLAPINZ', 'CALLE  2   1-08 TERPEL', 'ESTACION SAN ANTONIO', 'NO', '3124292052', 'NO', 'PRIMARIA', 'CATOLICA', 'LAVADOR DE  CARROS', 'VICTOR  JULIO  QUEVEDO', 'HERMANO', 'NO', '3114828697', 'NO', 'NO', 'NO', 'CITA  CONTROL  PARA MEDICAMENTOS  URG  YA  SE  LE  ACABARON  MUY  URG.  SE  ENCUENTRA  BASTANTE ENFERMO PRIORIDAD  URG.', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:23'),
(352, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '3033056', 'MARTIN', 'CARDENAS', 'PEDRO', 'NECTALI', '21/02/1960', '54', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 54C #127D-35', 'PADRO VERANIEGO', '0', '3138283804', 'PETERN.MARTIN@HOTMAIL.COM', 'T', 'CATOLICO', 'EMPLEADO', 'MARIA ROSALES', 'ESPOSA', '0', '3192050364', 'SI', 'SI', 'NO', 'PACIENTE SE HA COMUNICADO Y OTORGADO TODOS SUS DATOS EN DOS OPORTUNIDADES SIN EXITO. EN ESPERA DE 6 MESES POR UNA CITA POR PRIMERA VEZ.', '3ra Llamada', 'Daniela L', '20/05/2015 10:57'),
(353, 0, 'ENDOCRINOLOG', 'CC', '19116043', 'GOMEZ', 'RUEDA', 'CARLOS', '', '14/10/1950', '64', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 68F #21-65 SUR', 'VILLA CLAUIDA', '4592401', '3152091822', 'CARLOGO1950@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'PENSIONADO', 'GLORIA LONDO', 'ESPOSA', '4592401', '3152091822', 'SI', 'SI', 'NO', 'PACIENTE SOLICITA CITA OPORTUNA PARA PRESENTAR EXAMENES M', '1ra Llamada', 'Daniela L', '20/05/2015 11:22'),
(354, 0, 'CIRUG', 'CC', '52531171', 'BRICE', 'NAVARRO', 'ANGELA', 'MARIA', '04/08/1978', '36', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA11#83A61', 'CIUDADELA COLSUBSIDIO', '4700850', '3118213384', 'SUPERANGELITA78@HOTMAIL.COM', 'T', 'AGNOSTICA', 'COMERCIANTE', 'SANDOVAL IVAN ALBERTO', 'ESPOSO', '4700850', '3107890891', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 11:23'),
(355, 0, 'CIRUG', 'CC', '41910169', 'BEJARANO', 'JARAMILLO', 'FLOR', 'ALBA', '04/08/2015', '48', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 66A #87-36 PISO 2', 'FLORIDA', '5417688', '3118193873', 'NO TIENE', 'T', 'CATOLICO', 'EMPLEADO', 'LAURA SUAREZ', 'HIJA', '5417688', '3214114412', 'SI', 'NO', 'NO', 'PACIENTE SOLICITA LA CITA PARA JUNIO DEBIDO A QUE LOS RESULTADOS DE LA BIOPSIA SE LOS ENTREGAN EL DIA 29 DE MAYO.', '1ra Llamada', 'Daniela L', '20/05/2015 11:30'),
(356, 0, 'ONCOLOG', 'CC', '9048633', 'GARCIA', 'PE', 'LUIS', 'ALFONSO', '02/06/1939', '65', 'MASCULINO', 'ENCOSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE74D#70-F-23', 'BONANZA', '4385014-2513486', '3205132995', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'PENSIONADO', 'LETICIA MERCADO', 'ESPOSA', '4385014-2513486', '3124661212-3158274160', 'NO', 'SI', 'NO', 'CONTROL CON EL DOC', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 11:25'),
(357, 0, 'CIRUG', 'CC', '39540471', 'VALDES', 'MAYORCA', 'MADI', 'YAMILE', '21/06/1976', '48', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA83A75-50 CASA 44', '5 DE LA 80', '5162450', '3208904451', 'MADDYYAMILE@HOTMAIL.ES', 'UNIVERSITARIO', 'CRISTIANA', 'DESEMPLEADA', 'SIFIFREDO RAMIREZ', 'ESPOSO', '3212274925', '3212274925', 'SI', 'SI', 'NO', 'RESULTADO DE MAMOGRAFIA CON UN MES DE PETICION DE LA CITA SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '20/05/2015 11:30'),
(358, 0, 'HEMATOLOG', 'CC', '20922654', 'CARRERO', 'CORREA', 'FLOR', ' DE  MARIA', '19/08/1967', '47', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SESQUIL', 'VEREDA TIERRA NEGRA', 'NO', '6162506', '3222135778', 'CARITO-DEIVIS@HOT.MAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ADRIANA CAROLINA  MONCADA', 'HIJA', 'NO', '3212712507', 'NO', 'NO', 'SI', 'CITA  CONTROL  MUY  URG.  PARA  ORDEN DE  QUIMIOTERAPIA  LE FALTAN  DOSIS Y  NO  SE  PUEDE PASAR POR  FAVOR  DAR PRIORIDAD ESTA  LLAMANDO  DESDE  HACE  15 DIAS', '4ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:34'),
(359, 0, 'UROLOG', 'CC', '739453', 'ABELDA', 'TORREZ', 'WALTER', 'BRAYAN', '02/01/1984', '31', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'BOYAC', 'CHIQUINQUIR', 'CRA9#25-38', 'BERSALLES', '7264702', '3133346998', 'WRATOX007@GMAIL.COM', 'TECN', 'CATOLICA', 'DESEMPLEADO', 'CAROLINA BUITRAGO', 'ESPOSOQ', '7264702-8', '3142130266', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 11:39'),
(360, 0, 'GINECOONCOLOG', 'CC', '20951118', 'GOMEZ', 'FERNANDEZ', 'BLANCA', 'MARINA', '21/12/1953', '60', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 1A  32C-68  SUR', 'BARRIO ATENAS', 'NO', '3152234436', 'CAVALIER7030@GMAIL.COM', 'PRIMARIA', 'EVANGELICA', 'HOGAR', 'ANDERSON GOMEZ', 'HIJO', 'NO', '3152234436', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ  PARA  CIRUGIA ES URG.  ESTA LLAMANDO  DESDE EL  27  DE  ABRIL  POR  FAVOR  DAR PRIORIDAD URG.  CIRUGIA', '5ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:41'),
(361, 0, 'ENDOCRINOLOG', 'CC', '41431897', 'FRINO', 'BELTRAN', 'RITA', 'DELIA', '20/11/1948', '65', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE72F#113A-85', 'VILLAS DE GRANADA', '3874239', '3115265686', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'LUIS CARDENAS', 'ESPOSO', '3874239', '3142476626', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 11:45'),
(362, 0, 'CIRUG', 'CC', '65550784', 'PINTO', '', 'MARIA', 'JHINET', '28/07/1972', '52', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL36SUR#39B-61', 'SANTA RITA', '4746017', '3208059124', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'CARLOS ALBERTO SARMIENTO', 'ESPOSO', '4746017', '3133983896', 'NO', 'NO', 'NO', '1 DIAS SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '20/05/2015 11:47'),
(363, 0, 'HEMATOLOG', 'CC', '51908583', 'TAPIA', 'POLOCHE', 'ALCIRA', '0', '20/10/1966', '48', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE 12 # 13 - 60', 'TEJARES DOS', '6361619', '3102187679', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'MARTA TARASONA', 'ASESORA', '6263146', '3153251105', 'SI', 'SI', 'NO', 'ES UN CONTROL CON LADOCTORA SILVIA MARGARITA ROJAS  - LLEVA DOS MESES ESPERANDO', '4ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:39'),
(364, 0, 'HEMATOLOG', 'CC', '35377948', 'SIERRA', 'FRANCO', 'ROSALBINA', '', '24/12/1943', '68', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MESETAS', '0', 'SANATA ELENA', '8476731', '3124759165', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ELISENIA RODRIGUEZ', 'CUIDADORA', '8476731', '3124759165', 'NO', 'NO', 'NO', 'ES UNA CITA DE CONTROL CON EL DOCTOR CARLOS BERMUDEZ', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:50'),
(365, 0, 'ANESTESIOLOG', 'CC', '20089440', 'BURGOS', 'MARTINEZ', 'ANA', 'DOLORES', '15/03/1935', '80', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG32BSUR#12B-63', 'RESURRECION', '2726919', '3194833256', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'MARI LUSI GUERRERO', 'HIJA', '2726919', '3118870157', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 11:53'),
(366, 0, 'ONCOLOG', 'CC', '28426275', 'GARAVITO', 'VIUDA DE CHACON', 'MARIA', 'BENILDA', '15/04/1937', '78', 'FEMENINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 103F  136A-08', 'SUBA COSTA AZUL', '5360862', '3222446642', 'JASC1495@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JULIE  ALEJANDRA SALAZAR', 'NIETA', '5360872', '3222446642', 'NO', 'NO', 'NO', 'CITA CONTROL LLAMO  FINALIZANDO  ABRIL', '2da Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 11:52'),
(367, 0, 'ONCOLOG', 'CC', '28681813', 'DUCUARA', 'CAICEDO', 'ANA', 'ELVIRA', '30/05/1939', '78', 'FEMENINO', 'CAFE SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 128# 145 - 70', 'COMPARTIR SUBA', '6930248', '3183880729', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'HOGAR', 'MERY OSPINA', 'HIJA', '6930248', '3183880729', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 11:58'),
(368, 0, 'ORTEPEDIA ONCOLOG', 'TI', '97090824868', 'BONILLA', 'CASTRO', 'DANIEL', 'SANTIAGO', '08/09/1997', '17', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA100A#73-14SUR', 'RECREO', '3563407', '3003796569', 'ADRIANACASVAN@HOTMAIL.COM', 'BACHILLER', 'CRISTIANO', 'ESTUDIANTE', 'ADRIANA CASTRO', 'MAMA', '3563407', '3003796569', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 12:00'),
(369, 0, 'CIRUG', 'CC', '79817361', 'GOMEZ', 'CRUZ', 'WILSON', 'ENRIQUE', '02/12/1980', '34', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 1 H  81-56 SUR', 'YOMASA', '2002055', '3214196407', 'NO', 'BACHILLER', 'CATOLICA', 'VIGILANCIA', 'MARTHA  LUCILA GOMEZ CRUZ', 'HERMANA', '2002051', '3118376127', 'NO', 'NO', 'NO', 'CITA  PARA CONTROL  URG.  PACIENTE YA TIENE EXAMENES PRIORIDAD ESTA LLAMANDO  HACE 20 DIAS', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:03'),
(370, 0, 'CIRUG', 'CC', '21003163', 'ROJAS', 'DE SEGURA', 'ANA', 'SILVIA', '21/09/1951', '63', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TIBIRITA', 'USBITA', 'USBITA', '3672401', '3138288649', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'TELVIAN ROJAS', 'HERMANA', '3672401', '3672401', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 11:59'),
(371, 0, 'UROLOG', 'CC', '242625', 'CESPEDES', 'CUBILLOS', 'PEDRO', 'INGNACIO', '14/03/1934', '81', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CALLE 139 # 95 A 90', 'SUBA', '6820524', '3115369538', 'ROSIO.BARCUS@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ROSIO BARBOSA', 'NIETA', '4012453', '3112618645', 'SI', 'NO', 'NO', 'PRIORIDAD - TENER EN CUENTA QUE TEIEN QUE TRASLADARSE', '4ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 12:09'),
(372, 0, 'CIRUG', 'CC', '51703967', 'PARRA', 'RODRIGUZ', 'GLORIA', 'INES', '16/01/1963', '52', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA53B#2D-64', 'GALAN', '2603917', '3123580456', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA PARRA', 'TIA', '4508313', '3103060424', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 12:06'),
(373, 0, 'CIRUG', 'CC', '52234348', 'RIA', 'CIFUENTES', 'SANDRA', 'MARITZA', '23/05/1978', '36', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 25  49-44', 'TUNAL', '7489921', '3112345720', 'NO', 'UNIVERSITARIO', 'CATOLICA', 'ENFERMERA JEFE', 'MARIA ELVIRA CIFUENTES', 'MAMA', '7489921', '3144503404', 'SI', 'SI', 'NO', 'CITA  POR PRIMERA VEZ  LLAMO LA  SEMANA PASADA Y  NO LE  HAN  DADO CITA ES URG.', '2da Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:09'),
(374, 0, 'ONCOLOG', 'CC', '51729329', 'URREGO', 'DE  CALDERON', 'ALBA', 'TULIA', '11/01/1963', '52', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  71A  89B-15  SUR', 'BOSA VILLAS DEL PROGRESO', '7851799', '3125658947', 'DEYATQ10@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'EDWIN CALDERON', 'HIJO', 'NO', '3125515294', 'NO', 'NO', 'SI', 'CITA CONTROL DR. PIERRE  QUIMIOTERAPIA  TOMADA ES URG.  POR  FAVOR  DAR PRIORIDAD', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:23'),
(375, 0, 'ANESTESIOLOG', 'CC', '43889804', 'CANCHILA', 'GUTIEREZ', 'VIVIANA', 'FARIDES', '24/09/1980', '34', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL135A#95C-10', 'VILLA LISA', '322395757', '3222395757', 'NO TIENE', 'OTRO', 'CATOLICA', 'EMPLEDA DOMESTIC', 'MILTON ROPERO', 'ESPOSO', '32041157476', '3204115776', 'SI', 'SI', 'NO', 'SE OTORGA UNA CITA CON CABRZA Y CUELLO Y ERA PARA ANESTECIOLOGIA', '1ra Llamada', 'Pedro Juli', '20/05/2015 12:17'),
(376, 0, 'CIRUG', 'CC', '10029681', 'RODAS', 'LOPEZ', 'MAURICIO', 'ALBERTO', '01/08/1976', '38', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL6A#88-20', 'EL TINTAL', '4609552', '3142911376', 'MAURICIORODA00@HOTMAIL.COM', 'T', 'CATOLICO', 'VENTAS', 'VEATRIS ELENA RENDON', 'ESPOSA', '4609552', '3112973470', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 12:25'),
(377, 0, 'CL', 'CC', '3016030', 'DIAZ', 'PADILLA', 'LUIS', 'ABRAHAM', '15/10/1958', '56', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FOMEQUE', 'CALLE  4  5-00', 'HOSP.FOMEQUE', 'NO', '3115754480', 'NO', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'ROSALBA CUELLAR', 'ESPOSA', 'NO', '3115754480', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:29'),
(378, 0, 'CIRUG', 'CC', '39706587', 'HERNADEZ', 'ALBARES', 'MARIA', 'DEL CARME', '10/07/1966', '48', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'LOS PUENTES', 'MOSQUERA', '8298375', '3133473147', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'GENOVE RODIRIGUES CASTELLANOS', 'COMADRE', '388375', '3133473147', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 12:36'),
(379, 0, 'DERMATOLOG', 'CC', '30023775', 'HERNANDEZ', 'DE  NORIEGA', 'MARIA', 'ADELA', '05/02/1956', '58', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA  87F  40-17', 'VILLA ANDRES', '5726086', '3003458360', 'MALUNOHE@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE  CASA', 'MARTHA NORIEGA', 'HIJA', '5726086', '3003458360', 'SI', 'SI', 'NO', 'CITA PARA CONTROL', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:36'),
(380, 0, 'ENDOCRINOLOG', 'CC', '20793304', 'BERNAL', 'GARCIA', 'NUBIA', 'CECILIA', '12/01/1956', '59', 'FEMENINO', 'CAFE SALUD', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'PACHO', 'CALLE 6 #14-63', 'BELLA VISTA', '0', '3143669541', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'JULIO TORRES', 'ESPOSO', '0', '3134068786', 'NO', 'NO', 'NO', 'PACIENTE SE HA COMUNICADO EN REPETIDAS OPORTUNIDADES SIN EXITO, SOLICITA CONTROL CON EL MEDICO PARA EL MES DE JUNIO', '3ra Llamada', 'Daniela L', '20/05/2015 12:38'),
(381, 0, 'CIRUG', 'CC', '53069879', 'REATIGA', 'CARVAJAL', 'LEIDY', 'JOHANNA', '16/06/1975', '29', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA4ESTE#100-27SUR', 'EL RUBI', '0', '3105771418', 'LIBORI.NITE@HOTMIL.COM', 'PRIMARIA', 'CATOLICA', 'SATELITE', 'LIBARDO NI', 'ESPOSO', '0', '3142294382', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 12:22'),
(382, 0, 'UROLOG', 'CC', '20614855', 'RAMOS', 'ALCALA', 'MARIA', 'ELISA', '12/12/1953', '66', 'FEMENINO', 'CAPRECON', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GIRARDOT', 'MANZANA14', 'EL DIAMANTE', '3209723538', '3209723538', 'NO TIENE', 'OTRO', 'CRISTIANA', 'HOGAR', 'CAMPOS RAMOSANGELICA', 'HIJA', '3209723538', '3015463611', 'NO', 'NO', 'SI', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 12:42'),
(383, 0, 'HEMATOLOG', 'CC', '80059947', 'GARCIA', 'MORA', 'HUGO', 'RICARDO', '04/10/1978', '36', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 6 I ESTE 33-49  SUR', 'SAN VICENTE SUR ORIENTAL', '4654210', '3132684022', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'BLANCA LEONOR MORA', 'MAMA', '4654210', '3138009142', 'NO', 'NO', 'SI', 'CITA  CONTROL  URG. NECESITA MEDICAMENTOS  Y  ORDEN  PARA LA QUIMIOTERAPIA  POR  FVR  ES URG.  DR.  BERMUDEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:42'),
(384, 0, 'ORTEPEDIA ONCOLOG', 'CC', '65690711', 'MORENO', 'PERDOMO', 'AMPARO', 'NO', '20/07/1961', '53', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 64 SUR  85B-40', 'BOSA  LA  PAZ', '3065951', '3102751781', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ANDREA GONZALEZ', 'HIJA', '4908027', '3132127620', 'NO', 'NO', 'NO', 'CITA CONTROL  DR.  LUIS  CARLOS  GOMEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 12:50'),
(385, 0, 'ONCOLOG', 'CC', '20482018', 'BORBON', 'DERODRIGUEZ', 'ELVIA', 'INES', '02/08/1948', '66', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHOACH', 'CRA3#1-03', 'CHOACHI', '0', '3115885069', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'SANDRA RODRIGUEZ', 'HIJA', '0', '3115885069', 'NO', 'NO', 'NO', 'CONTROL DOC BORIS SANCHEZ', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '20/05/2015 12:56'),
(386, 0, 'ENDOCRINOLOG', 'CC', '23925666', 'MENDOZA', 'RINCON', 'FLOR', 'ELISA', '01/08/1963', '51', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  63  18L-09', 'LUCERO', '7908407', '3134193662', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'CINDY  SUAREZ', 'HIJA', '7908407', '3115065839', 'NO', 'NO', 'NO', 'CITA  CONTROL  PARA ENTREGA DE  EXAMENES  DR.  EXIGE  SER RECIENTES Y  LA  PACIENTE  HACE  UN MES ESTA LLAMANDO  Y  LA  ULTIMA  FUE  EL  15  DE  MAYO POR FAVOR DAR PRIORIDAD', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '20/05/2015 12:55'),
(387, 0, 'CIRUG', 'CC', '79182010', 'GONZALES', 'GUTIERREZ', 'CAMPO', 'ELIAS', '23/09/1963', '51', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CRA5#3-24 ESTE', 'CEDRITOS', '8734907', '3115756871', 'NO TIENE', 'OTRO', 'CATOLICO', 'ELECTRICISTA', 'RIVEROS PINZON BLANCA', 'PRIMA', '8074907', '3118146946', 'NO', 'NO', 'NO', 'DOCTOR ENRIQUE CHAPARRO', '1ra Llamada', 'Pedro Juli', '20/05/2015 13:06'),
(388, 0, 'HEMATOLOG', 'CC', '20193919', 'GARCIA', 'DE LEE', 'SILVIA', 'EMILIA', '08/04/1928', '86', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 169A  62-26', 'VILLA  JULIA', '5106481', '3005556906', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'SILVIA LEE', 'HIJA', 'NO', '3005556906', 'NO', 'NO', 'NO', 'CITA  CONTROL URG.  HA  LLAMADO  VARIAS VECES  POR  FAVOR  DAR PRIORIDAD', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 13:08'),
(389, 0, 'HEMATOLOG', 'CC', '52317618', 'RUIZ', 'VARGAS', 'NUBIA', 'YANET', '26/06/1974', '41', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 1 #83-12', 'MARIA PAZ', '4017353', '3142473833', 'NEL2436@HOTMAIL.COM', 'BACHILLER', 'CRISTIANA', 'AMA DE CASA', 'NELSON TORRES', 'ESPOSO', '4017353', '3103223551', 'SI', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE EL 15 DE ABRIL. CITA CONTROL PARA QUE EL ESPECIALISTA VERIFIQUE LOS RESULTADOS DE SUS EXAMENES', '2da Llamada', 'Daniela L', '20/05/2015 13:10'),
(390, 0, 'CIRUG', 'CC', '21719277', 'GONZALEZ', 'DE HERRERA', 'ANA', 'NO', '04/12/1938', '76', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'AVDA CRA 36  23-76 BLOQUE B 5  APTO 1204', 'CENTRO NARI', '3913708', '315869016', 'ANCEHEGO@YAHOO.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANA  CECILIA HERRERA', 'HIJA', 'NO', '3158690160', 'SI', 'SI', 'NO', 'CITA  URG.  POR  PRIMERA VEZ HA LLAMADO  EN  DIFERENTES  OPORTUNIDADES  POR  FAVOR DAR PRIORIDAD', '4ta Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 13:15'),
(391, 0, 'CIRUG', 'CC', '41536836', 'MORA', 'DE OSA', 'VICENTA', '', '10/11/1947', '67', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CL12C#71B-61', 'CUIDAD ALCACIA', '4127440', '3012563076', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'MARLENI OSA', 'HIJA', '4058131', '3057063500', 'NO', 'SI', 'NO', 'URGENTE', '2da Llamada', 'Pedro Juli', '20/05/2015 13:21'),
(392, 0, 'ONCOLOG', 'CC', '19160890', 'GRANADOS', 'DAZA', 'JORGE', 'ALIRIO', '30/01/1951', '64', 'FEMENINO', 'CAFE SALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 76A #87-18', 'SAN CAYETANO', '2234505', '3115124268', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'LUZ CASTRO', 'ESPOSA', '2234505', '3214419271', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Daniela L', '20/05/2015 13:27'),
(393, 0, 'COLOPROCTOLOG', 'CC', '19231015', 'CASTRO', 'MELGAREJO', 'JULIO', 'NO', '16/04/1954', '61', 'MASCULINO', 'CAPRECOM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG. 68 H  48C-33 SUR', 'MANUELA BELTRAN', '7175109', 'NO', 'NO', 'BACHILLER', 'CATOLICA', 'DESEMPLEADO', 'OMAR SAIN CASTRO', 'HERMANO', 'NO', '3118508033', 'NO', 'NO', 'NO', 'CITA PARA CONTROL URG.  ESTA LLAMANDO  HACE  DOS  MESES  POR  FAVOR DAR `PRIORIDAD URG.', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '20/05/2015 13:29'),
(394, 0, 'HEMATOLOG', 'CC', '20410338', 'NI', 'NU', 'SONIA', 'JULIETA', '31/03/1957', '58', 'FEMENINO', 'FAMISANRA', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA8222-15', 'MODELIA', '2630958', '3005664415', 'NO TIENE', 'UNIVERSITARIO', 'EVANGELICA', 'INDEPENDIENTE', 'NI', 'HERMANA', '7038538', '3134520702', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 13:31'),
(395, 0, 'HEMATOLOG', 'CC', '20952673', 'PIRACUN', 'GUTIRREZ', 'BEATRIS', 'MARIA', '17/07/1958', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA96#129C-46', 'RINCON DE SUBA', '3115659325', '3112421373', 'NO TIENE', 'OTRO', 'CATOLICA', 'ASEADORA', 'ANA JHANET SAMORA PIRACUN', 'HIJA', '6854072', '3115659325', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 13:38'),
(396, 0, 'CIRUG', 'TI', '1372044', 'PARRA', 'MONTA', 'SOFIA', '', '21/01/2001', '14', 'FEMENINO', 'UNICAJACONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL7B#22A76 SUR', '20 DE JULIO', '4038255', '3133783411', 'SOFIACARMON@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'ESTUDIANTE', 'ELBIRA PARRA MONTA', 'MAMA', '4038255', '3133783411', 'SI', 'SI', 'NO', 'ESPERA DE CITA DESDE EL DIA ABRIL 29 SIN RESPUESTA', '6ta Llamada', 'Pedro Juli', '20/05/2015 13:48'),
(397, 0, 'ONCOLOG', 'CC', '15895615', 'GALBIS', 'ARISTISABAL', 'JOSE', 'OBIDIO', '25/07/1950', '64', 'MASCULINO', 'CAPRECON', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL89C#3-17', 'CHICO SUR', '6638386', '3123639317', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'DIANA PAOLA GALVIS', 'HIJA', '7688476', '3219516505', 'SI', 'SI', 'NO', '', '2da Llamada', 'Pedro Juli', '20/05/2015 13:55'),
(398, 0, 'ONCOLOG', 'CC', '2886031', 'ALDANA GUARIN', 'GUARIN', 'REINALDO', '', '20/11/1933', '82', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA7#148-35', 'CEDRO GOMEZ', '8146253', '3007190691', 'CRUZSANTACRUZ52@HOTMAIL.COM', 'ESPECIALIZACI', 'CATOLICA', 'MEDICO', 'MIRIAM SANTACRUZ', 'ESPOSA', '8146253', '3007190691', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 13:01'),
(399, 0, 'UROLOG', 'CC', '17081873', 'ROJAS', '', 'RAFAEL', '', '05/06/1941', '75', 'MASCULINO', 'CAPITALSALU', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA109A72-B-32', 'VILLA AMALIA', '4429526', '3124927565', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NANCYROJAS', 'HIJA', '4429526', '3124927565', 'NO', 'NO', 'SI', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 14:10'),
(400, 0, 'HEMATOLOG', 'CC', '19301621', 'QUINTERO', 'FIGUEREDO', 'ALVARO', 'ANTONIO', '07/02/1952', '57', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 74 BIS # 64 -F 53', 'LUJAN', '2510891', '3114952176', 'ANGELAQUINTERO14@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'CONDUCTOR', 'ANGELA QUINTERO', 'HIJA', '2510801', '311495276', 'SI', 'SI', 'NO', 'LLEVA ESPERANDO UN MESPOR LA CITA', '2da Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 13:30'),
(401, 0, 'ONCOLOG', 'CC', '28852117', 'NARVAES', 'YARA', 'MARIA', 'NATIVIDAD', '25/12/1958', '58', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CRA 2DA ESTE # 4 -59', 'CARTAJENITA', '3134557026', '3134557026', 'NO TIENE', 'NINGUNO', 'CATOLOCO', 'AMA DE CASA', 'CARMEN ROSO', 'AMIGA', '8274489', '3133937404', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 13:41'),
(402, 0, 'GINECOONCOLOG', 'CC', '52854855', 'BLANCO', 'ABRIL', 'FABIOLA', '0', '03/10/1979', '36', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CALLE 15 # 4 -38', 'LA FORTUNA', '8257150', '3204678027', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'SANDRA VANEGAS', 'AMIGA', '3213425592', '3213425592', 'NO', 'NO', 'NO', 'ES UN CONTROL CON JOSE SALAMANCA', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 13:48'),
(403, 0, 'ORTEPEDIA ONCOLOG', 'CC', '3044155', 'RAMIREZ', 'SARMIENTO', 'BERNADO', 'ALBERTO', '20/08/1944', '70', 'FEMENINO', 'CAFE SALUD', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 81 # 114 - 50', 'CORTIJO', '4593392', '3002772808', 'RAMBERTO_HOTMAIL.COM', 'UNIVERSITARIO', 'NINGUNA', 'MEDICO', 'ERIKA GUZMAN', 'TIO', '6057090', '3012800125', 'SI', 'SI', 'NO', 'PRESENTO CANCER DEPROSTATA Y SE LE PASO A UNA VERTEBRA Y TIENE COMPROMETIDA EN 70%  DELA FUNCIONALIDAD TIENE DIFICULTADES PARA CAMINAR', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 13:55'),
(404, 0, 'GINECOONCOLOG', 'CC', '52819512', 'BETANCUR', 'SANABRIA', 'NACY', 'CAROLINA', '08/05/1981', '34', 'FEMENINO', 'FAMISANR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 117 A # 116A- 16', 'ENGATIVA', '4585111', '3108738943', 'KRO0508@YAHOO.COM', 'T', 'CRISTIAN', 'HOGAR', 'RAFAEL REYES', 'ESPOSO', '3103168548', '3103168548', 'NO', 'NO', 'NO', 'ES UN CONTROL', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:16'),
(405, 0, 'HEMATOLOG', 'CC', '52819512', 'BETANCUR', 'SANABRIA', 'NANCY', 'CAROLINA', '08/05/1981', '34', 'FEMENINO', 'FAMISANR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 117  # 116A - 16', 'ENGATIVA', '4585111', '3108738943', 'KRO0508@YAHOO.COM', 'T', 'CRISTIANA', 'HOGAR', 'RAFAEL REYES', 'ESPOSO', '3103168548', '3103168548', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:20'),
(406, 0, 'ONCOLOG', 'CC', '20790053', 'ROMERO', '', 'ALICIA', '', '25/05/1944', '70', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'CRA10#CALLE3#7-46', 'BELLAVISTA', '0', '3112566246', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'FANNY ROMERO', 'HIJA', '0', '3112566246', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 14:21'),
(407, 0, 'ONCOLOG', 'CC', '20552445', 'EFPITIA', '', 'JULIA', 'ESTHER', '21/07/1967', '48', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUENTE DE ORO', 'CR 3 #2-40', 'INSPECCION DE CAPELLANIA', '0', '3144254520', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'AMA DA CASA', 'JEIMI GARZON', 'HIJA', '8553679', '3142787371', 'NO', 'NO', 'NO', 'PACIENTE RECIBIENDO MONOQUIMIOTERAPIA, PACIENTE DESEA SE LE AGENDE CITA PARA EL MES EN CURSO DEBIDO A QUE RECIBE TRATAMIENTO Y DESEA IR A CONTROL PARA QUE SE LE ASIGNE EL TRATAMIENTO CON EL DOCTOR PIERRE.', '2da Llamada', 'Daniela L', '20/05/2015 13:35'),
(408, 0, 'ONCOLOG', 'CC', '323759', 'PRIMIGIERO', 'CHICOASUQUE', 'ABRAHAM', '', '29/08/1934', '80', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 21 #106-54', 'FOTIBON', '4760360', '0', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'PENSIONADO', 'MARIA OLARTE', 'ESPOSA', '4760360', '3219241485', 'SI', 'SI', 'NO', 'URGENTE PACIENTE SOLICITA AGENDAMIENTO DEBIDO A QUE TIENE UN TUMOR MALIGNO AVANZADO', '1ra Llamada', 'Daniela L', '20/05/2015 13:45'),
(409, 0, 'UROLOG', 'CC', '9522222', 'BARRERA', 'SANTOS', 'GERARDO', 'ANTONIO', '13/09/1958', '57', 'MASCULINO', 'SALUCOOP', 'SI', 'NO', 'A', 'BOYAC', 'BOYAC', 'CALLE 9#32-26', 'LA ISLA', '7715433', '3203852195', 'GERARDO.B2011@YAHOO.ES', 'BACHILLER', 'CATOLICO', 'EMPLEADO', 'BLANCA BELTRAN', 'ESPOSA', '7715433', '3203852195', 'NO', 'NO', 'NO', 'SE TOMA REQUERIMIENTO PORQUE PACIENTE FUE ATENDIDO RECIENTEMENTE EN LA CL', '1ra Llamada', 'Daniela L', '20/05/2015 14:06'),
(410, 0, 'INFECTOLOG', 'CC', '17351443', 'VASQUEZ', 'GONZALEZ', 'ALIRIO', '', '22/06/1956', '58', 'MASCULINO', 'CAPITAL SALUD', 'SI', 'NO', 'B', 'META', 'VILLAVICENCIO', 'MANZANA F CASA 8', 'MANZANA F CASA 8', '3389760 EXT 6372', '3132915194', 'NO TIENE', 'NINGUNO', 'NO INDICA', 'NO INDICA', 'EDWAR TORO', 'ASESOR EPS', '3389760 EXT 6372', '3057125141', 'SI', 'SI', 'NO', 'URGENTE- PACIENTE HOSPITALIZADO. PACIENTE SOLICITA SE LE AGENDE CITA DE CARACTER URGENTE PARA VALORAR SU ESTADO Y ACORTAR LA HOSPITALIZACI', '3ra Llamada', 'Daniela L', '20/05/2015 14:17'),
(411, 0, 'UROLOG', 'CC', '20614855', 'RAMOS', 'ALCALA', 'MARIA', 'ELISA', '21/12/1947', '67', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'GIRARDOT', 'CRA 7MA # 32 -40', 'SAN JORGE', '3209723538', '3209723568', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA AVILA', 'ASESORA', '8889027', '3209723538', 'NO', 'NO', 'NO', '', '3ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:26'),
(412, 0, 'ORTOPEDIA GENERAL', 'CC', '41626528', 'GALINDO', 'ARIAS', 'DOMITILA', '', '16/11/1949', '66', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA61#70B-11', 'SAN FERNANDO', '2254985', '3137866198', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'JOSE VELA', 'ESP', '2254985', '3137861698', 'NO', 'SI', 'NO', '', '3ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 14:27'),
(413, 0, 'CL', 'CC', '20614855', 'RAMOS', 'ALCALA', 'MARIA', 'ELISA', '21/12/1947', '67', 'FEMENINO', 'CAPRECOM,', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'GIRARDOT', 'CRA 7MA # 32 -40', 'SAN JORGE', '3209723538', '3209723568', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'HOGAR', 'MARIA AVILA', 'ASESORA', '8889027', '8889027', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:33'),
(414, 0, 'CIRUG', 'CC', '1007298819', 'RAMOS', 'GUZMAN', 'NATALIA', 'PAOLA', '09/02/1991', '24', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 80B  92-20', 'PRIMAVERA NORTE', 'NO', '3215539250', 'NATA-RAMOS@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ESTUDIANTE', 'DAYRO ESPITIA NEGRETE', 'ESPOSO', 'NO', '3218262593', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 14:31'),
(415, 0, 'ENDOCRINOLOG', 'CC', '35469166', 'RUIZ', 'NO', 'FLOR', 'ALBA', '23/01/1957', '58', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 81 F 8A-33', 'VALLADOLID', 'NO', '3124899622', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LUZ MERY  RUIZ', 'HIJA', 'NO', '3204877395', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.  BORIS  HACE 15 DIAS LLAMO', '2da Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 14:36'),
(416, 0, 'CIRUG', 'CC', '51787749', 'PASTRANA', 'ARMIROLA', 'MARCELA', 'DEL PILAR', '12/06/1965', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CLL 4#36-70APTO204BLOQUED', 'BAL DE TIBANA|', '4457350', '3153087282', '65PIPAS@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'DOCENTE', 'LUZ HELENA PASTRANA', 'HERMANA', '6634349', '3123500309', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 14:35'),
(417, 0, 'HEMATOLOG', 'CC', '41679190', 'BERMUDEZ', 'MALDONADO', 'MARIA', 'CIELO', '24/03/1955', '60', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  69F  BIS  14A32  SUR', 'AURORA', '7643500', '3003072505', 'NO', 'BACHILLER', 'CRISTIANA', 'DISCAPACITADA', 'LUIS  FELIPE CABALLERO', 'ESPOSO', '7643500', '3003057489', 'NO', 'NO', 'NO', 'CITA CONTROL URGENTE ESTA LLAMANDO DESDE  MAS DE  UN  MES  ES URG. DAR  PRIORIDAD  PARA LECTURA DE EXAMENES', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 14:43'),
(418, 0, 'CIRUG', 'CC', '1045670828', 'ARTETA', 'MARTINEZ', 'YULEY', '', '06/07/1988', '26', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'BOYAC', 'PUERTO BOYAC', 'CR 4A #29-17', 'LA PAZ', '7383967', '3142343744', 'YULEYARTETA20@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'ROSARIO MARTINEZ', 'MADRE', '8114840', '3106760958', 'SI', 'SI', 'NO', 'PACIENTE REMITIDO POR EL ENDOCRINOLOGO. PACIENTE CON NODULO EN CRECIMIENTO PROGRESIVO.', '1ra Llamada', 'Daniela L', '20/05/2015 14:40'),
(419, 0, 'CIRUG', 'CC', '39730024', 'PRIETO', 'BAQUERO', 'FLOR', 'MARIA', '24/03/1974', '41', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 90A  83A-39', 'LA SERENA', '2234402', '3203196738', 'JOHANACESPEDESPRIETO@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JOHANNA  CESPEDES PRIETO', 'HIJA', 'NO', '3177635925', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA  VEZ  ES URG  POR  FAVOR DAR PRIORIDAD PACIENTE HA  LLAMADO  HACE 20  DIAS  VOLVIO  A LLAMAR  SE  LE PIDIERON  DATOS  NUEVAMENTE  PERO  NO  HA  SIDO  ASIGNADA SU  CITA', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 14:48'),
(420, 0, 'ONCOLOG', 'CC', '20522230', 'PULIDO', 'DE PARRA', 'ALICIA', '', '01/03/1940', '65', 'FEMENINO', 'ENCOSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CALLE12#2-27SUR', 'SAN CRISTOBAL', '0', '3102887722', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADO', 'LUZ ESPERANZA PARRA', 'HIJA', '0', '3223879773', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 14:43'),
(421, 0, 'ONCOLOG', 'CC', '20194424', 'DUARTE', 'RODRIGUEZ', 'MARIA', 'SARA', '17/06/1938', '68', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 138B  153-73', 'SANTA  RITA SUBA', '5380286', '3164242639', 'SANDYMILE86@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA DEL  PILAR CONTRERAS DUARTE', 'HIJA', '5380286', '3164242639', 'NO', 'NO', 'SI', 'CITA CONTROL  URG.  DR. LUIS  FLOREZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 14:58'),
(422, 0, 'HEMATOLOG', 'CC', '19182002', 'GUARNIZO', 'BARBOSA', 'JORGE', '', '14/04/1952', '63', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE35BSUR#73A-40BLOQ6ENT9APTO311', 'KENENDY PERDOMPO', '4507265', '3002294498', 'NO TIENE', 'TECN', 'CATOLICA', 'PENSIONADO', 'ROSA REINA', 'ESPOSA', '4507265', '3017194310', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 15:01'),
(423, 0, 'ORTOPEDIA GENERAL', 'CC', '1130484148', 'RUIZ', 'AREVALO', 'JOSE', 'DAVID', '25/06/1996', '18', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SASAIMA', 'VEREDA SAN  BERNARDO', 'NO', 'NO', '3178184942', 'NO', 'BACHILLER', 'NINGUNA', 'DESEMPLEADO', 'AURORA AREVALO', 'MAMA', 'NO', '3103087291', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA  VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 15:04'),
(424, 0, 'UROLOG', 'CC', '6761594', 'PARRA', 'OTALORA', 'JOSE', 'CRISANTO', '20/10/1956', '57', 'MASCULINO', 'CAFAM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FUNZA', 'CRA81A#42F-50', 'VILLA NELLY', '0', '3118703249', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'MARIA ROSALBA PARADA', 'ESPOSA', '5706978', '3125091691', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '20/05/2015 15:06'),
(425, 0, 'CIRUG', 'CC', '20700387', 'TOBAR', 'CASALLAS', 'SARIN', 'JASBLEYDI', '29/10/1972', '42', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CLL41G#78H-26', 'LOS PERIODISTAS', '7048134', '3212204346', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'OBIDIO QUEBEDO', 'ESPOSO', '7048134', '3102537148', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 15:06'),
(426, 0, 'CIRUG', 'CC', '51924466', 'VARGAS', 'VERA', 'MARIA', 'NUBIA', '21/05/1968', '47', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  108A  3C-75 ESTE', 'ANTONIO  JOSE  SUCRE', '7737576', '3124549164', 'YURIDIACASTANEDA@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'YURIDIA CASTA', 'HIJA', 'NO', '3124549164', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 15:10'),
(427, 0, 'HEMATOLOG', 'CC', '1070596100', 'ASEVEDO', 'FIGUEROA', 'YINIER', 'PAOLA', '05/04/1989', '26', 'FEMENINO', 'CAPRECOM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'GIRARDOT', 'MANZAN 2A TORRE1 APARATMENTO 403', 'VALLESDELSOL', '3144368318', '3144368318', 'POLA_YINIER@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'HERY ROBLEDO', 'ESPOSO', '3194277596', '3194277596', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:37'),
(428, 0, 'CIRUG', 'CC', '35376809', 'GOMEZ', 'MORALES', 'BLANCA', 'NIEVES', '22/01/1971', '44', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA98 A # 128 -52', 'SUBA', '4070850', '315453086', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARTA GONZALEZ', 'AMIGA', '7464113', '3142776049', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:44'),
(429, 0, 'CIRUG', 'CC', '41757734', 'MARTINEZ', 'LOPEZ', 'NIDIA', 'ELENA', '06/07/1956', '58', 'FEMENINO', 'FAMISANR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 73# 2A 64', 'AMERICAS', '2991611', '3133516614', 'NO TIENE', 'T', 'CATOLICO', 'HOGAR', 'ISABEL MARTINEZ', 'HERMAN', '2336634', '2336634', 'NO', 'NO', 'NO', 'LLEVA ESPERANDO 3 SEMANAS POR LA CITA', '5ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:49'),
(430, 0, 'HEMATOLOG', 'CC', '51986710', 'LOZANO', 'GORDILLO', 'CARMEN', 'ALICIA', '22/12/1968', '46', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6TA # 87A - 51', 'TINTAL', '4531833', '3112748160', 'LOZANOGORDILLO22@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'NINGUNA', 'CECILIA LOZANO', 'MADRE', '7016894', '7016894', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 14:57'),
(431, 0, 'CIRUG', 'CC', '39015523', 'QUI', 'RINCON', 'CARMELINA', '0', '05/12/1971', '43', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 136A # 144 - 58', 'BILBAO', '6898280', '3118890562', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'ESTILISTA', 'TULIO VENAVIDES', 'ESPOSO', '3125255427', '3125255427', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:08'),
(432, 0, 'GINECOONCOLOG', 'CC', '20206592', 'WILCHES', 'HUERFANO', 'ANA', 'LEONOR', '07/04/1937', '78', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MADRID', 'CRA 1RA C  # 36 SUR', 'CEREZOS', '3102848072', '3102848072', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'DILI PRECIADO', 'HIJA', '3102848072', '3102848072', 'NO', 'SI', 'NO', 'REMITIDA POR EL ONCOLOGO', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:16'),
(433, 0, 'ONCOLOG', 'CC', '21434880', 'GUTIERREZ', 'RIVEROS', 'AURA', 'M ARIA', '20/12/1945', '69', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  76  A SUR  2-08', 'OLIVARES', 'NO', '3204803011', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'DAYSO  IDALI  CADENA GUTIERREZ', 'HIJA', 'NO', '3209588901', 'NO', 'NO', 'SI', 'CITA  PARA QUIMIOTERAPIA  DR. GUSTAVO  MARQUEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 15:19'),
(434, 0, 'ONCOLOG', 'CC', '35408697', 'BUITRAGO', '', 'ROSA', 'MARIA', '11/10/1954', '61', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA14B#2927', 'PRADOS DEL MIRADOR', '8820531', '3046770930', 'MARISHAU36@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'MARIA ISABELA HAUMADA', 'HIJA', '8820531', '3043770930', 'SI', 'SI', 'NO', 'PACIENTE PRESENTA DETERIORO DE SALUD', '4ta Llamada', 'Pedro Juli', '20/05/2015 15:15'),
(435, 0, 'ONCOLOG', 'CC', '1014263625', 'LOPEZ', 'GOMEZ', 'INGRID', 'JOHANNA', '06/03/1995', '20', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG.  151B  136A-75 CASA 189', 'SUBA COMPARTIR', '6085958', '3203539416', 'NO', 'TECN', 'CRISTIANA', 'ESTUDIANTE', 'ADRIANA MARIA GOMEZ CORTES', 'MAMA', '6553893', '3203539416', 'SI', 'SI', 'NO', 'CITA  URG.  POR  PRIMERA VEZ  NECESITA TRATAMIENTO  PRIORITARIO ES  LA  TERCERA VEZ  QUE LLAMA  POR  FVR PRIORIDAD', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 15:23'),
(436, 0, 'HEMATOLOG', 'CC', '1070957911', 'RODRIGUEZ', 'CRUZ', 'ANGELA', 'MILENA', '30/06/1990', '24', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'FACATATIV', 'DIAG. 14A  19-58B', 'LLANO  POPULAR', '8901238', '3118304446', 'ANGELA.RODRIGUEZCRUZ@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ASESORA COMERCIAL', 'MARIA DEL  CARMEN   CRUZ', 'MAMA', 'NO', '3125507361', 'NO', 'NO', 'NO', 'CITA  CONTROL  PARA  ENTREGA  DE E XAMENES ES URG.- HA  LLAMADO  VARIAS VECES', '3ra Llamada', 'Carmenza Moreno Mendoza', '20/05/2015 15:31'),
(437, 0, 'ENDOCRINOLOG', 'CC', '51948368', 'VEGA', 'TOBAR', 'ANA', 'BEIDA', '19/04/1968', '47', 'FEMENINO', 'SALUTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA7#161A18', 'SAN CRISTOBAL NORTE', '6642959', '3118878195', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'MONICA LORENA GARCIA VEGA', 'HIJA', '6742959', '3194334661', 'SI', 'SI', 'SI', '', '1ra Llamada', 'Pedro Juli', '20/05/2015 15:28'),
(438, 0, 'UROLOG', 'CC', '183295', 'VIVAS', 'ROSADO', 'JOSE', 'ANTONIO', '24/11/1928', '86', 'FEMENINO', 'CAFESALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CACHIPAY', 'SAN GERONIMO', '0', '4943312', '3114944253', 'FLORAVIVAS2011@HOTMAIL.COM', 'OTRO', 'CATOLICO', 'MANICURISTA', 'FLOR ALBA VIVAS CASTRO', 'HIJA', '4943212', '3114944253', 'NO', 'NO', 'NO', 'CITA DOCTOR JUAN PABLO MONCADA UN MES DE ESPERA SIN RESPUESTA', '2da Llamada', 'Pedro Juli', '20/05/2015 15:36'),
(439, 0, 'GINECOONCOLOG', 'CC', '39631841', 'FAJARDO', 'DUQUE', 'NUBIA', 'INES', '21/12/1960', '54', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 59 B # 51 B -59 SUR', 'NUEVO MUSU', '4717224', '3134477557', 'NUBIDIA@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'EDGAR LINARES', 'ESPOSO', '3202419998', '3202419998', 'SI', 'SI', 'NO', 'PRIORITARIO', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:23'),
(440, 0, 'NEUROCIRUG', 'CC', '2996915', 'HERNADEZ', 'GUABITA', 'JAIME', '0', '########################################################################################################################################################################################################', '39', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHIPAQUE', 'VEREDA SIESA', 'FINCA', '3118951956', '3118951956', 'DMARCELITAROMERO691@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'NINGUNA', 'DIANA ROMERO', 'ASISTENTE EN SALUD', '8484266', '3143732441', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:29'),
(441, 0, 'HEMATOLOG', 'CC', '52871226', 'HERNANDEZ', 'RAMIREZ', 'ADRIANA', 'MARIA', '14/03/1981', '34', 'FEMENINO', 'FAMISANAR', 'SI', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 46B #62-54 SUR', 'JERUSALEN', '7159991', '3132943597', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'INDEPENDIENTE', 'JIMMY ANDRES FIQUISIVA', 'ESPOSO', '7159991', '3142102048', 'NO', 'NO', 'NO', 'PACIENTE SOLICITA CITA LO M', 'Mas de 10 llamadas', 'Daniela L', '20/05/2015 14:49'),
(442, 0, 'HEMATOLOG', 'CC', '20983511', 'GONZALEZ', 'GOMEZ', 'MARIA', 'ELENA', '29/06/1963', '52', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TABIO', 'VEREDA JUAICA CARRON', 'CARRON', '-', '3203934091', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'JHON VARGAS', 'YERNO', '-', '3132642276', 'NO', 'NO', 'NO', 'PACIENTE CON AUTORIZACI', '3ra Llamada', 'Daniela L', '20/05/2015 15:14');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(443, 0, 'CIRUG', 'CC', '20455275', 'CANO', 'GUITARRERO', 'RUBIELA', 'AMANDA', '30/05/1969', '56', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'COTA', 'CR 2 #13A-43', 'CENTRO', '8641454', '3123217067', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'CARLOS CASTRO', 'ESPOSO', '8641454', '3144795896', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '20/05/2015 15:52'),
(444, 0, 'ORTEPEDIA ONCOLOG', 'CC', '80351940', 'ROMERO', '', 'LUIS', 'EDUARDO', '30/04/1955', '60', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'KM 4 V', 'KM 4 V', '-', '3208062534', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'DESEMPLEADO', 'BLANCA LILIA DIAZ', 'ESPOSA', '-', '3208062534', 'NO', 'NO', 'NO', 'PACIENTE DEBIO ACUDIR A CONTROL M', '1ra Llamada', 'Daniela L', '20/05/2015 16:00'),
(445, 0, 'CIRUG', 'CC', '41726766', 'BELANDIA', 'DE PARRA', 'MERCEDES', '0', '01/08/1956', '58', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 129 # 52- 69', 'PADRO VERANIEGO', '8018529', '3002969911', 'EDWBAVE@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'NINGUNA', 'EDWIN PARRA', 'HIJO', '8018529', '3002969911', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:48'),
(446, 0, 'HEMATOLOG', 'CC', '7334885', 'MARTINES', 'LESMES', 'FABIO', 'ELIODORO', '19/10/1978', '36', 'MASCULINO', 'FAMISANR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE 35 # 35 -27 TORRE 7', 'CIUDAD VERDE', '3134735526', '900298', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'INDEPENDIENTE', 'ANNY CASTELBLANCO', 'ESPOSA', '4477295', '3202927782', 'NO', 'NO', 'SI', 'LLEVA ESPERANDO POR LA CITA 1 MES - LECTURA URGENTE DE EXAMENES', '5ta Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 15:55'),
(447, 0, 'ANESTESIOLOG', 'CC', '52157418', 'CRISTANCHO', 'GOMEZ', 'YAMILE', '', '10/11/2015', '40', 'FEMENINO', 'CRUZ BLANCA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 97 #70C-95', 'PUENTE VEDRA 5', '-', '3114863635', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'LUPE CRISTANCHO', 'HERMANA', '5334722', '3102203499', 'NO', 'NO', 'SI', '', '1ra Llamada', 'Daniela L', '20/05/2015 16:06'),
(448, 0, 'ONCOLOG', 'CC', '52157418', 'CRISTANCHO', 'GOMEZ', 'YAMILE', '', '10/11/2015', '40', 'FEMENINO', 'CRUZ BLANCA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 97 #70C-95', 'PUENTE VEDRA 5', '-', '3114863635', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AMA DE CASA', 'LUPE CRISTANCHO', 'HERMANA', '5334722', '3102203499', 'NO', 'NO', 'SI', 'PACIENTE REQUIERE SE MANTENGA SU CONTROL CON EL ESPECIALISTA GUILLERMO RAMIREZ', '1ra Llamada', 'Daniela L', '20/05/2015 16:12'),
(449, 0, 'CIRUG', 'CC', '21085967', 'ACU', 'DE CASTA', 'SATURIA', '0', '24/02/1927', '88', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 44A SUR # 3RAC - 38ESTE', 'LA GLORIA', '3629817', '3202697900', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'NORA CASTA', 'HIJA', '3629817', '32026979001', 'NO', 'NO', 'NO', 'HOY SALIO DE CIRUGIA Y EL DOCTOR DEJO EN CLARO QUE LACITA DEBE SER EL LUNES - FAVOR AJENDAR COMO PRIORIDAD', '1ra Llamada', 'Laura Liliana Benitez Garc', '20/05/2015 16:08'),
(450, 0, 'ENDOCRINOLOG', 'CC', '20501054', 'CARVAJAL', 'DE CAMACHO', 'LUCIA', '', '20/05/1941', '74', 'FEMENINO', 'CONFACUNDI', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'CANDELARIA', 'TRANSV 50 #68G-38 SUR', 'CANDELARIA', '5755871', '3142001123', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'LUZDARI CAMACHO', 'HIJA', '5755871', '3144646523', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Daniela L', '20/05/2015 16:26'),
(451, 0, 'CIRUG', 'CC', '41407361', 'GUARIN', 'DE ROJAS', 'MARIA', 'MAGDALENA', '23/04/1948', '67', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 82 #112F-10', 'CUIDAD DE LA COLSUBSIDIO', '3592518', '3138694711', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'PENSIONADA', 'MAGDA ROJAS', 'HIJA', '4929902', '3105794943', 'NO', 'SI', 'NO', 'URGENTE - PACIENTE ESPERANDO CITA DESDE HACE M', '7ma Llamada', 'Daniela L', '20/05/2015 17:49'),
(452, 0, 'ONCOLOG', 'CC', '29814277', 'CASTRO', 'AVILES', 'AMINTA', '', '24/12/1938', '77', 'FEMENINO', 'COLSUBSIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CR 2 #1-80', 'COPIGUE', '-', '3002196007', 'NO TIENE', 'NINGUNO', 'CRISTIANA', 'AMA DE CASA', 'CLAUDIA MORENO', 'NIETA', '-', '3153621001', 'NO', 'NO', 'SI', 'CITA CONTROL POR QUIMIOTERA', '1ra Llamada', 'Daniela L', '21/05/2015 07:13'),
(453, 0, 'COLOPROCTOLOG', 'CC', '23692288', 'MORALESQ', 'PERILLA', 'MARIA', 'DE JESUS', '13/11/1931', '84', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'BOYAC', 'MACANAL', 'CALLE 2 #2-49', 'LA UNION', '6080726', '3166531611', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ALCIDA MORALES', 'HIJA', '8140260', '3166531611', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '21/05/2015 07:23'),
(454, 0, 'HEMATOLOG', 'CC', '6751162', 'LEON', 'RATIGA', 'JOSE', 'ALVARO', '03/05/1950', '64', 'MASCULINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 52 C # 85 G  -16', 'BOSA', '4809294', '3107717963', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'VENDEDOR', 'NELLY LEON', 'HIJA', '4809294', '3105814774', 'NO', 'NO', 'NO', 'ES UN CONTROL CON HEMATOLOGIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:08'),
(455, 0, 'ORTEPEDIA ONCOLOG', 'CC', '1007295648', 'NIDIA', 'ARANGO', 'JAIME', 'ANTONIO', '########################################################################################################################################################################################################', '14', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRSNS 2DA A BIS B ESTE # 97 -B 18 SUR', 'LAS FLORES', '7731201', '3124190741', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'ESTUDIANTE', 'CLAUDIA MILLAN', 'AMIGA', '7731201', '3133179204', 'SI', 'SI', 'NO', 'ES UNA CITA PRIORITARIA  -', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:20'),
(456, 0, 'HEMATOLOG', 'CC', '4274707', 'BALERO', 'ROMERO', 'RAUL', '', '14/03/1939', '77', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA37#1H-25', 'VILLA INES', '8046650', '3108067354', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'TRANSPORTADOR', 'SANDRA BALERO', 'HIJA', '4852532', '3123791597', 'SI', 'SI', 'NO', '0', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 07:57'),
(457, 0, 'HEMATOLOG', 'CC', '4099351', 'PUENTES', 'GIL', 'JOSE', 'RAUL', '06/01/1969', '46', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CR 22 #12-03', 'PRADOS DE SAN ANDRES', '8641040', '3125543076', 'NO TIENE', 'OTRO', 'CRISTIANO', 'INDEPENDIENTE', 'GRACIELA ANGARITA', 'ESPOSA', '8641040', '3136864617', 'SI', 'SI', 'NO', 'URGENTE - PACIENTE ESPERANDO CITA DESDE HACE DOS MESES. PACIENTE CON EXAMENES LISTO SOLO PARA SER PRESENTADOS AL ESPECIALISTA.', '9na Llamada', 'Daniela L', '21/05/2015 08:01'),
(458, 0, 'ENDOCRINOLOG', 'CC', '20724081', 'ROJAS', 'CASTILLO', 'NELLY', 'ESTHER', '30/07/1981', '33', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 42 F SUR  87I-20', 'TINTALITO', '4689920', '3144307332', 'SAR30-81@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'EDILSON AVILA', 'ESPOSO', 'NO', '3043910331', 'NO', 'SI', 'NO', 'CITA  POR PRIMERA VEZ CON  ESTA ESPECIALIDAD', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:08'),
(459, 0, 'ENDOCRINOLOG', 'CC', '20179864', 'ROMERO', 'DE ALONSO', 'ROSA', 'ANGELINA', '28/02/1938', '77', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALL83A#114-36', 'SANTA BARBARA', '4351639', '3118478508', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ANA SOFIA ALONSO', 'HIJA', '2273406', '3118478508', 'NO', 'NO', 'NO', 'CONTROL NO SABE CON QUE DOCTOR', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 08:15'),
(460, 0, 'CIRUG', 'CC', '1022934980', 'QUINTIN', 'GOMEZ', 'DIANA', 'ROCIO', '09/06/1987', '27', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  90  C  SUR  0-44', 'VIRREY', '7625856', '3103100161', 'QUINTIND@BANCOABVILLAS.COM.CO', 'BACHILLER', 'CATOLICA', 'CAJERA  PRINCIPAL DEL  BANCO', 'DORA LILIA  GOMEZ', 'MAMA', 'NO', '3143994687', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:14'),
(461, 0, 'COLOPROCTOLOG', 'CC', '23854063', 'CASTRO', 'DE  CORONADO', 'ALCIRA', 'NO', '26/08/1943', '72', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'C', 'BOYAC', 'PAIPA', 'CALLE  157  92-77', 'SUBA SALITRE BTA', '4807574', '3133868680', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LUZ  MIREYA CORONADO', 'HIJA', '4807574', '3204165889', 'NO', 'NO', 'NO', 'CITA  CONTROL PARA  ENTREGAR PATOLOGIA  PACIENTE  VIVE  EN  BOYACA Y  NECESITA  SER  ATENDIDA ANTES DE  VIAJAR HA LLAMADO VARIAS VECES', '4ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:21'),
(462, 0, 'HEMATOLOG', 'CC', '80744342', 'GARZON', 'CLAVIJO', 'EDISON', 'SAMIR', '05/06/1983', '31', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA6A#49B-48SUR', 'RICON DE LOS MOLINOS', '7598326', '3102310811', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'CHEF', 'ANA ELI CLAVIJO ORTIZ', 'MAMA', '7598326', '3133828224', 'SI', 'SI', 'NO', 'LLAMA PARA PEDIR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 08:26'),
(463, 0, 'HEMATOLOG', 'CC', '19228522', 'SALAMANCA', 'MANCERA', 'EFRAIN', '', '17/10/1953', '62', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 18B #56-10 SUR', 'SAN CARLOS', '5512810', '3103357742', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'DIANA SALAMANCA', 'HIJA', '-', '3133530564', 'SI', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE UN MES.', '2da Llamada', 'Daniela L', '21/05/2015 08:37'),
(464, 0, 'UROLOG', 'CC', '3005507', 'IBARRA', 'PARDO', 'HENRY', 'EDAIN', '02/09/1967', '48', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'VIOT', 'VEREDA CAROLINA', 'NO', '4315055', '3105539242', 'MAYRA.IBARRA@USBSISTEMAS.COM', 'T', 'CATOLINA', 'AGRICULTOR', 'MAYRA  ALEJANDRA ROA IBARRA', 'HERMANA', 'NO', '3105539242', 'NO', 'NO', 'NO', 'CITA CONTROL  DR.  VARGAS URG.  PARA MEDICAMENTO  Y  LECTURA DE E XAMENES', '2da Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:36'),
(465, 0, 'COLOPROCTOLOG', 'CC', '79600752', 'BELLO', 'VILLAREAL', 'LUIS', 'ERNESTO', '16/06/1973', '42', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE50ASUR#31-44', 'EL CARMEN', '3925058', '3107591398-3142134698', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'MARIA RAMIREZ', 'ESPOSA', '3925058', '3102996601-3103135712', 'SI', 'SI', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 08:37'),
(466, 0, 'CIRUG', 'CC', '52206293', 'ROJAS', 'RODRIGUEZ', 'ALEIDA', '', '28/10/1974', '41', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 10 #9C-07', 'SOACHA', '7222897', '3144445810', 'DIALE@YAHOO.ES', 'UNIVERSITARIO', 'CRISTIANA', 'EMPLEADA', 'MARIA ALEJANDRA GARITA', 'HIJA', '-', '3202770945', 'SI', 'NO', 'NO', 'PACIENTE SOLICITA SE LE ASIGNE CITA PARA EL MES DE JUNIO QUE POSEA LOS RESULTADOS DE SUS EXAMENES', '1ra Llamada', 'Daniela L', '21/05/2015 08:43'),
(467, 0, 'ONCOLOG', 'CC', '39805973', 'GUTIERREZ', 'CABRERA', 'MARY', 'JULIETH', '28/06/1979', '35', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MADRID', 'CRA 4  20-00', 'VILLAS DE ALCALA', 'NO', '3212417851', 'JULIETHGUTIERREZT@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'COMERCIANTE', 'JAVIER ORLANDO CASTELLANOS', 'ESPOSO', 'NO', '3104235072', 'NO', 'NO', 'NO', 'CITA PARA CONTROL DR. FLORES', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:46'),
(468, 0, 'ORTOPEDIA GENERAL', 'CC', '41343133', 'MENDEZ', 'NO', 'ZORAIDA', 'NO', '06/02/1946', '69', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CRA 19B  62A-47 SUR', 'ACACIAS', '6758645', '3134587779', 'YA.DI09@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'DELIA YADIRA VALENCIA MENDEZ', 'HIJA', '6758645', '3134587779', 'SI', 'SI', 'NO', 'CITA PARA LLEVAR EXAMEN', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:50'),
(469, 0, 'HEMATOLOG', 'CC', '20091487', 'OTAVO', 'DE HERRERA', 'ANA', 'GILMA', '19/02/1919', '96', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CALLE  2  5-57', 'BARANDILLAS', 'NO', '3192021568', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA  CONSUELO  HERRERA OTAVO', 'HIJA', 'NO', '3192021568', 'NO', 'NO', 'SI', 'CITA CONTROL PARA  SEGUIMIENTO DR.  PIERRE  URG. PRIORIDAD', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 08:58'),
(470, 0, 'HEMATOLOG', 'CC', '51877959', 'ROA', 'CARRILLO', 'SANDRA', 'JANNETH', '08/09/1967', '47', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 111C  86A-78 INT 28  APTO  301', 'CIUDADELA COLSUBSIDIO', '4356230', '3144391291', 'SANDRAROA92@HOTMAIL.COM', 'T', 'CATOLICA', 'INDEPENDIENTE', 'CARLOS  CHAVARRIA', 'ESPOSO', 'NO', '3103005203', 'NO', 'NO', 'NO', 'CITA CONTROL DRA SILVIA MARGARITA', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 09:07'),
(471, 0, 'HEMATOLOG', 'CC', '80234848', 'CASTRO', 'CASTRO', 'JHON', 'DEIVI', '11/02/1980', '35', 'MASCULINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL59#87B-18SUR', 'BOSA NOVA', '7846450', '3106686434', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'CARLOS ALBEIRO CASTRO', 'PAPA', '7846450', '3204763011', 'NO', 'NO', 'NO', 'UN MES DE ESPERA SIN RESPUESTA CONTROL DOCTORA CILVIA MARGARITA ROJAS PORRAS', '3ra Llamada', 'Pedro Juli', '21/05/2015 09:07'),
(472, 0, 'HEMATOLOG', 'CC', '17156760', 'MUNEVAR', 'BAUTISTA', 'SAUL', '', '28/09/1946', '68', 'MASCULINO', 'SALUD VIDA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHIGOROD', 'CRA14G#7-38', 'IBARO 2', '8634339', '3202848858', 'MUNEVARG@YAHOO.COM', 'PRIMARIA', 'CATOLICA', 'NO', 'MARISOL MUNEVAR', 'HIJA', '8634339', '3103013356', 'NO', 'NO', 'SI', '', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 08:46'),
(473, 0, 'ONCOLOG', 'CC', '52084365', 'ALVAREZ', 'CHAVEZ', 'ALBA', 'PATRICIA', '12/10/1971', '43', 'FEMENINO', 'CAPITAL SALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 139 #128A - 27', 'SUBA', '6897088', '3115808614', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'JESUS MENESES', 'ESPOSO', '-', '3162349054', 'NO', 'NO', 'SI', 'URGENTE - PACIENTE REQUIERE SER VISTO POR SU ESPECIALISTA PARA QUE LE AUTORICEN SU PROXIMO CICLO DE QUIMIOTERAPIA QUE DEBE SER APLICADO CADA 21 D', '10ma Llamada', 'Daniela L', '21/05/2015 08:56'),
(474, 0, 'CIRUG', 'CC', '80234848', 'CASTRO', 'CASTRO', 'JHON', 'DEIVI', '11/02/1980', '35', 'MASCULINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL59#87B-18 SUR', 'BOSA NOVA', '7846450', '3106686434', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'HOGAR', 'CARLOS ALBEIROCASTRO', 'PAPA', '7846450', '3204763011', 'NO', 'SI', 'NO', 'UN MES DE ESPERA SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '21/05/2015 09:13'),
(475, 0, 'HEMATOLOG', 'CC', '3056140', 'RODRIIGUEZ', 'BELTRAN', 'JOSE', 'GREGORIO', '22/12/1962', '41', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOP', 'CALLE 1RA A SUR # 4 -60', 'LA MONTANA', '8788755', '3105849497', 'NO TIENE', 'PRIMARIA', 'COTOLICA', 'OPERARIO', 'LILIANA OROZCO', 'CU', '8788755', '3144900602', 'NO', 'NO', 'NO', 'ES UN CONTROL', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:35'),
(476, 0, 'HEMATOLOG', 'CC', '40021178', 'MORENO', 'CIPAMOCHA', 'MARIA', 'NELLY', '13/11/1964', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'BOYAC', 'PAIPA', 'CALLE 23 # 17A -48', 'LAS QUINTAS', '3158500299', '3158500299', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'AUXIILIAR', 'MIGUEL LOPEZ', 'ESPOSO', '3178453100', '3178453100', 'NO', 'NO', 'NO', 'ES UN CITA CONTROLPARA ANEMIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:39'),
(477, 0, 'HEMATOLOG', 'CC', '1070944753', 'GOMEZ', 'NI', 'TATIANA', 'ALEJANDRA', '29/07/1986', '28', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CALLE 19A # 1 -24', 'EL RINCON', '3124205945', '3124205945', 'TUTIGOMEZ839@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARIA NI', 'MADRE', '311217329', '3112173292', 'NO', 'NO', 'NO', 'PRIORITARIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:46'),
(478, 0, 'GASTROENTEROLOG', 'CC', '203925', 'LOPEZ', 'ROSO', 'ALFONSO', '0', '20/05/1959', '76', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAQUEZA', 'CALLE 33 # 19 -43 SUR', 'QUIROGA', '3134405190', '3134405190', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AGRICULTOR', 'LUIS LOPEZ', 'HIJO', '3134405190', '3134746061', 'NO', 'SI', 'NO', 'EXAMEN DE BIOPSIA  GAESOFAGOGASTRODENOSCOPIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 07:53'),
(479, 0, 'HEMATOLOG', 'CC', '39796576', 'GARCIA', 'DONCEL', 'YOLANDA', '0', '20/03/1970', '45', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 44 # 58C - 18 SUR', 'AURORA', '7670029', '3144367541', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AUXILIAR DE COCINA', 'LIGIA GARCIA', 'HERMANA', '7685774', '3144367541', 'NO', 'NO', 'NO', 'ES CITA DE CONTROL -', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 08:10'),
(480, 0, 'HEMATOLOG', 'CC', '28190654', 'MATEUS', 'MARIN', 'ANA', 'LEONOR', '20/08/1952', '62', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 143 # 151B -08', '0', '7007019', '3107309935', 'NO TIENE', 'PRIMARIA', '0', 'AMA DE CASA', 'DANIELA NAVARRO', 'FUNCIONARIA', '4473535 EXT 411', '3212108378', 'SI', 'SI', 'NO', 'PPRIORITARIA - EL PASIENTE PRESENTA TROMBOSITOPENIA ,ANEMIA Y LEUCOPENIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 08:16'),
(481, 0, 'CIRUG', 'CC', '52111984', 'PULIDO', 'PARDO', 'MARTA', 'ELIANA', '10/12/1971', '44', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'BOGOT', 'CRA 81B # 6B - 50', 'TERRAZAS  DE CASTILLA 2', '4730781', '3173829476', 'JOSORIANO@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'AMA DE CASA', 'JAIRO SORIANO', 'ESPOSA', '4484940', '3112043976', 'SI', 'NO', 'NO', 'PRORITARIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 08:23'),
(482, 0, 'ANESTESIOLOG', 'CC', '1018473725', 'HILDAGO', 'GONZALES', 'ERIKA', 'VIVIANA', '11/01/1995', '20', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA99#128B-24INT5', 'SUBA', '5360706', '3107662257', 'ERIKIVIS13@HOTMAIL.COM', 'TECN', 'CATOLICA', 'ESTUDIANTE', 'ARGEL GONZALEZ', 'MADRE', '5360706', '3153275421', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 08:29'),
(483, 0, 'ANESTESIOLOG', 'CC', '51969105', 'BERMUDEZ', 'BERMUDEZ', 'CLARA', 'INES', '23/05/1969', '45', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 29 SUR # 41 11', 'SANTA RITA', '4747962', '3142056751', 'CLABERBER@4HOTMAIL.COM', 'T', 'CATOLICA', 'EMPLEADA', 'DAVID SORIANO', 'ESPOSO', '4747962', '3118335453', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 08:51'),
(484, 0, 'CIRUG', 'CC', '65717185', 'ZU', 'BENITEZ', 'MARIA', 'DEL PILAR', '15/11/1974', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 20A # 96C - 66', 'VILLE MAR', '2677898', '3172130827', 'MAPIZUNIGA74@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'COORDINADORA OPERATIVA', 'ELIDA HERRERA', 'MADRE', '3134274742', '3134274742', 'SI', 'SI', 'NO', 'AGENDAR CON LA DOCTORA CUBILLOS - PRIORITARIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 09:01'),
(485, 0, 'HEMATOLOG', 'CC', '1023917189', 'AVILA', 'BASQUEZ', 'JHISON', 'ALBEIRO', '22/12/1991', '23', 'MASCULINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANS 12A ESTE # 47 -81 SUR', 'LA NUEVA GLORIA', '2642565', '3118106115', 'AVILA1222@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'ALBA MEDINA', 'ESPOSA', '2642565', '3208870963', 'NO', 'NO', 'SI', 'ES UN CONTROL CON EL DOCTOR  CARLOS BERMUDEZ - PRIORIDAD POR QUE YA SALIO DE LA CLINICA Y EL CONTRO DEBE SER AGENDADO PARA EL VIERNES', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 09:11'),
(486, 0, 'HEMATOLOG', 'CC', '55180528', 'ARTULUAGA', 'LOAIZA', 'SANDRA', 'PATRICIA', '20/06/1972', '42', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GIRALDO', '0', '0', '0', '0', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'NO', 'NO', 'NO', 'HACE DOS MESES HA LLAMADO Y NADA DE LA CITA', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '21/05/2015 09:15'),
(487, 0, 'CIRUG', 'CC', '51613229', 'GOMEZ', 'OSPINA', 'LUZ', 'ANGELA', '06/09/1959', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 100  50B-45  SUR TORRE 12 APTO  404 SECTOR 2', 'PORVENIR BOSA', 'NO', '3107088678', 'NO', 'BACHILLER', 'CRISTIANA', 'EMPLEADA', 'MARIA ANGELA BEJARANO', 'HIJA', 'NO', '3134006011', 'NO', 'NO', 'NO', 'CITA CONTROL PARA  LECTURA DE EXAMENES URG. HA  LLAMADO  VARIAS VECES  MUY  IMPORTANTE SE  LE VAN  A VENCER LOS  EXAMENES PRIORIDAD', '10ma Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 09:12'),
(488, 0, 'CIRUG', 'CC', '39540947', 'LOPEZ', 'ZABALA', 'MARIA', 'CRISTINA', '23/03/1966', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA118#89B-35', 'CIUDADELA COLSUDSIDIO', '4753337', '3183760789', 'MACRISLOZACZA66@HOTAMIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'INDEPENDIENTE', 'GERMAN MORENO SANTIAGO ARIZA', 'ESPOSO', '4753337', '3185510027', 'NO', 'NO', 'NO', 'CONTROL CON EL DOCTOR IVAN DARIO MARTIN', '1ra Llamada', 'Pedro Juli', '21/05/2015 09:25'),
(489, 0, 'CIRUG', 'CC', '52018466', 'OROZCO', 'CAVANZO', 'TO', 'MAYERLY', '25/11/1979', '45', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 82 D  41A-51  SUR', 'SAN  CARLOS  KENNEDY', 'NO', '3157903739', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'CLAUDIA LILIANA  OROZCO', 'HERMANA', '5721918', '3132412091', 'NO', 'NO', 'NO', 'CITA  CONTROL HA  LLAMADO  VARIAS VECES', '5ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 09:33'),
(490, 0, 'HEMATOLOG', 'CC', '41522305', 'MARTINEZ', 'DELGADO', 'CARMEN', '', '22/12/1936', '79', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 88 #74B-30', 'FLORENCIA', '4915341', '3115947672', 'NO TIENE', 'NINGUNO', 'CATOLICO', 'AMA DE CASA', 'NUBIA DELGADO', 'HIJA', '4915341', '3115947672', 'NO', 'NO', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE DOS MESES. EL CONTROL CON EL ESPECIALISTA DEBIO HABER SIDO EN EL MES DE ABRIL Y A', '6ta Llamada', 'Daniela L', '21/05/2015 09:17'),
(491, 0, 'CIRUG', 'CC', '51856851', 'TORRES', 'CAMARGO', 'MARIA', 'NELLY', '08/03/1967', '48', 'FEMENINO', 'COMFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 73B #16C-10', 'CIUDAD BOLIVAR', '78662886', '3202005669', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'EMPLEADA', 'JOSE SALDA', 'HIJA', '2027944', '3103219797', 'NO', 'NO', 'NO', 'PACIENTE DESEA SE LE SEA ASIGNADA LA CITA PARA EL MES DE JUNIO', '3ra Llamada', 'Daniela L', '21/05/2015 09:30'),
(492, 0, 'CIRUG', 'CC', '30344598', 'GUERRERO', 'MONTEALEGRE', 'MARIA', 'ERCILIOA', '20/09/1965', '49', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE57B#99B-36', 'BOSA', '5977205', '3212444836', 'NO', 'PRIMARIA', 'CATOLICA', 'AMA  DE CASA', 'DIANA GUERRERO', 'HIJA', '0', '3145224388', 'NO', 'NO', 'NO', 'DICE LA PACIENTE QUE ES PRIORITARIA CON LA DOCTORA CUBILLOS', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 09:34'),
(493, 0, 'ONCOLOG', 'CC', '118534', 'BRAVO', 'COCA', 'REGULO', 'NO', '10/03/1932', '83', 'MASCULINO', 'ECOSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 99   20B-52', 'FONTIBON', '4217086', '3133238365', 'NO', 'T', 'CATOLICA', 'PENSIONADO', 'DORIS  BRAVO', 'HIJA', '4217086', '3133238365', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.   PIERRE  PARA CONTROL DE  MEDICAMENTO Y  CONTROL  DE EXAMENES POR FAVOR  DAR ENTRE 7  9  Y  11  DE  JUNIO', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 09:40'),
(494, 0, 'CIRUG', 'CC', '41385963', 'ACERO', 'DE HERRERA', 'MARY', 'LUZ', '31/01/1947', '68', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 22F #105-62', 'LA GIRALDA', '6630692', '3134264643', 'MARYLUZACEROVILLAMIL@YAHOO.ES', 'T', 'CRISTIANA', 'PENSIONADO', 'ROMAN HERRERA', 'ESPOSO', '4585756', '3208430511', 'SI', 'NO', 'NO', 'CITA CONTROL PARA PRESENTAR EXAMENES PARA QUE LE ORDENEN LA CIRUG', '2da Llamada', 'Daniela L', '21/05/2015 09:43'),
(495, 0, 'HEMATOLOG', 'CC', '55180528', 'ARTUNDUAGA', 'LOAISA', 'SANDRA', 'PATRICIA', '20/06/1972', '42', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GIRARDOT', 'MAZA CASA11', 'POSO AZUL', '3017114388', '3017114388', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'LUS MARINA ARTUNDUAGA', 'HERMANA', '3017114388', '3017114388', 'NO', 'NO', 'NO', 'PACIENTE URGENTE PRESENTA HOPITALISACION HACE DOS MESES Y LLEVA DOS MESES DE ESPERAA', '4ta Llamada', 'Pedro Juli', '21/05/2015 09:35'),
(496, 0, 'CIRUG', 'CC', '20169610', 'OCAMPO', 'DE DAZA', 'TERESA', 'NO', '02/07/1938', '76', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA 60 70C-08', 'SAN FERNANDO', '6307998', '3143902570', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'INGRID DAZA OCAMPO', 'HIJA', '2507671', '3155301068', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ HA  TIENE  ORDEN  DESDE  EL  24  DE  ABRIL', '5ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 09:56'),
(497, 0, 'COLOPROCTOLOG', 'CC', '80169842', 'RAMIREZ', 'BAQUE', 'ANDRES', 'YAIR', '29/10/1981', '33', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA52#79-19', 'GAITAN', '4010654', '3167400558', 'ANDRESRAMIREZ@GAELTDA.COM', 'TECN', 'NINGUNA', 'EMPLEADO', 'MONICA RODRIGUEZ', 'ESPOSA', '4010654', '3182384149', 'SI', 'SI', 'NO', 'LLAMA PARA PEDIR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 09:48'),
(498, 0, 'CIRUG', 'CC', '21550658', 'MORALES', '', 'MARIA', '0', '00:00:00', '0', 'FEMENINO', 'O', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BARBOSA', '0', '0', '0', '0', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'NO', 'NO', 'NO', 'DICE QUE HACE QUINCE DIAS HA LLAMADO Y NADA DE LA CITA', '7ma Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:01'),
(499, 0, 'ORTOPEDIA GENERAL', 'CC', '41491242', 'CASTRO', 'NO', 'MARIA', 'DEL  CARMEN', '25/01/1950', '65', 'FEMENINO', 'COLSUBSIDIO', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'FUNZA', 'CALLE  18  7A-60', 'MEXICO SECTOR  SAN  MIGUEL', '8259939', '3133589755', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ZORAIDA  CASTRO  GARCIA', 'HIJA', '8259939', '3133589755', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.  JULIO  JOSE  ALVIZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:01'),
(500, 0, 'HEMATOLOG', 'CC', '51586146', 'AUCIQUE', 'CORREA', 'GLADYS', 'AMPARO', '26/06/1959', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6D #79A-56', 'CASTILLA', '3093594', '3125119171', 'NO TIENE', 'T', 'CATOLICO', 'AMA DE CASA', 'DAYANA TAMAYO', 'HIJA', '3300000 EXT 80346', '3134322070', 'NO', 'NO', 'NO', 'CITA CONTROL PARTA PRESENTAR RESULTADOS DE EXAMENES', '1ra Llamada', 'Daniela L', '21/05/2015 10:03'),
(501, 0, 'PSICOLOG', 'CC', '52108956', 'DELGADO', 'CORTEZ', 'GLORIA', 'MILENA', '12/04/1974', '41', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 13A # 3 -51', 'SEVILLA', '3474733', '3138064982', 'NO TIENE', 'TECN', 'CATOLICO', 'EMPLEADA', 'EBELIO DELGADO', 'PADRE', '7165092', '3134412452', 'NO', 'NO', 'NO', 'FAVOR AGENDAR PARA LAS 08:00 AM - LLAMAR CON 2 DIAS DE ANTICIPACION', '2da Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 09:19'),
(502, 0, 'CIRUG', 'CC', '52506792', 'MORALES', 'CASTRO', 'YAZMIN', '-', '11/04/1979', '36', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA77 KBISA # 59 -27', 'BOSA', '7756331', '3212288152', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICO', 'DOCENTE', 'ROSAURA CASTRO', 'MADRE', '7756331', '3138813495', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 09:37'),
(503, 0, 'ONCOLOG', 'CC', '51894187', 'REYES', 'CASTA', 'MARIA', 'DEL PILAR', '07/11/1966', '48', 'FEMENINO', 'UNICAJAS', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 77 # 1 - 03', 'MARICUELA', '7682944', '3214708203', 'PILARREYES7@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'JOSE REYES', 'PADRE', '7682944', '3214708203', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 09:44'),
(504, 0, 'HEMATOLOG', 'CC', '30347534', 'LUNA', 'RUBIANO', 'NANCY', '-', '08/06/1968', '46', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 94A # 6 C -18', 'TINTAL 2', '3012149', '3125935423', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'OFICIOS VARIOS', 'RICARDO FAJARDO', 'ESPOSO', '3138887560', '3138887560', 'NO', 'NO', 'NO', 'CITAR ENES UN CONTROL CON ELDOCTOR OSCAR PE', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 10:04'),
(505, 0, 'CIRUG', 'CC', '19363510', 'MONROY', 'RICARDO', 'JOSE', 'ANTONIO', '11/06/1959', '56', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE23D#85B-55', 'MODELIA', '2956809', '3105533716', 'JOSEAMONROYR@HOTMAIL,COM', 'POSTGRADO', 'CATOLICO', 'PENSIONADO', 'YOVANNA MOROY', 'HERMANA', '4124698', '3213202244', 'NO', 'NO', 'NO', 'CONTROL PABLO JOSE JIMENES MEJIA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:05'),
(506, 0, 'CIRUG', 'CC', '52426418', 'LEON', '', 'LILIA', 'BEATRIZ', '06/09/1976', '38', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DG39#5-74 ESTE', 'PARAISO', '3208646261', '3124911144', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MONROY VARGAS', 'ESPOSO', '3124911144', '3124911144', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 10:04'),
(507, 0, 'GINECOONCOLOG', 'CC', '35423933', 'GARCIA', 'MERCHAN', 'NELLY', 'RUTH', '29/12/1980', '33', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA A  11-42', 'BOLIVAR 83', 'NO', '3208487529', 'YLLENRUTH@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'JOSE  GIOVANNY  GARCIA', 'HERMANO', 'NO', '3202839479', 'NO', 'NO', 'SI', 'CITA  CONTROL  PARA  SABER SI  CONTINUA  CON  QUIMIOTERAPIA O  Q DEBE HACER', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:09'),
(508, 0, 'DERMATOLOG', 'CC', '23250379', 'ROMERO', '', 'ROSA', '0', '00:00:00', '0', 'FEMENINO', '0', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', '0', '0', '0', '0', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'NO', 'NO', 'NO', 'HACE MAS DE DOS MESES HA LLAMADO POR CITA Y NADA', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '21/05/2015 10:12'),
(509, 0, 'CIRUG', 'CC', '51916644', 'VIANCHA', 'PEREZ', 'OLGA', 'LUCIA', '07/09/1968', '46', 'FEMENINO', 'CAPITASALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG.   51  BIS 56A-32', 'NUEVO  MUZU', '7134505', '3118579126', 'OLVIAN9797@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'RAFAEL  VIZCAINO', 'ESPOSO', 'NO', '3124657413', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:16'),
(510, 0, 'CIRUG', 'CC', '20705943', 'CARDENAS', 'MAHECHA', 'MARIA', 'ADELAIDA', '18/11/1982', '32', 'FEMENINO', 'FAMISAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CRA13#16A-21', 'VILLA SAJONIA', '0', '3133557596', 'ADELAIDACARDENAS2011@HOTMAIL.COM', 'T', 'CATOLICA', 'INDEPENDIENTE', 'ABEL MORA', 'ESPOSO', '0', '3112655009', 'SI', 'SI', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:19'),
(511, 0, 'HEMATOLOG', 'CC', '51575917', 'ESPINOSA', 'COLORADO', 'GLORIA', '', '14/08/1960', '54', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRA6AESTE#32B 52 SUR', 'ORACIO ORJUELA', '3642478', '3115038826', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'MORENO ESPINOSA MAURICIO', 'HIJO', '3203413508', '3203413508', 'NO', 'NO', 'NO', 'CONTROL DOCTORA SILVIA ROJAS', '3ra Llamada', 'Pedro Juli', '21/05/2015 10:20'),
(512, 0, 'HEMATOLOG', 'CC', '51952988', 'RODRIGUEZ', 'ROJAS', 'MARISOL', 'NO', '21/07/1967', '47', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  132A  137-09', 'NOGALES DE  SUBA', '6900013', '3213397356', 'MRZ126@HOT.MAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'KAREN  PATRICIA BERMEO RODRIGUEZ', 'HIJA', '6881165', '3214596523', 'NO', 'NO', 'NO', 'CITA  URG.  CONTROL  DRA  SILVIA  MARGARITA  HA  LLAMADO  HACE MAS  DE  UN  MES  Y  NECESITA CONTROL PORQUE  ES MEDICADA CADA TRES MESES  POR  FAVOR PRIORIDAD ********', '4ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:25'),
(513, 0, 'ANESTESIOLOG', 'CC', '41623242', 'CAMACHO', '', 'HERLINDA', '0', '00:00:00', '0', 'INDEFINIDO', '0', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', '0', '0', '0', 'O', 'O', 'OTRO', '0', 'O', '0', '0', '0', '0', 'NO', 'NO', 'NO', 'DICE QUE HA LLAMADO Y LLAMADO Y NADA DE CITA', '10ma Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:26'),
(514, 0, 'CIRUG', 'CC', '52295533', 'CARMONA', 'HERRERA', 'DAMARIS', 'NO', '08/12/1976', '38', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FUNZA', 'CRA 6  23-70 BLOQUE 14  CASA  12', 'SUAME DOS', 'NO', '3112012682', 'DAMACAR111@YAHOO.ES', 'T', 'CATOLICA', 'ASISTENTE COMERCIAL', 'HENRY  SALAMANCA COCA', 'ESPOSO', 'NO', '3108847069', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.  PABLO  JIMENEZ  PACIENTE  LLAMO  EL  7  DE  MAYO  Y  ESTA E SPERANDO ASIGNACION DE  LA  CITA', '2da Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:31'),
(515, 0, 'GINECOONCOLOG', 'CC', '23741392', 'ROBLES', 'FUENTE', 'NIBIA', '', '23/10/1958', '56', 'FEMENINO', 'CAPRESOCA', 'NO', 'SI', 'A', 'CASANARE', 'YOPAL', 'DIG34#31B-29', '0', '0', '3143939747', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'MARBEL ROBLES', 'SOBRINA', '0', '3115644537', 'SI', 'NO', 'NO', 'HA LLAMADO VARIAS VECES CITAS', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:33'),
(516, 0, 'DERMATOLOG', 'CC', '20884735', 'CIFUENTES', 'DE  IBA', 'CAROLINA', 'CONCEPCION', '19/09/1942', '72', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CRA 4A  24-22', 'LA MACARENA', 'NO', '3118581709', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ROSA  HELENA  IBA', 'HIJA', '7923282', '3116249383', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ HA  LLAMADO  VARIAS VECES URG.', '2da Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:44'),
(517, 0, 'GINECOONCOLOG', 'CC', '20843352', 'MARTINEZ', 'SIERRA', 'ANATILDE', '', '12/06/1946', '69', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CR 19 A#22-31', 'REMANZO', '-', '3114936500', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'ANA LUISA MARTINEZ', 'HIJA', '-', '3114936500', 'NO', 'NO', 'NO', 'CITA CONTROL PARA PRESENTAR EXAMENES', '1ra Llamada', 'Daniela L', '21/05/2015 10:23'),
(518, 0, 'NEUROCIRUG', 'CC', '63289785', 'FARFAN', 'BASTO', 'MARIA', 'DE LA CRUZ', '03/05/1955', '60', 'FEMENINO', 'UNICAJAS', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE167#58-B96', 'PORTALES DEL NOTE', '6705362', '3123884795', 'LINA305.LP@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'ABOGADO', 'SANDRA DUQUE', 'HIJA', '5266551', '3204594097', 'NO', 'SI', 'NO', 'HACE DOS MESE HA ESTADO LLAMADO CONTROL DOCTORA ANGELA MARIA ALVARES IGUARAN', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '21/05/2015 10:43'),
(519, 0, 'ENDOCRINOLOG', 'CC', '79186388', 'RODRIGUEZ', 'PINTOR', 'JAIME', '', '27/06/1978', '47', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'CAJIC', 'VEREDA LAS MANAS', 'VEREDA LAS MANAS', '6731561', '3115218848', 'PROACABADOSPBELTDA@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'GERENTE', 'ILDA GARZON', 'ESPOSA', '6731578', '3132528062', 'SI', 'SI', 'NO', ' LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 10:56'),
(520, 0, 'CIRUG', 'CC', '21046753', 'HERNANDEZ', 'LEON', 'ANA', 'ELSA', '01/12/1961', '53', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  54C  SUR 87-21 CASA 177', 'CHICALA', '7497956', '3013816062', 'JACASINLJUL@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'JAIME ENRIQUE NIETO', 'ESPOSO', 'NO', '3214810566', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ', '3ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 10:50'),
(521, 0, 'HEMATOLOG', 'CC', '21087538', 'GUERRA', 'LUNA', 'ADELAIDA', '', '30/05/1969', '45', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA16#180-15-17', 'SANTA FE', '6716569', '3204536491', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'EMPLEADA', 'DEYANIRA GOMEZ', 'SUEGRA', '6716569', '0', 'NO', 'SI', 'NO', 'CONTROL DOC SILVIA MARGARITA PORRAS', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 11:04'),
(522, 0, 'DERMATOLOG', 'CC', '20937967', 'RODRIGUEZ', 'DE MONTOYA', 'LEONOR', '', '08/08/1948', '67', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CLL12A2-19', 'UBATE', '7128037', '3132698999', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LUIS ALFONSO MONTOYA', 'HIJO', '7254244', '3138438264', 'SI', 'SI', 'NO', '15 DIAS SIN RESPUESTA', '3ra Llamada', 'Pedro Juli', '21/05/2015 11:01'),
(523, 0, 'HEMATOLOG', 'CC', '20564186', 'RAMIREZ', 'GODOY', 'ROSALBA', '', '26/01/1951', '64', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL63#74A11', 'NORMANDIA', '4289817', '3002684648', 'ROSALBARAMIREZABOGADA@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ABOGADA', 'DIEGO ANDRES PEREZ RAMIREZ', 'HIJO', '2526556', '3002684599', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 11:07'),
(524, 0, 'ANESTESIOLOG', 'CC', '4449424', 'ROJAS', 'GONZALES', 'GUSTAVO', '', '18/09/1947', '67', 'MASCULINO', 'UNICAJA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE71IBISSUR#27A-16', 'CIUDAD BOLIVAR', '7900045', '3116232130', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'HOGAR', 'HUMBERTO GONZALEZ', 'YERNO', '7900045', '3115420896', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 11:10'),
(525, 0, 'UROLOG', 'CC', '2335557', 'HERNANDEZ', 'ROMERO', 'ECCEHOMO', 'NO', '19/09/1939', '75', 'MASCULINO', 'MASCULINO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  128A  88B-05', 'SUBA  RINCON', '6811196', '3143303826', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JOSE  MAURICIO  HERNANDEZ', 'HIJO', 'NO', '3219374992', 'NO', 'NO', 'NO', 'CITA  DE  CONTROL DR. GERMAN  ESCALLON  URG', '2da Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 11:03'),
(526, 0, 'ONCOLOG', 'CC', '51742667', 'AVELLANEDA', 'NO', 'FLOR', 'ALBA', '19/08/1964', '50', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 97 16B-36', 'FONTIBON', '4185574', '3202892137', 'FLORITAPOTI@HOTMAIL.COM', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'MANUEL  RICARDO  TIBOCHA', 'HIJO', 'NO', '3138867104', 'NO', 'NO', 'NO', 'CITA GRUPO  ONCOLOGICO ESPECIALIZADA', '3ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 11:16'),
(527, 0, 'HEMATOLOG', 'CC', '390528', 'BALLEJO', 'RODRIGUEZ', 'JESUS', '', '02/05/1938', '77', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'C', 'CUNDINAMARCA', 'SOACHA', 'CRA6#11-21', 'SOACHA CENTRO', '9025103', '3214683099', 'ALIX.CBALLEN@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ALIX BALLEN', 'HIJA', '9025103', '3214683099', 'NO', 'SI', 'SI', 'CONTROL DOCTORA SILVIA MARGARITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 11:23'),
(528, 0, 'HEMATOLOG', 'CC', '23983474', 'MENDOZA', 'RIAPIRA', 'BLANCA', 'LILIA', '20/05/1958', '57', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 53A #5B-25', 'SAN RAFAEL', '4205389', '3112798268', 'NO TIENE', 'PRIMARIA', 'CRISTIANA', 'AMA DE CASA', 'GLOVIS MENDOZA', 'HERMANO', '4205389', '3105561348', 'SI', 'NO', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE UN MES.  PARA QUE EL PACIENTE PUEDA INGRESAR A CIRUG', '3ra Llamada', 'Daniela L', '21/05/2015 10:51'),
(529, 0, 'ONCOLOG', 'CC', '80438733', 'SABALA', 'GARCIA', 'FABIAN', 'NO', '19/01/1971', '44', 'MASCULINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  55 SUR 34-15', 'SAN  VICENTE', 'NO', '3118305078', 'NO', 'BACHILLER', 'CATOLICA', 'DESEMPLEADO', 'MERCEDES GARCIA', 'MAMA', 'NO', '3118305078', 'NO', 'NO', 'SI', 'CITA CONTROL  URG. DR. PIERRE  PACIENTE INF  Q  EL  DR.  LE  COLOCO EN  LA  ORDEN  PARA EL  26  DE  MAYO  POR  FVR  DAR  PRIORIDAD', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 11:28'),
(530, 0, 'HEMATOLOG', 'CC', '21082376', 'BELTRAN', 'CRUZ', 'OLGA', 'LUSIA', '14/04/1978', '37', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CRA3SUR#11A76', 'MANABLANCA', '3124366248', '3124366248', 'NO TIENE', 'OTRO', 'CATOLICA', 'OPERARIA', 'PABLO EMILIO ACOSTA', 'ESPOSO', '3132575853', '3132575853', 'NO', 'NO', 'NO', 'CONTROL DE HEMATOLOGIA DOCTOR BERMUDEZ', '1ra Llamada', 'Pedro Juli', '21/05/2015 11:20'),
(531, 0, 'CIRUG', 'CC', '41633210', 'ESTEVAN', 'BANARRETE', 'MARTHA', '', '24/02/1954', '61', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA75#64C-24', 'EL ENCANTO', '2240101', '3222117717', 'MARTHA.INES.ESTEBAN@GMAIL.COM', 'ESPECIALIZACI', 'CATOLICA', 'PENSIONADA', 'EWIND NAVARRETA ESTEBAN', 'HIJO', '3021909', '3143232380', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 11:41'),
(532, 0, 'HEMATOLOG', 'CC', '1020725834', 'RAMIREZ', 'BARON', 'SANTIAGO', '', '15/06/1987', '27', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA46#123-61', 'BATAN', '4834355', '3132848955', 'SANTI.RAMIREZ@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADO', 'YASMIN PINZON', 'MAMA', '3777094 CALI', '3115228902', 'NO', 'SI', 'NO', 'CONTROL DOC BERMUDEZ', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 11:46'),
(533, 0, 'GINECOONCOLOG', 'CC', '52093729', 'SOLAQUE', 'CASTILLO', 'ANA', 'ISABEL', '31/07/1975', '39', 'FEMENINO', 'UNICAJAS CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 9  ESTE 2-41', 'LOS  LACHES', '4553556', '3142257310', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'RAUL  ALFONSO SOLAQUE', 'PAPA', 'NO', '3208574809', 'NO', 'NO', 'NO', 'CITA  CONTROL  DR.  JOSE  VICENTE SALAMANCA  PRIORIDAD  POR  FAVOR  ESTA LLAMANDO  DESDE  ABRIL', '2da Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 11:49'),
(534, 0, 'GINECOONCOLOG', 'CC', '39813414', 'BERNAL', 'RONDEROS', 'LEXI', 'SAMIRA', '16/03/1983', '32', 'FEMENINO', 'SALUTOTAL', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'GUADUAS', 'CRA14#1634', 'VIREYES', '8466671', '3104827535', 'LEXI.BERNAL@HOTMAIL.COM', 'T', 'CATOLICA', 'HOGAR', 'CARLOS GUERRERO', 'ESPOSO', '3143577297', '3143577297', 'NO', 'NO', 'NO', 'CITA CON DOCTOR RICO', '1ra Llamada', 'Pedro Juli', '21/05/2015 11:54'),
(535, 0, 'HEMATOLOG', 'CC', '23432770', 'BERNAL', '', 'ESTER', '', '05/06/1944', '70', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA1B#29-73', 'FALAHORRA', '86920', '3134275975', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'FLORALBA REYES', 'HIJA', '821920', '3125375733', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 11:59'),
(536, 0, 'HEMATOLOG', 'CC', '19234976', 'RONCANCIO', '', 'MARIO', '', '18/02/1954', '61', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA95A#133A-10', 'SUBA', '6805996', '3203005463', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'HOGAR', 'MIRIAN ESTELA NI', 'HERMANA', '6894245', '3133581871', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 12:09'),
(537, 0, 'ONCOLOG', 'CC', '39705134', 'FRANCO', 'SARMIENTO', 'ADRIANA', ' MARIA', '26/12/1984', '50', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE17D#103B-70', 'FONTIBON', '4771413', '3132722643', 'ADRIANA.FRANCO.SARMIENTO@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'TONNY AVILAN', 'ESPOSO', '4771413', '3114888766', 'NO', 'SI', 'NO', 'CONTROL DOC GUSTAVO MARQUEZ', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 12:02'),
(538, 0, 'CIRUG', 'CC', '20282440', 'BALLESTEROS', 'DE LARA', 'MARIA', 'TERESA', '15/11/1940', '74', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 70  73A-75', 'BONANZA', '2232451', '3143820333', 'NO', 'PRIMARIA', 'CATOLICA', 'COMERCIANTE', 'MARIA  DEL  PILAR LARA BALLESTEROS', 'HIJA', '2232451', '3143820333', 'NO', 'NO', 'NO', 'CITA  CONTROL', '3ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 12:09'),
(539, 0, 'ONCOLOG', 'CC', '1024473391', 'AVILA', 'MORA', 'MARINA', '', '31/05/1955', '59', 'FEMENINO', 'CAPITAL SALID', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE77#20-60SUR', 'CORDILLERA', '7904583', '3118766379', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'RECICLADORA', 'BLANCA ESTELLA AVILA', 'HERMANA', '7904583', '3118766379', 'NO', 'NO', 'NO', 'CLLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 12:17'),
(540, 0, 'ONCOLOG', 'CC', '41556513', 'RODRIGUEZ', 'PADILLA', 'ANA', 'BELEN', '19/10/1950', '64', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA  17  3B-41', 'SAN  PABLO', '8816752', '3102993388', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MONICA BOLIVAR', 'HIJA', 'NO', '3102993388', 'NO', 'NO', 'SI', 'CITA  CONTROL  PARA  MEDICAMENTO DR.  PIERRE', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 12:29'),
(541, 0, 'CIRUG', 'CC', '52274160', 'MORENO', 'RENGIFO', 'ANUNCIACION', '', '19/10/1976', '38', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA11B#3-29', 'SAN BERNARDO CENTRO', '3336275', '3138830916', 'NUNCIMORENO@HOTMAIL.COM', 'T', 'CATOLICA', 'AMA DE CASA', 'WUILSON SALINAS', 'ESP', '3336275', '3112193939', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 12:37'),
(542, 0, 'ONCOLOG', 'CC', '26275123', 'CALCEDO', 'MENA', 'FRANCIA', 'HELENA', '21/11/1960', '55', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 71B #28-91', 'PARAISO', '-', '3208473468', 'NO TIENE', 'PRIMARIA', 'CRISTIANA', 'AMA DE CASA', 'ALIRIO CALCEDO', 'SOBRINO', '-', '3214000552', 'NO', 'NO', 'NO', 'CONTROL POST OPERATORIO', '1ra Llamada', 'Daniela L', '21/05/2015 12:46'),
(543, 0, 'HEMATOLOG', 'CC', '52278091', 'HERRERA', 'QUESADA', 'CIOMARA', 'LUCIA', '08/03/1975', '38', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA71D#53C-22', 'OLARTE', '4707657', '3208086021', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARI MERCEDES HERRERA', 'HERMANA', '4707657', '3142303572', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 12:49'),
(544, 0, 'COLOPROCTOLOG', 'CC', '39723185', 'MASMELA', 'CASAS', 'BLANCA', 'ISABEL', '12/01/1967', '48', 'FEMENINO', 'CAPITAL SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 5D  48K-04', 'BOCHICA SUR', '5671019', '3204295459', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANA  FERNANDA GONZALEZ', 'PRIMA', '5671019', '3226015501', 'SI', 'SI', 'NO', 'CITA  POR PRIMERA VEZ HA  LLAMADO  VARIAS VECES POR  FAVOR  DAR  PRIORIDAD ES URG.', '5ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 12:54'),
(545, 0, 'CIRUG', 'CC', '35528185', 'ROCHA', '', 'SOFIA', 'MILENA', '09/02/1935', '80', 'FEMENINO', 'COLSUDSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CRA15#1149', 'SANTA ISABEL', '3112368738', '3112368738', 'NO TIENE', 'OTRO', 'CATOLICA', 'HOGAR', 'GARCIA ROCHA ISABEL', 'HIJA', '3112368738', '3112368738', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 13:03'),
(546, 0, 'HEMATOLOG', 'CC', '51894632', 'HERNANDEZ', 'ROMERO', 'MARTHA', 'NIDIA', '06/11/1967', '48', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 77 Q  55-24  APTO 301', 'ROMA', '4801135', '3016578073', 'NIDIA1_@HOTMAIL.COM', 'TECN', 'CATOLICA', 'EMPLEADA', 'BERNARDO MARTINEZ', 'ESPOSO', 'NO', '3003006373', 'NO', 'NO', 'NO', 'CONTROL  DRA SILVIA  MARGARITA URG.  PACIENTE  ESTA  LLAMANDO HACE UN  M,E', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '21/05/2015 13:21'),
(547, 0, 'ANESTESIOLOG', 'TI', '98062856025', 'RODRIGUEZ', 'MANGONES', 'CRISTIAN', 'CAMILO', '28/06/1998', '17', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 187A #8-46', 'LIJACA', '4698097', '3204983835', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'ESTUDIANTE', 'ERNESTO RODRIGUEZ', 'PADRE', '4698097', '3204983835', 'NO', 'NO', 'NO', 'URGENTE- PACIENTE ESPERANDO CITA CON PRIORIDAD DEBIDO A QUE EL TUMOR QUE TIENE EN LA CARA CRECE PROGRESIVAMENTE', '4ta Llamada', 'Daniela L', '21/05/2015 13:11'),
(548, 0, 'CIRUG', 'CC', '51710610', 'CORTES', 'VARON', 'CLARA', 'INES', '20/12/1962', '53', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CR 54 #64A-45', 'MODELO NORTE', '4706621', '3005641014', 'CLARACORTESVARON@HOTMAIL.COM', 'ESPECIALIZACI', 'CATOLICO', 'EMPLEADO', 'IRMA CORTES', 'HERMANA', '2602251', '3005630263', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Daniela L', '21/05/2015 13:23'),
(549, 0, 'CIRUG', 'CC', '46661204', 'SUAREZ', 'PUERTO', 'MARIA', 'CRISTINA', '01/01/1966', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL5-12-25', 'SAN BERNARDO', '5612170', '3133426870', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'ASISTENTE DE CARTERA', 'FERNADO ALEXANDER', 'ESPOSO', '3513312', '3138627288', 'NO', 'NO', 'NO', 'CONTROL CON EL DOCTOR PABLO JIMENEZ MEJIA', '1ra Llamada', 'Pedro Juli', '21/05/2015 13:19'),
(550, 0, 'HEMATOLOG', 'CC', '5879514', 'AYANENE', 'OYOLA', 'JOSE', 'DAVID', '05/03/1950', '65', 'MASCULINO', 'COMFACUNDI', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 74B #87I-14', 'BOSA SAN BERNARDINO', '4634153', '3202554338', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'DESEMPLEADO', 'YOLANDA AYANENE', 'HIJA', '4634153', '3202554338', 'SI', 'SI', 'NO', 'CONTROL - SEGUIMIENTO PACIENTE PRESENTA DETERIORI PROGRESIVO EN SU SALUD Y DESEA SER VALORADO POR SU ESPECIALISTA', '2da Llamada', 'Daniela L', '21/05/2015 13:33');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(551, 0, 'CIRUG', 'CC', '51790813', 'ALARCON', 'DAZA', 'ROSA', 'MIRIAN', '27/07/1965', '49', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL19A#82-65', 'AYUELOS', '7029287', '3204995326', 'RALRCONGRUPOCONSTUMAX.COM', 'T', 'CATOLICA', 'EMPLEADA', 'JULIO BERNAL', 'ESPOSO', '7029287', '3103061909', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 13:52'),
(552, 0, 'CIRUG', 'CC', '28251812', 'GARCIA', 'DE GARCIA', 'ANA', 'FRANCISCA', '02/04/1949', '66', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 58ISUR#78M-09', 'JOSE ANTONIO GALAN DE BOSA', '7821654', '3202016137', 'NO TIENE', 'PRIMARIA', 'CRISTIANA', 'AMA DE CASA', 'GERONIMO GARCIA', 'HIJO', '7821654', '3202016137', 'NO', 'SI', 'NO', 'LLAMAR PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 12:57'),
(553, 0, 'HEMATOLOG', 'CC', '41342436', 'MANRIQUE', 'PULIDO', 'MIRIAM', 'TERESA', '20/01/1944', '71', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE18#102-682 PISO', 'FONTIBON CENTRO', '6056595', '3182275845', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'CONFECCION', 'INGRI M RODRIGUEZ', 'HIJA', '6634610', '3012893163', 'NO', 'NO', 'NO', 'CONTROL DOC CARLOS DANIEL BERMUDEZ SILVA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:05'),
(554, 0, 'CIRUG', 'CC', '1063140027', 'VELASCO', 'HERNANDEZ', 'BERLI', 'DEL SOCORRO', '28/10/1973', '39', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE127BBIS#19-21', 'LA CALLEJA', '8141374', '3138396549', 'NO TIENE', 'PRIMARIA', 'CRISTIANA', 'DOMESTICA', 'DORIS VELASCO', 'HERMANA', '8141374', '3138396549', 'SI', 'SI', 'NO', 'LLAMADA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:23'),
(555, 0, 'CIRUG', 'CC', '51975929', 'DIAZ', 'RODRIGUEZ', 'RUTH', 'JUDITH', '14/04/1969', '46', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG94BIS#56-6-1', 'RIONEGRO', '2565207', '3102908280', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'SECRETARIA', 'MARIA DORIS RODRIGUEZ', 'MAMA', '4715863', '3102908280', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:28'),
(556, 0, 'CIRUG', 'CC', '51802507', 'GUTIERREZ', 'CUEVA', 'OLGA', 'DELIDA', '24/03/1964', '51', 'FEMENINO', 'COLSUBSIDIO', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'USIACUR', 'CALLE 74 #78D-41 SUR', 'LAS ALAMEDAS', '4495434', '3118864951', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'EMPLEADO', 'NELSY TORRES', 'AMIGA', '-', '3003003286', 'SI', 'SI', 'NO', 'URGENTE - PACIENTE REMITIDO ESPERANDO CITA CON ESPECIALISTA DESDE FEBRERO. SOLICITA SE LE SEA AGENDADO ANTES DEL 30 DE MAYO DEBIDO A QUE LA VALORACI', 'Mas de 10 llamadas', 'Daniela L', '21/05/2015 13:43'),
(557, 0, 'ONCOLOG', 'CC', '51747399', 'CARDENAS', '', 'MARIA', 'MERCEDES', '15/08/1960', '55', 'FEMENINO', 'COMFACUNDI', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 87 SUR #8-38', 'YOMASITA', '7640199', '3208935953', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'DIANA HERNANDEZ', 'HIJA', '3821616', '3017212614', 'NO', 'NO', 'NO', 'URGENTE CAMBIO DE PROTESIS (COLOSTOMIA) CITA CONTROL PACIENTE CON COLOSTOMIA. PACIENTE DESEA SE LE AGENDE LO M', '2da Llamada', 'Daniela L', '21/05/2015 14:13'),
(558, 0, 'COLOPROCTOLOG', 'CC', '51747399', 'CARDENAS', '', 'MARIA', 'MERCEDES', '15/08/1960', '55', 'FEMENINO', 'COMFACUNDI', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 87 SUR #8-38', 'YOMASITA', '7640799', '3208935953', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'DIANA HERNANDEZ', 'HIJA', '3821616', '3017212614', 'NO', 'SI', 'NO', 'PACIENTE ESPERANDO CITA DESDE EL MES DE ABRIL PARA QUE LE INDIQUEN SI LE HARAN LA CIRUG', '2da Llamada', 'Daniela L', '21/05/2015 14:25'),
(559, 0, 'CIRUG', 'CC', '25957901', 'ESPIDIA', 'ROBI', 'MARIA', 'BERNARDA', '23/09/1950', '65', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 19 #51-28', 'CHAPINERO', '2558900', '3135184699', 'NO TIENE', 'OTRO', 'CATOLICO', 'INDEPENDIENTE', 'INES ANGEL', 'AMIGA', '2558900', '3212698343', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Daniela L', '21/05/2015 14:32'),
(560, 0, 'CIRUG', 'CC', '217526', 'HUERFANO', 'HORTUA', 'ALFONSO', '', '01/08/1937', '78', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CHIPAQUE', 'VEREDA CIECHA', 'VEREDA CIECHA', '0', '3153886205', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'INCAPACITADO', 'LUIS ALFONSO HUERFANO', 'HIJO', '0', '3153886205', 'NO', 'SI', 'NO', 'CONTROL LLAMO HACE 8 DIAS CON EL DOCTOR CHAPARRO PIDE CAMBIO POR LA DOCTORA SANDRA PARDO DICE LA DOCTORA QUE SEA EL JUEVES ALAS 3:00PM', '8va Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:35'),
(561, 0, 'HEMATOLOG', 'CC', '20262736', 'PE', 'PEREZ', 'LUCRECIA', '', '22/12/1941', '74', 'FEMENINO', 'UNICAJA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'KM5VIA LA CALERACRA9#100C-03ESTE', 'SURE', '6320744', '3145557422', 'NO TIENE', 'PRIMARIA', 'TESTIGO DE JEHOVA', 'HOGAR', 'JOHANNADAZA PE', 'HIJA', '6320744', '3145557422', 'NO', 'NO', 'NO', 'CONTROL DOCTOR  CARLOS DANIEL BERMUDEZ', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:43'),
(562, 0, 'ONCOLOG', 'TI', '97072914680', 'ABRIL', 'BECERRA', 'IVAN', 'ANDRES', '29/07/1997', '17', 'MASCULINO', 'SALUDCOOP', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 129D  104D-11', 'AURES DOS', '6933602', '3202803927', 'NANABECERRA1975@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'CASA', 'MARIA LILIANA BECERRA SUAREZ', 'MAMA', '6933602', '3202803927', 'NO', 'NO', 'SI', 'CONTROL PACIENTE INSISTE  EN QUE  SE  AGENDE SU LLAMDA PORQ TIENE GANADA UNA  TUTELA Y  YA  TIENE  RESULTADOS DE  BIOPSIA PARA  Q  EL  DR.  JORGE CARO  LA VEA', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 14:42'),
(563, 0, 'CIRUG', 'CC', '51994479', 'HERNANDES', 'ANGARITA', 'PEGGY', '', '16/03/1970', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL7#9251', 'CIUDAD TINTAL', '4488728', '3134704454', 'PEGHERANG70@HOTMAIL.COM', 'T', 'CATOLICA', 'HOGAR', 'MILLER YESID', 'ESPOSO', '4488728', '3134599582', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 14:55'),
(564, 0, 'CIRUG', 'CC', '11364090', 'SALAZAR', 'TONJUELO', 'ANGEL', 'ALBERTO', '05/12/1962', '53', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'GRANADA', 'CRA14#8-05', 'TRIUNFO', '0', '3138147382', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'GOHANNA PEQUIA RODRIGUEZ', 'ESPOSA', '0', '3112526893', 'NO', 'NO', 'NO', 'CONTROL DOCTOR CLAUDIA PRIETO', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 14:58'),
(565, 0, 'CIRUG', 'CC', '39727313', 'ALBARES', 'GUTIERRES', 'ROSALBINA', '', '25/12/1963', '52', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL38BIS#33-70', 'VILLA MAYOR', '5616139', '3213188988', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'VIGILANTE', 'ALBARES GUTIERRES ANA JUDID', 'HERMANA', '3016275662', '5613939', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 15:01'),
(566, 0, 'ONCOLOG', 'CC', '41441271', 'CA', 'BERNAL', 'AURA', 'MARIA', '12/11/1947', '68', 'FEMENINO', 'CAFAM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CALLE 4TA # 2 -27', 'LA CONCEPCION', '3124884391', '3124884391', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'JANET LAMPREA', 'HIJA', '3124884391', '3124884391', 'NO', 'NO', 'NO', 'ES CITA DE CONTROL', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 13:31'),
(567, 0, 'HEMATOLOG', 'CC', '52933034', 'BABATIVA', 'RODRIGUEZ', 'YENNI', 'LORENA', '11/03/1983', '32', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 1RA B # 51 A - 57', 'LA PONDEROSA', '8076940', '3118878089', 'YENILORENABABATIVAR@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'MEDICA', 'DEISY RODRIGUEZ', 'MADRE', '8076940', '3144183328', 'NO', 'NO', 'NO', 'ES UN CONTROL CON LA DOCTORA SILVIA ROJAS - DEBE SER AJENADO EN MAXIMO EN 15 DIAS', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 13:37'),
(568, 0, 'HEMATOLOG', 'CC', '11348508', 'RODRIGUEZ', 'TORRES', 'LUIS', 'ALVARO', '14/09/1972', '42', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA 4TS # 9 -05', 'BARANDILLA', '3142947789', '31442947789', 'ALVARORT72@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'YOLANDA QUIROGA', 'ESPOSA', '3142825985', '3142825985', 'NO', 'NO', 'NO', 'CONTROL CON LA DOCTORA SILVIA ROJAS', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 13:48'),
(569, 0, 'ONCOLOG', 'CC', '23735102', 'BELTRAN', 'DE BRAVO', 'AURA', 'MARIA', '27/03/1946', '69', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANS57 # 104B - 70', 'PUENTE LARGO', '4969537', '4969537', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'MARIA BELTRAN', 'HREMANA', '4969537', '3118878077', 'SI', 'SI', 'NO', 'EL PACIENTE MANIFIESTA MALESTAR -ES UNCITA CONTROL', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 13:54'),
(570, 0, 'HEMATOLOG', 'CC', '52498903', 'MARI', 'MONDRAGON', 'CLAUDIA', 'PATRICIA', '25/09/1978', '36', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 150B # 115 -64', 'SUBA', '4966744', '3213298725', 'JUANCHO_GIGIO@HOTMAIL.COM', 'T', 'CATOLICO', 'GESTORA', 'ALBA IZQUIERDO', 'TIA', '3134901187', '2535451', 'SI', 'SI', 'NO', 'ORDEN PRIORITARIA  POR TROMBOSIS VENOSA EN PIERNA IZQUUERDA', '1ra Llamada', 'Laura Liliana Benitez Garcia', '21/05/2015 14:04'),
(571, 0, 'HEMATOLOG', 'CC', '51716310', 'BENAVIDES', 'PERAZA', 'ANA', 'MARIBEL', '06/03/1974', '51', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 91A # 60 36', 'RIO NEGRO', '2567516', '3156491818', 'MARIBELBENAVIDESSP@YAHOO.COM', 'T', 'CATOLICA', 'INDEPENDIENTE', 'MIRIAN BENAVIDES', 'HERMANA', '2567516', '3172306192', 'SI', 'SI', 'NO', 'ES UNA CITA PRIORITARIA', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 14:12'),
(572, 0, 'CIRUG', 'CC', '79113822', 'MORENO', 'MONTENEGRO', 'LUCIANO', '-', '31/03/1959', '56', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 16C # 153 -  11', 'CEDRITOS', '2168624', '3133148449', 'LUMOR65@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'DISE', 'CECILIA ORTIZ', 'ESPOSA', '21686224', '3114929057', 'SI', 'SI', 'NO', 'TIENE QUISTES EN LA TIROIDES, MANIFIESTA VERTIGO', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 14:24'),
(573, 0, 'CIRUG', 'CC', '19438385', 'VEGA', 'FORERO', 'EGIFIO', '-', '05/05/1961', '54', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CRA58B # 131 -59', 'CIUDAD JARDIN', '6137511', '3115215036', 'VEGAEGIDIO@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'VENTAS', 'DIOMAR MOJICA', 'ESPOSA', '6137511', '3134249594', 'SI', 'SI', 'NO', 'MASA LOCALIZADA EN EL CUELLO', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 14:30'),
(574, 0, 'CIRUG', 'CC', '51706947', 'MOJICA', 'OCHOA', 'OLGA', 'PATRICIA', '29/05/1963', '51', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 96 # 69C - 12', 'ALBORADA', '5333492', '3102389814', 'PATTYMOJICA8@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'CONSUELO MOJICA', 'HERMANA', '5333492', '3114746682', 'SI', 'SI', 'NO', 'CITAR PARA PARA PRINCIPIOS DE JUNIO POR EXAMENES -PRESENTA UNA MASA EN EL CUELLO', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 14:36'),
(575, 0, 'ANESTESIOLOG', 'CC', '39535467', 'QUIROGA', 'NIETO', 'LUZ', 'YANETH', '29/01/1965', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 75A - # 105B - 52', 'GARCES NAVAS', '3208032086', '3208032086', 'LUZJANETH.QUIROGA@ AGENCIALOGISTICA.GOV.CO', 'BACHILLER', 'CATOLICA', 'ANALISTA DE CARTERA', 'MARTA QUIROGA', 'HERMANA', '8049978', '8049978', 'SI', 'SI', 'NO', 'PRIORITARIA - LLEVA ESPERANDO UN MES POR ESTA CITA', '10ma Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 14:50'),
(576, 0, 'ONCOLOG', 'CC', '202652', 'TORRES', 'HERNANDEZ', 'MOISES', '-', '14/01/1927', '88', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAQUEZA', 'VERADA GIRON DE BLANCO', '0', '3112374987', '3112374987', 'CARMENSA1022@HOTMAIL.COM', 'NINGUNO', 'CATOLICO', 'AGRICULTOR', 'CARMEN TORRES', 'HIJA', '3112374987', '3112374987', 'NO', 'NO', 'NO', 'ESTA SIENDOPRIORITARIA - CON EL DOCTOR ABUCHAR - VISTO POR CUIDADOS PALEATIVO - EL PACIENTE MANIFIESTA DOLOR INTENSO', '1ra Llamada', 'Laura Liliana Benitez Garc', '21/05/2015 15:05'),
(577, 0, 'HEMATOLOG', 'CC', '21131308', 'BUSTOS', 'DE MAHECHA', 'GEORGINA', 'NO', '06/03/1943', '72', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 135  132B-44', 'SUBA LA TOSCANA', '4074398', '3103361254', 'YAMIFELPA24@HOTMAIL.COM', 'NINGUNO', 'CATOLICA', 'HOGAR', 'YAMILE  ESPINOSA', 'HIJA', '4074398', '3103361254', 'NO', 'NO', 'NO', 'CONTROL DRA SILVIA MARGARITA ROJAS', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 15:08'),
(578, 0, 'HEMATOLOG', 'CC', '390528', 'BALLEN', '', 'JESUS', '', '21/05/1938', '77', 'MASCULINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOCHA', 'CRA6#11-21', 'CENTRO', '9055103', '3173126942', 'NO TIENE', 'OTRO', 'CATOLICO', 'HOGAR', 'BALLEN JESUS', 'HIJO', '9025103', '3173126942', 'NO', 'NO', 'SI', 'CONTROL DOCTORA SILVIA MARGARITA', '1ra Llamada', 'Pedro Juli', '21/05/2015 15:06'),
(579, 0, 'CL', 'CC', '20628946', 'CASTILLO', 'DE MURILLO', 'MARIA', 'CRISTINA', '01/03/1937', '78', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG.  47A  52C-05', 'VENECIA', 'NO', '3132584425', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'DORIS MURILLO', 'HIJA', 'NO', '3132584425', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ URG.  PACIENTE HA LLAMADO VARIAS VECES', '3ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 15:18'),
(580, 0, 'CIRUG', 'CC', '442370', 'SERRATO', 'MAECHA', 'MANUEL', 'AFRANIO', '03/12/1949', '71', 'MASCULINO', 'FAMISANA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL26 SUR#78Q33', 'KENEDY', '4548660', '3114543614', 'ARELISSERRATO@HOTMAIL.COM', 'OTRO', 'CATOLICO', 'HOGAR', 'ARELIS SERRATO', 'HIJA', '4548660', '3114543614', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 15:22'),
(581, 0, 'ORTOPEDIA GENERAL', 'CC', '41317663', 'LEON', '', 'ANA', 'LUCIA', '15/05/1940', '75', 'FEMENINO', 'UNICAJA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 69#87-43SUR', 'BOSA VILLA CAROLINA', '5610137', '3144876705', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ELENA NEUZA', 'HIJA', '7834904', '3144876705', 'NO', 'SI', 'NO', 'CONTROLJULIO JOSE  ALBIS', '2da Llamada', 'Sandra Liliana Agudelo', '21/05/2015 15:03'),
(582, 0, 'CIRUG', 'CC', '1081495', 'FUENTES', 'CA', 'JOSE', 'SILVIO', '19/10/1954', '61', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 128D #96-24', 'SUBA', '6856735', '3115812728', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'EMPLEADO', 'EULALIA BELDA', 'ESPOSA', '6856735', '3115812728', 'SI', 'SI', 'NO', 'URGENTE -  PACIENTE ESPERANDO CITA DESDE EL MES DE ABRIL, INDICA QUE UNO DE LOS TUMORES QUE TIENE EN LA TIROIDES ESTA CRECIENDO M', '4ta Llamada', 'Daniela L', '21/05/2015 15:16'),
(583, 0, 'CIRUG', 'CC', '39613444', 'BARBOSA', '', 'ANA', 'LUCRESIA', '14/11/1962', '53', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CALLE 4 #20-46', 'JUAN PABLO I', '9002850', '3112069103', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'INDEPENDIENTE', 'HERMES RAMIREZ', 'HIJO', '-', '3103338687', 'NO', 'NO', 'NO', 'PACIENTE ESPERANDO CITA DESDE HACE M', '6ta Llamada', 'Daniela L', '21/05/2015 15:26'),
(584, 0, 'HEMATOLOG', 'CC', '52181827', 'VILLALOBOS', 'ROSA', 'CLUDIA', 'PATRICIA', '14/08/1974', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE136BIS#103C-22', 'SUBA', '4747307', '3164453308', 'ALETOYPATY@HOTMAIL.COM', 'TECN', 'PROTESTANTE', 'HOTELERIA', 'FRANCO ALEJANDRO GUTIERREZ', 'ESPOSO', '4747307', '3178308051', 'NO', 'NO', 'NO', 'CONTROL OSCAR PE', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 15:33'),
(585, 0, 'DERMATOLOG', 'CC', '41642199', 'RIOS', 'DE FLORES', 'ETELVINA', 'NO', '10/05/1953', '63', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  68A  79-02', 'SAN MARCOS', '7965692', '3125842021', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARGARITA RIOS', 'HERMANA', '7965692', 'NO', 'NO', 'SI', 'NO', 'CITA  PRIMERA VEZ CON  ESTA ESPECIALIDAD', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 15:43'),
(586, 0, 'CIRUG', 'CC', '20951190', 'DIAZ', 'CERON', 'POLICARPA', '', '07/04/1953', '62', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG139A#127A48', 'SUBA', '6898381', '3204970853', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'AMA DE CASA', 'JOHANNA PALACIOS', 'HIJA', '6898381', '3192265441', 'NO', 'NO', 'NO', 'LA SE', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 15:47'),
(587, 0, 'CIRUG', 'CC', '79806094', 'PALACIO', '', 'LEOPOLDO', 'ILARIO', '17/11/1976', '39', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CR 2 #87A-22', 'CHAPINERITO SUR', '-', '3142959874', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'EMPLEADO', 'GILBERTO PALACIOS', 'HERMANO', '7730035', '3132013332', 'SI', 'SI', 'NO', 'CITA PRIORITARIA PACIENTE REQUIERE VALORACI', '1ra Llamada', 'Daniela L', '21/05/2015 15:35'),
(588, 0, 'HEMATOLOG', 'CC', '24709618', 'SALAZAR', '-', 'ANA', 'ROSA', '31/08/1954', '60', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'BOYAC', 'PUERTO BOYAC', 'CR 9 #20-75', 'NUEVO BRISA', '-', '3127776020', 'MAECHA_W2009@HOTMAIL.COM', 'PRIMARIA', 'CRISTIANA', 'AMA DE CASA', 'WILMER MAECHA', 'HIJO', '-', '3113718953', 'NO', 'SI', 'NO', 'URGENTE - CITA PRIORITARIA PACIENTE ESPERANDO CITA DESDE EL MES DE ABRIL. DEBER', '2da Llamada', 'Daniela L', '21/05/2015 15:44'),
(589, 0, 'ONCOLOG', 'CC', '41642199', 'RIOS', 'DE FLORES', 'ETELVINA', 'NO', '10/05/1953', '63', 'FEMENINO', 'COLSUBSIDIP', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 68A 79-02', 'SAN MARCOS', '7965692', '3125842021', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARGARITA RIOS', 'HERMANA', '7965692', 'NO', 'NO', 'NO', 'NO', 'CITA CONTROL', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 15:48'),
(590, 0, 'HEMATOLOG', 'CC', '80058986', 'MATIAS', 'LEON', 'CARLOS', 'EDUARDO', '24/10/1980', '34', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE81SUR#88-10-04', 'BOSA', '5709420', '3102589795', 'NO TIENE', 'T', 'CATOLICO', 'INCAPACITADO', 'LILIA LEON CARDOZO', 'MAMA', '5709420', '3102589795', 'NO', 'NO', 'NO', 'CONTROL CON EL DOCTOR BENJAMIN', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 15:51'),
(591, 0, 'ONCOLOG', 'CC', '35327423', 'VELES', 'DE NI', 'FLOR', 'MAGDALENA', '26/10/1949', '65', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL16I#96G60', 'FONTIBON', '2980398', '3114727266', 'MAGMNV@HOTMAIL.COM', 'OTRO', 'CATOLICA', 'HOGAR', 'MAGDA MARINZA', 'HIJA', '2980398', '3124534374', 'NO', 'NO', 'SI', 'CONTROL CON DOCTOR PIERRE', '1ra Llamada', 'Pedro Juli', '21/05/2015 15:52'),
(592, 0, 'ONCOLOG', 'CC', '20439520', 'QUEVEDO DE', 'CESPEDES', 'ANA', 'CECILIA', '07/06/1945', '69', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CAQUEZA', 'VEREDACENTRO PISCINA', 'VEREDACENTRO PISCINA', '0', '3115022825', 'ARROCHI@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'AMELIA CESPEDES', 'HIJA', '0', '3168260230', 'NO', 'NO', 'NO', 'CONTROL DOC EDI PIERR', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 15:57'),
(593, 0, 'CIRUG', 'CC', '51751267', 'RIOS', 'HERRERA', 'MIRIAM', '', '18/02/1964', '50', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALL56A#77H-06SUR', 'NUEVA ROMA', '7197400', '3204246234', 'NO TIENE', 'T', 'CATOLICA', 'HOGAR', 'YILI KATERIN SABIO', 'HIJA', '0', '3204126706', 'SI', 'SI', 'NO', 'LLAMAR POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 16:02'),
(594, 0, 'HEMATOLOG', 'CC', '20049306', 'PEREZ', 'DE VAN EGAS', 'ANA', 'LILI', '15/01/1931', '84', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 78P  35-25 SUR', 'KENNEDY', '2996293', '3125802665', 'NO', 'OTRO', 'CATOLICA', 'PENSIONADA', 'MARTHA ROCIO SILVA', 'HIJA', '4628024', 'NO', 'NO', 'NO', 'NO', 'CITA CONTROL DR. CARLOS  BERMUDEZ PARA LECTURA DE  EXAMENES PCTE DE 84 A', '5ta Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 16:00'),
(595, 0, 'CIRUG', 'CC', '41762891', 'RODRIGUZ', 'CEDIEL', 'MIRTA', '', '22/03/1958', '57', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE15#119-A-07', 'FONTIBON', '0', '3204671469', 'NO TIENE', 'T', 'CATOLICA', 'HOGAR', 'LORENA GOMEZ', 'HIJA', '0', '3212781592', 'SI', 'NO', 'NO', 'LLAMA POR CITA ...', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 16:14'),
(596, 0, 'CIRUG', 'CC', '41796624', 'SIERRA', 'SANCHEZ', 'LILIA', 'MARIA', '00:00:00', '0', 'FEMENINO', '0', 'NO', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', '0', '0', '0', '0', '0', 'OTRO', '0', '0', '0', '0', '0', '0', 'NO', 'NO', 'NO', 'PACIENTEQUE HACE UN MES LARGO QUE HA LLAMADO POR CITA NO  DA MAS DATOS', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '21/05/2015 16:21'),
(597, 0, 'ONCOLOG', 'CC', '41456958', 'FORERO', 'ROCHE', 'MARIA', 'SILOE', '22/04/1946', '69', 'FEMENINO', 'CAFE SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 6C #2-20 ESTE', 'BUENOS AIRES', '3334961', '3203324961', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'AMA DE CASA', 'LILIA FORERO', 'HERMANA', '3339004', '-', 'NO', 'NO', 'SI', 'CITA CONTROL PARA PRESENTAR EXAMENES - PACIENTE CON TUTELA  FUE ATENDIDO POR ULTIMA VEZ 8 DE MAYO REQUIERE SE HAGA ASIGNACION LO M', '3ra Llamada', 'Daniela L', '21/05/2015 16:10'),
(598, 0, 'HEMATOLOG', 'CC', '1015443094', 'GUTIERREZ', 'PINZON', 'CRISTIAN', 'GUSTAVO', '16/12/1993', '21', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 72A #58-64', 'SAN FERNANDO', '4678501', '3174590504', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICO', 'ESTUDIANTE', 'GLORIA PINZON', 'MADRE', '4678501', '3174590504', 'NO', 'NO', 'NO', 'CITA CONTROL. PACIENTE SOLICITA SE LE SEA AGENDADO PARA MEDIADOS DE JUNIO', '1ra Llamada', 'Daniela L', '21/05/2015 16:24'),
(599, 0, 'HEMATOLOG', 'CC', '52477378', 'PARRA', 'CONTRERAS', 'SANDRA', 'PATRICIA', '23/01/1978', '37', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  48  86-60 SUR', 'ALAMEDA DE  SAN  PEDRO KENNEDY', '8125742', '3214275161', 'JULIPIPE78@HOTMAIL.COM', 'POSTGRADO', 'CATOLICA', 'DOCENTE', 'OSCAR GUILLERMO BLANCO PLANEL', 'ESPOSO', '7690990', '3142510544', 'NO', 'NO', 'NO', 'CITA  CONTROL  DRA SILVIA MARGARITA PCTE  ESTA LLAMANDO HACE DOS MESES  Y  NECESITA LECTURA DE EXAMENES DAR  PRIORIDAD', '3ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 16:15'),
(600, 0, 'CIRUG', 'CC', '52662780', 'VARGAS', 'USAQUEN', 'NIDIA', 'YAZMIN', '02/03/1980', '35', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CALL23A#18A-47', 'REMANSO', '0', '3142087588-3134271650', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'OPERARIA', 'LUIS ALONSO POLECUA RINCON', 'ESPOSO', '0', '3142087588-3134271650', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 16:33'),
(601, 0, 'HEMATOLOG', 'CC', '52081929', 'CALDERON', 'AGREDO', 'LETICIA', '', '17/05/1972', '43', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL137C SUR#3C-58', 'USME', '7333158', '3138565257', 'LE-TI-17@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'OFICIOS BARIOS', 'VANESA FLORES', 'HIJA', '7333158', '3133281686', 'SI', 'SI', 'NO', 'PACIENTE CON MARCAPASOS', '1ra Llamada', 'Pedro Juli', '21/05/2015 16:41'),
(602, 0, 'CIRUG', 'CC', '21031578', 'BEJARANO', 'MENDEZ', 'MONICA', '-', '20/08/1968', '46', 'FEMENINO', 'ECOOPSOS', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CR 4 #89D-13 SUR', 'CHICO', '7687761', '3123911246', 'NO TIENE', 'PRIMARIA', 'CARTOLICO', 'AMA DE CASA', 'LUISA GOMEZ', 'NUERA', '-', '3124329484', 'NO', 'NO', 'NO', 'POR RECOMENDACION DEL ESPECIALISTA PACIENTE DEBE ASISTIR 15 D', '1ra Llamada', 'Daniela L', '21/05/2015 16:36'),
(603, 0, 'HEMATOLOG', 'CC', '20007605', 'HUERTAS', 'MOYA', 'ALBINA', 'NO', '05/02/1930', '85', 'FEMENINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 3  120A-19', 'USAQUEN', '6123959', '3125333718', 'JCPH1976@HOTMAIL.ES', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'YOLANDA HUERTAS DE  PINZON', 'HIJA', '6123959', '3125333718', 'NO', 'NO', 'NO', 'CITA CONTROL  DR.  CARLOS DANIEL BERMUDEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 16:35'),
(604, 0, 'CIRUG', 'CC', '79105609', 'SABOGAL', '', 'RAMIRO', '', '24/08/1952', '62', 'MASCULINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CRA2#16-37', 'FERREFELITAS', '8938337', '3203283737', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'HERLINDA JIMENES', 'ESPOSA', '8938337', '3202032555', 'SI', 'SI', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '21/05/2015 16:39'),
(605, 0, 'HEMATOLOG', 'CC', '52965575', 'RODRIGUEZ', 'BAYONA', 'ANGELA', 'IVONNE', '16/10/1983', '30', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 92  85A-25', 'QUIRIGUA', '5357578', '3013907132', 'NO', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'MARTHA CECILIA  BAYONA', 'MAMA', '5357538', '3208225534', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 16:53'),
(606, 0, 'DERMATOLOG', 'CC', '17105503', 'AFORERO', 'GALEANO', 'JOSE', 'ADAN', '12/11/1944', '70', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MADRID', 'CLL14#9-21', 'ESCALLON', '5733371', '3133153484', 'NO TIENE', 'OTRO', 'CATOLICO', 'CONSTRUCTOR', 'LUZ MARITZA FORERO', 'HIJA', '3219044989', '3133153484', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 16:53'),
(607, 0, 'ONCOLOG', 'CC', '20667553', 'PEDRASA', 'PE', 'MARCELA', '', '20/09/1978', '36', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CLL11SUR#68C61', 'VILLA CLAUDIA', '4140809', '3133671652', 'MARPEPE78@HOTMAIL.COM', 'TECN', 'CATOLICA', 'INDEPENDIENTE', 'WILLIAN CASTRO', 'ESPOSO', '4140809', '3105599607', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '21/05/2015 17:00'),
(608, 0, 'ONCOLOG', 'CC', '3115732', 'MARTINEZ', 'RODRIGUEZ', 'DIEGO', 'JOSE', '26/07/1947', '67', 'MASCULINO', 'CAFE SALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PACHO', 'VEREDA AGUAS CLARAS', 'VEREDA AGUAS CLARAS', '7404311', '3172196387', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'INDEPENDIENTE', 'JAIRO MARTINEZ', 'HERMANO', '7404311', '3172196387', 'NO', 'NO', 'SI', 'URGENTE - PACIENTE SOLICITA SE LE AGENDE DEBIDO A QUE DEBE APLICARSE LA QUIMIOTERAPIA EN 21 DIAS Y LE CORRESPONDERIA A FINALES DE MAYO', '2da Llamada', 'Daniela L', '21/05/2015 16:47'),
(609, 0, 'HEMATOLOG', 'CC', '20922654', 'CARRERO', 'CORREA', 'FLOR', 'MARIA', '19/08/1967', '47', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SESQUIL', 'VEREDA TIERRA NEGRA', 'NO', '6162506', '3222135778', 'CARITO-DEIVIS@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ADRIANA CAROLINA  MONCADA', 'HIJA', 'NO', '3212712507', 'NO', 'NO', 'SI', 'CITA  URG. PACIENTE REQUIERE QUIMIOTERAPIA YA SE LA PASO EL  TIEMPO DE  LA  SIGUIENTE DOSIS  HA  LLAMADO  EN  VARIAS OPORTUNIDADES PRIORIDAD*********', '8va Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 17:06'),
(610, 0, 'CIRUG', 'CC', '38260869', 'MENDOZA', 'SALAMANCA', 'AURA', 'MERCEDES', '12/10/1963', '52', 'FEMENINO', 'ENCOSALUD', 'SI', 'NO', 'A', 'TOLIMA', 'IBAGU', 'CALLE 44 #11-16', 'CALARCA', '2784106', '3142332385', 'NO TIENE', 'ESPECIALIZACI', 'CATOLICA', 'EMPLEADA', 'JOSE TORO', 'ESPOSO', '-', '3112739532', 'NO', 'NO', 'NO', 'CITA CONTROL PARA PRESENTAR EXAMENES', '2da Llamada', 'Daniela L', '21/05/2015 17:06'),
(611, 0, 'ANESTESIOLOG', 'CC', '5587150', 'FLORES', 'LOPEZ', 'LEONARDO', '', '02/01/1942', '73', 'MASCULINO', 'ENCOSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA7A108A', 'SUBA', '5356252', '3112499874', 'NO TIENE', 'PRIMARIA', 'CATOLICO', 'PENSIONADO', 'MARIA FLOREZ', 'HIJA', '3114499165', '3114499165', 'NO', 'SI', 'NO', '', '2da Llamada', 'Pedro Juli', '21/05/2015 17:06'),
(612, 0, 'HEMATOLOG', 'CC', '7334885', 'MARTINEZ', 'NO', 'FABIO', 'HELIODORO', '19/10/1979', '36', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CIUDAD VERDE CONJUNTO  RESIDENCIAL VICTORIA 2  TORRE 7  APTO 604', 'CIUDAD VERDE', '9000298', '3107507845', 'YANETH_M@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'INDEPENDIENTE', 'ANNIE  CASTIBLANCO', 'ESPOSA', 'NO', '3202927782', 'NO', 'NO', 'SI', 'CITA CONTROL DR. BERMUDEZ PARA EL  SIGUIENTE CICLO DE QUIMIOTERAPIA  TERMINO EL  4  Y  SON  6  POR FVR DAR PRIORIDAD ESTA  SIN  MEDICAMENTO  Y ESTA  LLAMANDO HACE MES Y MEDIO ********', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '21/05/2015 17:12'),
(613, 0, 'CIRUG', 'CC', '37328946', 'SERRANO', 'AMAYA', 'LEIDY', 'MARIA', '05/11/1975', '39', 'MASCULINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL792A56', 'CIUDAD TINTAL', '4486020', '3107737827', 'NO TIENE', 'BACHILLER', 'CRISTIANA', 'BARIOS', 'ALFONSO QUEVEDO', 'ESPOSO', '4486020', '3107736827', 'NO', 'NO', 'NO', 'CONTROL DOCTOR PABLO MARTIN', '1ra Llamada', 'Pedro Juli', '21/05/2015 17:27'),
(614, 0, 'CIRUG', 'CC', '1016088257', 'CADENA', 'RUIZ', 'ERICKA', 'MICHELLE', '05/07/1996', '18', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 73 #107C-05', 'VILLA AMALIA', '2290139', '3132550251', 'MNCADENITA@YAHOO.ES', 'BACHILLER', 'CATOLICO', 'ESTUDIANTE', 'NANCY CADENAS', 'TIA', '2290139', '3132550251', 'SI', 'NO', 'NO', 'PACIENTE REMITIDO PARA QUE EL ESPECIALISTA REVISE LOS RESULTADOS', '1ra Llamada', 'Daniela L', '21/05/2015 17:26'),
(615, 0, 'ANESTESIOLOG', 'CC', '39560168', 'BARRERO', 'RAMIREZ', 'DUNEYE', 'NO', '22/04/1966', '49', 'FEMENINO', 'ENCOSALUD TOLIMA', 'SI', 'NO', 'A', 'TOLIMA', 'ESPINAL', 'MANZANA E 2 CASA 14', 'VILLA CATALINA', '2487320', '3118203255', 'DUBARA2002@GMAIL.COM', 'POSTGRADO', 'CATOLICA', 'DOCENTE', 'CRISTIAN ALIRIO GUTIERREZ', 'HIJO', 'NO', '3118203255', 'NO', 'SI', 'NO', 'CITA PARA VALORACION URG PACIENTE DE ESPINAL TOLIMA  NECESITA CIRUGIA DFR', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 17:31'),
(616, 0, 'ORTOPEDIA GENERAL', 'CC', '51910803', 'BERMUDEZ', 'NO', 'NUBIA', 'NO', '16/08/1966', '48', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 54  100-24', 'BOSA PORVENIR', '4627824', '3142823292', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'JEIMMY JOHANNA ALDANA BERMUDEZ', 'HIJA', 'NO', '3202155682', 'NO', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '21/05/2015 17:54'),
(617, 0, 'HEMATOLOG', 'CC', '52933954', 'GOMEZ', 'PAJARITO', 'LEIDY', 'ADRIANA', '20/12/1982', '32', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL77B#100B-85', 'VILLAS DE AMDRIGAL', '2282297', '3123101008', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'INGENIERA AMBIENTAL', 'BEATRIS PAJARITO', 'MAMA', '3167049785', '3167049785', 'NO', 'NO', 'NO', '', '1ra Llamada', '4', '21/05/2015 17:55'),
(618, 0, 'CIRUG', 'CC', '13260058', 'VELASQUEZ', 'LOPEZ', 'VICTOR', 'MANUEL', '09/08/1953', '62', 'MASCULINO', 'ECOPSOS', 'NO', 'SI', 'A', 'NORTE DE SANTANDER', 'OCA', 'LOS SAUCES', 'LOS SAUCES', '2091029', '3115408364', 'JJLOPEZOSORIO@HOTMAIL.COM', 'NINGUNO', 'CATOLICA', 'HOGAR', 'MARTHA CECILIA VELASQUEZ', 'HIJA', '3115408364', '3115408364', 'NO', 'NO', 'SI', 'TIENE TRE ORDENES AUTORIZADAS Y SE ENCUENTRA MUY LEJOS DESEA QUE SE HAGA LO MAS PRONTO POSIBLE', '1ra Llamada', 'ADMINISTRADOR', '21/05/2015 18:02'),
(619, 0, 'NUTRICI', 'CC', '13260058', 'VELASQUEZ', 'LOPEZ', 'VICTOR', 'MANUEL', '09/08/1953', '62', 'MASCULINO', 'ECOPSOS', 'NO', 'SI', 'A', 'NORTE DE SANTANDER', 'OCA', 'LOS SAUCES', 'LOS SAUCES', '2091029', '3115408364', 'JJLOPEZOSORIO@HOTMAIL.COM', 'NINGUNO', 'CATOLICA', 'HOGAR', 'MARTHA CECILIA VELASQUEZ', 'HIJA', '3115408364', '3115408364', 'NO', 'NO', 'SI', 'TIENE TRES ORDENES DESEA QUE SE LE ASIGNEN CON BREVEDAD', '1ra Llamada', 'ADMINISTRADOR', '21/05/2015 18:10'),
(620, 0, 'CL', 'CC', '13260058', 'VELASQUEZ', 'LOPEZ', 'VICTOR', 'MANUEL', '09/08/1953', '62', 'MASCULINO', 'ECOPSOS', 'NO', 'SI', 'A', 'NORTE DE SANTANDER', 'OCA', 'LOS SAUCES', 'LOS SAUCES', '2031029', '3115408364', 'JJLOPEZOSORIO@HOTMAIL.COM', 'NINGUNO', 'CATOLOCA', 'HOGAR', 'MARTHA CECILIA VELASQUEZ', 'HIJA', '311540836', '3115408364', 'NO', 'NO', 'SI', 'TIENE TRES ORDENES DESEA QUE SE LE ASIGNEN CON BREVEDAD', '1ra Llamada', 'ADMINISTRADOR', '21/05/2015 18:14'),
(621, 0, 'HEMATOLOG', 'CC', '1026560178', 'CRUZ', 'GOMEZ', 'JUAN', 'RICARDO', '27/02/1989', '26', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE22#33-57', 'CUNDINAMARCA', '6959905', '3125118354', 'NO TIENE', 'BACHILLER', 'CATOLICO', 'HOGAR', 'CARMEN LIGIA ROMERO', 'SUEGRA', '6959905', '3125118352', 'NO', 'SI', 'NO', 'CONTROL DOCTOR MILENA PEREZ', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 07:57'),
(622, 0, 'UROLOG', 'CC', '17124799', 'CARDENAS', 'VELASQUEZ', 'JOSE', 'EUSEBIO', '07/03/1948', '67', 'MASCULINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE166#3B-33', 'SORATAMA', '6637058', '3118821453', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADO', 'ELVIA MARIA CARDENAS', 'HERMANA', '4050642', '3214860840', 'NO', 'SI', 'NO', 'CONTROL DOCTOR GODOY', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 08:22'),
(623, 0, 'ORTOPEDIA GENERAL', 'CC', '21086092', 'MENDEZ', 'DE BELTRAN', 'MARGARITA', 'NO', '25/09/1942', '65', 'FEMENINO', 'ECOOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANSV..  15A  45-18  SUR', 'MARCO  FIDEL  SUAREZ', 'NO', '3138348023', 'NO', 'NINGUNO', 'CATOLICA', 'HOGAR', 'AURORA  RODRIGUEZ', 'NUERA', 'NO', '3132464615', 'NO', 'NO', 'NO', 'CITA CONTROL  DR.  JULIO JOSE ALVIZ  URG. NECESITA CONTROL  POSTQUIRURGICO', '2da Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 08:24'),
(624, 0, 'ONCOLOG', 'CC', '26473912', 'GUALI', 'CASTILLO', 'ALICIA', 'NO', '17/07/1972', '43', 'FEMENINO', 'SALUD VIDA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SILVANIA', 'VEREDA VICTORIA', 'SILVANIA', 'NO', '3204255888', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'HUMBERTO  CASTRO', 'ESPOSO', 'NO', '3115113695', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ POR  FAVOR  URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 08:30'),
(625, 0, 'INFECTOLOG', 'CC', '80383582', 'TENJO', 'ESGUERRA', 'MAURICIO', 'NO', '06/01/1966', '49', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TENJO', 'VEREDA JAGALITO', 'NO', 'NO', '3103403897', 'NO', 'PRIMARIA', 'CRISTIANA', 'CONSTRUCCION', 'ESPERANZA TENJO', 'HIJA', 'NO', '3142735310', 'NO', 'NO', 'NO', 'CITA  PARA CONTROL', '2da Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 08:36'),
(626, 0, 'GINECOONCOLOG', 'CC', '39622461', 'GUARIN', 'DIAS', 'AMIRA', '', '20/06/1972', '43', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'TENA', 'VEREDA EL ROSARIO', 'VEREDA EL ROSARIO', '4181944', '3134762867', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'NORMA GUARIN', 'HERMANA', '4181944', '3163090943', 'NO', 'SI', 'NO', 'CONTROL DOCTOR SALAMANCA HA LLAMADO HACE DOS MESE', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 08:33'),
(627, 0, 'CIRUG', 'CC', '80096253', 'GONGORA', 'SANCHEZ', 'FELIX', 'EFRAIN', '14/07/1982', '32', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  53  19-06', 'GALERIAS', '5403947', '3134469170', 'AXEL_FEGS@HOTMAIL.COM', 'T', 'CATOLICA', 'EMPLEADO', 'MARY CALDERON', 'ESPOSA', 'NO', '3165351052', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ PRIORITARIA  ES MUY  URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 08:44'),
(628, 0, 'ONCOLOG', 'CC', '17415004', 'REY', '', 'PEDRO', 'NEL', '07/08/1969', '46', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE64C#103A-20', 'VILLA DEL MAR', '0', '3125571789', 'ELISA.8910@HOTMAIL.COM', 'TECN', 'CRISTIANAO', 'EMPLEADO', 'ELIZABETH JIMENES', 'ESPOSA', '0', '3132217924', 'NO', 'SI', 'NO', 'CONTROL DOC BERMUDEZ HACE 15 DIAS LLAMO PACIRENTE', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 08:52'),
(629, 0, 'HEMATOLOG', 'CC', '41780105', 'CUPASACHOA', 'ROSAS', 'GLADIS', '', '26/07/1959', '55', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL5C#41B15', 'PRIMABERA', '8056856', '3102358452', 'DIANA.SALAZAR0749@GMAIL.COM', 'BACHILLER', 'CATOLICA', 'HOGAR', 'DIANA SALAZAR', 'HIJA', '3132661426', '3144815003', 'NO', 'NO', 'NO', 'CONTROL CON LA DOCTORA SILVIA MARGARITA ROJAS PORRAS', '1ra Llamada', 'Pedro Juli', '22/05/2015 09:05'),
(630, 0, 'COLOPROCTOLOG', 'CC', '51647435', 'QUINCOSIS', 'ESTUPI', 'GRISELDA', '', '14/06/1972', '52', 'FEMENINO', 'CAPITALSALUD', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA3#54-24 SUR', 'DANUVIOAZUL', '3183805389', '3134923885', 'NO TIENE', 'OTRO', 'CATOLICA', 'EMPLEADA', 'MKHATERINATEUS', 'HIJA', '3134923885', '3134923885', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 09:11'),
(631, 0, 'HEMATOLOG', 'CC', '52753909', 'RAMIRE', 'ORTIZ', 'DIANA', 'MARITZA', '28/10/1981', '33', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRANV80D#65I-29SUR', 'GONZALO JIMENES DE QUESADA', '7780126', '3142142715', 'DMRAMIREZ3909@GMAIL.COM', 'T', 'CATOLICA', 'EMPLEADO', 'MARIA SUSANAORTIZ', 'MAMA', '4938034', '3107815464', 'NO', 'NO', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:00'),
(632, 0, 'CIRUG', 'CC', '52195582', 'VELEZ', 'MORENO', 'YINETH', 'NO', '12/06/1973', '41', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIAG.  45A  16B-71 SUR', 'SAN  JORGE', '7961732', '3213383350', 'LEIDY_9229@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'LEIDY JULIETH RODRIGUEZ', 'HIJA', 'NO', '3212190458', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 08:56'),
(633, 0, 'HEMATOLOG', 'CC', '17415004', 'REY', 'GUTIERREZ', 'PEDRO', 'NEL', '07/08/1969', '45', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA64C#103-A-20', 'VILLA DEL MAR', '0', '3125571789', 'ELISA.8910@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANO', 'DISE', 'ELIZABETH JIMENES', 'ESPOSO', '0', '3132217924', 'NO', 'SI', 'NO', 'CONTROL DOR BERMUDEZ HACE 15 DIAS QUE HA LLAMADO', '8va Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:20'),
(634, 0, 'CIRUG', 'CC', '52393035', 'VEGA', 'NO', 'CRISTINA', 'ISABEL', '08/11/1978', '36', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 134  57-47', 'LA  COLINA', '2713845', '3213714963', 'CRISAVEGA07@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ESTETICISTA', 'MAGNOLIA VEGA GALVIZ ', 'HERMANA', 'NO', '3157935000', 'NO', 'NO', 'NO', 'CITA  PARA CONTROL  URG. DESDE ENERO  ESTA E SPERANDO LA  CITA   PARA  SER  CONTROLADA  DESPUES DE UNA CIRUGIA*******', '8va Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 09:32'),
(635, 0, 'CIRUG', 'CC', '176307', 'ROJAS', 'SIERRA', 'HERNANDO', '', '14/03/1948', '67', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA113#19A-58', 'FONTIBON', '5479287', '3173511147', 'NOT IENE', 'PRIMARIA', 'CATOLICA', 'PENSIONDA', 'LILIA CAMARGO', 'ESPOSA', '5479287', '3173511147', 'NO', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:25'),
(636, 0, 'GINECOONCOLOG', 'CC', '20458063', 'ALONSO', 'NO', 'ANA', 'EDILMA', '28/05/1968', '47', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 1 I  4-07', 'UBATE', 'NO', '3133441443', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'NIDIA PAOLA RODRIGUEZ', 'PRIMAS', 'NO', '3132047094', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA MUY  URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 09:38'),
(637, 0, 'CIRUG', 'CC', '19357766', 'GOMEZ', 'JIMENEZ', 'GUSTABO', '', '21/12/1956', '58', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA81CBISK#42F94 SUR', 'VILLA NELY', '4944329', '3125835041', 'BUSGOMGYM@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'EMPLEADO', 'LUZ MARI RODRIGUEZ', 'ESPOSA', '3132381644', '3132381644', 'SI', 'SI', 'NO', 'UN MES DE ESPERA SIN RESPUESTA ALGUNA', '2da Llamada', 'Pedro Juli', '22/05/2015 09:40'),
(638, 0, 'CIRUG', 'CC', '1044424012', 'ALFARO', 'ALTAMAR', 'IBONN', 'PAOLA', '01/11/1988', '26', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA80C#49-23SUR', 'PASTRANITA', '0', '3188016467', 'CHINO1044@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'FELIPE ECHEVERRI', 'ESPOSO', '0', '3208910117', 'NO', 'SI', 'NO', 'CONTROL DOC PABLO JOSE JIMENES', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:40'),
(639, 0, 'ONCOLOG', 'CC', '19249378', 'VELASQUEZ', 'ROMERO', 'OSCAR', 'NO', '03/04/1959', '55', 'MASCULINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 56  167-29 APTO 108', 'SAN  CIPRIANO', '7471425', '3223749472', 'OVELASQUEZR@HOTMAIL.COM', 'UNIVERSITARIO', 'PROTESTANTE', 'MAESTRO', 'GUILLERMO VELASQUEZ  ROMERO', 'HERMANO', 'NO', '3003572918', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ URG. *****', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 09:47'),
(640, 0, 'COLOPROCTOLOG', 'CC', '24041881', 'RIOS', 'FLORES', 'NANCY', '', '17/06/1975', '39', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA13#3A16', 'OLIVOS 2 DE SOACHA', '0', '3132522853', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'GUSTAVO PARRA', 'ESPOSO', '0', '3105121057', 'SI', 'SI', 'NO', 'LLAMA PARA PEDIR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:50'),
(641, 0, 'CIRUG', 'CC', '1013578991', 'FUNTES', 'QUITIAN', 'LADI', 'CONSUELO', '26/01/1986', '28', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL76B#45', 'BUENOS AIRES', '7157904', '3213894843', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ESILDA QUITIAN', 'MAMA', '7157904', '3175679383', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 09:49'),
(642, 0, 'CIRUG', 'CC', '1023876300', 'RODRIGUEZ', 'LEON', 'JENNY', 'ALEXANDRA', '26/06/1988', '26', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 30A  SUR  8-12 APTO 202', 'SERAFINA', 'NO', '3103482986', 'NO', 'NINGUNO', 'NO', 'NO', 'SECORTO LLAMADA', 'SE CORTO LLAMAD ', 'SE CORTO', 'NO', 'NO', 'NO', 'NO', 'SE  CORTO  LLAMADA Y  NO SE PUDIDERON  TOMAR LOS DATOS', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 09:55'),
(643, 0, 'HEMATOLOG', 'CC', '20146658', 'URREA', 'DE RODRIGUEZ', 'MARIA', 'ISOLINA', '22/12/1928', '86', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA77#71-57', 'SANTA HELENIOTA', '4848401', '3002187484', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARINA RODRIGUEZ', 'HIJA', '4848401', '3002187484', 'NO', 'SI', 'NO', 'CONTROL DOCTORA SIVIA MARGARITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 09:56'),
(644, 0, 'CIRUG', 'CC', '20587871', 'AMAYA', 'RODRIGUEZ', 'MARTHA', 'CECILIA', '15/11/1977', '37', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE27SUR#19F-09', 'OYALA HERRERA', '4596934', '3209880086', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'COMERCIANTE', 'GILBERTO LEON GARZON', 'ESPOSO', '4596934', '3112736298', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 10:03'),
(645, 0, 'CIRUG', 'CC', '1023876300', 'RODRIGUEZ', 'LEON', 'JENY', 'ALEXANDRA', '26/07/1988', '26', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL30ASUR#8-12', 'LA SERAFINA', '3103482986', '3138865721', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'ADMINISTRADORA', 'JHON JAIRO VENITES', 'ESPOSO', '3107925656', '3143567756', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 10:12'),
(646, 0, 'HEMATOLOG', 'CC', '42794237', 'ARENAS', 'ECHEVERRI', 'MARIA', 'DE LA PAZ', '08/04/1962', '42', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE12A#71C-20', 'CUIDAD ALZACIA', '0', '3124990735', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'YULIET RESTREPO', 'HIJA', '0', '3124990735', 'NO', 'NO', 'NO', 'DESDE EL MES DE DICIEMBRE HA ESTADO LLAMANDO PARA LA CITA Y NADA EN EL MES DE FEBRERO LE DIERON CITA  PERO DESPUES LA LLAMARON PARA CANCELARLA LE DIJERON QUE EN LOS PRINCIPOS DE MAYO LE DABAN CITA Y LLAMA OTRA VEZ PAR CITA', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 10:08'),
(647, 0, 'ENDOCRINOLOG', 'CC', '52707044', 'SANTA', 'GONZALES', 'YUDI', 'LIZEHT', '14/11/1978', '36', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA8A#153-56', 'CEDRO GOLF', '3133763435', '3133763435', 'YUDYLUSG@GMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ENFERMERA', 'MARIA DL ARMEN', 'MAMA', '4722646', '3143171868', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 10:17'),
(648, 0, 'CIRUG', 'CC', '79641946', 'LEITON', 'MORENO', 'SANDRO', 'STEBAN', '23/06/1972', '43', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA40#29B21-SUR', 'LA GUACA', '2035267', '3203272045', 'NO TIEN', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'YANETH RANGEL', 'HERMANA', '2035267', '3203272045', 'SI', 'SI', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 10:17'),
(649, 0, 'HEMATOLOG', 'CC', '39770638', 'ROMERO', 'PARDO', 'ALBA', '', '28/05/1967', '47', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MOSQUERA', 'CRA 12B  10A-25', 'VILLA  MARCELA', '8279248', '3224219885', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANA MILENA GIL', 'VECINA', '8945415', 'NO', 'NO', 'NO', 'NO', 'CITA PARA CONTROL  DR.  BERMUDEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 10:06'),
(650, 0, 'ONCOLOG', 'CC', '19223180', 'AREVALO', 'POVEDA', 'URIEL', 'NO', '26/01/1952', '63', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE  72F  114-51 INT 1  APTO 403', 'VILLAS DE  GRANADA CONJUNTO MONTECARLO  UNO', '6619974', '3134360905', 'NO', 'PRIMARIA', 'CATOLICA', 'PENSIONADO', 'MILTON  URIEL  AREVALO', 'HIJO', 'NO', '3134360905', 'NO', 'NO', 'SI', 'CITA  CONTROL DR.  RAMIREZ  URG.  NECESITA  DE  QUIMIOTERAPIA ANTES DE  FINALIZAR EL MES *********', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 10:35'),
(651, 0, 'HEMATOLOG', 'CC', '1014182984', 'BICHER', 'PEDRAZA', 'TATIANA', '', '19/12/1988', '28', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'TRA94M8610', 'QUIRIGUA', '2599665', '3017207952', 'NO TIENE', 'UNIVERSITARIO', 'CATOLICA', 'INDEPENDIANTE', 'TATIANA BICHER', 'MADRE', '3144825583', '3144825583', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 10:56'),
(652, 0, 'HEMATOLOG', 'CC', '52315170', 'MELO', 'DIAZ', 'LUZ', 'DARY', '30/03/1973', '42', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 50 SUR 93D-38', 'BOSA PORVENIR  RESERVADO', '7599576', '3138143965', 'NO', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'ESMERALDA PE', 'HERMANA', '7599576', '3142919530', 'NO', 'NO', 'NO', 'CITA  CONTROL DR.  BERMUDEZ  ES UG. SE LA VA A VENCER LA ORDEN  Y  ESTA  EN  PROCESO DE TRANSPLANTE DE  MEDULA  Y  EL  DR. LES ORDENO CITA PRIORITARIA  PARA EL SEGUIMIENTO***********', '10ma Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 10:45'),
(653, 0, 'ORTOPEDIA GENERAL', 'CC', '20149689', 'VELASQUEZ', 'TAUTIBA', 'ISABEL', '', '04/01/1935', '80', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL41A#11-28', 'SAN JOSE', '3626215', '3142729421', 'NO', 'OTRO', 'CATOLICA', 'HOGAR', 'LUZ MARINA VELASQUEZ', 'HIJA', '3142729421', '3142729421', 'NO', 'NO', 'NO', 'CONTROL DOCTOR ALVIS', '1ra Llamada', 'Pedro Juli', '22/05/2015 11:10'),
(654, 0, 'DERMATOLOG', 'CC', '6452967', 'URAN', '', 'HERNAN  DE', 'JESUS', '02/04/1942', '73', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'DIAG16#2-51', 'LOS AUCESE', '0', '3134131398', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'DESEMPLEADO', 'VITALINO URANO', 'HERMANO', '0', '3148700403', 'SI', 'SI', 'NO', 'CITA', '1ra Llamada', 'ADMINISTRADOR', '22/05/2015 11:18'),
(655, 0, 'HEMATOLOG', 'CC', '3214685', 'GUZMAN', '', 'FERNANDO', '', '20/06/1969', '45', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'TOLIMA', 'CAJAMARCA', 'CALL129BBIS#87A-04', 'CAJAMARCA', '3114462137', '3123355190', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'LUZ MARI AMAYA', 'ESPOSA', '0|', '3114462137', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 10:42'),
(656, 0, 'CIRUG', 'CC', '63277760', 'BELTRAN', 'GAMARRA', 'ANA', '', '27/10/1957', '57', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA34D38-53SUR', 'VILLA MAYOR', '0', '3112750576', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'EDWIN BALLE', 'HIJO', '0', '3112750576', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 11:05'),
(657, 0, 'ONCOLOG', 'CC', '320442240', 'ORTIZ', '', 'MARIA', 'AGUSTINA', '05/09/1935', '79', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UBAQUE', 'VEREDA ALISA', 'VEREDA ALISA', '4009350', '3144631662', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'ANMA DE CASA', 'ANA ELVIRA SANCHEZ', 'HIJA', '4009350', '3144631662', 'NO', 'SI', 'NO', 'CONTROL DOCTOR PIERR HA LLAMADO VARIAS VECES Y NADA', 'Mas de 10 llamadas', 'Pedro Juli', '22/05/2015 11:34'),
(658, 0, 'HEMATOLOG', 'CC', '412112', 'VALDERRAMA', 'CAMARGO', 'CARLOS', 'JULIO', '12/02/1944', '72', 'MASCULINO', 'CAFAM', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'FUNZA', 'CRA 3A 6-63', 'EL  PORVENIR', '8261886', '3142468111', 'OLGAVALDERRAMA20@YAHOO.ES', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'GLORIA MARCELA VALDERRARMA HIJA ', 'HIJA', 'NO', '3203121073', 'SI', 'SI', 'NO', 'CITA VALORACION  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 11:20');
INSERT INTO `saliente_1` (`id`, `leido`, `ESPECIALIDADES`, `tipodocumento`, `numerodocumento`, `primerapellido`, `segundoapellido`, `primernombre`, `segundonombre`, `nacimiento`, `edad`, `sexo`, `EPS`, `cotizante`, `beneficiario`, `categorias`, `DEPARTAMENTO`, `CIUDADES`, `DIRECCION`, `BARRIO`, `fijo`, `celular`, `EMAIL`, `estudio`, `RELIGION`, `OCUPACION`, `nonapellidofamiliar`, `PARENTESCO`, `TELfamiliar`, `CELULARfamiliar`, `primeravez`, `primeraveespecialidad`, `QUIMIOTERAPIA`, `OBSERVACIONES`, `tipificacion_llamada`, `USUARIO`, `fechadellamada`) VALUES
(659, 0, 'CIRUG', 'CC', '20026394', 'BUITRAGO', 'MOSCOSO', 'SOBEIDA', '', '04/07/1936', '78', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA15#63A-45APTO302', 'CHAPINERO', '2121876', '3112025579', 'GEOGE_MACLAWN@HOTMAIL.COM', 'BACHILLER', 'CATOLICA', 'AMA DE CASA', 'JORGE ELIECER OCHOA', 'HIJO', '2121876', '3112025579', 'NO', 'SI', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 11:28'),
(660, 0, 'HEMATOLOG', 'CC', '326596', 'RINCON', 'RINCON', 'JOSE', 'GREGORIO', '27/07/1943', '72', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'NEMOC', 'CRA 6  2-39 SUR', 'SANTA ANA NEMOCON', 'NO', '3144187996', 'JOSERINCON75@YAHOO.COM.CO', 'T', 'CATOLICA', 'PENSIONADO', 'SILVINA RINCON', 'HIJA', 'NO', '3113114945', 'NO', 'NO', 'NO', 'CITA  CONTROL DRA SILVIA MARGARITA  PARA   MEDICAMENTOS *******', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 11:32'),
(661, 0, 'CIRUG', 'CC', '19324738', 'RIA', 'CADENA', 'JOSE', 'DEL CARMEN', '02/11/1978', '56', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'C', 'CUNDINAMARCA', 'BOGOT', 'CRA 76#4C-41', 'SANRAFAEL', '7589835', '3204019991', 'NO', 'BACHILLER', 'CATOLICO', 'ELECTRONICO', 'CLARA FABIOLA LUNA', 'ESPOSA', '7589835', '3204019991', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 11:37'),
(662, 0, 'ORTEPEDIA ONCOLOG', 'CC', '52380172', 'ESPINOSA', '', 'BLANCA', 'CECILIA', '11/10/1976', '48', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL1FBIS#1B-24', 'ATANASIO GIURARDOT', '5511519', '3143603096', 'PAVITA1976@HOTMAIL.COM', 'T', 'CATOLICA', 'EMPLEADA', 'YOLANDA GARZON', 'HERMANA', '0', '3124478905', 'SI', 'SI', 'NO', 'LLEVA OCHO MESES LLAMANDO PARA QUE LE ASIGNEN ESTA CITA POR FAVOR URGENTE DICE LA PACIENTE', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 11:35'),
(663, 0, 'HEMATOLOG', 'CC', '1139714', 'PINILLA', 'MALAGON', 'JOSE', 'LUIS', '14/08/1979', '75', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA108#78-21', 'GARCES NAVAS', '4403158', '3108691912', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'PENSIONADO', 'MIRIAM GOMEZ', 'ESPOSA', '4403158', '3108691912', 'NO', 'SI', 'NO', 'LLEVA UN MES LLAMANDO PARA CITA HACE UN MES', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 11:42'),
(664, 0, 'HEMATOLOG', 'CC', '39621104', 'MENDEZ', 'LEON', 'AMANDA', '', '20/06/1970', '44', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA96#23D50', 'FONTIBON', '4212314', '3142800608', 'AMANDA.MENDEZ@CONVIDA.COM.CO', 'UNIVERSITARIO', 'CATOLICA', 'EMPLEADA', 'YENET MENDEZ', 'HERMANA', '3134127011', '3134127011', 'NO', 'NO', 'NO', 'CONTROL DOCTORA SILVIA MARGARITA PARRA', '1ra Llamada', 'Pedro Juli', '22/05/2015 11:52'),
(665, 0, 'ONCOLOG', 'CC', '19227107', 'VARGAS', 'NO', 'EFRAIN', 'NO', '11/12/1953', '61', 'MASCULINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'MADRID', 'CALLE 12  5-25 INT 2', 'BARRIO  EL PINAR', '8284432', '3102319674', 'NO', 'PRIMARIA', 'CATOLICA', 'COMERCIANTE', 'ROSA JENNY GUERRERO', 'ESPOSA', 'NO', '3212953573', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA  VEZ  MUY URG. NECESITA TRATAMIENTO', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 11:38'),
(666, 0, 'HEMATOLOG', 'CC', '1019014400', 'ESPINEL', 'JAIME', 'DIANA', 'PATRICIA', '18/04/1987', '28', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL59#91-22', 'SUBA RINCON', '6859057', '3144564852', 'NO', 'BACHILLER', 'CATOLICA', 'VENDEDORA', 'OSCAR CAMACHO', 'ESPOSO', '6859057', '3106890414', 'NO', 'SI', 'NO', 'CONTROL CON DOCTOR DANIEL BERMUDEZ TRES SEMANAS SOLICITANDO LA CITA SIN RESPUESTA', '4ta Llamada', 'Pedro Juli', '22/05/2015 12:11'),
(667, 0, 'CIRUG', 'CC', '52269802', 'AYA', 'TRUJILLO', 'MARIA', 'STELLA', '21/09/1975', '39', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 39B SUR 2C-59', 'GUACAMAYAS', '3673534', '3102222073', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARIA STELLA TRUJILLO MOLINA', 'MAMA', '3673534', '3134556047', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA  VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 12:12'),
(668, 0, 'CL', 'CC', '41497593', 'RODRIGUEZ', 'DE RAMOS', 'ROSA', 'MARIA', '16/04/1951', '67', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'UBAQUE', 'CLL4#8-50', 'SAN FRANCISCO', '8891025', '3143811410', 'NO', 'T', 'CATOLICA', 'ENFERMERA', 'PAEZ BLANCA', 'TIA', '8891025', '3124820197', 'NO', 'NO', 'NO', 'CONTROL DOCTORA ANGELA MARIA ALVARES', '1ra Llamada', 'Pedro Juli', '22/05/2015 12:19'),
(669, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '39523344', 'BERNAL', 'NO', 'MARIA', 'MAGDALENA', '20/10/1960', '54', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE 71SUR 99A-50', 'BOSA EL  RECREO', '4625397', '3154724501', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'RODRIGO CORREDOR', 'HIJO', '4625397', 'NO', 'SI', 'SI', 'NO', 'CITA  POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 12:24'),
(670, 0, 'ONCOLOG', 'CC', '17107629', 'SANCHES', '', 'ARIOLFO', '', '14/10/1944', '70', 'MASCULINO', 'CAPITALSALUD', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 58SUR#17-68', 'SAN RAFAEL', '3654314', '3118749324', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'DESEMPLEADO', 'CARMEN SANCHEZ', 'HERMANA', '3655592', '3213511933', 'NO', 'SI', 'NO', 'LLAM POR CITA', '7ma Llamada', 'Sandra Liliana Agudelo', '22/05/2015 11:56'),
(671, 0, 'ORTOPEDIA GENERAL', 'CC', '2842137', 'TORRES', 'PE', 'ALIRIO', '', '12/06/1942', '72', 'MASCULINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CALLE25A#3D-10', 'MACARANE', '0', '3208432010', 'CYLO99@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMO DE CASA', 'MIRIAM BELTRAN', 'NUERA', '0', '3102233744', 'NO', 'SI', 'NO', 'CONTROL CON DOCT JULIO JOSE ALBIS', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 12:28'),
(672, 0, 'CIRUG', 'CC', '1022331751', 'CASTELLANOS', 'CANTE', 'JOHANNA', 'JASBLEYDY', '31/03/1986', '29', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'SOACHA', 'CRA 16C 36-88  SUR', 'LLANOS DE SOACHA', '7790754', '3138158218', 'MAURIFRUTIVERALBAN@YAHOO.COM.CO', 'BACHILLER', 'CATOLICA', 'OPERARIA', 'MARIA DEL CARMEN CANTE', 'MAMA', '7325102', 'NO', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 12:29'),
(673, 0, 'HEMATOLOG', 'CC', '41510306', 'URIBE', 'DIAZ', 'ROSA', 'CRISTINA', '08/04/1949', '65', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CALLE  54 35-21 APTO 101', 'NICOLAS DE  FEDERMAN', '2219753', '3114628931', 'ROSACRISUR@HOTMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'PENSIONADA', 'ESPERANZA URIBE', 'HERMANA', 'NO', '3143160712', 'NO', 'NO', 'NO', 'CITA CONTROL URG.  ENTREGA DE  BIOPSIA DRA SILVIA MARGARITA *******', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 12:37'),
(674, 0, 'CIRUG', 'CC', '21057748', 'VELASQUEZ', 'PRADA', 'ANA', 'LUCIA', '28/10/1958', '56', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'CUCUNUB', 'VEREDA PUEBLO VIEJO', 'VEREDA PUEBLO VIEJO', '8553742', '3143889779', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'ANDREA BELLO M', 'HIJA', '0', '3107509838', 'NO', 'SI', 'NO', 'CONTROL DOCTOR PABLO JOSE JIMENES MEJIA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 12:49'),
(675, 0, 'HEMATOLOG', 'CC', '20504396', 'SILVA', 'DE GANTIVA', 'MARIA', 'MARGARITA', '26/03/1956', '59', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'ZIPAQUIR', 'CRA 1B  9-47 INT 2', 'EL  CODITO', 'NO', '3144815076', 'NO', 'BACHILLER', 'CATOLICA', 'PENSIONADA', 'NELSON HERNANDO SILVA', 'SOBRINO', 'NO', '3214010207', 'NO', 'NO', 'NO', 'CITA CONTROL DRA SILVIA MARGARITA', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 12:51'),
(676, 0, 'HEMATOLOG', 'CC', '52233592', 'BERMUDEZ', 'ACOSTA', 'YENY', 'ALEXANDRA', '10/05/1978', '37', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIG3#83-02', 'NUEVA CASTILLA', '3926838', '3118750388', 'MAFELA23@YAHOO.ES', 'BACHILLER', 'CATOLICA', 'HOGAR', 'ANA ACOSTA', 'TIA', '7142597', '3107589215', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 12:51'),
(677, 0, 'CIRUG', 'CC', '28131284', 'JAIMES', 'JIMENES', 'MARGARITA', '', '30/12/1957', '57', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CRA16H#36-31SUR', 'LLANOS DE SOACHA', '9012916', '3103265870', 'MAJAJI57@HOTMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'MARTINES LAURA', 'HIJA', '6444690-EXT2703', '3209599181', 'SI', 'NO', 'NO', 'LLAMA POR CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 12:54'),
(678, 0, 'HEMATOLOG', 'CC', '53084754', 'ALBARRAZIN', 'VASQUES', 'ANGELA', 'YUDITH', '10/02/1986', '29', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA119#128-49', 'SUBA', '5372970', '3124704930', 'NO', 'T', 'CATOLICA', 'EMPLEADA', 'WILDER ROJAS', 'ESPOSO', '5372070', '3214140070', 'NO', 'NO', 'NO', 'CONTROL DOCTORA SILVIA ROJAS', '1ra Llamada', 'Pedro Juli', '22/05/2015 12:58'),
(679, 0, 'ONCOLOG', 'CC', '20753794', 'CASTILLO', '', 'BLANCA', 'PATRICIA', '18/03/1960', '55', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CRA6A#7A-22', 'SO VIVIENDA', '8262780', '3163800738', 'NIO TIENE', 'BACHILLER', 'CRISTIANA', 'AMA DE CASA', 'IVAN MAURICIO BARRETO', 'YERNO', '8932916', '3184248498', 'SI', 'SI', 'NO', 'CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 13:01'),
(680, 0, 'CIRUGIA VASCULAR PERIF', 'CC', '79248799', 'BONILLA', 'NO', 'FRANCISCO', 'JAVIER', '13/12/1969', '45', 'MASCULINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 134A CRA 101A -11', 'POTRERILLOS SUBA', '5367356', '3203187783', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MARY LUZ  VILLALBA', 'ESPOSA', '2427370', '3133319373', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 13:14'),
(681, 0, 'CIRUG', 'CC', '51743474', 'PACHON', 'REY', 'NANCY', '', '20/08/1962', '52', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL80#17-42', 'SAN JUAQUIN', '6300520', '3106139520', 'NO', 'PRIMARIA', 'CATOLICA', 'ENCUADERNADORA', 'ANA BETULA PACHON', 'HERMANA', '7656401', '3182033740', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 13:24'),
(682, 0, 'CIRUG', 'CC', '51680302', 'LUQUE', 'CALDAS', 'VEATRIS', 'YOLANDA', '25/01/1961', '53', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA74#81-20', 'MINUTO DE DIOS', '6271611', '3128396573', 'NO', 'BACHILLER', 'CATOLICA', 'AUXILIAR ADMINISTRATIBA', 'MONICA LUQUE', 'HERMANA', '3125651691', '3125651691', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 13:29'),
(683, 0, 'CIRUG', 'CC', '20371026', 'RAMIREZ', 'FRANCO', ' SANDRA', ' PATRICIA', '28/03/1984', '31', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'B', 'CUNDINAMARCA', 'MOSQUERA', 'CRA13A#19-64', 'EL CONDADO', '8935423', '3112659447', 'NO', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'VASQUES JHON JAIRO', 'ESPOSO', '8935423', '3107775771', 'SI', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 13:36'),
(684, 0, 'HEMATOLOG', 'CC', '52300488', 'VARGAS', 'CABALLERO', 'LUZ', 'DARI', '05/02/1965', '40', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA99#78-35', 'POTRERITO', '5718514', '3183995059', 'NO', 'BACHILLER', 'CATLICA', 'HOGAR', 'JEREMIAS LEAL CARRE', 'ESPOSO', '5708849', '3108142703', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 13:49'),
(685, 0, 'CIRUG', 'CC', '52203971', 'LESMES', 'GUEVARA', 'LUZ', 'DARY', '25/06/1972', '42', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'B', 'CUNDINAMARCA', 'BOGOT', 'CRA24BIS#44-24SUR', 'SANTA LUCIA', '7691413', '3144230747', 'LUZDARYLESMES25@HOTMAIL.COM', 'ESPECIALIZACI', 'CATOLICA', 'AUX', 'MARIA OFELIA CAMELLO', 'HERMANA', '7691413', '3105658874', 'SI', 'SI', 'NO', 'LLAMA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 13:44'),
(686, 0, 'CIRUG', 'CC', '51839543', 'MALAVER', 'OSORIO', 'MARTHA', 'EDILVA', '30/06/1995', '48', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL48#82-59', 'BRITALIA', '4501346', '31118268289', 'NO', 'BACHILLER', 'CATOLICA', 'OPERARIA', 'ELVIO MALAVER', 'MAMA', '4501346', '4501346', 'SI', 'SI', 'NO', '5 MESES DE ESPERA CON TRES ORDENES VENCIDAS', '10ma Llamada', 'Pedro Juli', '22/05/2015 14:02'),
(687, 0, 'CIRUG', 'CC', '51569094', 'AZUERO', 'ISAZA', 'LUISA', 'FERNANDA', '11/06/1960', '54', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA3A#54A-85', 'CHAPINERO ALTO', '8072153', '3158954003', 'LFAZUERO@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'DESEMPLEADA', 'MARCO ANTONIO AZUERO', 'HERMANO', '8072153', '3153372510', 'SI', 'SI', 'NO', 'LLAMADA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:08'),
(688, 0, 'ONCOLOG', 'CC', '20653487', 'PARDO', 'DIAZ', 'ROSA', 'ELVIRA', '01/04/1934', '81', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CRA 6  12-43', 'YANITUT VIA EL ROSAL', '8422790', '3133592082', 'CARQUIROGA@CAFAM.COM.CO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'TEODORO  TRIANA', 'ESPOSO', '8422790', '3133592082', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA ESTAN LLAMANDO DE CAFAM REGIMEN SUBSIADO PACIENTE DE  81  A', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:09'),
(689, 0, 'HEMATOLOG', 'CC', '19129172', 'ACOSTA', 'MAYORGA', 'PEDRO', 'NEL', '12/05/1950', '65', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE57BSUR#63-14', 'VILLA DEL RIO', '8122977', '3208023179', 'NO TIENE', 'BACHILLER', 'CATOLICA', 'DESEMPLEADO', 'DIOSELINA SERRANO', 'ESPOSA', '0', '3156558010', 'NO', 'SI', 'NO', 'CONTROL DOCTOR CARLOS DANIEL BERMUDEZ', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:14'),
(690, 0, 'ONCOLOG', 'CC', '23724491', 'BARRERA', 'NO', 'MARGARITA A', 'NO', '12/07/1951', '63', 'FEMENINO', 'CAPRESOCA', 'NO', 'SI', 'A', 'CASANARE', 'CASABIANCA', 'FINCA LA ALBANIA ', 'VEREDA SURIMENA', 'NO', '3142352589', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MILENA CANELO', 'HIJA', 'NO', '3118840754', 'NO', 'NO', 'NO', 'CITA  CONTROL POSTQUIRURGICO  PARA ENTREGA DE  PATOLOGIA  URG.  PACIENTE VIENE DESDE CASANARE******', '4ta Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:16'),
(691, 0, 'CIRUG', 'CC', '77343604', 'MENDOZA', 'RAMIREZ', 'ALEYDA', 'NO', '25/12/1973', '41', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'NO  LA SABE', 'PASEO REAL', 'NO', '3208777026', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'WILSON  GUTIERREZ TORRES', 'ESPOSO', 'NO', '3106498232', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:22'),
(692, 0, 'HEMATOLOG', 'CC', '1014234792', 'PINEDA', 'SIENDUA', 'JUDITH', 'VIVIANA', '28/07/1992', '22', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE68B#81-45', ' LACLARITA', '4718907', '3045548779', 'UNINA2014@HOTMAIL.COM', 'TECN', 'CATOLICA', 'EMPLEADA', 'MONICA SIENDUA', 'M,AMA', '4718907', '3045548779', 'SI', 'SI', 'NO', 'CITA PRIORITARIA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:19'),
(693, 0, 'CL', 'CC', '20332847', 'RODRIGUEZ', 'GUZMAN', 'ROSALBINA', 'NO', '26/11/1939', '76', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 5P 49H-13 SUR', 'MOLINOS', '7676279', '3104762073', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA ELVIRA  OTAVO', 'HIJA', 'NO', '3104762073', 'NO', 'NO', 'NO', 'CITA PARA CONTROL  URG. PACIENTE DIABETICA CON CANCER DE  COLON  Y  REQUIERE URG. LA CITA DAR PRIORIDAD********', '4ta Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:33'),
(694, 0, 'HEMATOLOG', 'CC', '52589372', 'RODRIGUEZ', 'GOMEZ', 'JAQUELIN', '', '29/06/1973', '41', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL128B#93C-48', 'RINCON', '0', '3117372275', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ANYI CUESTAS', 'HIJA', '0', '3138779071', 'NO', 'SI', 'NO', 'CONTROL DOCTOR SILVIA MARGARITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:33'),
(695, 0, 'COLOPROCTOLOG', 'CC', '20332847', 'RODRIGUEZ', 'GUZMAN', 'ROSALBINA', 'NO', '26/11/1939', '76', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 5 49H-13 SUR', 'MOLINOS', '7676279', '3104762073', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA ELVIRA OTAVO', 'HIJA', 'NO', '3104762073', 'NO', 'NO', 'NO', 'CITA PARA CONTROL URG******', '4ta Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:40'),
(696, 0, 'NUTRICI', 'CC', '20332847', 'RODRIGUEZ', 'GUZMAN', 'ROSALBINA', 'NO', '26/11/1939', '76', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 5 49H-13 SUR', 'MOLINOS', '7676279', '3104762073', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'MARIA ELVIRA OTAVO', 'HIJA', 'NO', '3104762073', 'NO', 'NO', 'NO', 'CITA PARA CONTROL URG.*****', '4ta Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:44'),
(697, 0, 'CIRUG', 'TI', '97091305155', 'TORREZ', 'PARRA', 'DIANA', 'CAROLINA', '13/09/1997', '17', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUNZA', 'CALLE9A#16-52', 'LA CHAGUYYA', '0', '3209631162-3046250704', 'MANUEL.VELEROS @ GMAIL.COM', 'BACHILLER', 'CATOLICA', 'ESTUDIANTE', 'JUAN MANUEL TORREZ', 'PADRE', '0', '3209631162-3046250704', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:42'),
(698, 0, 'CIRUG', 'CC', '1030618543', 'CASTA', 'MORALES', 'IVAN', 'ANDRES', '17/12/1992', '22', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 78F 58D-26 SUR', 'CIUDAD ROMA', 'NO', '3012574978', 'PATITO51930@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICA', 'ESTUDIANTE', 'PATRICIA EUGENIA MORALES', 'MAMA', 'NO', '3012574978', 'NO', 'NO', 'NO', 'CITA PARA CONTROL  Y  ENTREGA DE EXAMEN PRIORITARIO', '5ta Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 14:48'),
(699, 0, 'CIRUG', 'CC', '2378025', 'SAAVEDRA', 'PINEDA', 'CLARA', 'INES', '29/03/1963', '51', 'FEMENINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL62D#87-8-65', 'ESTANCIAL LAGOS', '6086493', '3145053539', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'LUIS ALBERTO VENTURA', 'ESPOSO', '6086493', '3145053539', 'NO', 'SI', 'NO', 'CONTROL DOCTOR CLAUDIA CUBILLOS', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 14:48'),
(700, 0, 'HEMATOLOG', 'CC', '19370239', 'GONZALEZ', 'CORTES', 'JOSE', 'GUILLERMO', '02/08/1959', '55', 'MASCULINO', 'UNICAJAS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 42SUR 12G-48', 'SAN JORGE', 'NO', '3213105179', 'NO', 'PRIMARIA', 'CRISTIANO', 'HOGAR', 'ANA MERCHAN BENITEZ', 'ESPOSA', 'NO', '3213105179', 'NO', 'NO', 'NO', 'CITA CONTROL URG.  DRA SILVIA MARGARITA ROJAS ESTA LLAMANDO DESDE MARZO******', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '22/05/2015 14:53'),
(701, 0, 'ANESTESIOLOG', 'CC', '79893066', 'SANCHEZ', 'MORENO', 'EDWIN', 'JAVIER', '17/07/1977', '37', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA2 #23-45', 'RICAURTE', '7216041', '3125578663', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADO', 'FERNANDA RUIZ', 'ESPOSA', '721641', '3125578663', 'NO', 'SI', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 15:02'),
(702, 0, 'GINECOONCOLOG', 'CC', '39693842', 'GONZALEZ', 'PACHECO', 'MARIA', 'LEONOR', '31/10/1964', '50', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 75B  87-14', 'FLORENCIA', '2237792', '3202668477', 'NO', 'BACHILLER', 'CATOLICA', 'EMPLEADA', 'MIRYAM  GONZALEZ  PACHECO', 'HERMANA', '2237792', '3125012288', 'SI', 'SI', 'NO', 'CITA POR  PRIMERA VEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 15:02'),
(703, 0, 'CL', 'CC', '4291851', 'RUIZ', 'RUIZ', 'MARCO', 'ANTONIO', '23/02/1954', '61', 'MASCULINO', 'UNICAJA', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL138#155-27', 'SANTA RITA SUBA', '3031988', '3138973053', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'DESEMPLEADO', 'OLGA LUCIA RUIZ', 'HIJA', '3031988', '3138973053', 'NO', 'SI', 'NO', 'PACIENTE QUE HA LLAMADO MAS DE DOS MESES POR CITA Y LA ORDEN DICE PRIORITARIA', 'Mas de 10 llamadas', 'Sandra Liliana Agudelo', '22/05/2015 14:56'),
(704, 0, 'CIRUG', 'CC', '39613444', 'BARBOSA', 'BARRERA', 'ANA', 'LUCRECIA', '14/11/1962', '52', 'FEMENINO', 'ECOPSOS', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'SOACHA', 'CLL4#11-46', 'JUAN PABLO1', '9002850', '3112069103', 'NO', 'PRIMARIA', 'CATOLICA', 'INDEPENDIENTE', 'OFELIA BARBOZA', 'HERMANA', '7836883', '7836883', 'NO', 'NO', 'NO', '', '6ta Llamada', 'Pedro Juli', '22/05/2015 15:08'),
(705, 0, 'CIRUG', 'CC', '35375722', 'ROMERO', 'MORENO', 'LILIA', 'CAROLINA', '08/05/1967', '48', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 78C  75F-39  SUR', 'BOSA LA AMISTAD', 'NO', '3204788057', 'NO', 'BACHILLER', 'CRISTIANA', 'HOGAR', 'MARIA FERNANDA JIMENEZ ROMERO', 'HIJA', 'NO', '3193708494', 'NO', 'NO', 'NO', 'CITA  CONTROL PARA ENTREGA DE E XAMENES DRA CLAUDIA CUBILLOS', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 15:12'),
(706, 0, 'CIRUG', 'CC', '39615298', 'BARELO', 'LOPEZ', 'MERIA', 'ESTEFAN', '18/12/1963', '51', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FUSAGASUG', 'CALLE25A#1-14', 'FUZAGAZUGA', '8733559', '3125447168', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'JESUS BALERO', 'HERMANO', '7677625', '3143684775', 'SI', 'SI', 'SI', 'CLLAMADA DE VALORACION', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 15:09'),
(707, 0, 'HEMATOLOG', 'CC', '35325248', 'GIL', 'HERNANDEZ', 'NELLY', 'NO', '11/07/1956', '58', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 104 A BIS  23G-56', 'LA CABA', '2672279', '3004771317', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'CARLOS  ANDRES GIL', 'HIJO', 'NO', '3006035557', 'NO', 'NO', 'NO', 'CITA PARA CONTROL PARA  LECTURA DE  EXAMENES DR. CARLOS  DANIEL BERMUDEZ', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 15:19'),
(708, 0, 'ENDOCRINOLOG', 'CC', '24487793', 'CABRERA', '', 'ARGELIA', 'INES', '19/06/1956', '57', 'FEMENINO', 'SALUD TOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL 53SUR#78K-44', 'ROMA', '4618285', '3132881349', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'MARIO DIAZ', 'HIJO', '4618285', '3213752187', 'NO', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 15:19'),
(709, 0, 'HEMATOLOG', 'CC', '20332011', 'GUEVARA', 'DE RUBIANO', 'MARIA', 'ANTONIA', '27/03/1943', '72', 'FEMENINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL69A>-26', 'BRITALIA', '6508778', '3213531823', 'IVONGUEBARA@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'ADRIANA RUBIANO', 'HIJA', '6508778', '6508778', 'SI', 'NO', 'NO', 'DOCTOR OSCAR JAVIER PE', '1ra Llamada', 'Pedro Juli', '22/05/2015 15:21'),
(710, 0, 'ONCOLOG', 'CC', '41528624', 'DIAZ', 'DE MORENO', 'MARIA', 'CRISTINA', '06/08/1946', '68', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA2#37-77', 'GUACAMYAS', '2061510', '3203154636', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'VICTOR MANUEL MORENO', 'ESPOSO', '2061510', '3203154635', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 15:26'),
(711, 0, 'HEMATOLOG', 'CC', '1030566766', 'LUCERO', 'GUTIERREZ', 'LEIDY', 'ANDREA', '09/01/1990', '25', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA81I#42B51SUR', 'VILLA LA LOMA', '2737773', '3188304467', 'NO TIENE', 'T', 'CATOLICA', 'AUX DE FARMACIA', 'ELENA GUTIERREZ', 'MAMA', '2737773', '3125251806', 'NO', 'NO', 'NO', 'CANCELACION DE CITA  POR QUE NO SE TOMO EXAMENES DE LABORATORIO', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 15:25'),
(712, 0, 'CIRUG', 'CC', '20643926', 'AVELLANEDA', 'MENDEZ', 'AURORA', 'NO', '14/03/1958', '57', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'GUASCA', 'VEREDA SAN ISIDRO', 'NO', 'NO', '3165817380', 'NO', 'PRIMARIA', 'CATOLICA', 'HOGAR', 'LEONARDO TOVAR', 'HIJO', 'NO', '3182915306', 'NO', 'NO', 'NO', 'CITA DE CONTROL  PARA LECTURA DE E XAMENES ES URG.  PRIORIDAD HA LLAMADO VARIAS VECES', '3ra Llamada', 'Carmenza Moreno Mendoza', '15:29:19'),
(713, 0, 'CIRUG', 'CC', '5198399', 'REYES', ' GUZMAN', 'PILAR', '', '17/02/1968', '47', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA12#15-103', 'VILLA MARCELA', '8079082', '3143523468', 'NO', 'BACHILLER', 'CATOLICA', 'HOGAR', 'BARBOSA REYES', 'HIJA', '3204523743', '3204523743', 'SI', 'SI', 'NO', 'MAS DE UN MES DE ESPERA SIN RESPUESTA', '10ma Llamada', 'Pedro Juli', '22/05/2015 15:40'),
(714, 0, 'ONCOLOG', 'CC', '40329497', 'ROJAS', 'PARRA', 'LUZ', 'MARINA', '15/03/1984', '31', 'FEMENINO', 'SALUDCOOP', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 151 C 142C-42', 'SUBA BILBAO', 'NO', '3123474962', 'NO', 'ESPECIALIZACI', 'CATOLICA', 'EMPLEADA', 'CARLOS  TRASLAVI', 'ESPOSO', 'NO', '3202773657', 'NO', 'NO', 'NO', 'DE CLINICA SAN  DIEGO  LA ENVIARON  PARA AGENDARLE  CITA URG.  EL  JUEVES LE  ENTREGAN  EXAMENES  Y  NECESITA  QUE  LOS  LEAN URG. DR. LUIS  CARLOS GOMEZ ******', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 15:36'),
(715, 0, 'HEMATOLOG', 'CC', '19128295', 'LARA', 'MENESES', 'JOSE', 'YAMILE', '12/04/1950', '65', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA72MBIS#37-81', 'CARBAJAL', '2646044', '3208359941', 'JOSELARA@TECNOAISLAR.COM', 'BACHILLER', 'CRISTIANO', 'EMPLEADO', 'MENDOZA DE ', 'ESPOSA', '4203232', '3106192295', 'SI', 'NO', 'NO', '20 DIAS DE ESPERA SIN RESPUESTA ALGUNA', '2da Llamada', 'Pedro Juli', '22/05/2015 15:46'),
(716, 0, 'NUTRICI', 'CC', '25616559', 'MANSILLA', 'LASSO', 'MARIA', 'CENIDES', '30/09/1939', '75', 'FEMENINO', 'CAFAM', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'PUERTO SALGAR', 'CR6#9-50', 'ALTO BUENOS AIRES', '0968573732', '3147311811', 'NO TIENE', 'PRIMARIA', 'ADVENTISTA', 'AMA DE CASA', 'MARIA TERESA USURRIAGA', 'HIJA', 'O', '3127248348', 'NO', 'NO', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 15:35'),
(717, 0, 'HEMATOLOG', 'CC', '80577710', 'RAMIREZ', 'MEDINA', 'LEONARDO', 'ANDRES', '06/06/1978', '36', 'MASCULINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'MADRID', 'CRA7#12A-40', 'PROVIS', '8250207', '3142298271', 'LEONARDO2890@HOTMAIL.COM', 'UNIVERSITARIO', 'CATOLICO', 'EMPLEADO', 'ANA ROSALBA PULIDO', 'SUEGRA', '8250207', '3115090843', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 16:00'),
(718, 0, 'NUTRICI', 'CC', '20780741', 'HUERTAS', 'LEAL', 'SARA', 'ELIZA', '06/06/1951', '63', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA33#26A-54', 'ANTONIO NARI', '3409092-2442823', '3204507750-3125086345', 'CAROMENHUER5@GMAIL.COM', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'CARMEN ROSA MENDEZ H', 'HIJA', '3409092-2442823', '3204507750', 'NO', 'SI', 'SI', 'LLAMA  CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 15:58'),
(719, 0, 'CIRUG', 'CC', '30313588', 'VALENZUELA', 'SILVA', 'NANCY', 'NO', '25/12/1966', '48', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 14 75-42', 'EL  LAGO', '3177897', '3102824366', 'NO', 'T', 'CRISTIANO', 'EMPLEADA', 'LUIS ALBERTO MONTENEGRO MORENO', 'ESPOSO', '3177897', 'NO', 'SI', 'SI', 'NO', 'CITA POR PRIMERA VEZ URG.', '1ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 15:55'),
(720, 0, 'UROLOG', 'CC', '3001324', 'MARIN', 'LOPEZ', 'RIGOBERTO', '', '04/04/1951', '64', 'MASCULINO', 'CAFAM', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'VILLANUEVA', 'CRA80J#49-16SUR', 'BRITALIA', '2930562', '3125827235', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AGRICULTOR', 'CARMENZA MARIN', 'HERMANA', '2930562', '3125827235', 'NO', 'SI', 'NO', 'CONTROL DOCTOR GERMAN ADRIAN GODOY', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 16:09'),
(721, 0, 'COLOPROCTOLOG', 'CC', '20147368', 'MORA', 'SANCHEZ', 'MARIA', 'LILIA', '03/04/1926', '89', 'FEMENINO', 'CONFACUNDI', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL7#90-81', 'TINTAL}', '2309419', '3158081996', 'NO', 'PRIMARIA', 'CATOLICO', 'HOGAR', 'JORGE MORA', 'HIJO', '3150347', '315881996', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 16:10'),
(722, 0, 'CIRUG', 'CC', '39773968', 'VELASQUEZ', 'RAMOS', 'BLANCA', 'AURORA', '08/11/1963', '51', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'DIA32G#12I-24', 'LUIS LOPEZ DE MESA', '2094390', '3102638728', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'OFICIOS VARIOS', 'PEDRO EMILIO VARILA', 'ESPOSO', '2094390', '3132614772', 'SI', 'SI', 'NO', 'LLAMA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 16:15'),
(723, 0, 'GINECOONCOLOG', 'CC', '52015139', 'GORDILLO', 'NO', 'FLOR', 'MIRYAM', '22/09/1969', '45', 'FEMENINO', 'FAMISANAR', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA 93 B  71-49', 'EL  RECREO', '7856117', '3102951682', 'MIRIAMN0320091@GMAIL.COM', 'UNIVERSITARIO', 'CRISTIANA', 'ESTILISTA', 'DELIO ALFONSO MANIOS', 'ESPOSO', '7856117', '3102643482', 'SI', 'SI', 'NO', 'CITA URG.  POR PRIMERA VEZ URG.  MUY  URG.  NECESITA VALORACION URG LE  ESTA CRECIENDO  UNA  MASA******', '3ra Llamada', 'Carmenza Moreno Mendoza', '22/05/2015 16:17'),
(724, 0, 'CIRUG', 'CC', '51869150', 'VELA', '', 'CLAUDIA', 'PATRICIA', '25/08/1967', '47', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA104#13-48', 'FONTIBON', '4602058', '3102889085', 'CPV.67@HOTMAIL.COM', 'TECN', 'CATOLICA', 'ASESORA COMERCIAL', 'PE', 'ESPOSO', '4602058', '3213040127', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 16:19'),
(725, 0, 'HEMATOLOG', 'CC', '53098480', 'RODRIGUEZ', 'PADILLA', 'MARIA', 'CLARENA', '09/09/1984', '30', 'FEMENINO', 'SALUDTOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA69P#72-69', 'FERIAS', '3208597862', '3114441106', 'MARIACLARENA84@HOTMAIL.COM', 'T', 'CATOLICA', 'HOGAR', 'CARLOS MORENO', 'ESPOSO', '3114441106', '3114441106', 'NO', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 16:25'),
(726, 0, 'CIRUG', 'CC', '42498083', 'AGUDELO', 'SERRANO', 'ELIA', 'ROSA', '01/11/1960', '54', 'FEMENINO', 'FAMISANAR', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CLL53A#7A-08', 'ABRAM LINCON', '4654615', '3186354637', 'NO TIENE', 'NINGUNO', 'CATOLICA', 'INDEPENDIENTE', 'LISETH NAVAS AGUDELO', 'HIJA', '0', '3203536256-3136697635', 'SI', 'SI', 'NO', 'LLAMA PARA CITA', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 16:20'),
(727, 0, 'ONCOLOG', 'CC', '20737837', 'TRIANA', 'MORENO', 'FABIOLA', '', '17/10/1963', '51', 'FEMENINO', 'COLSUBSIDIO', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'FACATATIV', 'CRA1A#13-12ESTE', 'MANABLANCA', '0', '3102211129', 'NO TIENE', 'PRIMARIA', 'CATOLICA', 'AMA DE CASA', 'LISETH CONTRERAS', 'HIJA', '0', '3193277090', 'NO', 'SI', 'NO', 'CONTROL DOCTOR ALEJANDRO ABUCHAR', '1ra Llamada', 'Sandra Liliana Agudelo', '22/05/2015 16:42'),
(728, 0, 'HEMATOLOG', 'CC', '17054169', 'CHIRIVI', 'NO', 'CLODOVEDO', 'NO', '12/08/1941', '73', 'MASCULINO', 'SALUDTOTAL', 'NO', 'SI', 'A', 'CUNDINAMARCA', 'BOGOT', 'CALLE 79  60-67', 'SIMON BOLIVAR', 'NO', '3132897556', 'NO', 'PRIMARIA', 'CRISTIANO', 'ELECTRICISTA', 'RITA QUEMBA', 'ESPOSA', 'NO', '3202276770', 'NO', 'NO', 'NO', 'CITA CONTROL DRA SILVIA MARGARITA ESTA LLAMANDO HACE 2 MESES Y  SU ORDEN DICE PRIORIDAD UNO *********', 'Mas de 10 llamadas', 'Carmenza Moreno Mendoza', '22/05/2015 16:35'),
(729, 0, 'ORTEPEDIA ONCOLOG', 'CC', '1024499534', 'GONX', 'VIASOS', 'FABIO', 'HERNESTO', '10/12/1989', '25', 'FEMENINO', 'SALUD TOTAL', 'SI', 'NO', 'A', 'CUNDINAMARCA', 'BOGOT', 'CRA2#80-19SUR', 'BALLES DE CAFAM', '7672055', '3214079092', 'FAVITO_92-87@HOTMAIL.COM', 'BACHILLER', 'CATOLICO', 'CONDUCTOR', 'KAREN OSORIO', 'ESPOSA', '7672055', '3138513301', 'SI', 'NO', 'NO', '', '1ra Llamada', 'Pedro Juli', '22/05/2015 16:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saliente_3`
--

CREATE TABLE `saliente_3` (
  `id` bigint(20) NOT NULL,
  `leido` int(2) DEFAULT '0',
  `nombre` varchar(200) DEFAULT NULL,
  `numero` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `saliente_3`
--

INSERT INTO `saliente_3` (`id`, `leido`, `nombre`, `numero`) VALUES
(1, 1, 'luiz', 'titulo'),
(2, 1, 'excel', ''),
(3, 1, 'nombre ', 'excel'),
(4, 1, 'wqe', 'qweqwe'),
(5, 0, 'dfghgfn', 'fgbgfb'),
(6, 0, 'gbff', 'fbgb'),
(7, 0, '', 'fgbfgbfgb'),
(8, 0, 'luis2', 'luis2'),
(9, 0, 'eduardo1', 'eduardo2'),
(10, 0, 'eduardo2', 'eduardo2'),
(11, 0, 'luis2', 'luis2'),
(12, 0, 'eduardo1', 'eduardo2'),
(13, 0, 'eduardo2', 'eduardo2'),
(14, 0, 'luis2', 'luis2'),
(15, 0, 'eduardo1', 'eduardo2'),
(16, 0, 'eduardo2', 'eduardo2'),
(17, 0, 'luis2', 'luis2'),
(18, 0, 'eduardo1', 'eduardo2'),
(19, 0, 'eduardo2', 'eduardo2'),
(20, 0, 'luis', 'luis1'),
(21, 0, 'luis2', 'luis2'),
(22, 0, 'eduardo1', 'eduardo2'),
(23, 0, 'eduardo2', 'eduardo2'),
(24, 0, 'luis', 'luis1'),
(25, 0, 'luis2', 'luis2'),
(26, 0, 'eduardo1', 'eduardo2'),
(27, 0, 'eduardo2', 'eduardo2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) NOT NULL,
  `campanas_id` bigint(20) NOT NULL,
  `creado` varchar(120) NOT NULL,
  `cambio` varchar(120) DEFAULT NULL,
  `activo` int(2) DEFAULT '0',
  `nombre` varchar(120) NOT NULL,
  `descripcion` text,
  `generado` int(2) DEFAULT '0',
  `agendamiento` int(2) DEFAULT '0',
  `buscador` varchar(120) DEFAULT NULL,
  `listadoagendamiento` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `campanas_id`, `creado`, `cambio`, `activo`, `nombre`, `descripcion`, `generado`, `agendamiento`, `buscador`, `listadoagendamiento`) VALUES
(1, 3, '27-10-2015', '27-10-2015', 1, 'Ticket', 'sadasd', 1, 1, 'campo_2', 0),
(2, 3, '26-02-2016', '26-02-2016', 1, 'agendamiento de doctores', 'agendamiento de doctores', 1, 1, 'campo_3', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketsusuarios`
--

CREATE TABLE `ticketsusuarios` (
  `id` bigint(20) NOT NULL,
  `tickets_id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticketsusuarios`
--

INSERT INTO `ticketsusuarios` (`id`, `tickets_id`, `usuarios_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_1`
--

CREATE TABLE `tickets_1` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `denwa_id` bigint(20) NOT NULL,
  `tabla_denwa` varchar(120) NOT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `TICKETS_FECHA_AGENDA` varchar(200) DEFAULT NULL,
  `TICKETS_HORA_AGENDA` varchar(200) DEFAULT NULL,
  `TICKETS_DESPLAZAMIENTO` varchar(200) DEFAULT NULL,
  `TICKETS_TEMPO_EJECUCION` varchar(200) DEFAULT NULL,
  `TICKETS_ACTIVO` int(2) DEFAULT '0',
  `TICKETS_COMENTARIOEXTERNO` text,
  `campo_1` varchar(200) DEFAULT NULL,
  `campo_2` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tickets_1`
--

INSERT INTO `tickets_1` (`id`, `usuarios_id`, `denwa_id`, `tabla_denwa`, `fecha`, `hora`, `tiempo`, `TICKETS_FECHA_AGENDA`, `TICKETS_HORA_AGENDA`, `TICKETS_DESPLAZAMIENTO`, `TICKETS_TEMPO_EJECUCION`, `TICKETS_ACTIVO`, `TICKETS_COMENTARIOEXTERNO`, `campo_1`, `campo_2`) VALUES
(1, 1, 14, 'denwa_3', '27-10-2015', '12:15:44 PM', '0:45', '2015-10-27', '12:22', '00:05:00', '00:10:00', 1, NULL, '123', 'luis'),
(2, 1, 1, 'denwa_3', '27-10-2015', '01:34:30 PM', '73:58', '2015-10-28', '03:30', '00:10:00', '00:10:00', 1, NULL, '234', 'luis'),
(3, 1, 15, 'denwa_3', '27-10-2015', '03:05:50 PM', '1:20', '2015-10-27', '01:32', '00:05:00', '00:05:00', 0, 'conentariosssssss<br />Luis Bernal 04:58 PM 27-10-2015', '123', 'luis'),
(4, 1, 16, 'denwa_3', '27-10-2015', '04:09:59 PM', '0:34', '2015-10-27', '14:56', '00:10:00', '01:00:00', 0, NULL, '2', 'luis'),
(5, 1, 4, 'denwa_3', '27-10-2015', '05:01:34 PM', '21:45', '2015-10-28', '14:00', '00:15:00', '01:00:00', 0, 'hgxhjasgcjs<br />Luis Eduar 05:02 PM 27-10-2015', '123', 'luis'),
(6, 1, 18, 'denwa_3', '26-02-2016', '10:29:53 AM', '0:46', '2016-02-26', '02:11', '00:05:00', '00:05:00', 0, NULL, '1', 'luis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_2`
--

CREATE TABLE `tickets_2` (
  `id` bigint(20) NOT NULL,
  `usuarios_id` bigint(20) NOT NULL,
  `denwa_id` bigint(20) NOT NULL,
  `tabla_denwa` varchar(120) NOT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `hora` varchar(120) DEFAULT NULL,
  `tiempo` varchar(200) DEFAULT NULL,
  `TICKETS_FECHA_AGENDA` varchar(200) DEFAULT NULL,
  `TICKETS_HORA_AGENDA` varchar(200) DEFAULT NULL,
  `TICKETS_DESPLAZAMIENTO` varchar(200) DEFAULT NULL,
  `TICKETS_TEMPO_EJECUCION` varchar(200) DEFAULT NULL,
  `TICKETS_ACTIVO` int(2) DEFAULT '0',
  `TICKETS_COMENTARIOEXTERNO` text,
  `campo_3` text,
  `campo_4` varchar(200) DEFAULT NULL,
  `campo_5` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tickets_2`
--

INSERT INTO `tickets_2` (`id`, `usuarios_id`, `denwa_id`, `tabla_denwa`, `fecha`, `hora`, `tiempo`, `TICKETS_FECHA_AGENDA`, `TICKETS_HORA_AGENDA`, `TICKETS_DESPLAZAMIENTO`, `TICKETS_TEMPO_EJECUCION`, `TICKETS_ACTIVO`, `TICKETS_COMENTARIOEXTERNO`, `campo_3`, `campo_4`, `campo_5`) VALUES
(1, 1, 19, 'denwa_3', '26-02-2016', '11:44:34 AM', '1:28', '2016-02-26', '10:00', '00:00:00', '00:00:00', 0, NULL, 'doc 1', 'luis', '#0000ff'),
(2, 1, 1, 'denwa_3', '26-02-2016', '01:00:24 PM', '0:19', '2016-02-26', '10:10', '01:00:00', '00:00:00', 0, NULL, 'doc1', 'luis', '#000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets_campos`
--

CREATE TABLE `tickets_campos` (
  `id` bigint(20) NOT NULL,
  `tickets_id` bigint(20) NOT NULL,
  `tipos_id` bigint(20) NOT NULL,
  `listas_id` bigint(20) NOT NULL,
  `ayuda` text NOT NULL,
  `titulo_campo` varchar(200) NOT NULL,
  `visible` int(2) NOT NULL,
  `orden` int(120) NOT NULL,
  `obligatorio` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tickets_campos`
--

INSERT INTO `tickets_campos` (`id`, `tickets_id`, `tipos_id`, `listas_id`, `ayuda`, `titulo_campo`, `visible`, `orden`, `obligatorio`) VALUES
(1, 1, 3, 0, 'numm', 'numero', 1, 1, 1),
(2, 1, 1, 0, 'sdfsdf', 'nombre', 1, 2, 1),
(3, 2, 1, 5, 'dddddd', 'doctor', 1, 1, 1),
(4, 2, 1, 0, 'aaa', 'nombreaa', 1, 2, 1),
(5, 2, 9, 0, '', 'color', 1, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `html` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `html`) VALUES
(3, 'Numerico', 'number'),
(4, 'Correo', 'email'),
(5, 'Fecha (dia/mes/año)', 'date'),
(6, 'Mes (mes del año)', 'month'),
(7, 'Hora (00:00)', 'time'),
(8, 'Semana (Semana #, año)', 'week'),
(1, 'Texto sencillo', 'text'),
(2, 'Texto grande', 'text'),
(9, 'Color (Selección de color)', 'color');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` bigint(20) NOT NULL,
  `nombreusuario` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nombreusuario`) VALUES
(1, 'Administrador'),
(2, 'Agente'),
(3, 'Comercial (tickets)'),
(4, 'Consultor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `tipousuario_id` bigint(20) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `activo` int(2) NOT NULL DEFAULT '1',
  `pass` varchar(200) NOT NULL,
  `identificacion` varchar(120) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `apellido` varchar(120) NOT NULL,
  `creado` varchar(120) DEFAULT NULL,
  `cambio` varchar(120) DEFAULT NULL,
  `ultima_entrada` varchar(120) DEFAULT NULL,
  `fijo` varchar(120) DEFAULT NULL,
  `movil` varchar(120) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `tipousuario_id`, `correo`, `activo`, `pass`, `identificacion`, `nombre`, `apellido`, `creado`, `cambio`, `ultima_entrada`, `fijo`, `movil`) VALUES
(1, 1, 'guitarradeluis@gmail.com', 1, 'luis', '1030598919', 'Luis', 'Bernal', NULL, '22-05-2015', NULL, NULL, ''),
(2, 4, 'guitarradeluis1@gmail.com', 1, 'luis', '123', 'Luis', 'Eduar', '15-05-2015', '19-08-2016', NULL, '', ''),
(3, 2, 'analista.facturacion@primeholdingservice.com', 1, 'YA6918phs', '1072188167', 'YOHAN', 'ALVAREZ', '22-05-2015', '22-05-2015', NULL, NULL, ''),
(4, 2, 'guitarradeluis2@gmail.com', 1, '123', '1222', 'll', 'Ee', '22-05-2015', '26-05-2015', NULL, '1', '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendamientotipo`
--
ALTER TABLE `agendamientotipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agendamientotipocampos`
--
ALTER TABLE `agendamientotipocampos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agendasmiento`
--
ALTER TABLE `agendasmiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agendasmiento_denwa`
--
ALTER TABLE `agendasmiento_denwa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banderas`
--
ALTER TABLE `banderas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `buscador`
--
ALTER TABLE `buscador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `campanas`
--
ALTER TABLE `campanas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `campanasusuarios`
--
ALTER TABLE `campanasusuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `campanas_condicion`
--
ALTER TABLE `campanas_condicion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `campos`
--
ALTER TABLE `campos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `condicion_banderas`
--
ALTER TABLE `condicion_banderas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuadro`
--
ALTER TABLE `cuadro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuadro_campos`
--
ALTER TABLE `cuadro_campos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_2`
--
ALTER TABLE `denwa_2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_3`
--
ALTER TABLE `denwa_3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_4`
--
ALTER TABLE `denwa_4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_5`
--
ALTER TABLE `denwa_5`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_6`
--
ALTER TABLE `denwa_6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_7`
--
ALTER TABLE `denwa_7`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denwa_8`
--
ALTER TABLE `denwa_8`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listado_tiempos`
--
ALTER TABLE `listado_tiempos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listaopciones`
--
ALTER TABLE `listaopciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listas`
--
ALTER TABLE `listas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_listas`
--
ALTER TABLE `orden_listas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametrosemail`
--
ALTER TABLE `parametrosemail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pibotes`
--
ALTER TABLE `pibotes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pibotesitems`
--
ALTER TABLE `pibotesitems`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saliente_1`
--
ALTER TABLE `saliente_1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saliente_3`
--
ALTER TABLE `saliente_3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticketsusuarios`
--
ALTER TABLE `ticketsusuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_1`
--
ALTER TABLE `tickets_1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_2`
--
ALTER TABLE `tickets_2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets_campos`
--
ALTER TABLE `tickets_campos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendamientotipo`
--
ALTER TABLE `agendamientotipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `agendamientotipocampos`
--
ALTER TABLE `agendamientotipocampos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `agendasmiento`
--
ALTER TABLE `agendasmiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `agendasmiento_denwa`
--
ALTER TABLE `agendasmiento_denwa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `banderas`
--
ALTER TABLE `banderas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `buscador`
--
ALTER TABLE `buscador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `campanasusuarios`
--
ALTER TABLE `campanasusuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `campanas_condicion`
--
ALTER TABLE `campanas_condicion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `campos`
--
ALTER TABLE `campos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `condicion_banderas`
--
ALTER TABLE `condicion_banderas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `cuadro`
--
ALTER TABLE `cuadro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuadro_campos`
--
ALTER TABLE `cuadro_campos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `denwa_2`
--
ALTER TABLE `denwa_2`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `denwa_3`
--
ALTER TABLE `denwa_3`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `denwa_4`
--
ALTER TABLE `denwa_4`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `denwa_5`
--
ALTER TABLE `denwa_5`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `denwa_6`
--
ALTER TABLE `denwa_6`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `denwa_7`
--
ALTER TABLE `denwa_7`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `denwa_8`
--
ALTER TABLE `denwa_8`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `listado_tiempos`
--
ALTER TABLE `listado_tiempos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `listaopciones`
--
ALTER TABLE `listaopciones`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `listas`
--
ALTER TABLE `listas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `mail`
--
ALTER TABLE `mail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `orden_listas`
--
ALTER TABLE `orden_listas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `parametrosemail`
--
ALTER TABLE `parametrosemail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `pibotes`
--
ALTER TABLE `pibotes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pibotesitems`
--
ALTER TABLE `pibotesitems`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `saliente_1`
--
ALTER TABLE `saliente_1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730;
--
-- AUTO_INCREMENT de la tabla `saliente_3`
--
ALTER TABLE `saliente_3`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ticketsusuarios`
--
ALTER TABLE `ticketsusuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tickets_1`
--
ALTER TABLE `tickets_1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tickets_2`
--
ALTER TABLE `tickets_2`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tickets_campos`
--
ALTER TABLE `tickets_campos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
