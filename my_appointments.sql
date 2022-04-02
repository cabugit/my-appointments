-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2022 a las 00:59:55
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_appointments`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialty_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `description`, `specialty_id`, `doctor_id`, `patient_id`, `scheduled_date`, `scheduled_time`, `type`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Reservada', 1, 2, 3, '2022-03-31', '07:00:00', 'Consulta', 'Confirmada', '2022-03-05 02:37:25', '2022-03-10 15:56:34'),
(4, 'Confirmada', 1, 2, 3, '2022-03-17', '07:00:00', 'Consulta', 'Confirmada', '2022-03-05 04:10:17', '2022-03-05 06:12:08'),
(5, 'Reservada', 1, 2, 3, '2022-03-24', '07:00:00', 'Consulta', 'Confirmada', '2022-03-05 04:10:37', '2022-03-10 08:49:43'),
(3006, 'Illo et quod maiores quis quas eveniet.', 3, 7, 50, '2022-02-23', '20:30:52', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3007, 'Harum non iusto beatae sint velit.', 2, 4, 27, '2022-03-06', '17:47:14', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3008, 'Quo voluptatibus unde eum.', 3, 9, 44, '2021-12-13', '09:25:20', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3009, 'Rem vero eos doloremque quos sed nihil.', 4, 11, 28, '2021-06-10', '13:28:35', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3010, 'Reiciendis perspiciatis sit ipsum quam.', 2, 5, 37, '2021-09-27', '23:26:19', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3011, 'In est sed error.', 4, 10, 47, '2021-04-01', '16:42:56', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3012, 'Sint adipisci aliquam deserunt molestiae.', 3, 7, 53, '2022-01-19', '09:55:12', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3013, 'Et sunt consequatur quod suscipit ipsam eum.', 3, 8, 53, '2021-04-13', '07:15:25', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3014, 'Et dolor ipsa ut ex.', 3, 9, 19, '2021-10-04', '06:18:00', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3015, 'Quam quae veritatis in officia nihil.', 4, 11, 27, '2021-05-05', '01:28:06', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3016, 'Odit officiis similique rerum nihil deserunt dicta.', 4, 11, 39, '2021-08-08', '02:27:30', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3017, 'Autem odit distinctio est dolor corporis.', 2, 5, 58, '2021-10-12', '14:25:56', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3018, 'Ipsam doloribus dolore et laudantium qui et.', 2, 5, 43, '2022-02-11', '00:41:43', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3019, 'Qui ipsum cumque itaque sint.', 3, 9, 20, '2021-10-08', '06:18:58', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3020, 'Nesciunt provident cum et quo dolorem.', 3, 9, 13, '2022-01-27', '02:18:36', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3021, 'Eum expedita dolore quae qui tenetur.', 3, 8, 33, '2021-12-06', '08:33:53', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3022, 'Et ab rem doloremque minus.', 4, 11, 50, '2021-05-28', '17:20:35', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3023, 'Sint tempore officiis officia consequatur facere laborum.', 3, 7, 50, '2021-11-19', '07:58:45', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3024, 'Et explicabo aliquid voluptatem ratione.', 4, 10, 46, '2021-07-02', '09:13:58', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3025, 'Libero est voluptatem dolores adipisci.', 4, 11, 31, '2022-01-21', '03:07:23', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3026, 'Ullam voluptatem qui est et dignissimos.', 3, 7, 33, '2021-05-25', '11:36:11', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3027, 'Quia dolor impedit quia sed libero.', 4, 11, 32, '2021-06-24', '07:08:46', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3028, 'Nam cum autem sed quasi nihil laboriosam.', 4, 11, 57, '2021-10-24', '13:48:34', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3029, 'Animi sunt nostrum cupiditate eos.', 4, 11, 60, '2021-04-14', '07:24:04', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3030, 'Atque impedit nam blanditiis asperiores.', 4, 10, 21, '2022-01-14', '14:24:41', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3031, 'Vel nam rerum corporis sint laudantium deserunt.', 4, 11, 28, '2021-05-31', '06:01:01', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3032, 'Itaque aliquam non magnam aperiam sint rerum.', 4, 12, 62, '2021-12-28', '07:21:56', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3033, 'Praesentium ad quasi esse voluptas sequi.', 4, 12, 32, '2021-04-30', '08:46:38', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3034, 'Earum sint quaerat et quidem repudiandae culpa.', 2, 5, 45, '2021-11-19', '03:18:34', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3035, 'Dignissimos odit commodi quaerat vel mollitia consequatur.', 1, 2, 40, '2021-07-24', '14:56:12', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3036, 'Quae sint quia corporis.', 3, 9, 50, '2021-05-18', '06:48:51', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3037, 'Cupiditate consequatur mollitia rerum.', 4, 2, 35, '2021-06-15', '19:35:09', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3038, 'Quis soluta incidunt et.', 2, 5, 56, '2021-04-25', '20:25:02', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3039, 'Voluptatem consequuntur reiciendis dolor possimus.', 4, 10, 13, '2021-08-16', '00:46:02', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3040, 'Quis enim quo molestiae voluptates aut voluptatem ipsum.', 4, 10, 24, '2022-01-02', '16:49:22', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3041, 'Corrupti porro fugit voluptas odit odit.', 2, 5, 13, '2021-06-20', '14:38:23', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3042, 'Fugit tempore fugiat et perferendis doloribus.', 3, 8, 24, '2022-02-23', '23:02:52', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3043, 'Vitae fuga in ipsa et ipsa natus.', 2, 6, 57, '2022-01-20', '08:15:55', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3044, 'In facere aspernatur commodi assumenda.', 2, 6, 26, '2021-07-13', '05:38:01', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3045, 'Sit corporis magnam qui sed.', 4, 11, 47, '2021-03-27', '03:25:52', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3046, 'Rerum veniam dicta cupiditate velit vel.', 3, 7, 33, '2021-03-11', '03:22:08', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3047, 'Numquam officia necessitatibus ullam asperiores.', 3, 9, 41, '2022-01-04', '11:02:19', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3048, 'Velit consectetur est esse.', 2, 4, 61, '2022-02-03', '10:50:45', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3049, 'Incidunt quibusdam quasi cupiditate.', 2, 4, 15, '2022-01-08', '11:27:03', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3050, 'Dignissimos ut neque excepturi temporibus laborum.', 2, 4, 3, '2021-07-06', '16:32:58', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3051, 'Aut animi vel non non rerum.', 4, 12, 15, '2021-04-28', '17:44:00', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3052, 'Excepturi et sed laudantium maiores minima non.', 2, 5, 34, '2021-07-23', '08:12:54', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3053, 'Possimus omnis aut quis debitis nulla ipsum.', 2, 5, 42, '2021-03-20', '18:35:37', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3054, 'Provident consequatur culpa nostrum dolore eum.', 2, 4, 33, '2021-07-17', '03:51:30', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3055, 'Ut quibusdam est similique harum.', 4, 12, 48, '2021-05-19', '18:17:34', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3056, 'Architecto sequi sit sit et quia.', 3, 7, 58, '2021-11-05', '20:56:30', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3057, 'Nam odit error veritatis et.', 3, 7, 55, '2021-09-09', '12:53:26', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3058, 'Et omnis nisi et voluptatibus odio quis.', 4, 11, 30, '2021-11-23', '02:52:36', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3059, 'Est unde blanditiis atque.', 4, 10, 46, '2021-11-05', '07:11:15', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3060, 'Dolor totam velit aut magnam deserunt.', 1, 2, 58, '2021-05-16', '19:11:47', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3061, 'Labore tenetur delectus optio autem a aut.', 4, 10, 29, '2021-05-23', '05:29:15', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3062, 'Qui eum veritatis eius.', 2, 6, 15, '2021-03-15', '21:25:37', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3063, 'Iusto in sapiente consequatur earum consequuntur.', 4, 11, 26, '2021-05-21', '17:11:42', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3064, 'Ullam quo consectetur necessitatibus beatae quibusdam ea.', 3, 8, 40, '2021-07-28', '18:49:50', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3065, 'Ipsum magni quas ut.', 3, 9, 51, '2021-07-23', '23:40:09', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3066, 'Maxime cum officia rerum.', 2, 5, 56, '2021-09-29', '03:50:27', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3067, 'Error vel adipisci molestias labore sapiente quae.', 1, 2, 47, '2021-06-07', '08:43:36', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3068, 'Laborum sequi libero rerum.', 4, 12, 22, '2021-05-27', '06:24:13', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3069, 'Quae est illum quidem.', 3, 8, 18, '2021-07-09', '02:54:53', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3070, 'Sit quis quos assumenda quo dicta dolorem.', 2, 4, 22, '2021-10-25', '05:06:29', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3071, 'Quod et voluptate a est quae eveniet.', 4, 10, 33, '2021-05-03', '18:01:34', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3072, 'Provident consectetur a qui sed voluptates.', 3, 7, 24, '2021-07-04', '16:21:22', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3073, 'Rerum vitae suscipit ut dolor facilis.', 2, 6, 15, '2021-09-27', '09:34:07', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3074, 'Consectetur a explicabo explicabo eum et.', 2, 5, 34, '2021-03-15', '04:38:53', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3075, 'Nam sint commodi libero.', 3, 8, 56, '2021-03-31', '17:20:50', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3076, 'Pariatur consequuntur vero ea nihil nostrum.', 2, 4, 60, '2021-10-06', '04:07:49', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3077, 'Dolore voluptas consectetur ipsa cum qui beatae.', 4, 11, 30, '2021-07-15', '20:28:21', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3078, 'Rem cupiditate nostrum quis quasi labore minus.', 2, 4, 51, '2021-04-01', '07:14:50', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3079, 'Natus quod assumenda repudiandae facere perspiciatis voluptatem.', 3, 7, 20, '2021-08-05', '14:05:34', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3080, 'Incidunt quia fugiat possimus voluptatem enim.', 3, 8, 35, '2021-09-11', '09:38:57', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3081, 'Earum delectus reprehenderit in aut minus velit.', 4, 12, 58, '2021-08-26', '19:25:10', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3082, 'Harum qui tenetur occaecati et ea voluptatem.', 2, 4, 3, '2022-02-16', '10:33:50', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3083, 'Dicta commodi eos est dolores in.', 2, 4, 50, '2022-02-11', '21:40:23', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3084, 'Veritatis ratione velit inventore atque sed occaecati.', 4, 11, 61, '2022-02-18', '21:02:31', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3085, 'Occaecati quod suscipit et quaerat.', 4, 11, 18, '2022-02-22', '13:05:49', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3086, 'Eos cum vitae facere.', 2, 4, 3, '2021-08-10', '01:20:30', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3087, 'Tenetur ut delectus quae enim voluptas.', 1, 2, 47, '2021-12-20', '17:42:27', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3088, 'Voluptatum eos qui omnis.', 4, 12, 54, '2022-01-19', '01:32:25', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3089, 'In recusandae animi quia.', 3, 8, 46, '2021-04-14', '21:27:10', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3090, 'Asperiores ipsam modi totam expedita amet doloremque.', 4, 2, 53, '2021-07-24', '13:18:52', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3091, 'Optio eos occaecati aliquam quidem.', 3, 7, 37, '2021-11-18', '03:50:31', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3092, 'Occaecati repellendus ut odio reiciendis dolorem.', 3, 9, 16, '2021-12-06', '03:55:07', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3093, 'Autem assumenda eveniet quis.', 4, 10, 50, '2021-12-13', '22:46:59', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3094, 'Incidunt rerum et molestias est.', 4, 2, 3, '2021-04-06', '04:29:21', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3095, 'Dolor nisi totam cumque quia asperiores.', 4, 12, 57, '2022-03-02', '20:58:21', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3096, 'Nihil eum neque ut quidem.', 2, 4, 43, '2022-02-13', '23:39:56', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3097, 'Repellendus in molestiae repellendus nihil explicabo.', 3, 8, 54, '2021-05-11', '09:39:33', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3098, 'Iure non nesciunt laboriosam et officia.', 2, 6, 19, '2021-10-16', '06:59:37', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3099, 'Aliquid impedit reiciendis voluptas consequatur.', 3, 9, 48, '2022-02-25', '02:03:49', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3100, 'Eveniet quasi neque voluptate accusamus.', 4, 11, 15, '2022-03-09', '08:29:32', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3101, 'Dolorem quia cum magni dolor.', 4, 11, 49, '2021-09-10', '11:13:58', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3102, 'Voluptatum vel perspiciatis molestias iste ut ad.', 4, 12, 3, '2021-10-09', '23:02:21', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3103, 'Velit nisi id voluptatem vel commodi.', 3, 9, 21, '2021-05-29', '02:24:15', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3104, 'Iure unde dolores quod ut.', 2, 4, 44, '2021-07-04', '03:56:35', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3105, 'Dolorem facilis cumque itaque cupiditate consequatur.', 4, 11, 19, '2021-03-10', '08:56:01', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3106, 'In iste ut aut.', 3, 7, 15, '2021-07-16', '14:33:32', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3107, 'Repudiandae non vero id debitis.', 3, 7, 58, '2021-03-23', '20:25:49', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3108, 'Quia voluptatem deserunt in laborum ex iusto.', 3, 8, 57, '2021-05-06', '10:21:40', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3109, 'Voluptatem non quia est sequi ea.', 2, 5, 55, '2022-02-01', '01:31:25', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3110, 'Nesciunt quam consequatur inventore mollitia ut amet.', 3, 9, 45, '2021-09-29', '20:00:13', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3111, 'Quis et aut aut maiores.', 3, 8, 33, '2021-03-28', '09:41:35', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3112, 'Facilis quaerat non modi sapiente.', 3, 7, 29, '2021-10-12', '22:40:20', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3113, 'Dolorem exercitationem voluptates enim similique autem quis.', 4, 10, 43, '2021-10-24', '01:40:45', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3114, 'Velit inventore deserunt nihil est non cumque.', 3, 7, 28, '2021-08-01', '10:40:51', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3115, 'Cum ut sint inventore ipsam enim.', 2, 6, 48, '2021-09-20', '11:33:23', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3116, 'Dolor ipsam ad fuga ut.', 4, 2, 44, '2021-11-30', '23:01:55', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3117, 'Eos reprehenderit aliquam repudiandae aut voluptatem sed.', 4, 11, 16, '2021-07-06', '13:48:46', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3118, 'Dolores officia dignissimos consectetur autem explicabo.', 2, 5, 26, '2022-02-28', '19:49:33', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3119, 'Quisquam enim est est aperiam sit esse.', 4, 2, 34, '2021-06-21', '10:01:49', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3120, 'Delectus perspiciatis enim facere natus.', 3, 7, 43, '2021-03-18', '04:15:52', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3121, 'Dicta harum et sapiente.', 3, 8, 57, '2021-11-22', '10:01:16', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3122, 'Minus in quod eos architecto quisquam temporibus.', 4, 2, 61, '2021-07-22', '14:12:16', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3123, 'Exercitationem consequatur ut eius quia.', 3, 8, 33, '2022-01-08', '10:04:01', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3124, 'Eum ut dolor nisi excepturi.', 4, 12, 13, '2021-11-07', '13:34:51', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3125, 'Voluptatem sed consequatur illum est numquam.', 4, 11, 27, '2021-08-30', '09:13:41', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3126, 'Voluptas aut cumque quasi velit eveniet alias.', 2, 6, 48, '2021-10-05', '11:24:05', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3127, 'Eius omnis culpa consequatur et cumque.', 2, 5, 23, '2022-01-20', '05:57:35', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3128, 'Illo accusamus qui cum occaecati.', 2, 5, 37, '2021-10-09', '21:58:19', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3129, 'Saepe eum ullam minus iste.', 4, 11, 24, '2021-05-09', '22:57:09', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3130, 'Vero libero dolores nemo.', 3, 9, 16, '2021-03-19', '12:01:53', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3131, 'Odit quia non culpa deleniti.', 3, 7, 58, '2021-08-01', '07:47:32', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3132, 'Consequatur ut vel quos et.', 4, 10, 35, '2022-03-04', '09:19:22', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3133, 'Sit magni cupiditate aut iure cum.', 2, 5, 58, '2021-06-20', '09:56:20', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3134, 'Dolorem architecto nobis eum.', 4, 11, 13, '2021-12-29', '18:58:19', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3135, 'Et reiciendis fugit rem qui qui consectetur.', 2, 6, 17, '2021-08-21', '01:29:38', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3136, 'Exercitationem rerum aut dolor voluptas.', 4, 11, 13, '2021-12-20', '15:31:24', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3137, 'Debitis voluptatibus delectus itaque.', 4, 2, 39, '2022-02-20', '05:38:27', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3138, 'Voluptatem corrupti impedit sit sit.', 3, 9, 54, '2021-10-18', '01:20:25', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3139, 'Molestiae vel rerum similique.', 3, 7, 44, '2021-05-03', '15:32:32', 'Operación', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3140, 'Ut molestias atque quia.', 4, 10, 42, '2022-02-13', '13:56:34', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3141, 'Voluptates animi voluptas id.', 4, 11, 35, '2021-05-03', '18:59:41', 'Consulta', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3142, 'Minima facilis corrupti possimus.', 4, 12, 45, '2021-06-28', '03:10:54', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3143, 'Voluptatum voluptatem est animi.', 4, 12, 54, '2021-11-09', '22:57:40', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3144, 'Ipsa qui odio ea.', 3, 8, 57, '2021-12-28', '13:42:58', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3145, 'Eius distinctio aut autem et et.', 4, 2, 60, '2022-02-02', '12:55:41', 'Operación', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3146, 'Harum neque debitis quos voluptas culpa.', 4, 12, 3, '2022-02-19', '20:11:55', 'Examen', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3147, 'Tempora eum rerum repellat dicta quaerat reprehenderit.', 2, 6, 27, '2021-08-01', '07:14:43', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3148, 'Praesentium vel omnis sit ex.', 3, 8, 31, '2021-03-29', '21:20:58', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3149, 'Expedita quisquam dolor consequatur.', 3, 7, 40, '2021-09-29', '18:03:40', 'Examen', 'Cancelada', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3150, 'Qui velit consequatur expedita.', 1, 2, 28, '2021-10-04', '15:40:35', 'Consulta', 'Atendida', '2022-03-09 18:53:56', '2022-03-09 18:53:56'),
(3151, 'Sit cum laborum vitae aut saepe et.', 3, 9, 22, '2021-04-18', '23:42:15', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3152, 'Est ut a eligendi.', 4, 12, 35, '2021-11-14', '04:20:08', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3153, 'Reprehenderit minima modi deserunt architecto.', 3, 9, 49, '2021-07-11', '16:12:03', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3154, 'Placeat rem nam soluta.', 4, 11, 50, '2021-04-19', '07:18:10', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3155, 'Expedita odit quia veritatis repudiandae fugiat.', 4, 10, 43, '2021-07-10', '11:30:13', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3156, 'Culpa expedita sit eveniet sunt et officia.', 2, 4, 22, '2021-11-16', '13:33:21', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3157, 'Hic perspiciatis voluptate magnam vel.', 2, 6, 16, '2021-11-10', '21:46:40', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3158, 'Alias accusantium qui dolor voluptatem aperiam.', 4, 11, 57, '2021-07-01', '14:00:49', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3159, 'Sapiente eveniet esse esse porro quis explicabo.', 4, 11, 37, '2021-06-16', '03:09:08', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3160, 'Quam earum rerum architecto tempora.', 2, 5, 27, '2021-12-31', '13:57:03', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3161, 'Illo perspiciatis et sunt magnam non exercitationem.', 3, 7, 39, '2021-08-21', '22:56:06', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3162, 'Excepturi ipsam suscipit dolores excepturi.', 4, 12, 44, '2021-03-20', '01:54:49', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3163, 'Odio eligendi earum excepturi.', 4, 10, 34, '2021-07-07', '00:35:50', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3164, 'Deleniti culpa laudantium iste maiores amet voluptatum.', 4, 12, 55, '2021-03-23', '13:11:45', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3165, 'Ullam nam accusamus quo.', 4, 12, 61, '2021-08-23', '07:52:49', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3166, 'Laboriosam et dolorem et.', 4, 12, 36, '2021-10-13', '05:42:14', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3167, 'Quis amet aut placeat qui.', 3, 8, 37, '2022-01-10', '07:15:46', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3168, 'Vero id quam aliquid.', 2, 4, 19, '2021-05-01', '13:41:34', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3169, 'At earum dolorem sed tenetur reprehenderit quam.', 4, 11, 34, '2021-04-08', '07:33:11', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3170, 'Dolorem sed molestiae id ratione.', 3, 8, 21, '2021-04-01', '13:14:53', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3171, 'Repudiandae minus fugiat pariatur.', 4, 11, 35, '2021-08-21', '16:30:29', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3172, 'Alias et distinctio nesciunt velit recusandae.', 2, 5, 52, '2021-10-19', '02:05:53', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3173, 'Quos adipisci dolores modi aut.', 3, 9, 33, '2021-12-15', '07:30:37', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3174, 'Quo quo omnis autem.', 2, 4, 51, '2021-03-24', '05:33:23', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3175, 'Exercitationem praesentium eveniet consequatur dolorem.', 1, 2, 33, '2021-10-27', '02:14:05', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3176, 'Similique expedita suscipit reprehenderit.', 4, 10, 37, '2022-01-05', '22:39:50', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3177, 'Iste minima asperiores quos.', 4, 11, 60, '2022-01-08', '14:12:41', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3178, 'Facilis quia illum aut.', 4, 12, 16, '2021-12-24', '22:06:05', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3179, 'Ut facilis quo rem unde.', 3, 8, 58, '2021-08-18', '05:06:09', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3180, 'Iste autem vel deleniti.', 3, 8, 52, '2021-07-29', '12:51:09', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3181, 'Et dolor dolorum impedit aut impedit.', 3, 9, 26, '2022-02-03', '21:53:02', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3182, 'Eos cupiditate non voluptates.', 3, 8, 45, '2021-05-19', '19:36:11', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3183, 'Consequatur cum voluptatum quaerat praesentium occaecati et.', 3, 9, 50, '2021-09-26', '22:02:12', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3184, 'Rerum quod voluptatem similique id maxime sed.', 2, 6, 51, '2021-11-29', '05:00:28', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3185, 'Iure ad dolores ipsum aut in.', 2, 4, 52, '2021-07-10', '16:17:06', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3186, 'Pariatur est et aut.', 2, 6, 56, '2021-05-11', '14:27:24', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3187, 'Nostrum dolores voluptates nemo.', 3, 9, 14, '2021-04-29', '12:55:08', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3188, 'Deleniti eum dolorem similique amet nostrum et.', 3, 7, 47, '2021-07-26', '19:01:38', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3189, 'Consequatur vero aut veritatis quia natus.', 4, 10, 17, '2022-01-25', '13:15:12', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3190, 'Vel quidem atque sit.', 2, 4, 41, '2021-08-22', '03:05:29', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3191, 'Quia sint qui dicta vitae nobis.', 2, 5, 50, '2022-03-03', '11:18:41', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3192, 'Exercitationem praesentium modi vel voluptas.', 2, 6, 21, '2021-10-19', '07:15:35', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3193, 'A aperiam sed excepturi.', 3, 7, 27, '2022-01-28', '06:54:18', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3194, 'Et aut inventore quaerat.', 3, 7, 50, '2021-06-09', '19:13:22', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3195, 'Officia exercitationem eligendi voluptatem.', 2, 4, 44, '2021-09-22', '01:09:14', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3196, 'Deleniti debitis et cumque ut asperiores.', 4, 10, 19, '2021-05-06', '05:47:04', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3197, 'Ab facere qui atque est similique.', 4, 11, 52, '2021-09-18', '08:00:50', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3198, 'Odio recusandae rerum ad.', 4, 2, 52, '2021-12-02', '18:25:41', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3199, 'Quo aut dicta alias sit.', 4, 11, 29, '2021-09-12', '19:27:57', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3200, 'Quisquam voluptatem quod omnis qui deserunt.', 4, 12, 40, '2022-03-01', '04:42:22', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3201, 'Ut ex non alias.', 4, 12, 14, '2021-05-26', '13:06:03', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3202, 'Amet sint ad odit.', 2, 5, 28, '2021-09-10', '11:40:16', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3203, 'Quae ut ex nobis rerum.', 4, 2, 20, '2021-04-01', '08:14:13', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3204, 'Praesentium aspernatur deserunt tenetur perferendis dolorum fuga.', 4, 10, 16, '2022-02-16', '06:29:40', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3205, 'Voluptatibus dolores pariatur quod.', 4, 2, 24, '2021-07-20', '18:14:58', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3206, 'Aut eaque voluptas quam.', 2, 6, 16, '2021-10-24', '00:52:33', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3207, 'Eligendi ea beatae necessitatibus aperiam beatae.', 3, 9, 26, '2022-02-24', '14:33:26', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3208, 'Voluptatibus dolor excepturi officiis quaerat.', 4, 11, 44, '2021-10-24', '19:55:23', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3209, 'Aut consequuntur excepturi enim pariatur.', 3, 9, 42, '2021-10-21', '11:46:56', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3210, 'Optio omnis ut voluptatem consectetur alias aut.', 4, 2, 15, '2021-12-01', '09:41:03', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3211, 'Est cupiditate facilis est.', 4, 10, 62, '2021-11-10', '18:54:30', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3212, 'Dignissimos autem numquam autem occaecati.', 2, 6, 29, '2021-11-03', '10:08:16', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3213, 'Aut qui odit delectus.', 3, 7, 25, '2021-08-09', '22:40:23', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3214, 'Architecto numquam ea atque sit ratione.', 2, 6, 52, '2021-11-02', '09:41:43', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3215, 'Asperiores aut repudiandae est.', 3, 8, 27, '2021-12-14', '03:36:04', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3216, 'Cum necessitatibus labore est vel non consequatur.', 3, 9, 55, '2021-04-25', '20:24:54', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3217, 'Autem tempore sint minus alias.', 4, 10, 49, '2021-03-14', '19:29:58', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3218, 'Soluta delectus aut voluptatem commodi velit.', 2, 5, 15, '2021-09-19', '22:01:41', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3219, 'Et adipisci cum labore quo consequatur.', 2, 5, 56, '2021-11-05', '16:24:17', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3220, 'Et temporibus vel odit.', 4, 12, 13, '2021-06-03', '16:36:52', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3221, 'Enim quia est non et.', 3, 9, 34, '2021-03-11', '17:33:41', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3222, 'Dicta non deserunt reprehenderit omnis.', 3, 7, 27, '2021-06-08', '13:36:19', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3223, 'Iusto nam veniam quo omnis aut facilis.', 3, 9, 41, '2021-08-01', '06:32:34', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3224, 'Possimus tempore illum dolor fugiat.', 2, 6, 38, '2021-03-10', '07:14:42', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3225, 'Consectetur ut aut ea ducimus.', 3, 9, 58, '2021-07-12', '13:56:31', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3226, 'Quia unde voluptas nisi sed.', 2, 6, 26, '2021-04-12', '21:31:00', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3227, 'Est eos minima qui numquam voluptatem hic.', 4, 11, 16, '2021-09-17', '12:46:37', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3228, 'Rerum et et ipsa totam minima occaecati.', 4, 11, 35, '2021-12-03', '15:32:13', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3229, 'Ea illo temporibus et.', 4, 12, 20, '2021-12-29', '17:34:26', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3230, 'Sed dolor sit sunt aspernatur rerum.', 2, 5, 52, '2021-05-12', '13:27:49', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3231, 'Cumque tempora esse a in odit est consequatur.', 3, 7, 32, '2021-07-28', '10:24:10', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3232, 'Iure sed qui molestiae.', 4, 2, 32, '2021-12-04', '09:18:22', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3233, 'Quibusdam dolorem eum illum.', 4, 11, 29, '2022-01-24', '05:53:07', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3234, 'Ut consequuntur voluptas ullam enim nihil.', 3, 7, 55, '2021-06-05', '02:12:49', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3235, 'Quae error hic provident iste quod.', 4, 2, 48, '2021-06-13', '22:43:25', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3236, 'Dolor quia repellat iste.', 3, 7, 27, '2022-01-21', '16:29:09', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3237, 'Rem cupiditate magnam dignissimos alias.', 2, 5, 52, '2021-05-07', '09:38:21', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3238, 'Corporis ducimus modi quod molestiae iure.', 3, 9, 48, '2021-12-04', '05:34:12', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3239, 'Quidem quo optio ea quisquam quo.', 3, 7, 44, '2021-06-30', '14:41:53', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3240, 'Porro sunt rerum atque.', 2, 4, 40, '2021-12-11', '23:18:19', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3241, 'In consequatur officia quis.', 3, 9, 56, '2021-11-03', '01:31:58', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3242, 'Natus quam consequuntur quod nihil nostrum.', 2, 6, 26, '2022-01-10', '05:16:04', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3243, 'Dolores ut et recusandae consequuntur.', 4, 10, 24, '2021-05-17', '03:56:52', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3244, 'Porro harum doloribus voluptas.', 3, 7, 36, '2022-03-02', '22:58:29', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3245, 'Rerum non beatae molestias alias corrupti earum.', 4, 10, 48, '2021-05-03', '19:37:20', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3246, 'Vel qui atque vel optio facilis enim.', 3, 7, 17, '2021-08-14', '02:24:48', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3247, 'Voluptas saepe consequuntur assumenda perferendis.', 3, 8, 29, '2021-08-24', '13:16:15', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3248, 'Nostrum ipsam quidem odit.', 2, 4, 23, '2022-02-26', '09:14:29', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3249, 'Consectetur iure veritatis nobis et.', 4, 11, 45, '2022-01-24', '01:21:00', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3250, 'Quidem cum vitae et excepturi qui.', 2, 5, 36, '2021-11-06', '08:08:36', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3251, 'Ea corrupti quia numquam pariatur voluptas.', 2, 4, 19, '2021-07-04', '04:24:14', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3252, 'Ut nesciunt quis cum molestiae laboriosam qui.', 3, 8, 31, '2021-11-13', '16:21:44', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3253, 'Consequatur aut et magnam.', 4, 10, 41, '2021-10-12', '19:47:36', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3254, 'Et aspernatur minima et eum.', 3, 8, 58, '2021-12-19', '11:05:31', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3255, 'Vitae voluptatum aut accusantium quo autem.', 2, 5, 30, '2021-11-22', '18:07:36', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3256, 'Nihil eos aut consequatur pariatur et.', 3, 7, 43, '2021-07-23', '18:34:12', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3257, 'Expedita et culpa ratione sed saepe excepturi.', 2, 5, 49, '2021-11-15', '10:38:43', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3258, 'Quia a amet nihil.', 2, 6, 48, '2021-04-28', '01:15:59', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3259, 'Ut debitis excepturi est et perferendis harum.', 4, 11, 37, '2021-08-26', '00:51:46', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3260, 'Veniam ullam qui vero voluptas et.', 3, 8, 49, '2021-04-06', '14:57:15', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3261, 'Quo provident sed asperiores consequuntur.', 2, 4, 35, '2021-06-27', '19:09:48', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3262, 'Ut eum facere nihil suscipit.', 3, 7, 56, '2022-02-22', '03:50:36', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3263, 'Aut assumenda vero ea sit velit qui.', 2, 6, 20, '2021-08-15', '15:15:47', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3264, 'Omnis ut consequatur omnis nihil eveniet.', 4, 12, 62, '2021-07-22', '03:51:37', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3265, 'Dignissimos eos ex velit mollitia et.', 3, 7, 31, '2021-04-20', '04:03:52', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3266, 'Porro laudantium dolorem possimus enim.', 2, 5, 49, '2022-02-14', '15:24:40', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3267, 'In sequi quia nisi et.', 4, 2, 16, '2021-10-23', '18:20:43', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3268, 'Dolorum minima distinctio qui.', 2, 6, 28, '2021-03-31', '02:50:24', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3269, 'Facilis deleniti provident hic nostrum.', 4, 11, 40, '2021-06-29', '13:55:39', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3270, 'Quae sed qui dolore dolores provident est.', 4, 12, 27, '2021-08-28', '16:29:42', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3271, 'Sunt iusto nisi nihil nulla optio.', 4, 10, 55, '2021-05-03', '10:01:26', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3272, 'Eaque cumque fugiat ut mollitia.', 3, 8, 62, '2021-09-06', '03:04:58', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3273, 'Voluptate id aut neque repellat.', 1, 2, 15, '2022-01-05', '05:12:53', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3274, 'Autem soluta ducimus recusandae rerum odio asperiores.', 4, 10, 38, '2022-01-07', '10:14:36', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3275, 'Vel nihil earum dolorem vero.', 1, 2, 62, '2021-05-06', '20:09:04', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3276, 'Animi dicta nihil numquam.', 3, 7, 45, '2022-01-16', '01:11:18', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3277, 'Et iure a quidem dolor.', 4, 11, 13, '2021-12-23', '09:03:22', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3278, 'Sint dolorem possimus et.', 3, 8, 19, '2021-09-22', '12:09:50', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3279, 'Nihil nemo voluptates voluptas recusandae reiciendis ullam.', 4, 10, 56, '2021-11-12', '16:26:52', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3280, 'Culpa repellat sint nostrum saepe fugiat nihil.', 3, 7, 3, '2021-05-14', '15:44:24', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3281, 'Similique assumenda sint totam dolore repellat.', 3, 9, 45, '2021-06-16', '03:26:14', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3282, 'Ut culpa hic accusantium.', 4, 11, 32, '2021-07-09', '12:22:56', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3283, 'Assumenda est ipsam quisquam omnis.', 2, 6, 13, '2021-10-21', '08:24:06', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3284, 'Sequi odio pariatur repellendus consequatur.', 4, 10, 49, '2022-02-09', '02:44:27', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3285, 'Ut laborum qui velit quasi.', 3, 9, 59, '2021-04-26', '23:45:59', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3286, 'Et neque nisi nam commodi a quas.', 2, 6, 31, '2021-04-16', '00:39:23', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3287, 'Nostrum deserunt delectus ea.', 4, 11, 49, '2021-09-28', '22:54:39', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3288, 'Aperiam enim inventore cum laboriosam in adipisci.', 4, 10, 34, '2021-12-18', '08:56:25', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3289, 'Itaque aperiam dolore rem.', 4, 2, 29, '2022-03-02', '11:14:09', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3290, 'Esse voluptas quo voluptas corrupti animi est.', 2, 4, 59, '2021-09-20', '07:03:34', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3291, 'Dolore optio consequatur minima aspernatur omnis.', 3, 9, 50, '2021-10-31', '09:16:11', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3292, 'Nesciunt quas nemo vel.', 2, 6, 28, '2022-02-09', '07:58:31', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3293, 'Id doloribus sunt itaque consequatur.', 2, 5, 55, '2022-02-05', '20:22:38', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3294, 'Adipisci et quo quod itaque.', 4, 10, 44, '2021-05-16', '21:59:15', 'Examen', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3295, 'Quod maiores praesentium qui.', 3, 9, 55, '2021-04-05', '06:08:45', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3296, 'Voluptas eum rem dolore.', 2, 5, 19, '2021-08-13', '02:55:28', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3297, 'Recusandae sit nostrum dolor cupiditate vel magni.', 1, 2, 36, '2021-10-09', '20:15:15', 'Consulta', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3298, 'Consequuntur corporis omnis sed eum.', 2, 5, 56, '2021-03-21', '08:15:24', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3299, 'Quibusdam architecto vitae neque inventore laborum.', 2, 4, 29, '2022-01-20', '12:14:22', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3300, 'Et eos error illum nostrum.', 1, 2, 18, '2022-02-18', '00:40:36', 'Examen', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3301, 'Assumenda placeat repellendus animi consequatur magni suscipit.', 3, 9, 17, '2022-02-27', '15:09:10', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3302, 'Aut suscipit consectetur quisquam architecto.', 3, 9, 60, '2021-08-11', '12:25:20', 'Consulta', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3303, 'Quis eius aliquid molestiae.', 2, 6, 62, '2021-12-12', '18:52:11', 'Operación', 'Cancelada', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3304, 'Qui voluptas quod enim ea magnam ut.', 3, 8, 35, '2021-12-27', '22:49:44', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3305, 'Eius pariatur beatae enim sit libero nulla.', 4, 11, 26, '2021-12-15', '20:45:56', 'Operación', 'Atendida', '2022-03-09 18:53:57', '2022-03-09 18:53:57'),
(3306, 'nueva', 1, 2, 3, '2022-03-10', '16:00:00', 'Consulta', 'Cancelada', '2022-03-10 09:48:18', '2022-03-10 12:06:32'),
(3307, 'prueba 2', 1, 2, 3, '2022-03-10', '09:00:00', 'Consulta', 'Cancelada', '2022-03-10 12:31:00', '2022-03-10 15:17:28'),
(3308, 'prueba', 1, 2, 3, '2022-03-10', '08:00:00', 'Consulta', 'Confirmada', '2022-03-10 15:22:45', '2022-03-10 15:41:04'),
(3309, 'ddddd', 1, 2, 3, '2022-03-10', '08:30:00', 'Consulta', 'Confirmada', '2022-03-10 15:47:57', '2022-03-10 15:48:58'),
(3310, 'sadasdas', 1, 2, 3, '2022-03-10', '15:00:00', 'Consulta', 'Confirmada', '2022-03-10 15:50:10', '2022-03-10 15:50:50'),
(3311, 'wddas', 1, 2, 3, '2022-03-10', '07:30:00', 'Consulta', 'Confirmada', '2022-03-10 15:52:55', '2022-03-10 15:53:20'),
(3312, 'aasas', 1, 2, 3, '2022-03-10', '15:30:00', 'Consulta', 'Reservada', '2022-03-10 16:02:24', '2022-03-10 16:02:24'),
(3313, 'sasasasa', 1, 2, 3, '2022-03-10', '16:30:00', 'Consulta', 'Cancelada', '2022-03-10 16:02:34', '2022-03-11 02:38:29'),
(3314, 'asASasaSAsA', 1, 2, 3, '2022-03-10', '17:30:00', 'Consulta', 'Reservada', '2022-03-10 16:02:45', '2022-03-10 16:02:45'),
(3315, 'ASasASasASas', 1, 2, 3, '2022-03-10', '07:00:00', 'Consulta', 'Confirmada', '2022-03-10 16:02:58', '2022-03-10 16:04:55'),
(3316, 'sASasASasASa', 1, 2, 3, '2022-03-10', '17:00:00', 'Consulta', 'Confirmada', '2022-03-10 16:03:09', '2022-03-11 02:17:42'),
(3317, 'Me duele la cabeza', 1, 2, 3, '2022-03-24', '09:00:00', 'Consulta', 'Reservada', '2022-03-15 21:03:06', '2022-03-15 21:03:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancelled_appointments`
--

