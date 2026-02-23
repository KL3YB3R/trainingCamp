-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2026 a las 09:04:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservas_quiri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aforo`
--

CREATE TABLE `aforo` (
  `id` int(11) NOT NULL,
  `n_aforo` int(10) NOT NULL,
  `n_occupied` int(11) DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aforo`
--

INSERT INTO `aforo` (`id`, `n_aforo`, `n_occupied`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 150, 0, 0, '2026-01-31 10:46:52', '2026-01-31 10:57:47'),
(4, 400, 0, 0, '2026-01-31 10:57:47', '2026-01-31 11:06:41'),
(5, 300, 0, 0, '2026-01-31 11:06:41', '2026-01-31 13:38:53'),
(6, 400, 200, 0, '2026-01-31 13:38:53', '2026-02-20 10:15:00'),
(7, 600, 200, 0, '2026-02-20 10:15:00', '2026-02-20 11:13:31'),
(8, 600, 200, 0, '2026-02-20 11:13:31', '2026-02-20 11:16:40'),
(11, 600, 200, 0, '2026-02-20 11:16:40', '2026-02-20 11:21:11'),
(12, 600, 200, 1, '2026-02-20 11:21:11', '2026-02-20 11:21:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_trails`
--

CREATE TABLE `audit_trails` (
  `id` int(11) NOT NULL,
  `user_id` int(8) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audit_trails`
--

INSERT INTO `audit_trails` (`id`, `user_id`, `action`, `created_at`, `updated_at`) VALUES
(1, 12, 'Registro de usuario', '2026-02-05 10:56:36', '2026-02-05 10:56:36'),
(2, 1, 'Eliminar Imagen', '2026-02-17 04:10:26', '2026-02-17 04:10:26'),
(3, 1, 'Eliminar Imagen', '2026-02-17 04:12:49', '2026-02-17 04:12:49'),
(4, 1, 'Eliminar Imagen', '2026-02-17 04:14:15', '2026-02-17 04:14:15'),
(5, 1, 'Eliminar Imagen', '2026-02-17 04:15:00', '2026-02-17 04:15:00'),
(6, 1, 'Eliminar Imagen', '2026-02-17 04:16:05', '2026-02-17 04:16:05'),
(7, 1, 'Eliminar Imagen', '2026-02-19 22:29:56', '2026-02-19 22:29:56'),
(8, 1, 'Eliminar Imagen', '2026-02-19 22:49:30', '2026-02-19 22:49:30'),
(9, 1, 'Eliminar Noticia', '2026-02-19 22:49:52', '2026-02-19 22:49:52'),
(10, 1, 'Eliminar Imagen', '2026-02-19 23:15:17', '2026-02-19 23:15:17'),
(11, 1, 'Actualizar Aforo', '2026-02-20 10:15:00', '2026-02-20 10:15:00'),
(12, 4, 'Registro de Reservación', '2026-02-20 10:48:55', '2026-02-20 10:48:55'),
(13, 4, 'Eliminar Reservación', '2026-02-20 10:49:23', '2026-02-20 10:49:23'),
(14, 1, 'Actualizar Aforo', '2026-02-20 11:13:31', '2026-02-20 11:13:31'),
(15, 1, 'Actualizar Aforo', '2026-02-20 11:16:40', '2026-02-20 11:16:40'),
(16, 1, 'Actualizar Aforo', '2026-02-20 11:21:11', '2026-02-20 11:21:11'),
(17, 4, 'Registro de Reservación', '2026-02-20 11:38:52', '2026-02-20 11:38:52'),
(18, 4, 'Pagar Reservación', '2026-02-21 07:11:15', '2026-02-21 07:11:15'),
(19, 1, 'Actualizar Estado de Pago', '2026-02-21 10:50:01', '2026-02-21 10:50:01'),
(20, 4, 'Registro de Reservación', '2026-02-21 11:56:14', '2026-02-21 11:56:14'),
(21, 4, 'Registro de Reservación', '2026-02-21 11:58:01', '2026-02-21 11:58:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(20) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `estado`) VALUES
(1, 'Amazonas'),
(2, 'Anzoátegui'),
(3, 'Apure'),
(4, 'Aragua'),
(5, 'Barinas'),
(6, 'Bolívar'),
(7, 'Carabobo'),
(8, 'Cojedes'),
(9, 'Delta Amacuro'),
(10, 'Falcón'),
(11, 'Guárico'),
(12, 'Lara'),
(13, 'Mérida'),
(14, 'Miranda'),
(15, 'Monagas'),
(16, 'Nueva Esparta'),
(17, 'Portuguesa'),
(18, 'Sucre'),
(19, 'Táchira'),
(20, 'Trujillo'),
(21, 'La Guaira'),
(22, 'Yaracuy'),
(23, 'Zulia'),
(24, 'Distrito Capital');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gallery`
--

INSERT INTO `gallery` (`id`, `image`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'galleries/rWsW5JuNfQkHIbdc5z8Kr0FksiNsKVrJiCZi8x3C.jpg', 'adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d adwdaw adwdaw da wa da wdaw d', 1, '2026-02-17 04:15:00', '2026-02-17 04:15:00'),
(6, 'galleries/chK9ygunmFSXS7pMpCX48LCcrJ0VfQhZIGTvMAem.jpg', 'ada wda wd aw daw dawd a wadkwudh akwud hakwudhakwujhd kawujdh kajwhkajw hdkau hkawu hdakwud hakwuh dakwujd hkau wdhakjdhkawjhdkauwk  k duwhdkuawh ka udhka uw dh kawu hkawu kau hdakwud hkauwhd kaud hkawuhdkauwdkau whdka uwk duahwkua hk udhak uwdak uwhdkua', 1, '2026-02-19 22:29:56', '2026-02-19 22:29:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_02_075243_add_two_factor_columns_to_users_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(8) NOT NULL,
  `estado_id` int(8) NOT NULL,
  `municipio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `estado_id`, `municipio`) VALUES
(1, 1, 'Alto Orinoco'),
(2, 1, 'Atabapo'),
(3, 1, 'Atures'),
(4, 1, 'Autana'),
(5, 1, 'Manapiare'),
(6, 1, 'Maroa'),
(7, 1, 'Río Negro'),
(8, 2, 'Anaco'),
(9, 2, 'Aragua'),
(10, 2, 'Manuel Ezequiel Bruzual'),
(11, 2, 'Diego Bautista Urbaneja'),
(12, 2, 'Fernando Peñalver'),
(13, 2, 'Francisco Del Carmen Carvajal'),
(14, 2, 'General Sir Arthur McGregor'),
(15, 2, 'Guanta'),
(16, 2, 'Independencia'),
(17, 2, 'José Gregorio Monagas'),
(18, 2, 'Juan Antonio Sotillo'),
(19, 2, 'Juan Manuel Cajigal'),
(20, 2, 'Libertad'),
(21, 2, 'Francisco de Miranda'),
(22, 2, 'Pedro María Freites'),
(23, 2, 'Píritu'),
(24, 2, 'San José de Guanipa'),
(25, 2, 'San Juan de Capistrano'),
(26, 2, 'Santa Ana'),
(27, 2, 'Simón Bolívar'),
(28, 2, 'Simón Rodríguez'),
(29, 3, 'Achaguas'),
(30, 3, 'Biruaca'),
(31, 3, 'Muñóz'),
(32, 3, 'Páez'),
(33, 3, 'Pedro Camejo'),
(34, 3, 'Rómulo Gallegos'),
(35, 3, 'San Fernando'),
(36, 4, 'Atanasio Girardot'),
(37, 4, 'Bolívar'),
(38, 4, 'Camatagua'),
(39, 4, 'Francisco Linares Alcántara'),
(40, 4, 'José Ángel Lamas'),
(41, 4, 'José Félix Ribas'),
(42, 4, 'José Rafael Revenga'),
(43, 4, 'Libertador'),
(44, 4, 'Mario Briceño Iragorry'),
(45, 4, 'Ocumare de la Costa de Oro'),
(46, 4, 'San Casimiro'),
(47, 4, 'San Sebastián'),
(48, 4, 'Santiago Mariño'),
(49, 4, 'Santos Michelena'),
(50, 4, 'Sucre'),
(51, 4, 'Tovar'),
(52, 4, 'Urdaneta'),
(53, 4, 'Zamora'),
(54, 5, 'Alberto Arvelo Torrealba'),
(55, 5, 'Andrés Eloy Blanco'),
(56, 5, 'Antonio José de Sucre'),
(57, 5, 'Arismendi'),
(58, 5, 'Barinas'),
(59, 5, 'Bolívar'),
(60, 5, 'Cruz Paredes'),
(61, 5, 'Ezequiel Zamora'),
(62, 5, 'Obispos'),
(63, 5, 'Pedraza'),
(64, 5, 'Rojas'),
(65, 5, 'Sosa'),
(66, 6, 'Caroní'),
(67, 6, 'Cedeño'),
(68, 6, 'El Callao'),
(69, 6, 'Gran Sabana'),
(70, 6, 'Angostura del Orinoco'),
(71, 6, 'Piar'),
(72, 6, 'Angostura Raúl Leoni'),
(73, 6, 'Roscio'),
(74, 6, 'Sifontes'),
(75, 6, 'Sucre'),
(76, 6, 'Padre Pedro Chien'),
(77, 7, 'Bejuma'),
(78, 7, 'Carlos Arvelo'),
(79, 7, 'Diego Ibarra'),
(80, 7, 'Guacara'),
(81, 7, 'Juan José Mora'),
(82, 7, 'Libertador'),
(83, 7, 'Los Guayos'),
(84, 7, 'Miranda'),
(85, 7, 'Montalbán'),
(86, 7, 'Naguanagua'),
(87, 7, 'Puerto Cabello'),
(88, 7, 'San Diego'),
(89, 7, 'San Joaquín'),
(90, 7, 'Valencia'),
(91, 8, 'Anzoátegui'),
(92, 8, 'Tinaquillo'),
(93, 8, 'Girardot'),
(94, 8, 'Lima Blanco'),
(95, 8, 'Pao de San Juan Bautista'),
(96, 8, 'Ricaurte'),
(97, 8, 'Rómulo Gallegos'),
(98, 8, 'San Carlos'),
(99, 8, 'Tinaco'),
(100, 9, 'Antonio Díaz'),
(101, 9, 'Casacoima'),
(102, 9, 'Pedernales'),
(103, 9, 'Tucupita'),
(104, 10, 'Acosta'),
(105, 10, 'Bolívar'),
(106, 10, 'Buchivacoa'),
(107, 10, 'Cacique Manaure'),
(108, 10, 'Carirubana'),
(109, 10, 'Colina'),
(110, 10, 'Dabajuro'),
(111, 10, 'Democracia'),
(112, 10, 'Falcón'),
(113, 10, 'Federación'),
(114, 10, 'Jacura'),
(115, 10, 'José Laurencio Silva'),
(116, 10, 'Los Taques'),
(117, 10, 'Mauroa'),
(118, 10, 'Miranda'),
(119, 10, 'Monseñor Iturriza'),
(120, 10, 'Palmasola'),
(121, 10, 'Petit'),
(122, 10, 'Píritu'),
(123, 10, 'San Francisco'),
(124, 10, 'Sucre'),
(125, 10, 'Tocópero'),
(126, 10, 'Unión'),
(127, 10, 'Urumaco'),
(128, 10, 'Zamora'),
(129, 11, 'Camaguán'),
(130, 11, 'Chaguaramas'),
(131, 11, 'El Socorro'),
(132, 11, 'José Félix Ribas'),
(133, 11, 'José Tadeo Monagas'),
(134, 11, 'Juan Germán Roscio'),
(135, 11, 'Julián Mellado'),
(136, 11, 'Las Mercedes'),
(137, 11, 'Leonardo Infante'),
(138, 11, 'Pedro Zaraza'),
(139, 11, 'Ortíz'),
(140, 11, 'San Gerónimo de Guayabal'),
(141, 11, 'San José de Guaribe'),
(142, 11, 'Santa María de Ipire'),
(143, 11, 'Sebastián Francisco de Miranda'),
(144, 12, 'Andrés Eloy Blanco'),
(145, 12, 'Crespo'),
(146, 12, 'Iribarren'),
(147, 12, 'Jiménez'),
(148, 12, 'Morán'),
(149, 12, 'Palavecino'),
(150, 12, 'Simón Planas'),
(151, 12, 'Torres'),
(152, 12, 'Urdaneta'),
(179, 13, 'Alberto Adriani'),
(180, 13, 'Andrés Bello'),
(181, 13, 'Antonio Pinto Salinas'),
(182, 13, 'Aricagua'),
(183, 13, 'Arzobispo Chacón'),
(184, 13, 'Campo Elías'),
(185, 13, 'Caracciolo Parra Olmedo'),
(186, 13, 'Cardenal Quintero'),
(187, 13, 'Guaraque'),
(188, 13, 'Julio César Salas'),
(189, 13, 'Justo Briceño'),
(190, 13, 'Libertador'),
(191, 13, 'Miranda'),
(192, 13, 'Obispo Ramos de Lora'),
(193, 13, 'Padre Noguera'),
(194, 13, 'Pueblo Llano'),
(195, 13, 'Rangel'),
(196, 13, 'Rivas Dávila'),
(197, 13, 'Santos Marquina'),
(198, 13, 'Sucre'),
(199, 13, 'Tovar'),
(200, 13, 'Tulio Febres Cordero'),
(201, 13, 'Zea'),
(223, 14, 'Acevedo'),
(224, 14, 'Andrés Bello'),
(225, 14, 'Baruta'),
(226, 14, 'Brión'),
(227, 14, 'Buroz'),
(228, 14, 'Carrizal'),
(229, 14, 'Chacao'),
(230, 14, 'Cristóbal Rojas'),
(231, 14, 'El Hatillo'),
(232, 14, 'Guaicaipuro'),
(233, 14, 'Independencia'),
(234, 14, 'Lander'),
(235, 14, 'Los Salias'),
(236, 14, 'Páez'),
(237, 14, 'Paz Castillo'),
(238, 14, 'Pedro Gual'),
(239, 14, 'Plaza'),
(240, 14, 'Simón Bolívar'),
(241, 14, 'Sucre'),
(242, 14, 'Urdaneta'),
(243, 14, 'Zamora'),
(258, 15, 'Acosta'),
(259, 15, 'Aguasay'),
(260, 15, 'Bolívar'),
(261, 15, 'Caripe'),
(262, 15, 'Cedeño'),
(263, 15, 'Ezequiel Zamora'),
(264, 15, 'Libertador'),
(265, 15, 'Maturín'),
(266, 15, 'Piar'),
(267, 15, 'Punceres'),
(268, 15, 'Santa Bárbara'),
(269, 15, 'Sotillo'),
(270, 15, 'Uracoa'),
(271, 16, 'Antolín del Campo'),
(272, 16, 'Arismendi'),
(273, 16, 'García'),
(274, 16, 'Gómez'),
(275, 16, 'Maneiro'),
(276, 16, 'Marcano'),
(277, 16, 'Mariño'),
(278, 16, 'Península de Macanao'),
(279, 16, 'Tubores'),
(280, 16, 'Villalba'),
(281, 16, 'Díaz'),
(282, 17, 'Agua Blanca'),
(283, 17, 'Araure'),
(284, 17, 'Esteller'),
(285, 17, 'Guanare'),
(286, 17, 'Guanarito'),
(287, 17, 'Monseñor José Vicente de Unda'),
(288, 17, 'Ospino'),
(289, 17, 'Páez'),
(290, 17, 'Papelón'),
(291, 17, 'San Genaro de Boconoíto'),
(292, 17, 'San Rafael de Onoto'),
(293, 17, 'Santa Rosalía'),
(294, 17, 'Sucre'),
(295, 17, 'Turén'),
(296, 18, 'Andrés Eloy Blanco'),
(297, 18, 'Andrés Mata'),
(298, 18, 'Arismendi'),
(299, 18, 'Benítez'),
(300, 18, 'Bermúdez'),
(301, 18, 'Bolívar'),
(302, 18, 'Cajigal'),
(303, 18, 'Cruz Salmerón Acosta'),
(304, 18, 'Libertador'),
(305, 18, 'Mariño'),
(306, 18, 'Mejía'),
(307, 18, 'Montes'),
(308, 18, 'Ribero'),
(309, 18, 'Sucre'),
(310, 18, 'Valdéz'),
(341, 19, 'Andrés Bello'),
(342, 19, 'Antonio Rómulo Costa'),
(343, 19, 'Ayacucho'),
(344, 19, 'Bolívar'),
(345, 19, 'Cárdenas'),
(346, 19, 'Córdoba'),
(347, 19, 'Fernández Feo'),
(348, 19, 'Francisco de Miranda'),
(349, 19, 'García de Hevia'),
(350, 19, 'Guásimos'),
(351, 19, 'Independencia'),
(352, 19, 'Jáuregui'),
(353, 19, 'José María Vargas'),
(354, 19, 'Junín'),
(355, 19, 'Libertad'),
(356, 19, 'Libertador'),
(357, 19, 'Lobatera'),
(358, 19, 'Michelena'),
(359, 19, 'Panamericano'),
(360, 19, 'Pedro María Ureña'),
(361, 19, 'Rafael Urdaneta'),
(362, 19, 'Samuel Darío Maldonado'),
(363, 19, 'San Cristóbal'),
(364, 19, 'Seboruco'),
(365, 19, 'Simón Rodríguez'),
(366, 19, 'Sucre'),
(367, 19, 'Torbes'),
(368, 19, 'Uribante'),
(369, 19, 'San Judas Tadeo'),
(370, 20, 'Andrés Bello'),
(371, 20, 'Boconó'),
(372, 20, 'Bolívar'),
(373, 20, 'Candelaria'),
(374, 20, 'Carache'),
(375, 20, 'Escuque'),
(376, 20, 'José Felipe Márquez Cañizalez'),
(377, 20, 'Juan Vicente Campos Elías'),
(378, 20, 'La Ceiba'),
(379, 20, 'Miranda'),
(380, 20, 'Monte Carmelo'),
(381, 20, 'Motatán'),
(382, 20, 'Pampán'),
(383, 20, 'Pampanito'),
(384, 20, 'Rafael Rangel'),
(385, 20, 'San Rafael de Carvajal'),
(386, 20, 'Sucre'),
(387, 20, 'Trujillo'),
(388, 20, 'Urdaneta'),
(389, 20, 'Valera'),
(390, 21, 'Vargas'),
(391, 22, 'Arístides Bastidas'),
(392, 22, 'Bolívar'),
(407, 22, 'Bruzual'),
(408, 22, 'Cocorote'),
(409, 22, 'Independencia'),
(410, 22, 'José Antonio Páez'),
(411, 22, 'La Trinidad'),
(412, 22, 'Manuel Monge'),
(413, 22, 'Nirgua'),
(414, 22, 'Peña'),
(415, 22, 'San Felipe'),
(416, 22, 'Sucre'),
(417, 22, 'Urachiche'),
(418, 22, 'José Joaquín Veroes'),
(441, 23, 'Almirante Padilla'),
(442, 23, 'Baralt'),
(443, 23, 'Cabimas'),
(444, 23, 'Catatumbo'),
(445, 23, 'Colón'),
(446, 23, 'Francisco Javier Pulgar'),
(447, 23, 'Páez'),
(448, 23, 'Jesús Enrique Losada'),
(449, 23, 'Jesús María Semprún'),
(450, 23, 'La Cañada de Urdaneta'),
(451, 23, 'Lagunillas'),
(452, 23, 'Machiques de Perijá'),
(453, 23, 'Mara'),
(454, 23, 'Maracaibo'),
(455, 23, 'Miranda'),
(456, 23, 'Rosario de Perijá'),
(457, 23, 'San Francisco'),
(458, 23, 'Santa Rita'),
(459, 23, 'Simón Bolívar'),
(460, 23, 'Sucre'),
(461, 23, 'Valmore Rodríguez'),
(462, 24, 'Libertador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Segunda noticia', 'Si sirven las noticias \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae harum eos sunt expedita, delectus, id cumque voluptatum dolores quas, nulla optio! Sint minima explicabo, vel excepturi aperiam dignissimos vitae, voluptates unde laborum asperiores dolor sunt? Obcaecati ut nobis neque quibusdam. Nam enim esse provident laborum recusandae aperiam corrupti magni optio, quam eos aspernatur. Est porro, possimus aspernatur dolor fugit asperiores. Vel quod laborum tempora ipsam voluptates. Architecto sint ipsum quisquam totam ipsa ad enim omnis inventore asperiores, in debitis, magni repellendus accusantium eaque veniam tenetur aspernatur expedita! Dignissimos fugit odit nisi. Nisi hic debitis exercitationem voluptatum eos incidunt minus velit.', 1, '2026-02-11 20:29:38', '2026-02-11 20:29:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parameters`
--

CREATE TABLE `parameters` (
  `id` int(11) NOT NULL,
  `tasa_dolar` float DEFAULT 0,
  `amount_person` float DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parameters`
--

INSERT INTO `parameters` (`id`, `tasa_dolar`, `amount_person`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 395, 1, 0, '2026-02-20 10:15:00', '2026-02-20 11:13:31'),
(2, 395, 1200, 0, '2026-02-20 11:13:31', '2026-02-20 11:16:40'),
(3, 395.2, 1200, 0, '2026-02-20 11:16:40', '2026-02-20 11:21:11'),
(4, 395.23, 1200, 1, '2026-02-20 11:21:11', '2026-02-20 11:21:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `id` int(11) NOT NULL,
  `municipio_id` int(8) NOT NULL,
  `parroquia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `parroquia`
--

INSERT INTO `parroquia` (`id`, `municipio_id`, `parroquia`) VALUES
(820, 1, 'Alto Orinoco'),
(821, 1, 'Huachamacare Acanaña'),
(822, 1, 'Marawaka Toky Shamanaña'),
(823, 1, 'Mavaka Mavaka'),
(824, 1, 'Sierra Parima Parimabé'),
(825, 2, 'Ucata Laja Lisa'),
(826, 2, 'Yapacana Macuruco'),
(827, 2, 'Caname Guarinuma'),
(828, 3, 'Fernando Girón Tovar'),
(829, 3, 'Luis Alberto Gómez'),
(830, 3, 'Pahueña Limón de Parhueña'),
(831, 3, 'Platanillal Platanillal'),
(832, 4, 'Samariapo'),
(833, 4, 'Sipapo'),
(834, 4, 'Munduapo'),
(835, 4, 'Guayapo'),
(836, 5, 'Alto Ventuari'),
(837, 5, 'Medio Ventuari'),
(838, 5, 'Bajo Ventuari'),
(839, 6, 'Victorino'),
(840, 6, 'Comunidad'),
(841, 7, 'Casiquiare'),
(842, 7, 'Cocuy'),
(843, 7, 'San Carlos de Río Negro'),
(844, 7, 'Solano'),
(845, 8, 'Anaco'),
(846, 8, 'San Joaquín'),
(847, 9, 'Cachipo'),
(848, 9, 'Aragua de Barcelona'),
(849, 11, 'Lechería'),
(850, 11, 'El Morro'),
(851, 12, 'Puerto Píritu'),
(852, 12, 'San Miguel'),
(853, 12, 'Sucre'),
(854, 13, 'Valle de Guanape'),
(855, 13, 'Santa Bárbara'),
(856, 14, 'El Chaparro'),
(857, 14, 'Tomás Alfaro'),
(858, 14, 'Calatrava'),
(859, 15, 'Guanta'),
(860, 15, 'Chorrerón'),
(861, 16, 'Mamo'),
(862, 16, 'Soledad'),
(863, 17, 'Mapire'),
(864, 17, 'Piar'),
(865, 17, 'Santa Clara'),
(866, 17, 'San Diego de Cabrutica'),
(867, 17, 'Uverito'),
(868, 17, 'Zuata'),
(869, 18, 'Puerto La Cruz'),
(870, 18, 'Pozuelos'),
(871, 19, 'Onoto'),
(872, 19, 'San Pablo'),
(873, 20, 'San Mateo'),
(874, 20, 'El Carito'),
(875, 20, 'Santa Inés'),
(876, 20, 'La Romereña'),
(877, 21, 'Atapirire'),
(878, 21, 'Boca del Pao'),
(879, 21, 'El Pao'),
(880, 21, 'Pariaguán'),
(881, 22, 'Cantaura'),
(882, 22, 'Libertador'),
(883, 22, 'Santa Rosa'),
(884, 22, 'Urica'),
(885, 23, 'Píritu'),
(886, 23, 'San Francisco'),
(887, 24, 'San José de Guanipa'),
(888, 25, 'Boca de Uchire'),
(889, 25, 'Boca de Chávez'),
(890, 26, 'Pueblo Nuevo'),
(891, 26, 'Santa Ana'),
(892, 27, 'Bergatín'),
(893, 27, 'Caigua'),
(894, 27, 'El Carmen'),
(895, 27, 'El Pilar'),
(896, 27, 'Naricual'),
(897, 27, 'San Crsitóbal'),
(898, 28, 'Edmundo Barrios'),
(899, 28, 'Miguel Otero Silva'),
(900, 29, 'Achaguas'),
(901, 29, 'Apurito'),
(902, 29, 'El Yagual'),
(903, 29, 'Guachara'),
(904, 29, 'Mucuritas'),
(905, 29, 'Queseras del medio'),
(906, 30, 'Biruaca'),
(907, 31, 'Bruzual'),
(908, 31, 'Mantecal'),
(909, 31, 'Quintero'),
(910, 31, 'Rincón Hondo'),
(911, 31, 'San Vicente'),
(912, 32, 'Guasdualito'),
(913, 32, 'Aramendi'),
(914, 32, 'El Amparo'),
(915, 32, 'San Camilo'),
(916, 32, 'Urdaneta'),
(917, 33, 'San Juan de Payara'),
(918, 33, 'Codazzi'),
(919, 33, 'Cunaviche'),
(920, 34, 'Elorza'),
(921, 34, 'La Trinidad'),
(922, 35, 'San Fernando'),
(923, 35, 'El Recreo'),
(924, 35, 'Peñalver'),
(925, 35, 'San Rafael de Atamaica'),
(926, 36, 'Pedro José Ovalles'),
(927, 36, 'Joaquín Crespo'),
(928, 36, 'José Casanova Godoy'),
(929, 36, 'Madre María de San José'),
(930, 36, 'Andrés Eloy Blanco'),
(931, 36, 'Los Tacarigua'),
(932, 36, 'Las Delicias'),
(933, 36, 'Choroní'),
(934, 37, 'Bolívar'),
(935, 38, 'Camatagua'),
(936, 38, 'Carmen de Cura'),
(937, 39, 'Santa Rita'),
(938, 39, 'Francisco de Miranda'),
(939, 39, 'Moseñor Feliciano González'),
(940, 40, 'Santa Cruz'),
(941, 41, 'José Félix Ribas'),
(942, 41, 'Castor Nieves Ríos'),
(943, 41, 'Las Guacamayas'),
(944, 41, 'Pao de Zárate'),
(945, 41, 'Zuata'),
(946, 42, 'José Rafael Revenga'),
(947, 43, 'Palo Negro'),
(948, 43, 'San Martín de Porres'),
(949, 44, 'El Limón'),
(950, 44, 'Caña de Azúcar'),
(951, 45, 'Ocumare de la Costa'),
(952, 46, 'San Casimiro'),
(953, 46, 'Güiripa'),
(954, 46, 'Ollas de Caramacate'),
(955, 46, 'Valle Morín'),
(956, 47, 'San Sebastían'),
(957, 48, 'Turmero'),
(958, 48, 'Arevalo Aponte'),
(959, 48, 'Chuao'),
(960, 48, 'Samán de Güere'),
(961, 48, 'Alfredo Pacheco Miranda'),
(962, 49, 'Santos Michelena'),
(963, 49, 'Tiara'),
(964, 50, 'Cagua'),
(965, 50, 'Bella Vista'),
(966, 51, 'Tovar'),
(967, 52, 'Urdaneta'),
(968, 52, 'Las Peñitas'),
(969, 52, 'San Francisco de Cara'),
(970, 52, 'Taguay'),
(971, 53, 'Zamora'),
(972, 53, 'Magdaleno'),
(973, 53, 'San Francisco de Asís'),
(974, 53, 'Valles de Tucutunemo'),
(975, 53, 'Augusto Mijares'),
(976, 54, 'Sabaneta'),
(977, 54, 'Juan Antonio Rodríguez Domínguez'),
(978, 55, 'El Cantón'),
(979, 55, 'Santa Cruz de Guacas'),
(980, 55, 'Puerto Vivas'),
(981, 56, 'Ticoporo'),
(982, 56, 'Nicolás Pulido'),
(983, 56, 'Andrés Bello'),
(984, 57, 'Arismendi'),
(985, 57, 'Guadarrama'),
(986, 57, 'La Unión'),
(987, 57, 'San Antonio'),
(988, 58, 'Barinas'),
(989, 58, 'Alberto Arvelo Larriva'),
(990, 58, 'San Silvestre'),
(991, 58, 'Santa Inés'),
(992, 58, 'Santa Lucía'),
(993, 58, 'Torumos'),
(994, 58, 'El Carmen'),
(995, 58, 'Rómulo Betancourt'),
(996, 58, 'Corazón de Jesús'),
(997, 58, 'Ramón Ignacio Méndez'),
(998, 58, 'Alto Barinas'),
(999, 58, 'Manuel Palacio Fajardo'),
(1000, 58, 'Juan Antonio Rodríguez Domínguez'),
(1001, 58, 'Dominga Ortiz de Páez'),
(1002, 59, 'Barinitas'),
(1003, 59, 'Altamira de Cáceres'),
(1004, 59, 'Calderas'),
(1005, 60, 'Barrancas'),
(1006, 60, 'El Socorro'),
(1007, 60, 'Mazparrito'),
(1008, 61, 'Santa Bárbara'),
(1009, 61, 'Pedro Briceño Méndez'),
(1010, 61, 'Ramón Ignacio Méndez'),
(1011, 61, 'José Ignacio del Pumar'),
(1012, 62, 'Obispos'),
(1013, 62, 'Guasimitos'),
(1014, 62, 'El Real'),
(1015, 62, 'La Luz'),
(1016, 63, 'Ciudad Bolívia'),
(1017, 63, 'José Ignacio Briceño'),
(1018, 63, 'José Félix Ribas'),
(1019, 63, 'Páez'),
(1020, 64, 'Libertad'),
(1021, 64, 'Dolores'),
(1022, 64, 'Santa Rosa'),
(1023, 64, 'Palacio Fajardo'),
(1024, 65, 'Ciudad de Nutrias'),
(1025, 65, 'El Regalo'),
(1026, 65, 'Puerto Nutrias'),
(1027, 65, 'Santa Catalina'),
(1028, 66, 'Cachamay'),
(1029, 66, 'Chirica'),
(1030, 66, 'Dalla Costa'),
(1031, 66, 'Once de Abril'),
(1032, 66, 'Simón Bolívar'),
(1033, 66, 'Unare'),
(1034, 66, 'Universidad'),
(1035, 66, 'Vista al Sol'),
(1036, 66, 'Pozo Verde'),
(1037, 66, 'Yocoima'),
(1038, 66, '5 de Julio'),
(1039, 67, 'Cedeño'),
(1040, 67, 'Altagracia'),
(1041, 67, 'Ascensión Farreras'),
(1042, 67, 'Guaniamo'),
(1043, 67, 'La Urbana'),
(1044, 67, 'Pijiguaos'),
(1045, 68, 'El Callao'),
(1046, 69, 'Gran Sabana'),
(1047, 69, 'Ikabarú'),
(1048, 70, 'Catedral'),
(1049, 70, 'Zea'),
(1050, 70, 'Orinoco'),
(1051, 70, 'José Antonio Páez'),
(1052, 70, 'Marhuanta'),
(1053, 70, 'Agua Salada'),
(1054, 70, 'Vista Hermosa'),
(1055, 70, 'La Sabanita'),
(1056, 70, 'Panapana'),
(1057, 71, 'Andrés Eloy Blanco'),
(1058, 71, 'Pedro Cova'),
(1059, 72, 'Raúl Leoni'),
(1060, 72, 'Barceloneta'),
(1061, 72, 'Santa Bárbara'),
(1062, 72, 'San Francisco'),
(1063, 73, 'Roscio'),
(1064, 73, 'Salóm'),
(1065, 74, 'Sifontes'),
(1066, 74, 'Dalla Costa'),
(1067, 74, 'San Isidro'),
(1068, 75, 'Sucre'),
(1069, 75, 'Aripao'),
(1070, 75, 'Guarataro'),
(1071, 75, 'Las Majadas'),
(1072, 75, 'Moitaco'),
(1073, 76, 'Padre Pedro Chien'),
(1074, 76, 'Río Grande'),
(1075, 77, 'Bejuma'),
(1076, 77, 'Canoabo'),
(1077, 77, 'Simón Bolívar'),
(1078, 78, 'Güigüe'),
(1079, 78, 'Carabobo'),
(1080, 78, 'Tacarigua'),
(1081, 79, 'Mariara'),
(1082, 79, 'Aguas Calientes'),
(1083, 80, 'Ciudad Alianza'),
(1084, 80, 'Guacara'),
(1085, 80, 'Yagua'),
(1086, 81, 'Morón'),
(1087, 81, 'Yagua'),
(1088, 82, 'Tocuyito'),
(1089, 82, 'Independencia'),
(1090, 83, 'Los Guayos'),
(1091, 84, 'Miranda'),
(1092, 85, 'Montalbán'),
(1093, 86, 'Naguanagua'),
(1094, 87, 'Bartolomé Salóm'),
(1095, 87, 'Democracia'),
(1096, 87, 'Fraternidad'),
(1097, 87, 'Goaigoaza'),
(1098, 87, 'Juan José Flores'),
(1099, 87, 'Unión'),
(1100, 87, 'Borburata'),
(1101, 87, 'Patanemo'),
(1102, 88, 'San Diego'),
(1103, 89, 'San Joaquín'),
(1104, 90, 'Candelaria'),
(1105, 90, 'Catedral'),
(1106, 90, 'El Socorro'),
(1107, 90, 'Miguel Peña'),
(1108, 90, 'Rafael Urdaneta'),
(1109, 90, 'San Blas'),
(1110, 90, 'San José'),
(1111, 90, 'Santa Rosa'),
(1112, 90, 'Negro Primero'),
(1113, 91, 'Cojedes'),
(1114, 91, 'Juan de Mata Suárez'),
(1115, 92, 'Tinaquillo'),
(1116, 93, 'El Baúl'),
(1117, 93, 'Sucre'),
(1118, 94, 'La Aguadita'),
(1119, 94, 'Macapo'),
(1120, 95, 'El Pao'),
(1121, 96, 'El Amparo'),
(1122, 96, 'Libertad de Cojedes'),
(1123, 97, 'Rómulo Gallegos'),
(1124, 98, 'San Carlos de Austria'),
(1125, 98, 'Juan Ángel Bravo'),
(1126, 98, 'Manuel Manrique'),
(1127, 99, 'General en Jefe José Laurencio Silva'),
(1128, 100, 'Curiapo'),
(1129, 100, 'Almirante Luis Brión'),
(1130, 100, 'Francisco Aniceto Lugo'),
(1131, 100, 'Manuel Renaud'),
(1132, 100, 'Padre Barral'),
(1133, 100, 'Santos de Abelgas'),
(1134, 101, 'Imataca'),
(1135, 101, 'Cinco de Julio'),
(1136, 101, 'Juan Bautista Arismendi'),
(1137, 101, 'Manuel Piar'),
(1138, 101, 'Rómulo Gallegos'),
(1139, 102, 'Pedernales'),
(1140, 102, 'Luis Beltrán Prieto Figueroa'),
(1141, 103, 'San José (Delta Amacuro)'),
(1142, 103, 'José Vidal Marcano'),
(1143, 103, 'Juan Millán'),
(1144, 103, 'Leonardo Ruíz Pineda'),
(1145, 103, 'Mariscal Antonio José de Sucre'),
(1146, 103, 'Monseñor Argimiro García'),
(1147, 103, 'San Rafael (Delta Amacuro)'),
(1148, 103, 'Virgen del Valle'),
(1149, 10, 'Clarines'),
(1150, 10, 'Guanape'),
(1151, 10, 'Sabana de Uchire'),
(1152, 104, 'Capadare'),
(1153, 104, 'La Pastora'),
(1154, 104, 'Libertador'),
(1155, 104, 'San Juan de los Cayos'),
(1156, 105, 'Aracua'),
(1157, 105, 'La Peña'),
(1158, 105, 'San Luis'),
(1159, 106, 'Bariro'),
(1160, 106, 'Borojó'),
(1161, 106, 'Capatárida'),
(1162, 106, 'Guajiro'),
(1163, 106, 'Seque'),
(1164, 106, 'Zazárida'),
(1165, 106, 'Valle de Eroa'),
(1166, 107, 'Cacique Manaure'),
(1167, 108, 'Norte'),
(1168, 108, 'Carirubana'),
(1169, 108, 'Santa Ana'),
(1170, 108, 'Urbana Punta Cardón'),
(1171, 109, 'La Vela de Coro'),
(1172, 109, 'Acurigua'),
(1173, 109, 'Guaibacoa'),
(1174, 109, 'Las Calderas'),
(1175, 109, 'Macoruca'),
(1176, 110, 'Dabajuro'),
(1177, 111, 'Agua Clara'),
(1178, 111, 'Avaria'),
(1179, 111, 'Pedregal'),
(1180, 111, 'Piedra Grande'),
(1181, 111, 'Purureche'),
(1182, 112, 'Adaure'),
(1183, 112, 'Adícora'),
(1184, 112, 'Baraived'),
(1185, 112, 'Buena Vista'),
(1186, 112, 'Jadacaquiva'),
(1187, 112, 'El Vínculo'),
(1188, 112, 'El Hato'),
(1189, 112, 'Moruy'),
(1190, 112, 'Pueblo Nuevo'),
(1191, 113, 'Agua Larga'),
(1192, 113, 'El Paují'),
(1193, 113, 'Independencia'),
(1194, 113, 'Mapararí'),
(1195, 114, 'Agua Linda'),
(1196, 114, 'Araurima'),
(1197, 114, 'Jacura'),
(1198, 115, 'Tucacas'),
(1199, 115, 'Boca de Aroa'),
(1200, 116, 'Los Taques'),
(1201, 116, 'Judibana'),
(1202, 117, 'Mene de Mauroa'),
(1203, 117, 'San Félix'),
(1204, 117, 'Casigua'),
(1205, 118, 'Guzmán Guillermo'),
(1206, 118, 'Mitare'),
(1207, 118, 'Río Seco'),
(1208, 118, 'Sabaneta'),
(1209, 118, 'San Antonio'),
(1210, 118, 'San Gabriel'),
(1211, 118, 'Santa Ana'),
(1212, 119, 'Boca del Tocuyo'),
(1213, 119, 'Chichiriviche'),
(1214, 119, 'Tocuyo de la Costa'),
(1215, 120, 'Palmasola'),
(1216, 121, 'Cabure'),
(1217, 121, 'Colina'),
(1218, 121, 'Curimagua'),
(1219, 122, 'San José de la Costa'),
(1220, 122, 'Píritu'),
(1221, 123, 'San Francisco'),
(1222, 124, 'Sucre'),
(1223, 124, 'Pecaya'),
(1224, 125, 'Tocópero'),
(1225, 126, 'El Charal'),
(1226, 126, 'Las Vegas del Tuy'),
(1227, 126, 'Santa Cruz de Bucaral'),
(1228, 127, 'Bruzual'),
(1229, 127, 'Urumaco'),
(1230, 128, 'Puerto Cumarebo'),
(1231, 128, 'La Ciénaga'),
(1232, 128, 'La Soledad'),
(1233, 128, 'Pueblo Cumarebo'),
(1234, 128, 'Zazárida'),
(1235, 113, 'Churuguara'),
(1236, 129, 'Camaguán'),
(1237, 129, 'Puerto Miranda'),
(1238, 129, 'Uverito'),
(1239, 130, 'Chaguaramas'),
(1240, 131, 'El Socorro'),
(1241, 132, 'Tucupido'),
(1242, 132, 'San Rafael de Laya'),
(1243, 133, 'Altagracia de Orituco'),
(1244, 133, 'San Rafael de Orituco'),
(1245, 133, 'San Francisco Javier de Lezama'),
(1246, 133, 'Paso Real de Macaira'),
(1247, 133, 'Carlos Soublette'),
(1248, 133, 'San Francisco de Macaira'),
(1249, 133, 'Libertad de Orituco'),
(1250, 134, 'Cantaclaro'),
(1251, 134, 'San Juan de los Morros'),
(1252, 134, 'Parapara'),
(1253, 135, 'El Sombrero'),
(1254, 135, 'Sosa'),
(1255, 136, 'Las Mercedes'),
(1256, 136, 'Cabruta'),
(1257, 136, 'Santa Rita de Manapire'),
(1258, 137, 'Valle de la Pascua'),
(1259, 137, 'Espino'),
(1260, 138, 'San José de Unare'),
(1261, 138, 'Zaraza'),
(1262, 139, 'San José de Tiznados'),
(1263, 139, 'San Francisco de Tiznados'),
(1264, 139, 'San Lorenzo de Tiznados'),
(1265, 139, 'Ortiz'),
(1266, 140, 'Guayabal'),
(1267, 140, 'Cazorla'),
(1268, 141, 'San José de Guaribe'),
(1269, 141, 'Uveral'),
(1270, 142, 'Santa María de Ipire'),
(1271, 142, 'Altamira'),
(1272, 143, 'El Calvario'),
(1273, 143, 'El Rastro'),
(1274, 143, 'Guardatinajas'),
(1275, 143, 'Capital Urbana Calabozo'),
(1276, 144, 'Quebrada Honda de Guache'),
(1277, 144, 'Pío Tamayo'),
(1278, 144, 'Yacambú'),
(1279, 145, 'Fréitez'),
(1280, 145, 'José María Blanco'),
(1281, 146, 'Catedral'),
(1282, 146, 'Concepción'),
(1283, 146, 'El Cují'),
(1284, 146, 'Juan de Villegas'),
(1285, 146, 'Santa Rosa'),
(1286, 146, 'Tamaca'),
(1287, 146, 'Unión'),
(1288, 146, 'Aguedo Felipe Alvarado'),
(1289, 146, 'Buena Vista'),
(1290, 146, 'Juárez'),
(1291, 147, 'Juan Bautista Rodríguez'),
(1292, 147, 'Cuara'),
(1293, 147, 'Diego de Lozada'),
(1294, 147, 'Paraíso de San José'),
(1295, 147, 'San Miguel'),
(1296, 147, 'Tintorero'),
(1297, 147, 'José Bernardo Dorante'),
(1298, 147, 'Coronel Mariano Peraza '),
(1299, 148, 'Bolívar'),
(1300, 148, 'Anzoátegui'),
(1301, 148, 'Guarico'),
(1302, 148, 'Hilario Luna y Luna'),
(1303, 148, 'Humocaro Alto'),
(1304, 148, 'Humocaro Bajo'),
(1305, 148, 'La Candelaria'),
(1306, 148, 'Morán'),
(1307, 149, 'Cabudare'),
(1308, 149, 'José Gregorio Bastidas'),
(1309, 149, 'Agua Viva'),
(1310, 150, 'Sarare'),
(1311, 150, 'Buría'),
(1312, 150, 'Gustavo Vegas León'),
(1313, 151, 'Trinidad Samuel'),
(1314, 151, 'Antonio Díaz'),
(1315, 151, 'Camacaro'),
(1316, 151, 'Castañeda'),
(1317, 151, 'Cecilio Zubillaga'),
(1318, 151, 'Chiquinquirá'),
(1319, 151, 'El Blanco'),
(1320, 151, 'Espinoza de los Monteros'),
(1321, 151, 'Lara'),
(1322, 151, 'Las Mercedes'),
(1323, 151, 'Manuel Morillo'),
(1324, 151, 'Montaña Verde'),
(1325, 151, 'Montes de Oca'),
(1326, 151, 'Torres'),
(1327, 151, 'Heriberto Arroyo'),
(1328, 151, 'Reyes Vargas'),
(1329, 151, 'Altagracia'),
(1330, 152, 'Siquisique'),
(1331, 152, 'Moroturo'),
(1332, 152, 'San Miguel'),
(1333, 152, 'Xaguas'),
(1334, 179, 'Presidente Betancourt'),
(1335, 179, 'Presidente Páez'),
(1336, 179, 'Presidente Rómulo Gallegos'),
(1337, 179, 'Gabriel Picón González'),
(1338, 179, 'Héctor Amable Mora'),
(1339, 179, 'José Nucete Sardi'),
(1340, 179, 'Pulido Méndez'),
(1341, 180, 'La Azulita'),
(1342, 181, 'Santa Cruz de Mora'),
(1343, 181, 'Mesa Bolívar'),
(1344, 181, 'Mesa de Las Palmas'),
(1345, 182, 'Aricagua'),
(1346, 182, 'San Antonio'),
(1347, 183, 'Canagua'),
(1348, 183, 'Capurí'),
(1349, 183, 'Chacantá'),
(1350, 183, 'El Molino'),
(1351, 183, 'Guaimaral'),
(1352, 183, 'Mucutuy'),
(1353, 183, 'Mucuchachí'),
(1354, 184, 'Fernández Peña'),
(1355, 184, 'Matriz'),
(1356, 184, 'Montalbán'),
(1357, 184, 'Acequias'),
(1358, 184, 'Jají'),
(1359, 184, 'La Mesa'),
(1360, 184, 'San José del Sur'),
(1361, 185, 'Tucaní'),
(1362, 185, 'Florencio Ramírez'),
(1363, 186, 'Santo Domingo'),
(1364, 186, 'Las Piedras'),
(1365, 187, 'Guaraque'),
(1366, 187, 'Mesa de Quintero'),
(1367, 187, 'Río Negro'),
(1368, 188, 'Arapuey'),
(1369, 188, 'Palmira'),
(1370, 189, 'San Cristóbal de Torondoy'),
(1371, 189, 'Torondoy'),
(1372, 190, 'Antonio Spinetti Dini'),
(1373, 190, 'Arias'),
(1374, 190, 'Caracciolo Parra Pérez'),
(1375, 190, 'Domingo Peña'),
(1376, 190, 'El Llano'),
(1377, 190, 'Gonzalo Picón Febres'),
(1378, 190, 'Jacinto Plaza'),
(1379, 190, 'Juan Rodríguez Suárez'),
(1380, 190, 'Lasso de la Vega'),
(1381, 190, 'Mariano Picón Salas'),
(1382, 190, 'Milla'),
(1383, 190, 'Osuna Rodríguez'),
(1384, 190, 'Sagrario'),
(1385, 190, 'El Morro'),
(1386, 190, 'Los Nevados'),
(1387, 191, 'Andrés Eloy Blanco'),
(1388, 191, 'La Venta'),
(1389, 191, 'Piñango'),
(1390, 191, 'Timotes'),
(1391, 192, 'Eloy Paredes'),
(1392, 192, 'San Rafael de Alcázar'),
(1393, 192, 'Santa Elena de Arenales'),
(1394, 193, 'Santa María de Caparo'),
(1395, 194, 'Pueblo Llano'),
(1396, 195, 'Cacute'),
(1397, 195, 'La Toma'),
(1398, 195, 'Mucuchíes'),
(1399, 195, 'Mucurubá'),
(1400, 195, 'San Rafael'),
(1401, 196, 'Gerónimo Maldonado'),
(1402, 196, 'Bailadores'),
(1403, 197, 'Tabay'),
(1404, 198, 'Chiguará'),
(1405, 198, 'Estánquez'),
(1406, 198, 'Lagunillas'),
(1407, 198, 'La Trampa'),
(1408, 198, 'Pueblo Nuevo del Sur'),
(1409, 198, 'San Juan'),
(1410, 199, 'El Amparo'),
(1411, 199, 'El Llano'),
(1412, 199, 'San Francisco'),
(1413, 199, 'Tovar'),
(1414, 200, 'Independencia'),
(1415, 200, 'María de la Concepción Palacios Blanco'),
(1416, 200, 'Nueva Bolivia'),
(1417, 200, 'Santa Apolonia'),
(1418, 201, 'Caño El Tigre'),
(1419, 201, 'Zea'),
(1420, 223, 'Aragüita'),
(1421, 223, 'Arévalo González'),
(1422, 223, 'Capaya'),
(1423, 223, 'Caucagua'),
(1424, 223, 'Panaquire'),
(1425, 223, 'Ribas'),
(1426, 223, 'El Café'),
(1427, 223, 'Marizapa'),
(1428, 224, 'Cumbo'),
(1429, 224, 'San José de Barlovento'),
(1430, 225, 'El Cafetal'),
(1431, 225, 'Las Minas'),
(1432, 225, 'Nuestra Señora del Rosario'),
(1433, 226, 'Higuerote'),
(1434, 226, 'Curiepe'),
(1435, 226, 'Tacarigua de Brión'),
(1436, 227, 'Mamporal'),
(1437, 228, 'Carrizal'),
(1438, 229, 'Chacao'),
(1439, 230, 'Charallave'),
(1440, 230, 'Las Brisas'),
(1441, 231, 'El Hatillo'),
(1442, 232, 'Altagracia de la Montaña'),
(1443, 232, 'Cecilio Acosta'),
(1444, 232, 'Los Teques'),
(1445, 232, 'El Jarillo'),
(1446, 232, 'San Pedro'),
(1447, 232, 'Tácata'),
(1448, 232, 'Paracotos'),
(1449, 233, 'Cartanal'),
(1450, 233, 'Santa Teresa del Tuy'),
(1451, 234, 'La Democracia'),
(1452, 234, 'Ocumare del Tuy'),
(1453, 234, 'Santa Bárbara'),
(1454, 235, 'San Antonio de los Altos'),
(1455, 236, 'Río Chico'),
(1456, 236, 'El Guapo'),
(1457, 236, 'Tacarigua de la Laguna'),
(1458, 236, 'Paparo'),
(1459, 236, 'San Fernando del Guapo'),
(1460, 237, 'Santa Lucía del Tuy'),
(1461, 238, 'Cúpira'),
(1462, 238, 'Machurucuto'),
(1463, 239, 'Guarenas'),
(1464, 240, 'San Antonio de Yare'),
(1465, 240, 'San Francisco de Yare'),
(1466, 241, 'Leoncio Martínez'),
(1467, 241, 'Petare'),
(1468, 241, 'Caucagüita'),
(1469, 241, 'Filas de Mariche'),
(1470, 241, 'La Dolorita'),
(1471, 242, 'Cúa'),
(1472, 242, 'Nueva Cúa'),
(1473, 243, 'Guatire'),
(1474, 243, 'Bolívar'),
(1475, 258, 'San Antonio de Maturín'),
(1476, 258, 'San Francisco de Maturín'),
(1477, 259, 'Aguasay'),
(1478, 260, 'Caripito'),
(1479, 261, 'El Guácharo'),
(1480, 261, 'La Guanota'),
(1481, 261, 'Sabana de Piedra'),
(1482, 261, 'San Agustín'),
(1483, 261, 'Teresen'),
(1484, 261, 'Caripe'),
(1485, 262, 'Areo'),
(1486, 262, 'Capital Cedeño'),
(1487, 262, 'San Félix de Cantalicio'),
(1488, 262, 'Viento Fresco'),
(1489, 263, 'El Tejero'),
(1490, 263, 'Punta de Mata'),
(1491, 264, 'Chaguaramas'),
(1492, 264, 'Las Alhuacas'),
(1493, 264, 'Tabasca'),
(1494, 264, 'Temblador'),
(1495, 265, 'Alto de los Godos'),
(1496, 265, 'Boquerón'),
(1497, 265, 'Las Cocuizas'),
(1498, 265, 'La Cruz'),
(1499, 265, 'San Simón'),
(1500, 265, 'El Corozo'),
(1501, 265, 'El Furrial'),
(1502, 265, 'Jusepín'),
(1503, 265, 'La Pica'),
(1504, 265, 'San Vicente'),
(1505, 266, 'Aparicio'),
(1506, 266, 'Aragua de Maturín'),
(1507, 266, 'Chaguamal'),
(1508, 266, 'El Pinto'),
(1509, 266, 'Guanaguana'),
(1510, 266, 'La Toscana'),
(1511, 266, 'Taguaya'),
(1512, 267, 'Cachipo'),
(1513, 267, 'Quiriquire'),
(1514, 268, 'Santa Bárbara'),
(1515, 269, 'Barrancas'),
(1516, 269, 'Los Barrancos de Fajardo'),
(1517, 270, 'Uracoa'),
(1518, 271, 'Antolín del Campo'),
(1519, 272, 'Arismendi'),
(1520, 273, 'García'),
(1521, 273, 'Francisco Fajardo'),
(1522, 274, 'Bolívar'),
(1523, 274, 'Guevara'),
(1524, 274, 'Matasiete'),
(1525, 274, 'Santa Ana'),
(1526, 274, 'Sucre'),
(1527, 275, 'Aguirre'),
(1528, 275, 'Maneiro'),
(1529, 276, 'Adrián'),
(1530, 276, 'Juan Griego'),
(1531, 276, 'Yaguaraparo'),
(1532, 277, 'Porlamar'),
(1533, 278, 'San Francisco de Macanao'),
(1534, 278, 'Boca de Río'),
(1535, 279, 'Tubores'),
(1536, 279, 'Los Baleales'),
(1537, 280, 'Vicente Fuentes'),
(1538, 280, 'Villalba'),
(1539, 281, 'San Juan Bautista'),
(1540, 281, 'Zabala'),
(1541, 283, 'Capital Araure'),
(1542, 283, 'Río Acarigua'),
(1543, 284, 'Capital Esteller'),
(1544, 284, 'Uveral'),
(1545, 285, 'Guanare'),
(1546, 285, 'Córdoba'),
(1547, 285, 'San José de la Montaña'),
(1548, 285, 'San Juan de Guanaguanare'),
(1549, 285, 'Virgen de la Coromoto'),
(1550, 286, 'Guanarito'),
(1551, 286, 'Trinidad de la Capilla'),
(1552, 286, 'Divina Pastora'),
(1553, 287, 'Monseñor José Vicente de Unda'),
(1554, 287, 'Peña Blanca'),
(1555, 288, 'Capital Ospino'),
(1556, 288, 'Aparición'),
(1557, 288, 'La Estación'),
(1558, 289, 'Páez'),
(1559, 289, 'Payara'),
(1560, 289, 'Pimpinela'),
(1561, 289, 'Ramón Peraza'),
(1562, 290, 'Papelón'),
(1563, 290, 'Caño Delgadito'),
(1564, 291, 'San Genaro de Boconoito'),
(1565, 291, 'Antolín Tovar'),
(1566, 292, 'San Rafael de Onoto'),
(1567, 292, 'Santa Fe'),
(1568, 292, 'Thermo Morles'),
(1569, 293, 'Santa Rosalía'),
(1570, 293, 'Florida'),
(1571, 294, 'Sucre'),
(1572, 294, 'Concepción'),
(1573, 294, 'San Rafael de Palo Alzado'),
(1574, 294, 'Uvencio Antonio Velásquez'),
(1575, 294, 'San José de Saguaz'),
(1576, 294, 'Villa Rosa'),
(1577, 295, 'Turén'),
(1578, 295, 'Canelones'),
(1579, 295, 'Santa Cruz'),
(1580, 295, 'San Isidro Labrador'),
(1581, 296, 'Mariño'),
(1582, 296, 'Rómulo Gallegos'),
(1583, 297, 'San José de Aerocuar'),
(1584, 297, 'Tavera Acosta'),
(1585, 298, 'Río Caribe'),
(1586, 298, 'Antonio José de Sucre'),
(1587, 298, 'El Morro de Puerto Santo'),
(1588, 298, 'Puerto Santo'),
(1589, 298, 'San Juan de las Galdonas'),
(1590, 299, 'El Pilar'),
(1591, 299, 'El Rincón'),
(1592, 299, 'General Francisco Antonio Váquez'),
(1593, 299, 'Guaraúnos'),
(1594, 299, 'Tunapuicito'),
(1595, 299, 'Unión'),
(1596, 300, 'Santa Catalina'),
(1597, 300, 'Santa Rosa'),
(1598, 300, 'Santa Teresa'),
(1599, 300, 'Bolívar'),
(1600, 300, 'Maracapana'),
(1601, 302, 'Libertad'),
(1602, 302, 'El Paujil'),
(1603, 302, 'Yaguaraparo'),
(1604, 303, 'Cruz Salmerón Acosta'),
(1605, 303, 'Chacopata'),
(1606, 303, 'Manicuare'),
(1607, 304, 'Tunapuy'),
(1608, 304, 'Campo Elías'),
(1609, 305, 'Irapa'),
(1610, 305, 'Campo Claro'),
(1611, 305, 'Maraval'),
(1612, 305, 'San Antonio de Irapa'),
(1613, 305, 'Soro'),
(1614, 306, 'Mejía'),
(1615, 307, 'Cumanacoa'),
(1616, 307, 'Arenas'),
(1617, 307, 'Aricagua'),
(1618, 307, 'Cogollar'),
(1619, 307, 'San Fernando'),
(1620, 307, 'San Lorenzo'),
(1621, 308, 'Villa Frontado (Muelle de Cariaco)'),
(1622, 308, 'Catuaro'),
(1623, 308, 'Rendón'),
(1624, 308, 'San Cruz'),
(1625, 308, 'Santa María'),
(1626, 309, 'Altagracia'),
(1627, 309, 'Santa Inés'),
(1628, 309, 'Valentín Valiente'),
(1629, 309, 'Ayacucho'),
(1630, 309, 'San Juan'),
(1631, 309, 'Raúl Leoni'),
(1632, 309, 'Gran Mariscal'),
(1633, 310, 'Cristóbal Colón'),
(1634, 310, 'Bideau'),
(1635, 310, 'Punta de Piedras'),
(1636, 310, 'Güiria'),
(1637, 341, 'Andrés Bello'),
(1638, 342, 'Antonio Rómulo Costa'),
(1639, 343, 'Ayacucho'),
(1640, 343, 'Rivas Berti'),
(1641, 343, 'San Pedro del Río'),
(1642, 344, 'Bolívar'),
(1643, 344, 'Palotal'),
(1644, 344, 'General Juan Vicente Gómez'),
(1645, 344, 'Isaías Medina Angarita'),
(1646, 345, 'Cárdenas'),
(1647, 345, 'Amenodoro Ángel Lamus'),
(1648, 345, 'La Florida'),
(1649, 346, 'Córdoba'),
(1650, 347, 'Fernández Feo'),
(1651, 347, 'Alberto Adriani'),
(1652, 347, 'Santo Domingo'),
(1653, 348, 'Francisco de Miranda'),
(1654, 349, 'García de Hevia'),
(1655, 349, 'Boca de Grita'),
(1656, 349, 'José Antonio Páez'),
(1657, 350, 'Guásimos'),
(1658, 351, 'Independencia'),
(1659, 351, 'Juan Germán Roscio'),
(1660, 351, 'Román Cárdenas'),
(1661, 352, 'Jáuregui'),
(1662, 352, 'Emilio Constantino Guerrero'),
(1663, 352, 'Monseñor Miguel Antonio Salas'),
(1664, 353, 'José María Vargas'),
(1665, 354, 'Junín'),
(1666, 354, 'La Petrólea'),
(1667, 354, 'Quinimarí'),
(1668, 354, 'Bramón'),
(1669, 355, 'Libertad'),
(1670, 355, 'Cipriano Castro'),
(1671, 355, 'Manuel Felipe Rugeles'),
(1672, 356, 'Libertador'),
(1673, 356, 'Doradas'),
(1674, 356, 'Emeterio Ochoa'),
(1675, 356, 'San Joaquín de Navay'),
(1676, 357, 'Lobatera'),
(1677, 357, 'Constitución'),
(1678, 358, 'Michelena'),
(1679, 359, 'Panamericano'),
(1680, 359, 'La Palmita'),
(1681, 360, 'Pedro María Ureña'),
(1682, 360, 'Nueva Arcadia'),
(1683, 361, 'Delicias'),
(1684, 361, 'Pecaya'),
(1685, 362, 'Samuel Darío Maldonado'),
(1686, 362, 'Boconó'),
(1687, 362, 'Hernández'),
(1688, 363, 'La Concordia'),
(1689, 363, 'San Juan Bautista'),
(1690, 363, 'Pedro María Morantes'),
(1691, 363, 'San Sebastián'),
(1692, 363, 'Dr. Francisco Romero Lobo'),
(1693, 364, 'Seboruco'),
(1694, 365, 'Simón Rodríguez'),
(1695, 366, 'Sucre'),
(1696, 366, 'Eleazar López Contreras'),
(1697, 366, 'San Pablo'),
(1698, 367, 'Torbes'),
(1699, 368, 'Uribante'),
(1700, 368, 'Cárdenas'),
(1701, 368, 'Juan Pablo Peñalosa'),
(1702, 368, 'Potosí'),
(1703, 369, 'San Judas Tadeo'),
(1704, 370, 'Araguaney'),
(1705, 370, 'El Jaguito'),
(1706, 370, 'La Esperanza'),
(1707, 370, 'Santa Isabel'),
(1708, 371, 'Boconó'),
(1709, 371, 'El Carmen'),
(1710, 371, 'Mosquey'),
(1711, 371, 'Ayacucho'),
(1712, 371, 'Burbusay'),
(1713, 371, 'General Ribas'),
(1714, 371, 'Guaramacal'),
(1715, 371, 'Vega de Guaramacal'),
(1716, 371, 'Monseñor Jáuregui'),
(1717, 371, 'Rafael Rangel'),
(1718, 371, 'San Miguel'),
(1719, 371, 'San José'),
(1720, 372, 'Sabana Grande'),
(1721, 372, 'Cheregüé'),
(1722, 372, 'Granados'),
(1723, 373, 'Arnoldo Gabaldón'),
(1724, 373, 'Bolivia'),
(1725, 373, 'Carrillo'),
(1726, 373, 'Cegarra'),
(1727, 373, 'Chejendé'),
(1728, 373, 'Manuel Salvador Ulloa'),
(1729, 373, 'San José'),
(1730, 374, 'Carache'),
(1731, 374, 'La Concepción'),
(1732, 374, 'Cuicas'),
(1733, 374, 'Panamericana'),
(1734, 374, 'Santa Cruz'),
(1735, 375, 'Escuque'),
(1736, 375, 'La Unión'),
(1737, 375, 'Santa Rita'),
(1738, 375, 'Sabana Libre'),
(1739, 376, 'El Socorro'),
(1740, 376, 'Los Caprichos'),
(1741, 376, 'Antonio José de Sucre'),
(1742, 377, 'Campo Elías'),
(1743, 377, 'Arnoldo Gabaldón'),
(1744, 378, 'Santa Apolonia'),
(1745, 378, 'El Progreso'),
(1746, 378, 'La Ceiba'),
(1747, 378, 'Tres de Febrero'),
(1748, 379, 'El Dividive'),
(1749, 379, 'Agua Santa'),
(1750, 379, 'Agua Caliente'),
(1751, 379, 'El Cenizo'),
(1752, 379, 'Valerita'),
(1753, 380, 'Monte Carmelo'),
(1754, 380, 'Buena Vista'),
(1755, 380, 'Santa María del Horcón'),
(1756, 381, 'Motatán'),
(1757, 381, 'El Baño'),
(1758, 381, 'Jalisco'),
(1759, 382, 'Pampán'),
(1760, 382, 'Flor de Patria'),
(1761, 382, 'La Paz'),
(1762, 382, 'Santa Ana'),
(1763, 383, 'Pampanito'),
(1764, 383, 'La Concepción'),
(1765, 383, 'Pampanito II'),
(1766, 384, 'Betijoque'),
(1767, 384, 'José Gregorio Hernández'),
(1768, 384, 'La Pueblita'),
(1769, 384, 'Los Cedros'),
(1770, 385, 'Carvajal'),
(1771, 385, 'Campo Alegre'),
(1772, 385, 'Antonio Nicolás Briceño'),
(1773, 385, 'José Leonardo Suárez'),
(1774, 386, 'Sabana de Mendoza'),
(1775, 386, 'Junín'),
(1776, 386, 'Valmore Rodríguez'),
(1777, 386, 'El Paraíso'),
(1778, 387, 'Andrés Linares'),
(1779, 387, 'Chiquinquirá'),
(1780, 387, 'Cristóbal Mendoza'),
(1781, 387, 'Cruz Carrillo'),
(1782, 387, 'Matriz'),
(1783, 387, 'Monseñor Carrillo'),
(1784, 387, 'Tres Esquinas'),
(1785, 388, 'Cabimbú'),
(1786, 388, 'Jajó'),
(1787, 388, 'La Mesa de Esnujaque'),
(1788, 388, 'Santiago'),
(1789, 388, 'Tuñame'),
(1790, 388, 'La Quebrada'),
(1791, 389, 'Juan Ignacio Montilla'),
(1792, 389, 'La Beatriz'),
(1793, 389, 'La Puerta'),
(1794, 389, 'Mendoza del Valle de Momboy'),
(1795, 389, 'Mercedes Díaz'),
(1796, 389, 'San Luis'),
(1797, 390, 'Caraballeda'),
(1798, 390, 'Carayaca'),
(1799, 390, 'Carlos Soublette'),
(1800, 390, 'Caruao Chuspa'),
(1801, 390, 'Catia La Mar'),
(1802, 390, 'El Junko'),
(1803, 390, 'La Guaira'),
(1804, 390, 'Macuto'),
(1805, 390, 'Maiquetía'),
(1806, 390, 'Naiguatá'),
(1807, 390, 'Urimare'),
(1808, 391, 'Arístides Bastidas'),
(1809, 392, 'Bolívar'),
(1810, 407, 'Chivacoa'),
(1811, 407, 'Campo Elías'),
(1812, 408, 'Cocorote'),
(1813, 409, 'Independencia'),
(1814, 410, 'José Antonio Páez'),
(1815, 411, 'La Trinidad'),
(1816, 412, 'Manuel Monge'),
(1817, 413, 'Salóm'),
(1818, 413, 'Temerla'),
(1819, 413, 'Nirgua'),
(1820, 414, 'San Andrés'),
(1821, 414, 'Yaritagua'),
(1822, 415, 'San Javier'),
(1823, 415, 'Albarico'),
(1824, 415, 'San Felipe'),
(1825, 416, 'Sucre'),
(1826, 417, 'Urachiche'),
(1827, 418, 'El Guayabo'),
(1828, 418, 'Farriar'),
(1829, 441, 'Isla de Toas'),
(1830, 441, 'Monagas'),
(1831, 442, 'San Timoteo'),
(1832, 442, 'General Urdaneta'),
(1833, 442, 'Libertador'),
(1834, 442, 'Marcelino Briceño'),
(1835, 442, 'Pueblo Nuevo'),
(1836, 442, 'Manuel Guanipa Matos'),
(1837, 443, 'Ambrosio'),
(1838, 443, 'Carmen Herrera'),
(1839, 443, 'La Rosa'),
(1840, 443, 'Germán Ríos Linares'),
(1841, 443, 'San Benito'),
(1842, 443, 'Rómulo Betancourt'),
(1843, 443, 'Jorge Hernández'),
(1844, 443, 'Punta Gorda'),
(1845, 443, 'Arístides Calvani'),
(1846, 444, 'Encontrados'),
(1847, 444, 'Udón Pérez'),
(1848, 445, 'Moralito'),
(1849, 445, 'San Carlos del Zulia'),
(1850, 445, 'Santa Cruz del Zulia'),
(1851, 445, 'Santa Bárbara'),
(1852, 445, 'Urribarrí'),
(1853, 446, 'Carlos Quevedo'),
(1854, 446, 'Francisco Javier Pulgar'),
(1855, 446, 'Simón Rodríguez'),
(1856, 446, 'Guamo-Gavilanes'),
(1857, 448, 'La Concepción'),
(1858, 448, 'San José'),
(1859, 448, 'Mariano Parra León'),
(1860, 448, 'José Ramón Yépez'),
(1861, 449, 'Jesús María Semprún'),
(1862, 449, 'Barí'),
(1863, 450, 'Concepción'),
(1864, 450, 'Andrés Bello'),
(1865, 450, 'Chiquinquirá'),
(1866, 450, 'El Carmelo'),
(1867, 450, 'Potreritos'),
(1868, 451, 'Libertad'),
(1869, 451, 'Alonso de Ojeda'),
(1870, 451, 'Venezuela'),
(1871, 451, 'Eleazar López Contreras'),
(1872, 451, 'Campo Lara'),
(1873, 452, 'Bartolomé de las Casas'),
(1874, 452, 'Libertad'),
(1875, 452, 'Río Negro'),
(1876, 452, 'San José de Perijá'),
(1877, 453, 'San Rafael'),
(1878, 453, 'La Sierrita'),
(1879, 453, 'Las Parcelas'),
(1880, 453, 'Luis de Vicente'),
(1881, 453, 'Monseñor Marcos Sergio Godoy'),
(1882, 453, 'Ricaurte'),
(1883, 453, 'Tamare'),
(1884, 454, 'Antonio Borjas Romero'),
(1885, 454, 'Bolívar'),
(1886, 454, 'Cacique Mara'),
(1887, 454, 'Carracciolo Parra Pérez'),
(1888, 454, 'Cecilio Acosta'),
(1889, 454, 'Cristo de Aranza'),
(1890, 454, 'Coquivacoa'),
(1891, 454, 'Chiquinquirá'),
(1892, 454, 'Francisco Eugenio Bustamante'),
(1893, 454, 'Idelfonzo Vásquez'),
(1894, 454, 'Juana de Ávila'),
(1895, 454, 'Luis Hurtado Higuera'),
(1896, 454, 'Manuel Dagnino'),
(1897, 454, 'Olegario Villalobos'),
(1898, 454, 'Raúl Leoni'),
(1899, 454, 'Santa Lucía'),
(1900, 454, 'Venancio Pulgar'),
(1901, 454, 'San Isidro'),
(1902, 455, 'Altagracia'),
(1903, 455, 'Faría'),
(1904, 455, 'Ana María Campos'),
(1905, 455, 'San Antonio'),
(1906, 455, 'San José'),
(1907, 456, 'Donaldo García'),
(1908, 456, 'El Rosario'),
(1909, 456, 'Sixto Zambrano'),
(1910, 457, 'San Francisco'),
(1911, 457, 'El Bajo'),
(1912, 457, 'Domitila Flores'),
(1913, 457, 'Francisco Ochoa'),
(1914, 457, 'Los Cortijos'),
(1915, 457, 'Marcial Hernández'),
(1916, 458, 'Santa Rita'),
(1917, 458, 'El Mene'),
(1918, 458, 'Pedro Lucas Urribarrí'),
(1919, 458, 'José Cenobio Urribarrí'),
(1920, 459, 'Rafael Maria Baralt'),
(1921, 459, 'Manuel Manrique'),
(1922, 459, 'Rafael Urdaneta'),
(1923, 460, 'Bobures'),
(1924, 460, 'Gibraltar'),
(1925, 460, 'Heras'),
(1926, 460, 'Monseñor Arturo Álvarez'),
(1927, 460, 'Rómulo Gallegos'),
(1928, 460, 'El Batey'),
(1929, 461, 'Rafael Urdaneta'),
(1930, 461, 'La Victoria'),
(1931, 461, 'Raúl Cuenca'),
(1932, 447, 'Sinamaica'),
(1933, 447, 'Alta Guajira'),
(1934, 447, 'Elías Sánchez Rubio'),
(1935, 447, 'Guajira'),
(1936, 462, 'Altagracia'),
(1937, 462, 'Antímano'),
(1938, 462, 'Caricuao'),
(1939, 462, 'Catedral'),
(1940, 462, 'Coche'),
(1941, 462, 'El Junquito'),
(1942, 462, 'El Paraíso'),
(1943, 462, 'El Recreo'),
(1944, 462, 'El Valle'),
(1945, 462, 'La Candelaria'),
(1946, 462, 'La Pastora'),
(1947, 462, 'La Vega'),
(1948, 462, 'Macarao'),
(1949, 462, 'San Agustín'),
(1950, 462, 'San Bernardino'),
(1951, 462, 'San José'),
(1952, 462, 'San Juan'),
(1953, 462, 'San Pedro'),
(1954, 462, 'Santa Rosalía'),
(1955, 462, 'Santa Teresa'),
(1956, 462, 'Sucre (Catia)'),
(1957, 462, '23 de enero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `n_reference` int(10) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `date_transfer` date DEFAULT NULL,
  `status_id` int(8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `reservation_id`, `n_reference`, `phone_number`, `amount`, `date_transfer`, `status_id`, `created_at`, `updated_at`) VALUES
(2, 2, 798822, '04126164692', '3000.00', '2026-02-02', 2, '2026-01-30 03:40:46', '2026-02-01 11:29:19'),
(4, 2, 123321, '04126164692', '5000.00', '2026-02-01', 2, '2026-02-01 11:32:10', '2026-02-03 12:41:07'),
(11, 4, 586633, '04126164692', '2500.00', '2026-02-03', 1, '2026-02-04 09:09:42', '2026-02-04 09:09:42'),
(12, 7, 673322, '04126164692', '2000.00', '2026-02-20', 2, '2026-02-21 07:11:15', '2026-02-21 10:50:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `user_id` int(8) DEFAULT NULL COMMENT 'identificador de usuario',
  `start_date` timestamp NULL DEFAULT NULL COMMENT 'fecha de inicio de reserva',
  `end_date` timestamp NULL DEFAULT NULL COMMENT 'fecha de fin de reserva',
  `n_guest` int(5) NOT NULL DEFAULT 0 COMMENT 'numero de huespedes',
  `group_name` varchar(255) DEFAULT NULL COMMENT 'nombre del grupo',
  `responsible_name` varchar(50) DEFAULT NULL COMMENT 'nombre del responsable',
  `responsible_email` varchar(50) DEFAULT NULL COMMENT 'correo del responsable',
  `status_id` int(11) NOT NULL,
  `state_id` int(8) DEFAULT NULL,
  `municipality_id` int(8) DEFAULT NULL,
  `parish_id` int(8) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `total_amount` decimal(20,0) DEFAULT NULL,
  `percent_paid` varchar(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `start_date`, `end_date`, `n_guest`, `group_name`, `responsible_name`, `responsible_email`, `status_id`, `state_id`, `municipality_id`, `parish_id`, `address`, `total_amount`, `percent_paid`, `created_at`, `updated_at`) VALUES
(2, 4, '2026-01-03 04:00:00', '2026-01-24 04:00:00', 200, 'grupo 2', 'sekateh tu raj', 'infantekleyber@gmail.com', 3, NULL, NULL, NULL, NULL, NULL, '0', '2026-01-29 08:58:42', '2026-02-01 11:32:48'),
(4, 4, '2026-01-29 04:00:00', '2026-02-28 04:00:00', 150, 'grupo scouts a la carga', 'Kleyber Infante', 'infantekleyber@gmail.com', 2, 4, 48, 958, 'direccion de prueba', NULL, '0', '2026-02-03 11:51:52', '2026-02-04 09:09:42'),
(5, 4, '2026-02-01 04:00:00', '2026-02-28 04:00:00', 50, 'prueba de una tercera reservacion', 'Yoquito Foquito', 'infantekleyber@gmail.com', 1, 6, 69, 1047, 'prueba de direcciones', 60000, '0', '2026-02-03 11:58:21', '2026-02-21 11:58:01'),
(7, 4, '2026-02-23 04:00:00', '2026-03-21 04:00:00', 130, 'Scouts a la carga', 'Rafael Ramirez', 'infantekleyber@gmail.com', 3, 24, 462, 1954, 'prueba de direccion', 156000, '1.28', '2026-02-20 11:38:52', '2026-02-21 10:50:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2026-01-20 20:38:28', '2026-01-20 20:38:28'),
(2, 'Visitante', '2026-01-20 20:38:28', '2026-01-20 20:38:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('goMMoqL3U7uaaktOaSPb6zBBU5H8r5Npd6uJG1Yr', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia3hjSTNtNWRpR0hwQUlrc0hCNmJYNVZHUDl2SjNEeDRKUUJEVGRkaSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvdmlzaXRvcnMiO3M6NToicm91dGUiO3M6MTQ6InZpc2l0b3JzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1771660862),
('qT5KPvubDWc9o3KZBGPLwFkedTbMVVKzj8QyiBZ4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTjNYMGZraDN6cXlySXgzelpNVjEzdVN3MWJsbHZvZjRuaWZlekZ6VSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4iO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1771661030);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_payments`
--

CREATE TABLE `status_payments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status_payments`
--

INSERT INTO `status_payments` (`id`, `name`, `color`) VALUES
(1, 'Sin Confirmar', NULL),
(2, 'Confirmado', NULL),
(3, 'Rechazado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_reservation`
--

CREATE TABLE `status_reservation` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status_reservation`
--

INSERT INTO `status_reservation` (`id`, `name`, `color`) VALUES
(1, 'Por pagar', NULL),
(2, 'Verificando Pago', NULL),
(3, 'Abonando', NULL),
(4, 'Pagado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `document` varchar(10) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol_id` int(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `last_name`, `document`, `position`, `email`, `password`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, NULL, 'infantekleyber+1@gmail.com', '$2y$12$n9S3abzxpmfrZ7gT60QjdOcNLHN7M6Fw.inMhcLPBDZjrof/a/zu6', 1, '2026-01-31 05:08:19', '2026-01-31 05:08:19'),
(4, 'kinfante', 'Kleyber Manuel', 'Infante Blando', NULL, NULL, 'infantekleyber@gmail.com', '$2y$12$n9S3abzxpmfrZ7gT60QjdOcNLHN7M6Fw.inMhcLPBDZjrof/a/zu6', 2, '2026-01-21 00:43:04', '2026-01-21 00:43:04'),
(8, 'lblanco', 'Lennys Sireya', 'Blanco de Infante', NULL, NULL, 'sireya@gmail.com', '$2y$12$f4jLLHo1X4CF.KrykxPW7Okk8SCpX/zraY4m1stgbZxQBdxh/penK', 2, '2026-02-01 08:23:53', '2026-02-01 08:23:53'),
(12, 'linfante', 'Luis Manuel', 'Infante Blanco', NULL, NULL, 'linfante@gmail.com', '$2y$12$21g4gh9ldBjg/S6OaxOsJOkBd2p4HuQyFgMhFnBFhx35EQQhzXQPW', 2, '2026-02-05 10:56:36', '2026-02-05 10:56:36');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aforo`
--
ALTER TABLE `aforo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audit_trails`
--
ALTER TABLE `audit_trails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `municipio_id` (`municipio_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status_id`),
  ADD KEY `state_id` (`state_id`,`municipality_id`,`parish_id`),
  ADD KEY `municipality_id` (`municipality_id`),
  ADD KEY `parish_id` (`parish_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `status_payments`
--
ALTER TABLE `status_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status_reservation`
--
ALTER TABLE `status_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`email`),
  ADD UNIQUE KEY `cedula` (`document`),
  ADD UNIQUE KEY `cedula_3` (`document`,`email`),
  ADD KEY `rol` (`rol_id`),
  ADD KEY `rol_2` (`rol_id`),
  ADD KEY `cedula_2` (`document`,`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aforo`
--
ALTER TABLE `aforo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `audit_trails`
--
ALTER TABLE `audit_trails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=463;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1958;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status_payments`
--
ALTER TABLE `status_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `status_reservation`
--
ALTER TABLE `status_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `audit_trails`
--
ALTER TABLE `audit_trails`
  ADD CONSTRAINT `audit_trails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status_reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_4` FOREIGN KEY (`municipality_id`) REFERENCES `municipios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_5` FOREIGN KEY (`parish_id`) REFERENCES `parroquia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
