-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_coremas
CREATE DATABASE IF NOT EXISTS `bd_coremas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_coremas`;

-- Volcando estructura para tabla bd_coremas.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_categoria` text NOT NULL,
  `descripcion_categoria` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.ciudad
CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` text NOT NULL,
  `id_departamento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `departamento_to_ciudad` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.ciudad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_departamento` text,
  `id_pais` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `departamento_to_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.departamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.donaciones
CREATE TABLE IF NOT EXISTS `donaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `valor` double NOT NULL,
  `estado` int(11) NOT NULL COMMENT '0:generada,1:procesada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.donaciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `donaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `donaciones` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.intereses
CREATE TABLE IF NOT EXISTS `intereses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.intereses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `intereses` DISABLE KEYS */;
/*!40000 ALTER TABLE `intereses` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_coremas.migrations: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_pais` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.pais: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_coremas.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.pedido_recompensa
CREATE TABLE IF NOT EXISTS `pedido_recompensa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0: generado, 1:enviado, 2:recibido',
  `id_recompensa` int(10) unsigned NOT NULL,
  `id_user_envia` int(10) unsigned NOT NULL,
  `id_user_recibe` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_recompensa` (`id_recompensa`),
  KEY `id_envia` (`id_user_envia`),
  KEY `id_recibe` (`id_user_recibe`),
  CONSTRAINT `envia_to_user` FOREIGN KEY (`id_user_envia`) REFERENCES `users` (`id`),
  CONSTRAINT `pedido_to_recompensa` FOREIGN KEY (`id_recompensa`) REFERENCES `recompensa_proyecto` (`id`),
  CONSTRAINT `recibe_to_user` FOREIGN KEY (`id_user_recibe`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.pedido_recompensa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_recompensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_recompensa` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0: Emprendedor, 1:Inversionista, 2:socio',
  `fecha_nacimiento` date NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `sitio_web` text,
  `trabaja` tinyint(4) DEFAULT NULL COMMENT '0: no trabaja, 1:trabaja',
  `id_intereses` int(11) DEFAULT NULL,
  `nombre_completo` text NOT NULL,
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `id_intereses` (`id_intereses`),
  CONSTRAINT `perfiles_to_intereses` FOREIGN KEY (`id_intereses`) REFERENCES `intereses` (`id`),
  CONSTRAINT `perfiles_to_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.perfil: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` text NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `descripcion_proyecto` text NOT NULL,
  `fase_proyecto` text NOT NULL,
  `publico_objetivo` text NOT NULL,
  `problema_proyecto` text NOT NULL,
  `solucion_proyecto` text NOT NULL,
  `ventaja_proyecto` text NOT NULL,
  `propuesta_proyecto` text NOT NULL,
  `costos_proyecto` double NOT NULL,
  `valor_proyecto` double NOT NULL,
  `plazo_financiacion` date NOT NULL,
  `video_proyecto` text,
  `descripcion_extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `proyecto_to_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `proyecto_has_categoria` (`id`),
  CONSTRAINT `proyecto_to_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.proyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.proyecto_has_categoria
CREATE TABLE IF NOT EXISTS `proyecto_has_categoria` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `proyecto_tiene_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `proyecto_tiene_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.proyecto_has_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proyecto_has_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_has_categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.proyecto_sin_terminar
CREATE TABLE IF NOT EXISTS `proyecto_sin_terminar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` text NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `descripcion_proyecto` text NOT NULL,
  `fase_proyecto` text NOT NULL,
  `publico_objetivo` text NOT NULL,
  `problema_proyecto` text NOT NULL,
  `solucion_proyecto` text NOT NULL,
  `ventaja_proyecto` text NOT NULL,
  `propuesta_proyecto` text NOT NULL,
  `costos_proyecto` double NOT NULL,
  `valor_proyecto` double NOT NULL,
  `plazo_financiacion` date NOT NULL,
  `video_proyecto` text,
  `descripcion_extra` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `proyecto_sin_terminar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_coremas.proyecto_sin_terminar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proyecto_sin_terminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto_sin_terminar` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.recompensa_proyecto
CREATE TABLE IF NOT EXISTS `recompensa_proyecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_recompensa` text,
  `descripcion_recompensa` text,
  `plazo_recompensa` date DEFAULT NULL,
  `id_proyecto` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `recompensa_proyecto_to_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_coremas.recompensa_proyecto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recompensa_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `recompensa_proyecto` ENABLE KEYS */;

-- Volcando estructura para tabla bd_coremas.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla bd_coremas.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Miguiel', 'miguel-sg01@hotmail.com', NULL, '$2y$10$RRvILTDxLn8C.F0u2GeTPO88xFjhZ4a7hdwUw5BNkHDD/RTV0TTKq', NULL, '2018-11-24 23:22:32', '2018-11-24 23:22:32', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