CREATE TABLE `cancelled_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `justification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_by_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cancelled_appointments`
--

INSERT INTO `cancelled_appointments` (`id`, `appointment_id`, `justification`, `cancelled_by_id`, `created_at`, `updated_at`) VALUES
(1, 4, 'No pude', 3, '2022-03-05 06:12:08', '2022-03-05 06:12:08'),
(2, 3, 'Fui yo', 3, '2022-03-05 19:36:59', '2022-03-05 19:36:59'),
(3, 3306, 'error', 1, '2022-03-10 12:06:32', '2022-03-10 12:06:32'),
(4, 3307, 'tuvo que cancelarse', 1, '2022-03-10 15:17:28', '2022-03-10 15:17:28'),
(5, 3313, 'prueba fin', 1, '2022-03-11 02:38:29', '2022-03-11 02:38:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_25_053701_create_specialties_table', 1),
(6, '2022_02_27_172247_create_work_days_table', 1),
(7, '2022_02_27_233135_create_specialty_user_table', 1),
(8, '2022_02_27_233139_create_appointments_table', 1),
(9, '2022_03_05_042938_create_cancelled_appointments_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

CREATE TABLE `specialties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Nefrólogo', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(2, 'Oftalmólogía', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(3, 'Pediatría', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(4, 'Neurología', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialty_user`
--

