-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2022 at 02:59 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DS1_7`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2022-06-05 22:45:44.653166', '2022-06-05 22:45:44.653166');

-- --------------------------------------------------------

--
-- Table structure for table `juega_individuals`
--

CREATE TABLE `juega_individuals` (
  `id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `puntuacion` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `juega_individuals`
--

INSERT INTO `juega_individuals` (`id`, `usuario_id`, `puntuacion`, `fecha`, `created_at`, `updated_at`) VALUES
(1, 1, 1212, '2022-06-01', '2022-06-06 08:20:50.162057', '2022-06-06 08:20:50.162057'),
(2, 1, 123123, '2022-06-14', '2022-06-06 08:34:18.461965', '2022-06-06 08:34:18.461965'),
(3, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(4, 2, 80, '2022-06-06', '2022-06-06 09:39:53.481625', '2022-06-06 09:39:53.481625'),
(5, 2, 40, '2022-06-06', '2022-06-06 13:59:29.707928', '2022-06-06 13:59:29.707928'),
(6, 2, 0, '2022-06-06', '2022-06-06 18:15:51.090727', '2022-06-06 18:15:51.090727'),
(7, 1, 160, '2022-06-06', '2022-06-06 18:29:06.703068', '2022-06-06 18:29:06.703068'),
(8, 1, 69694, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(9, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(10, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(11, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(12, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(13, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(14, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(15, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(16, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(17, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(18, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(19, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(20, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(21, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(22, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(23, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(24, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(25, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(26, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(27, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(28, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(29, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(30, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(31, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(32, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(33, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(34, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(35, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(36, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(37, 1, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(38, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(39, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(40, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(41, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(42, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(43, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(44, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(45, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(46, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(47, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(48, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(49, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(50, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(51, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(52, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(53, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(54, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(55, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(56, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(57, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(58, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(59, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(60, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(61, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(62, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(63, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(64, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(65, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(66, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(67, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(68, 2, 6969, '2022-06-01', '2022-06-06 09:33:37.936042', '2022-06-06 09:33:37.936042'),
(69, 2, 0, '2022-06-08', '2022-06-08 18:49:12.517727', '2022-06-08 18:49:12.517727'),
(70, 2, 0, '2022-06-08', '2022-06-08 18:49:41.920859', '2022-06-08 18:49:41.920859'),
(71, 2, 0, '2022-06-08', '2022-06-08 18:50:41.580342', '2022-06-08 18:50:41.580342'),
(72, 2, 0, '2022-06-08', '2022-06-08 18:51:06.103380', '2022-06-08 18:51:06.103380'),
(73, 2, 0, '2022-06-08', '2022-06-08 18:57:02.247244', '2022-06-08 18:57:02.247244'),
(74, 22, 0, '2022-06-09', '2022-06-09 11:39:31.837262', '2022-06-09 11:39:31.837262'),
(75, 22, 240, '2022-06-09', '2022-06-09 11:41:01.522659', '2022-06-09 11:41:01.522659'),
(76, 22, 0, '2022-06-09', '2022-06-09 11:59:52.261054', '2022-06-09 11:59:52.261054');

-- --------------------------------------------------------

--
-- Table structure for table `participas`
--

CREATE TABLE `participas` (
  `id` bigint NOT NULL,
  `torneo_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `puntuacion` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `participas`
--

INSERT INTO `participas` (`id`, `torneo_id`, `usuario_id`, `puntuacion`, `created_at`, `updated_at`, `fecha`) VALUES
(2, 1, 1, 2344433, '2022-06-06 00:00:00.000000', '2022-06-06 00:00:00.000000', '2022-06-05'),
(3, 2, 2, 43212, '2022-06-06 00:00:00.000000', '2022-06-06 00:00:00.000000', '2022-06-05'),
(4, 3, 2, 8000, '2022-06-06 10:46:40.971277', '2022-06-06 10:46:40.971277', '2022-06-05'),
(9, 4, 2, 100, '2022-06-07 21:26:22.235558', '2022-06-07 21:26:22.235558', '2022-06-05'),
(16, 7, 2, 0, '2022-06-08 18:52:13.145089', '2022-06-08 18:52:13.145089', '2022-06-08'),
(17, 6, 2, 100, '2022-06-08 18:58:23.747771', '2022-06-08 18:58:23.747771', '2022-06-08'),
(19, 5, 2, 1200, '2022-06-08 19:00:49.496830', '2022-06-08 19:00:49.496830', '2022-06-08'),
(20, 7, 1, 0, '2022-06-08 20:00:08.045611', '2022-06-08 20:00:08.045611', '2022-06-08'),
(21, 3, 1, 0, '2022-06-08 20:00:42.478061', '2022-06-08 20:00:42.478061', '2022-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `partidas`
--

CREATE TABLE `partidas` (
  `id` bigint NOT NULL,
  `puntuacion` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20220605224525'),
('20220605224528'),
('20220605224531'),
('20220605224534'),
('20220605224537'),
('20220608081819');

-- --------------------------------------------------------

--
-- Table structure for table `torneos`
--

CREATE TABLE `torneos` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha_max_juego` date NOT NULL,
  `es_bomba` tinyint(1) NOT NULL,
  `multiplier` float NOT NULL,
  `piezas_puestas` int NOT NULL,
  `descripcion` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Descripción de torneo genérica',
  `probabilidad` float NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `torneos`
--

INSERT INTO `torneos` (`id`, `nombre`, `fecha_max_juego`, `es_bomba`, `multiplier`, `piezas_puestas`, `descripcion`, `probabilidad`, `created_at`, `updated_at`) VALUES
(1, 'Torneo prueba 1', '2022-06-08', 0, 1, 122, 'Hola, Esto es una descripcion para nuestra aplicacion basura, no sirve para absolutamente nada, mañana encima tenemos un examen del copon y no hemos estudiado absolutamente nada. Por favor que alguien nos ayude', 0.5, '2022-06-06 08:03:02.213501', '2022-06-09 11:25:58.954758'),
(2, 'Torneo prueba 2', '2022-06-01', 1, 1, 1, 'Vamos mis chavales que vosotros podeis que si no el resto nos hundimos en la mierda', 1, '2022-06-06 09:54:07.169648', '2022-06-09 11:26:12.088377'),
(3, 'Torneo de prueba 3', '2022-06-15', 0, 1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eleifend pretium nisl vitae egestas. Donec quis neque felis. Duis in sem eget sem viverra sodales non id magna. Mauris sit amet fermentum tellus, at gravida purus Pellentesque congue nulla tortor, in vehicula lacus bibendum vitae. Quisque eleifend nibh sit amet lacus tincidunt ullamco', 1, '2022-06-06 10:44:05.642546', '2022-06-09 11:26:19.844035'),
(4, 'Otro torneo más', '2022-06-14', 0, 1, 33, 'patata', 0.9, '2022-06-06 14:01:35.710204', '2022-06-09 11:26:34.786392'),
(5, 'Torneo overflow', '2022-06-09', 0, 1, 122, 'asdasdasdasd', 0.1, '2022-06-07 23:11:06.188692', '2022-06-07 23:11:06.188692'),
(6, 'Torneo casi final', '2022-06-09', 1, 3, 122, 'Hola, Esto es una descripcion para nuestra aplicacion basura, no sirve para absolutamente nada, mañana encima tenemos un examen del copon y no hemos estudiado absolutamente nada. Por favor que alguien nos ayude', 0.5, '2022-06-08 10:23:28.991317', '2022-06-08 10:45:10.417632'),
(7, 'Prueba torneo', '2022-06-30', 1, 7, 128, 'Esto es una descripción de prueba para ver que sale en la aplicación del cliente.', 0.5, '2022-06-08 14:34:26.539057', '2022-06-09 12:00:42.572035'),
(8, 'Torneo distinto', '2022-06-16', 1, 1, 1, 'dadasa', 1, '2022-06-08 19:10:36.209015', '2022-06-09 11:27:07.029020');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contrasena`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'nanoGrande', 'asd', 0, '2022-06-05 22:47:01.616249', '2022-06-05 22:47:01.616249'),
(2, 'asd', 'asd', 1, '2022-06-05 22:47:08.967568', '2022-06-05 22:47:08.967568'),
(3, 'ElBicho', 'siuuuuuuuuuu', 0, '2022-06-07 14:37:51.964370', '2022-06-07 14:37:51.964370'),
(14, 'elnanoesunacaca', 'caca', 0, '2022-06-08 00:54:41.241508', '2022-06-08 00:54:41.241508'),
(15, 'MAX', 'GOAT', 0, '2022-06-08 18:33:28.326697', '2022-06-08 18:33:28.326697'),
(16, 'pruebaParaTest', 'pruebaParaTest', 0, '2022-06-08 21:21:19.642309', '2022-06-08 21:21:19.642309'),
(19, 'Hola', 'Adios', 0, '2022-06-08 22:05:11.211392', '2022-06-08 22:05:11.211392'),
(20, 'sadada', 'sddsdsddsdsd', 0, '2022-06-08 23:25:32.189001', '2022-06-08 23:25:32.189001'),
(21, 'paco', '1234', 0, '2022-06-09 00:00:05.654137', '2022-06-09 00:00:05.654137'),
(22, 'usuario', 'asd', 0, '2022-06-09 11:33:55.362607', '2022-06-09 11:33:55.362607');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `juega_individuals`
--
ALTER TABLE `juega_individuals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_juega_individuals_on_usuario_id` (`usuario_id`);

--
-- Indexes for table `participas`
--
ALTER TABLE `participas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `torneo_id` (`torneo_id`,`usuario_id`,`fecha`),
  ADD KEY `index_participas_on_torneo_id` (`torneo_id`),
  ADD KEY `index_participas_on_usuario_id` (`usuario_id`);

--
-- Indexes for table `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `torneos`
--
ALTER TABLE `torneos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `juega_individuals`
--
ALTER TABLE `juega_individuals`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `participas`
--
ALTER TABLE `participas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `torneos`
--
ALTER TABLE `torneos`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `juega_individuals`
--
ALTER TABLE `juega_individuals`
  ADD CONSTRAINT `fk_rails_ff22165b77` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `participas`
--
ALTER TABLE `participas`
  ADD CONSTRAINT `fk_rails_62a0cc1ceb` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_rails_b5bf314a25` FOREIGN KEY (`torneo_id`) REFERENCES `torneos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