CREATE TABLE `specialty_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specialty_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specialty_user`
--

INSERT INTO `specialty_user` (`id`, `specialty_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(2, 2, 4, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(3, 2, 5, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(4, 2, 6, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(5, 3, 7, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(6, 3, 8, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(7, 3, 9, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(8, 4, 10, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(9, 4, 11, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(10, 4, 12, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(11, 4, 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `dni`, `address`, `phone`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Juan Pérez', 'jperez@demo.com', NULL, NULL, NULL, NULL, 'admin', '$2y$10$sarT4qUx1tvCPN/3Q4G7pe7FsjhzKer6jEv0gtjJFJLwzglB2lv3G', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(2, 'Médico Test', 'doctor@demo.com', NULL, NULL, NULL, NULL, 'doctor', '$2y$10$TNSBH3hi7ogKk19hYlo9Yedjn9mJRJR0ty8oN8n/FbiZxYcuiWdBm', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(3, 'Paciente Test', 'patient@demo.com', NULL, NULL, NULL, NULL, 'patient', '$2y$10$mKhXQp926I9CKULvWNL5nOwjQHMKgwUOhHzluwuhBUns72kyP6QjK', NULL, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(4, 'Alfonso Krajcik', 'hilda25@example.org', '2022-03-05 02:35:30', '7664004983', '7412 Mitchel Passage Suite 793\nJamisonfort, VT 46600', '8391551555', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kUlJuy01nU', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(5, 'Tara Barrows V', 'krajcik.luisa@example.org', '2022-03-05 02:35:30', '5600508781', '4602 Valentin Mission\nToyville, DE 75158-8215', '8181555190', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VNZPfdSIEx', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(6, 'Prof. Carey Leannon Sr.', 'iernser@example.net', '2022-03-05 02:35:30', '9635898060', '8882 Kerluke Mall Suite 898\nEast Briamouth, KY 69326-8409', '1804596717', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kb6wOdiUBc', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(7, 'Trevor Hoppe', 'mbreitenberg@example.net', '2022-03-05 02:35:30', '2816276322', '94155 Mohr Dale Suite 412\nSusanaville, SD 10899-3170', '3809996099', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OhGAP61xcX', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(8, 'Marlon Pfeffer', 'london36@example.net', '2022-03-05 02:35:30', '1575233877', '60285 Bianka River\nOletaport, TN 26176-8638', '9778199449', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2JBEApH5q0', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(9, 'Dortha Maggio', 'koepp.juwan@example.com', '2022-03-05 02:35:30', '7138914959', '709 Cydney Parks\nEast Rachel, MI 17826', '8666064538', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PLdVuCTn2m', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(10, 'Lacey Yundt II', 'gretchen.christiansen@example.com', '2022-03-05 02:35:30', '5261471320', '46719 Bosco Corners Suite 400\nPort Janiya, WV 93926-8039', '9129781479', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4lWmaS38fd', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(11, 'Mrs. Helga Ferry Jr.', 'jonathon.durgan@example.net', '2022-03-05 02:35:30', '7166144294', '67893 Jason Place Apt. 932\nWilliamsonfurt, IN 56835-8944', '5101897531', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7UaEzzdLaj', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(12, 'Tanya Hickle', 'cleveland46@example.com', '2022-03-05 02:35:30', '6984502890', '212 Noemie Island Apt. 723\nReichelview, CT 55881-6462', '8557871812', 'doctor', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C2XoIDKOkp', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(13, 'Terence Champlin', 'gutkowski.andy@example.org', '2022-03-05 02:35:30', '9571249031', '21765 Steve Center\nNorth Carolshire, MD 66823-8770', '2446396986', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Om0LezZ8SB', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(14, 'Wade Considine III', 'dheller@example.org', '2022-03-05 02:35:30', '4475860698', '430 Tyshawn Highway Apt. 573\nWest Cruz, SC 88888-0531', '1727187633', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'M8qXu029jA', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(15, 'Kaelyn Abshire', 'clark86@example.com', '2022-03-05 02:35:30', '9385804065', '736 Lester Mews\nOwenville, KY 68535', '7268340995', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aVpJ92lqVc', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(16, 'Thad Dicki', 'littel.madisen@example.org', '2022-03-05 02:35:30', '7013980362', '40417 Cole Haven Suite 975\nHaagton, VA 32859', '6491251351', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xKQrcx4AeB', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(17, 'Marcelle Gulgowski I', 'zwest@example.org', '2022-03-05 02:35:30', '1374303061', '3876 Hagenes Dam Suite 136\nNathanielton, AK 70312-3302', '1753219727', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MIp2oYb93O', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(18, 'Mr. Ken O\'Keefe DVM', 'adoyle@example.com', '2022-03-05 02:35:30', '7253452209', '16203 Heidenreich Way\nAltenwerthbury, NE 17293-4503', '5741985193', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gOqaGWn3F5', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(19, 'Ms. Kitty Ankunding II', 'rozella.blanda@example.net', '2022-03-05 02:35:30', '2524558398', '586 Morissette Ridge Suite 128\nEast Dejonburgh, PA 95203-1953', '3795321571', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UwPGSx1kga', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(20, 'Esperanza Goldner', 'gladys.skiles@example.net', '2022-03-05 02:35:30', '5430817614', '75252 Gislason Extensions Apt. 819\nGloriahaven, NY 54073-4365', '4782123362', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4wBJdF8JRl', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(21, 'Will Green Sr.', 'denesik.nedra@example.org', '2022-03-05 02:35:30', '8164446674', '5718 Carmen Mill\nKohlermouth, SC 54178-0777', '3121513546', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CT4idW0fpn', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(22, 'Melisa Johnston V', 'schimmel.coby@example.net', '2022-03-05 02:35:30', '7359770907', '41751 Jarret Corners\nPrudencetown, MI 14230-6527', '4650334331', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gIKh3CIpLz', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(23, 'Jamar Wiza', 'hubert.yost@example.org', '2022-03-05 02:35:30', '9979267645', '12185 Gorczany Mountains Suite 856\nEmardburgh, OR 67006', '6184319785', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ipm0NSvBuc', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(24, 'Kristin Thompson', 'thalia.cormier@example.org', '2022-03-05 02:35:30', '4807634383', '60092 Uriah Key Suite 349\nColeside, KY 36301', '9971613400', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KzzbuYXUvM', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(25, 'Joanny Champlin', 'carol.kozey@example.com', '2022-03-05 02:35:30', '9394334932', '7514 Lydia Burgs\nFaustoside, RI 50843', '9441615030', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tkvDvMjgnG', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(26, 'Soledad Halvorson', 'ledner.brad@example.com', '2022-03-05 02:35:30', '4954028226', '763 Nikko Highway Apt. 244\nMeganefurt, NM 46855', '9488285539', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JYofh49pOj', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(27, 'Dr. Leila Brown', 'mueller.elisha@example.com', '2022-03-05 02:35:30', '4370785695', '5702 Olin Ridge\nLake Gustavetown, NY 12294', '3556860339', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '23aaY5XpmP', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(28, 'Kendra Lind', 'chadd.schuster@example.net', '2022-03-05 02:35:30', '8763980065', '777 Herta Square Suite 900\nEast Johan, OK 13473', '6075372013', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jIwcCW4KXF', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(29, 'Ms. Elisha Douglas PhD', 'ratke.junior@example.net', '2022-03-05 02:35:30', '2106849959', '994 Reyna Passage\nEast Christelle, WA 94883', '2944684266', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sMIdzKqJbn', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(30, 'Delta Ritchie III', 'zgulgowski@example.org', '2022-03-05 02:35:30', '5213406872', '9504 Labadie Pines Suite 227\nEast Jean, ND 62746', '6947133346', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qRAJHeWTyF', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(31, 'Santiago Bartoletti DVM', 'bpurdy@example.com', '2022-03-05 02:35:30', '8034334100', '3996 Waino Island Apt. 964\nLake Jocelynport, MS 52077-8988', '2499350232', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JN4QETvU8R', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(32, 'Karina Gislason', 'stephen71@example.org', '2022-03-05 02:35:30', '9148769283', '683 Eloise Forges Suite 779\nKohlerborough, AL 44604-8778', '4235924363', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4ExKAGF8Gx', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(33, 'Antoinette Klocko I', 'clay06@example.net', '2022-03-05 02:35:30', '1265959935', '35430 Ellis Valleys\nNew Elroyville, FL 86704-8476', '5127869135', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dVmrjejtgm', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(34, 'Mr. Harmon Reynolds DVM', 'koelpin.wilfred@example.com', '2022-03-05 02:35:30', '7759374215', '6656 Crooks Drives\nDonnellyberg, HI 90632-2087', '7280947158', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'w9AjH5VDJA', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(35, 'Mrs. Luella Walker III', 'jerrold60@example.org', '2022-03-05 02:35:30', '2428936914', '1118 Mattie Mount Suite 842\nNew Kathryne, LA 98575-3796', '6227389155', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0hwbIGHIf5', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(36, 'Margaretta Langworth', 'jzieme@example.org', '2022-03-05 02:35:30', '6602434512', '331 Marley Valley Apt. 918\nPort Lazaro, WY 56023-7518', '8251970891', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aZBgxAQGNv', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(37, 'Willa Howell', 'emard.nova@example.net', '2022-03-05 02:35:30', '5622984812', '3843 Blick Parkway\nPort Jeramieside, WI 04378-4086', '4094646901', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pfFKENqo8K', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(38, 'Angel Waters Sr.', 'lexi.ernser@example.com', '2022-03-05 02:35:30', '5143990427', '2279 Graham Lane\nSouth Agnes, FL 24078', '4911891762', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IDlQSGbdaP', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(39, 'Zachariah Davis II', 'maryse.langosh@example.org', '2022-03-05 02:35:30', '8372591111', '1781 Huels Circles\nPort Jensen, ME 28029-7879', '8568758696', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'U2VewAJE9m', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(40, 'Elta Harvey V', 'grady59@example.org', '2022-03-05 02:35:30', '3444664414', '4971 Simeon Dale Apt. 040\nNew Dylanton, WA 56494-3351', '6499764057', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XRbdlGK9VY', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(41, 'Verda Cummerata', 'aparker@example.org', '2022-03-05 02:35:30', '1607271384', '2289 Robel Freeway\nMargiefort, TX 01550', '9529060540', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gw5Y6BIRHH', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(42, 'Eduardo Fisher', 'ibartoletti@example.org', '2022-03-05 02:35:30', '7383525198', '3097 Halle Throughway Apt. 843\nPort Estefaniashire, OH 52296-9631', '7843763909', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8iwG48eCva', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(43, 'Prof. Lacy Macejkovic MD', 'dschuppe@example.org', '2022-03-05 02:35:30', '8222906051', '5388 Schmeler Lakes\nQueenieport, MO 84068', '1251463181', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PZAaJanNWQ', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(44, 'Mr. Dino Blanda', 'nwintheiser@example.com', '2022-03-05 02:35:30', '5437717098', '389 Guillermo Stream\nNorth Alexandreton, FL 75661-1127', '2597502394', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AZfgihgW6i', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(45, 'Prof. Marcos Crooks', 'clinton87@example.net', '2022-03-05 02:35:30', '5159627684', '47328 Sydnie Mount Suite 545\nLake Aubrey, MA 42833-4805', '6918993127', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SV8hEPiiYj', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(46, 'Reece DuBuque', 'kyler61@example.org', '2022-03-05 02:35:30', '1417134743', '546 Torphy Walk\nAthenastad, WV 56260-1914', '5128719718', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'U6nPVC3yqL', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(47, 'Alexa Koch', 'aglae.carroll@example.net', '2022-03-05 02:35:30', '1288144599', '58028 Sanford Lake Apt. 781\nAdamsville, RI 75261-4053', '5923458171', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aKLPu6VAk3', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(48, 'Letitia Kuhn IV', 'tstehr@example.com', '2022-03-05 02:35:30', '7749071959', '562 McKenzie Ford Apt. 938\nTyreeton, RI 83395-6982', '4209993910', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't02YBYHuUd', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(49, 'Vicky Gibson', 'neal.effertz@example.net', '2022-03-05 02:35:30', '4226589939', '722 White Pass\nEast Nathanberg, WI 86053', '8329413194', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f7JREESEcn', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(50, 'Flavie Kessler', 'macejkovic.aurelia@example.org', '2022-03-05 02:35:30', '9294377034', '1562 Ernest Village Suite 340\nElfriedaview, AZ 88121-5419', '3778525213', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6ymAOhSIwl', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(51, 'Dr. Josie Kuvalis IV', 'ijacobson@example.org', '2022-03-05 02:35:30', '1276606509', '8875 Schultz Bridge Apt. 331\nNorth Ollieborough, MT 74562', '9784167381', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7omEWeVuA9', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(52, 'Laney Reichel', 'tommie.von@example.org', '2022-03-05 02:35:30', '8091795069', '42541 Imogene Springs\nNickolaston, DC 86080', '6294795373', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jB8Olht9GT', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(53, 'Eloy Larson', 'bridgette.spencer@example.com', '2022-03-05 02:35:30', '6545836002', '954 Pearlie Dam Apt. 644\nLake Hadleymouth, NY 60371-0386', '3803360385', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pX3H1dMl4K', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(54, 'Troy Ward III', 'rippin.trudie@example.net', '2022-03-05 02:35:30', '2436385729', '1047 Aufderhar Parkways\nLake Alisa, DC 92444', '5274448392', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hWDt78CwRV', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(55, 'Aric Williamson', 'albert18@example.net', '2022-03-05 02:35:30', '6122991495', '18210 Jeanie Plains Suite 662\nWest Elyssa, MI 65236-0893', '2378162117', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cgZUb23idD', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(56, 'Nola Bahringer', 'blanca58@example.org', '2022-03-05 02:35:30', '1257825347', '27920 Johnathan Stravenue\nConnmouth, NH 57694-3138', '7467858414', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hC6qIfHmnR', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(57, 'Mr. Jovani Romaguera II', 'adriana.hermiston@example.net', '2022-03-05 02:35:30', '9290305893', '1170 Velva Mission Suite 113\nForresttown, MS 37981', '8770200166', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CHQSOY0mXl', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(58, 'Miss Emma Larkin DDS', 'kuhlman.dagmar@example.net', '2022-03-05 02:35:30', '9975163759', '4690 Kelley Prairie Apt. 499\nNorth Ava, TX 08746-9769', '1483132908', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YP0z79V4gW', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(59, 'Hayden Mohr', 'fahey.branson@example.com', '2022-03-05 02:35:30', '8929957762', '5455 Aufderhar Crossroad\nPort Cortezchester, FL 70401', '1499368965', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Plg9NbO3nV', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(60, 'Abelardo Koepp', 'anya05@example.org', '2022-03-05 02:35:30', '1864045008', '8015 Flossie Lakes Apt. 557\nNorth Dashawnmouth, DE 55290-2596', '1171536211', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yq8pFhVjOg', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(61, 'Dr. Shad Rau', 'gleason.kamren@example.com', '2022-03-05 02:35:30', '9637585566', '494 Maudie Route Suite 743\nLenoremouth, MT 97034', '7022796057', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lxRCWPOAed', '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(62, 'Miss Clare Cassin', 'isobel06@example.com', '2022-03-05 02:35:30', '6434732929', '935 Alba Streets Suite 367\nLake Danteview, TX 39903-1027', '1608988597', 'patient', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tx9tPvJf4X', '2022-03-05 02:35:30', '2022-03-05 02:35:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `work_days`
--

CREATE TABLE `work_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day` smallint(5) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `morning_start` time NOT NULL,
  `morning_end` time NOT NULL,
  `afternoon_start` time NOT NULL,
  `afternoon_end` time NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `work_days`
--

INSERT INTO `work_days` (`id`, `day`, `active`, `morning_start`, `morning_end`, `afternoon_start`, `afternoon_end`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(2, 1, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(3, 2, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(4, 3, 1, '07:00:00', '09:30:00', '15:00:00', '18:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(5, 4, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(6, 5, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30'),
(7, 6, 0, '05:00:00', '05:00:00', '13:00:00', '13:00:00', 2, '2022-03-05 02:35:30', '2022-03-05 02:35:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_specialty_id_foreign` (`specialty_id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `cancelled_appointments`
--
ALTER TABLE `cancelled_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancelled_appointments_appointment_id_foreign` (`appointment_id`),
  ADD KEY `cancelled_appointments_cancelled_by_foreign` (`cancelled_by_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specialties_name_unique` (`name`);

--
-- Indices de la tabla `specialty_user`
--
ALTER TABLE `specialty_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialty_user_user_id_foreign` (`user_id`),
  ADD KEY `specialty_user_specialty_id_foreign` (`specialty_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `work_days`
--
ALTER TABLE `work_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_days_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3318;

--
-- AUTO_INCREMENT de la tabla `cancelled_appointments`
--
ALTER TABLE `cancelled_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `specialty_user`
--
ALTER TABLE `specialty_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `work_days`
--
ALTER TABLE `work_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`);

--
-- Filtros para la tabla `cancelled_appointments`
--
ALTER TABLE `cancelled_appointments`
  ADD CONSTRAINT `cancelled_appointments_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `cancelled_appointments_cancelled_by_foreign` FOREIGN KEY (`cancelled_by_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `specialty_user`
--
ALTER TABLE `specialty_user`
  ADD CONSTRAINT `specialty_user_specialty_id_foreign` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`),
  ADD CONSTRAINT `specialty_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `work_days`
--
ALTER TABLE `work_days`
  ADD CONSTRAINT `work_days_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
