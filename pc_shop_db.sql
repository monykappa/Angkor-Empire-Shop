-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 02:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_emailaddress`
--

INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
(2, 'ouddommonyk@gmail.com', 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements_advertisement`
--

CREATE TABLE `advertisements_advertisement` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisements_advertisement`
--

INSERT INTO `advertisements_advertisement` (`id`, `title`, `image`, `created_at`, `priority`) VALUES
(1, 'Ads-1', 'advertisements/images/ads-1.jpg', '2024-07-01 07:46:14.987106', 0),
(2, 'Ads-2', 'advertisements/images/ads-2.jpg', '2024-07-01 07:46:21.805820', 0),
(3, 'Ads-3', 'advertisements/images/ads-3.jpg', '2024-07-01 07:46:28.171970', 0),
(5, 'Ad-4', 'advertisements/images/ads-4_va6Dl4Q.jpg', '2024-07-14 11:39:49.244056', 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_apikey`
--

CREATE TABLE `api_apikey` (
  `id` bigint(20) NOT NULL,
  `key` char(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add battery spec', 7, 'add_batteryspec'),
(26, 'Can change battery spec', 7, 'change_batteryspec'),
(27, 'Can delete battery spec', 7, 'delete_batteryspec'),
(28, 'Can view battery spec', 7, 'view_batteryspec'),
(29, 'Can add brand', 8, 'add_brand'),
(30, 'Can change brand', 8, 'change_brand'),
(31, 'Can delete brand', 8, 'delete_brand'),
(32, 'Can view brand', 8, 'view_brand'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add color', 10, 'add_color'),
(38, 'Can change color', 10, 'change_color'),
(39, 'Can delete color', 10, 'delete_color'),
(40, 'Can view color', 10, 'view_color'),
(41, 'Can add cpu brand', 11, 'add_cpubrand'),
(42, 'Can change cpu brand', 11, 'change_cpubrand'),
(43, 'Can delete cpu brand', 11, 'delete_cpubrand'),
(44, 'Can view cpu brand', 11, 'view_cpubrand'),
(45, 'Can add display spec', 12, 'add_displayspec'),
(46, 'Can change display spec', 12, 'change_displayspec'),
(47, 'Can delete display spec', 12, 'delete_displayspec'),
(48, 'Can view display spec', 12, 'view_displayspec'),
(49, 'Can add gpu brand', 13, 'add_gpubrand'),
(50, 'Can change gpu brand', 13, 'change_gpubrand'),
(51, 'Can delete gpu brand', 13, 'delete_gpubrand'),
(52, 'Can view gpu brand', 13, 'view_gpubrand'),
(53, 'Can add memory brand', 14, 'add_memorybrand'),
(54, 'Can change memory brand', 14, 'change_memorybrand'),
(55, 'Can delete memory brand', 14, 'delete_memorybrand'),
(56, 'Can view memory brand', 14, 'view_memorybrand'),
(57, 'Can add operating system', 15, 'add_operatingsystem'),
(58, 'Can change operating system', 15, 'change_operatingsystem'),
(59, 'Can delete operating system', 15, 'delete_operatingsystem'),
(60, 'Can view operating system', 15, 'view_operatingsystem'),
(61, 'Can add port spec', 16, 'add_portspec'),
(62, 'Can change port spec', 16, 'change_portspec'),
(63, 'Can delete port spec', 16, 'delete_portspec'),
(64, 'Can view port spec', 16, 'view_portspec'),
(65, 'Can add storage brand', 17, 'add_storagebrand'),
(66, 'Can change storage brand', 17, 'change_storagebrand'),
(67, 'Can delete storage brand', 17, 'delete_storagebrand'),
(68, 'Can view storage brand', 17, 'view_storagebrand'),
(69, 'Can add webcam spec', 18, 'add_webcamspec'),
(70, 'Can change webcam spec', 18, 'change_webcamspec'),
(71, 'Can delete webcam spec', 18, 'delete_webcamspec'),
(72, 'Can view webcam spec', 18, 'view_webcamspec'),
(73, 'Can add wireless connectivity', 19, 'add_wirelessconnectivity'),
(74, 'Can change wireless connectivity', 19, 'change_wirelessconnectivity'),
(75, 'Can delete wireless connectivity', 19, 'delete_wirelessconnectivity'),
(76, 'Can view wireless connectivity', 19, 'view_wirelessconnectivity'),
(77, 'Can add cpu spec', 20, 'add_cpuspec'),
(78, 'Can change cpu spec', 20, 'change_cpuspec'),
(79, 'Can delete cpu spec', 20, 'delete_cpuspec'),
(80, 'Can view cpu spec', 20, 'view_cpuspec'),
(81, 'Can add gpu spec', 21, 'add_gpuspec'),
(82, 'Can change gpu spec', 21, 'change_gpuspec'),
(83, 'Can delete gpu spec', 21, 'delete_gpuspec'),
(84, 'Can view gpu spec', 21, 'view_gpuspec'),
(85, 'Can add memory spec', 22, 'add_memoryspec'),
(86, 'Can change memory spec', 22, 'change_memoryspec'),
(87, 'Can delete memory spec', 22, 'delete_memoryspec'),
(88, 'Can view memory spec', 22, 'view_memoryspec'),
(89, 'Can add product', 23, 'add_product'),
(90, 'Can change product', 23, 'change_product'),
(91, 'Can delete product', 23, 'delete_product'),
(92, 'Can view product', 23, 'view_product'),
(93, 'Can add product image', 24, 'add_productimage'),
(94, 'Can change product image', 24, 'change_productimage'),
(95, 'Can delete product image', 24, 'delete_productimage'),
(96, 'Can view product image', 24, 'view_productimage'),
(97, 'Can add stock', 25, 'add_stock'),
(98, 'Can change stock', 25, 'change_stock'),
(99, 'Can delete stock', 25, 'delete_stock'),
(100, 'Can view stock', 25, 'view_stock'),
(101, 'Can add storage spec', 26, 'add_storagespec'),
(102, 'Can change storage spec', 26, 'change_storagespec'),
(103, 'Can delete storage spec', 26, 'delete_storagespec'),
(104, 'Can view storage spec', 26, 'view_storagespec'),
(105, 'Can add laptop spec', 27, 'add_laptopspec'),
(106, 'Can change laptop spec', 27, 'change_laptopspec'),
(107, 'Can delete laptop spec', 27, 'delete_laptopspec'),
(108, 'Can view laptop spec', 27, 'view_laptopspec'),
(109, 'Can add order', 28, 'add_order'),
(110, 'Can change order', 28, 'change_order'),
(111, 'Can delete order', 28, 'delete_order'),
(112, 'Can view order', 28, 'view_order'),
(113, 'Can add cart item', 29, 'add_cartitem'),
(114, 'Can change cart item', 29, 'change_cartitem'),
(115, 'Can delete cart item', 29, 'delete_cartitem'),
(116, 'Can view cart item', 29, 'view_cartitem'),
(117, 'Can add order history', 30, 'add_orderhistory'),
(118, 'Can change order history', 30, 'change_orderhistory'),
(119, 'Can delete order history', 30, 'delete_orderhistory'),
(120, 'Can view order history', 30, 'view_orderhistory'),
(121, 'Can add order history item', 31, 'add_orderhistoryitem'),
(122, 'Can change order history item', 31, 'change_orderhistoryitem'),
(123, 'Can delete order history item', 31, 'delete_orderhistoryitem'),
(124, 'Can view order history item', 31, 'view_orderhistoryitem'),
(125, 'Can add address', 32, 'add_address'),
(126, 'Can change address', 32, 'change_address'),
(127, 'Can delete address', 32, 'delete_address'),
(128, 'Can view address', 32, 'view_address'),
(129, 'Can add user profile', 33, 'add_userprofile'),
(130, 'Can change user profile', 33, 'change_userprofile'),
(131, 'Can delete user profile', 33, 'delete_userprofile'),
(132, 'Can view user profile', 33, 'view_userprofile'),
(133, 'Can add advertisement', 34, 'add_advertisement'),
(134, 'Can change advertisement', 34, 'change_advertisement'),
(135, 'Can delete advertisement', 34, 'delete_advertisement'),
(136, 'Can view advertisement', 34, 'view_advertisement'),
(137, 'Can add site', 35, 'add_site'),
(138, 'Can change site', 35, 'change_site'),
(139, 'Can delete site', 35, 'delete_site'),
(140, 'Can view site', 35, 'view_site'),
(141, 'Can add email address', 36, 'add_emailaddress'),
(142, 'Can change email address', 36, 'change_emailaddress'),
(143, 'Can delete email address', 36, 'delete_emailaddress'),
(144, 'Can view email address', 36, 'view_emailaddress'),
(145, 'Can add email confirmation', 37, 'add_emailconfirmation'),
(146, 'Can change email confirmation', 37, 'change_emailconfirmation'),
(147, 'Can delete email confirmation', 37, 'delete_emailconfirmation'),
(148, 'Can view email confirmation', 37, 'view_emailconfirmation'),
(149, 'Can add social account', 38, 'add_socialaccount'),
(150, 'Can change social account', 38, 'change_socialaccount'),
(151, 'Can delete social account', 38, 'delete_socialaccount'),
(152, 'Can view social account', 38, 'view_socialaccount'),
(153, 'Can add social application', 39, 'add_socialapp'),
(154, 'Can change social application', 39, 'change_socialapp'),
(155, 'Can delete social application', 39, 'delete_socialapp'),
(156, 'Can view social application', 39, 'view_socialapp'),
(157, 'Can add social application token', 40, 'add_socialtoken'),
(158, 'Can change social application token', 40, 'change_socialtoken'),
(159, 'Can delete social application token', 40, 'delete_socialtoken'),
(160, 'Can view social application token', 40, 'view_socialtoken'),
(161, 'Can add PayPal IPN', 41, 'add_paypalipn'),
(162, 'Can change PayPal IPN', 41, 'change_paypalipn'),
(163, 'Can delete PayPal IPN', 41, 'delete_paypalipn'),
(164, 'Can view PayPal IPN', 41, 'view_paypalipn'),
(165, 'Can add menu item', 42, 'add_menuitem'),
(166, 'Can change menu item', 42, 'change_menuitem'),
(167, 'Can delete menu item', 42, 'delete_menuitem'),
(168, 'Can view menu item', 42, 'view_menuitem'),
(169, 'Can add footer', 43, 'add_footer'),
(170, 'Can change footer', 43, 'change_footer'),
(171, 'Can delete footer', 43, 'delete_footer'),
(172, 'Can view footer', 43, 'view_footer'),
(173, 'Can add social media link', 44, 'add_socialmedialink'),
(174, 'Can change social media link', 44, 'change_socialmedialink'),
(175, 'Can delete social media link', 44, 'delete_socialmedialink'),
(176, 'Can view social media link', 44, 'view_socialmedialink'),
(177, 'Can add about us', 45, 'add_aboutus'),
(178, 'Can change about us', 45, 'change_aboutus'),
(179, 'Can delete about us', 45, 'delete_aboutus'),
(180, 'Can view about us', 45, 'view_aboutus'),
(181, 'Can add contact us', 46, 'add_contactus'),
(182, 'Can change contact us', 46, 'change_contactus'),
(183, 'Can delete contact us', 46, 'delete_contactus'),
(184, 'Can view contact us', 46, 'view_contactus'),
(185, 'Can add delivery staff', 47, 'add_deliverystaff'),
(186, 'Can change delivery staff', 47, 'change_deliverystaff'),
(187, 'Can delete delivery staff', 47, 'delete_deliverystaff'),
(188, 'Can view delivery staff', 47, 'view_deliverystaff'),
(189, 'Can add delivery assignment', 48, 'add_deliveryassignment'),
(190, 'Can change delivery assignment', 48, 'change_deliveryassignment'),
(191, 'Can delete delivery assignment', 48, 'delete_deliveryassignment'),
(192, 'Can view delivery assignment', 48, 'view_deliveryassignment'),
(193, 'Can add delivery assignment history', 49, 'add_deliveryassignmenthistory'),
(194, 'Can change delivery assignment history', 49, 'change_deliveryassignmenthistory'),
(195, 'Can delete delivery assignment history', 49, 'delete_deliveryassignmenthistory'),
(196, 'Can view delivery assignment history', 49, 'view_deliveryassignmenthistory'),
(197, 'Can add notification', 50, 'add_notification'),
(198, 'Can change notification', 50, 'change_notification'),
(199, 'Can delete notification', 50, 'delete_notification'),
(200, 'Can view notification', 50, 'view_notification'),
(201, 'Can add discount', 51, 'add_discount'),
(202, 'Can change discount', 51, 'change_discount'),
(203, 'Can delete discount', 51, 'delete_discount'),
(204, 'Can view discount', 51, 'view_discount'),
(205, 'Can add product review', 52, 'add_productreview'),
(206, 'Can change product review', 52, 'change_productreview'),
(207, 'Can delete product review', 52, 'delete_productreview'),
(208, 'Can view product review', 52, 'view_productreview'),
(209, 'Can add event', 53, 'add_event'),
(210, 'Can change event', 53, 'change_event'),
(211, 'Can delete event', 53, 'delete_event'),
(212, 'Can view event', 53, 'view_event'),
(213, 'Can add social media', 54, 'add_socialmedia'),
(214, 'Can change social media', 54, 'change_socialmedia'),
(215, 'Can delete social media', 54, 'delete_socialmedia'),
(216, 'Can view social media', 54, 'view_socialmedia'),
(217, 'Can add order address', 55, 'add_orderaddress'),
(218, 'Can change order address', 55, 'change_orderaddress'),
(219, 'Can delete order address', 55, 'delete_orderaddress'),
(220, 'Can view order address', 55, 'view_orderaddress'),
(221, 'Can add user preferences', 56, 'add_userpreferences'),
(222, 'Can change user preferences', 56, 'change_userpreferences'),
(223, 'Can delete user preferences', 56, 'delete_userpreferences'),
(224, 'Can view user preferences', 56, 'view_userpreferences'),
(225, 'Can add refresh rate', 57, 'add_refreshrate'),
(226, 'Can change refresh rate', 57, 'change_refreshrate'),
(227, 'Can delete refresh rate', 57, 'delete_refreshrate'),
(228, 'Can view refresh rate', 57, 'view_refreshrate'),
(229, 'Can add resolution spec', 58, 'add_resolutionspec'),
(230, 'Can change resolution spec', 58, 'change_resolutionspec'),
(231, 'Can delete resolution spec', 58, 'delete_resolutionspec'),
(232, 'Can view resolution spec', 58, 'view_resolutionspec'),
(233, 'Can add api key', 59, 'add_apikey'),
(234, 'Can change api key', 59, 'change_apikey'),
(235, 'Can delete api key', 59, 'delete_apikey'),
(236, 'Can view api key', 59, 'view_apikey'),
(237, 'Can add rating', 60, 'add_rating'),
(238, 'Can change rating', 60, 'change_rating'),
(239, 'Can delete rating', 60, 'delete_rating'),
(240, 'Can view rating', 60, 'view_rating'),
(241, 'Can add product rating', 61, 'add_productrating'),
(242, 'Can change product rating', 61, 'change_productrating'),
(243, 'Can delete product rating', 61, 'delete_productrating'),
(244, 'Can view product rating', 61, 'view_productrating');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, '', '2024-08-19 05:20:22.359901', 0, 'lyhong', 'Ly', 'Hongs', '', 0, 1, '2024-06-24 13:23:28.812070'),
(3, 'pbkdf2_sha256$720000$OmHFjq8vfpHootwMeEzS9Z$Y0uGnruF62Qi1WNPj2QW+eIPO/SOaRBVfkvPaqQXrSM=', '2024-08-19 05:54:03.049620', 0, 'leng', 'Lay', 'keangleng', '', 0, 1, '2024-07-05 09:03:39.000000'),
(4, '!7iuPzJIs7OMtfrpozFvGmXhaokghIdrrzHZASgL5', '2024-07-09 07:53:43.043341', 0, 'kim', 'Kim', 'Ouddommony', '', 0, 1, '2024-07-06 08:27:03.251638'),
(5, 'pbkdf2_sha256$720000$ie6IPBZxPVVXntn543ytcB$MKwPlSSKp4ytI9Br4tTtjge5O9OrG9g7wVyPnVSLxXw=', '2024-08-19 05:56:42.783781', 0, 'delivery', '', '', 'dilvery121@gmail.com', 0, 1, '2024-07-09 03:34:22.000000'),
(6, 'pbkdf2_sha256$720000$o0XzN2mIe3KVFJYuGMQx8f$HqlQNxG+lNcxiQjvCxIdACLfq6JD1G36PSB5TT5cLxw=', '2024-08-19 05:36:44.411030', 0, 'delivery2', '', '', 'delivery2@gmail.com', 0, 1, '2024-07-09 04:08:46.199497'),
(8, 'pbkdf2_sha256$720000$bfKhr96uTMRj7v8fox7RrT$kRk5IQdvmPNTl8sNZ/4hNrHXL2Lg1d+GefRV12EanGA=', '2024-09-03 12:12:36.064774', 1, 'admin', '', '', '', 1, 1, '2024-07-09 11:56:07.000000'),
(9, 'pbkdf2_sha256$720000$M372zxmvCrAJvHhPryFVLY$byRRqa0Vw1RbBiRYMNgOhYaoTeEhYTA17g32qutOyQQ=', '2024-09-03 12:12:28.122600', 0, 'mony', 'Kim', 'Ouddommony', '', 0, 1, '2024-07-10 07:47:07.000000'),
(11, 'pbkdf2_sha256$720000$7vxNglIoZltHfKJ1quXkQl$Zy+/qcbeMO3dIywm5kp4S0dBaaMhTImP9ckba0WRZCQ=', '2024-08-19 07:28:28.925198', 0, 'Staff', '', '', 'staff123123@gmail.com', 1, 1, '2024-07-16 03:52:36.705946'),
(12, 'pbkdf2_sha256$720000$rtrgYD0OcRjC3ulYX4KKaF$nc6M9vUtkeoadSRg2bs69xscJv70kShv5FfsTUWAGas=', '2024-07-16 07:22:59.874471', 0, 'staff2', '', '', 'staff2@gmail.com', 1, 1, '2024-07-16 07:22:53.888604');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(197, 8, 1),
(198, 8, 2),
(199, 8, 3),
(200, 8, 4),
(201, 8, 5),
(202, 8, 6),
(203, 8, 7),
(204, 8, 8),
(205, 8, 9),
(206, 8, 10),
(207, 8, 11),
(208, 8, 12),
(209, 8, 13),
(210, 8, 14),
(211, 8, 15),
(212, 8, 16),
(213, 8, 17),
(214, 8, 18),
(215, 8, 19),
(216, 8, 20),
(217, 8, 21),
(218, 8, 22),
(219, 8, 23),
(220, 8, 24),
(221, 8, 25),
(222, 8, 26),
(223, 8, 27),
(224, 8, 28),
(225, 8, 29),
(226, 8, 30),
(227, 8, 31),
(228, 8, 32),
(229, 8, 33),
(230, 8, 34),
(231, 8, 35),
(232, 8, 36),
(233, 8, 37),
(234, 8, 38),
(235, 8, 39),
(236, 8, 40),
(237, 8, 41),
(238, 8, 42),
(239, 8, 43),
(240, 8, 44),
(241, 8, 45),
(242, 8, 46),
(243, 8, 47),
(244, 8, 48),
(245, 8, 49),
(246, 8, 50),
(247, 8, 51),
(248, 8, 52),
(249, 8, 53),
(250, 8, 54),
(251, 8, 55),
(252, 8, 56),
(253, 8, 57),
(254, 8, 58),
(255, 8, 59),
(256, 8, 60),
(257, 8, 61),
(258, 8, 62),
(259, 8, 63),
(260, 8, 64),
(261, 8, 65),
(262, 8, 66),
(263, 8, 67),
(264, 8, 68),
(265, 8, 69),
(266, 8, 70),
(267, 8, 71),
(268, 8, 72),
(269, 8, 73),
(270, 8, 74),
(271, 8, 75),
(272, 8, 76),
(273, 8, 77),
(274, 8, 78),
(275, 8, 79),
(276, 8, 80),
(277, 8, 81),
(278, 8, 82),
(279, 8, 83),
(280, 8, 84),
(281, 8, 85),
(282, 8, 86),
(283, 8, 87),
(284, 8, 88),
(285, 8, 89),
(286, 8, 90),
(287, 8, 91),
(288, 8, 92),
(289, 8, 93),
(290, 8, 94),
(291, 8, 95),
(292, 8, 96),
(293, 8, 97),
(294, 8, 98),
(295, 8, 99),
(296, 8, 100),
(297, 8, 101),
(298, 8, 102),
(299, 8, 103),
(300, 8, 104),
(301, 8, 105),
(302, 8, 106),
(303, 8, 107),
(304, 8, 108),
(305, 8, 109),
(306, 8, 110),
(307, 8, 111),
(308, 8, 112),
(309, 8, 113),
(310, 8, 114),
(311, 8, 115),
(312, 8, 116),
(313, 8, 117),
(314, 8, 118),
(315, 8, 119),
(316, 8, 120),
(317, 8, 121),
(318, 8, 122),
(319, 8, 123),
(320, 8, 124),
(321, 8, 125),
(322, 8, 126),
(323, 8, 127),
(324, 8, 128),
(325, 8, 129),
(326, 8, 130),
(327, 8, 131),
(328, 8, 132),
(329, 8, 133),
(330, 8, 134),
(331, 8, 135),
(332, 8, 136),
(333, 8, 137),
(334, 8, 138),
(335, 8, 139),
(336, 8, 140),
(337, 8, 141),
(338, 8, 142),
(339, 8, 143),
(340, 8, 144),
(341, 8, 145),
(342, 8, 146),
(343, 8, 147),
(344, 8, 148),
(345, 8, 149),
(346, 8, 150),
(347, 8, 151),
(348, 8, 152),
(349, 8, 153),
(350, 8, 154),
(351, 8, 155),
(352, 8, 156),
(353, 8, 157),
(354, 8, 158),
(355, 8, 159),
(356, 8, 160),
(357, 8, 161),
(358, 8, 162),
(359, 8, 163),
(360, 8, 164),
(361, 8, 165),
(362, 8, 166),
(363, 8, 167),
(364, 8, 168),
(365, 8, 169),
(366, 8, 170),
(367, 8, 171),
(368, 8, 172),
(369, 8, 173),
(370, 8, 174),
(371, 8, 175),
(372, 8, 176),
(373, 8, 177),
(374, 8, 178),
(375, 8, 179),
(376, 8, 180),
(377, 8, 181),
(378, 8, 182),
(379, 8, 183),
(380, 8, 184),
(381, 8, 185),
(382, 8, 186),
(383, 8, 187),
(384, 8, 188),
(385, 8, 189),
(386, 8, 190),
(387, 8, 191),
(388, 8, 192),
(389, 8, 193),
(390, 8, 194),
(391, 8, 195),
(392, 8, 196);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_deliveryassignment`
--

CREATE TABLE `delivery_deliveryassignment` (
  `id` bigint(20) NOT NULL,
  `assigned_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `delivery_staff_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_deliveryassignment`
--

INSERT INTO `delivery_deliveryassignment` (`id`, `assigned_at`, `completed_at`, `order_id`, `delivery_staff_id`) VALUES
(2, '2024-07-09 03:39:02.503398', '2024-07-09 03:43:07.805203', 8, 3),
(3, '2024-07-09 04:20:39.825330', '2024-07-09 04:39:06.566440', 7, 4),
(6, '2024-07-09 04:32:28.581528', '2024-07-09 07:40:20.289007', 6, 4),
(10, '2024-07-09 08:26:41.475215', '2024-07-09 08:26:59.244641', 9, 4),
(11, '2024-07-09 08:26:41.481327', '2024-07-09 08:27:00.636491', 10, 4),
(12, '2024-07-09 09:33:56.248388', '2024-07-09 09:35:04.576140', 11, 4),
(13, '2024-07-09 09:33:56.250767', '2024-07-09 09:35:06.053318', 12, 4),
(14, '2024-07-09 09:35:45.032773', '2024-07-09 09:37:17.896142', 13, 4),
(15, '2024-07-09 09:36:51.426765', '2024-07-09 09:37:08.483786', 14, 3),
(16, '2024-07-09 09:38:24.663423', '2024-07-10 08:12:29.622835', 15, 3),
(17, '2024-07-09 09:41:52.003036', '2024-07-09 09:48:19.441817', 16, 4),
(18, '2024-07-09 09:41:52.004192', '2024-07-10 08:12:36.559040', 17, 4),
(19, '2024-07-10 08:13:00.904970', '2024-07-10 08:13:46.065818', 18, 4),
(20, '2024-07-10 09:36:16.525589', '2024-07-10 09:39:05.204702', 19, 4),
(21, '2024-07-10 09:43:31.304316', '2024-07-11 07:11:17.782111', 20, 4),
(22, '2024-07-10 11:49:51.098540', '2024-07-10 11:50:01.204087', 21, 3),
(23, '2024-07-11 04:07:44.512835', '2024-07-11 04:07:56.184852', 22, 3),
(24, '2024-07-11 04:19:17.247147', '2024-07-11 04:19:24.158443', 26, 3),
(25, '2024-07-11 04:19:17.247147', '2024-07-11 04:19:25.900263', 27, 3),
(26, '2024-07-11 07:11:10.819998', '2024-07-11 07:11:28.799739', 29, 3),
(27, '2024-07-11 07:17:18.756655', '2024-07-11 07:17:45.945403', 30, 4),
(28, '2024-07-11 07:45:12.167323', '2024-07-11 07:45:17.466177', 31, 4),
(29, '2024-07-12 07:09:52.021092', '2024-07-12 07:09:58.027261', 32, 4),
(52, '2024-07-12 08:10:39.021632', '2024-07-12 08:20:10.143026', 34, 4),
(53, '2024-07-12 08:10:39.023004', '2024-07-12 08:20:08.955332', 35, 4),
(54, '2024-07-12 08:10:39.024023', '2024-07-12 08:20:07.692707', 36, 4),
(55, '2024-07-12 08:18:20.370515', '2024-07-12 08:19:56.147282', 37, 3),
(56, '2024-07-12 08:19:44.956115', '2024-07-12 08:19:57.969495', 38, 3),
(57, '2024-07-12 09:26:03.137003', '2024-07-12 09:26:08.567174', 39, 3),
(58, '2024-07-13 03:33:30.117776', '2024-07-13 03:33:34.835181', 40, 4),
(59, '2024-07-13 03:50:03.819710', '2024-07-13 03:50:08.675584', 41, 3),
(60, '2024-07-13 10:18:58.497907', '2024-07-13 10:19:07.681917', 42, 3),
(61, '2024-07-13 11:46:45.229678', '2024-07-13 11:50:05.873730', 43, 3),
(62, '2024-07-14 07:45:14.856015', '2024-07-14 07:45:35.916095', 44, 4),
(63, '2024-07-14 12:17:58.963903', '2024-07-14 12:18:08.151674', 46, 4),
(64, '2024-07-14 12:18:24.925535', '2024-07-15 04:33:58.666480', 45, 4),
(65, '2024-07-15 04:33:39.087857', '2024-07-15 04:33:51.810617', 47, 3),
(66, '2024-07-16 07:09:18.224281', '2024-07-16 07:14:32.604841', 53, 4),
(67, '2024-07-16 07:09:18.225281', '2024-07-16 07:14:34.394481', 54, 4),
(68, '2024-07-16 07:26:34.797904', '2024-07-16 07:26:48.017270', 48, 3),
(69, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:49.378025', 50, 3),
(70, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:50.613824', 51, 3),
(71, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:51.746022', 52, 3),
(72, '2024-07-17 02:18:48.910941', '2024-07-17 02:19:21.038477', 55, 3),
(73, '2024-07-19 04:09:15.526599', '2024-07-19 04:14:52.113020', 61, 3),
(74, '2024-07-22 02:13:54.013449', '2024-07-22 02:15:09.467982', 62, 3),
(75, '2024-07-22 02:13:54.019970', '2024-07-22 02:15:11.065312', 63, 3),
(76, '2024-07-22 02:19:53.488560', '2024-07-22 02:20:28.811872', 64, 3),
(77, '2024-07-22 10:59:15.604581', '2024-07-22 10:59:30.385372', 65, 4),
(78, '2024-07-22 13:23:39.466192', '2024-07-23 01:28:39.704373', 66, 3),
(79, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:10.746290', 67, 4),
(80, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:13.352117', 68, 4),
(81, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:14.811569', 69, 4),
(82, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:16.098165', 70, 4),
(83, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:54.643320', 71, 4),
(84, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:56.119319', 72, 4),
(85, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:57.476970', 73, 4),
(86, '2024-07-23 01:28:27.529615', '2024-07-23 01:28:58.763754', 74, 4),
(87, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:00.096852', 75, 4),
(88, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:01.352833', 76, 4),
(89, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:02.592324', 77, 4),
(90, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:05.253820', 78, 4),
(91, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:06.649891', 79, 4),
(92, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:07.952748', 80, 4),
(93, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:09.412210', 81, 4),
(94, '2024-07-23 02:04:07.964214', '2024-07-23 02:04:25.382062', 85, 4),
(95, '2024-07-23 02:08:46.523782', '2024-07-23 02:08:54.255927', 84, 3),
(96, '2024-07-23 02:10:22.956495', '2024-07-23 02:10:31.123525', 83, 3),
(97, '2024-07-23 02:21:13.111606', '2024-07-23 02:21:20.668959', 82, 3),
(98, '2024-07-23 02:29:21.154547', '2024-07-25 08:05:43.894535', 86, 4),
(99, '2024-07-26 08:54:30.425653', '2024-07-26 08:54:46.567658', 94, 3),
(100, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:48.321421', 95, 3),
(101, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:49.366751', 96, 3),
(102, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:56.400441', 97, 3),
(103, '2024-07-26 08:54:30.441278', '2024-07-26 08:55:03.829175', 98, 3),
(104, '2024-07-26 08:54:34.291610', '2024-07-26 08:55:25.531957', 89, 4),
(105, '2024-07-26 08:54:34.291610', '2024-07-26 08:55:27.388026', 90, 4),
(106, '2024-07-26 08:54:34.305125', '2024-07-26 08:55:29.242656', 91, 4),
(107, '2024-07-26 08:54:34.305125', '2024-07-26 08:55:31.015371', 92, 4),
(108, '2024-07-26 08:54:34.307632', '2024-07-26 08:55:32.715785', 93, 4),
(109, '2024-07-28 11:24:17.386787', '2024-07-28 11:24:27.160275', 99, 3),
(110, '2024-07-29 03:54:08.870260', '2024-07-29 03:54:18.904561', 100, 3),
(111, '2024-08-07 09:20:56.336446', '2024-08-07 09:21:14.657766', 104, 3),
(112, '2024-08-08 08:01:24.664532', '2024-08-08 08:01:34.339001', 105, 3),
(113, '2024-08-08 08:12:51.654076', '2024-08-08 08:12:58.989163', 101, 3),
(114, '2024-08-08 08:12:51.654076', '2024-08-08 08:13:00.794358', 102, 3),
(115, '2024-08-08 08:41:45.756336', '2024-08-08 08:42:27.693769', 106, 4),
(116, '2024-08-08 08:49:59.837522', '2024-08-08 08:50:08.240226', 107, 4),
(117, '2024-08-08 11:10:20.448447', '2024-08-08 11:10:27.025466', 108, 4),
(118, '2024-08-12 03:10:29.816535', '2024-08-12 03:10:53.620582', 109, 3),
(119, '2024-08-12 06:41:13.460289', '2024-08-12 06:41:32.968676', 110, 4),
(120, '2024-08-12 14:53:09.106878', '2024-08-12 14:53:25.681669', 111, 3),
(121, '2024-08-12 14:53:09.106878', '2024-08-12 14:53:24.403094', 112, 3),
(122, '2024-08-12 14:53:12.001424', '2024-08-12 14:53:39.696586', 113, 4),
(123, '2024-08-12 14:53:12.002441', '2024-08-12 14:53:41.809147', 114, 4),
(124, '2024-08-12 14:53:12.002711', '2024-08-12 14:53:43.167020', 115, 4),
(125, '2024-08-12 15:06:05.170130', '2024-08-12 15:06:13.450706', 116, 4),
(126, '2024-08-18 03:57:30.812358', '2024-08-18 03:58:11.899714', 117, 4),
(127, '2024-08-18 03:57:30.814304', '2024-08-18 03:58:17.481706', 121, 4),
(128, '2024-08-18 03:57:30.814304', '2024-08-18 03:58:26.823728', 122, 4),
(129, '2024-08-18 03:57:50.251501', '2024-08-18 03:57:59.679994', 123, 3),
(130, '2024-08-18 03:57:50.258329', '2024-08-18 03:58:04.103496', 124, 3),
(131, '2024-08-19 05:16:20.913772', '2024-08-19 05:16:37.189684', 125, 3),
(132, '2024-08-19 05:36:26.823606', '2024-08-19 05:36:39.956797', 126, 3),
(133, '2024-08-19 05:36:29.352004', '2024-08-19 05:36:47.981446', 127, 4),
(134, '2024-08-19 05:36:29.352004', '2024-08-19 05:36:49.824625', 128, 4),
(135, '2024-08-19 05:56:38.605932', '2024-08-19 05:56:48.316990', 129, 3);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_deliveryassignmenthistory`
--

CREATE TABLE `delivery_deliveryassignmenthistory` (
  `id` bigint(20) NOT NULL,
  `assigned_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) NOT NULL,
  `delivery_staff_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_deliveryassignmenthistory`
--

INSERT INTO `delivery_deliveryassignmenthistory` (`id`, `assigned_at`, `completed_at`, `delivery_staff_id`, `order_id`) VALUES
(2, '2024-07-09 04:32:28.581528', '2024-07-09 07:40:20.289007', 4, 6),
(4, '2024-07-09 08:26:41.475215', '2024-07-09 08:26:59.244641', 4, 9),
(5, '2024-07-09 08:26:41.481327', '2024-07-09 08:27:00.636491', 4, 10),
(7, '2024-07-09 09:33:56.248388', '2024-07-09 09:35:04.576140', 4, 11),
(8, '2024-07-09 09:33:56.250767', '2024-07-09 09:35:06.053318', 4, 12),
(9, '2024-07-09 09:36:51.426765', '2024-07-09 09:37:08.483786', 3, 14),
(10, '2024-07-09 09:35:45.032773', '2024-07-09 09:37:17.896142', 4, 13),
(11, '2024-07-09 09:41:52.003036', '2024-07-09 09:48:19.441817', 4, 16),
(12, '2024-07-09 09:38:24.663423', '2024-07-10 08:12:29.622835', 3, 15),
(13, '2024-07-09 09:41:52.004192', '2024-07-10 08:12:36.559040', 4, 17),
(14, '2024-07-10 08:13:00.904970', '2024-07-10 08:13:46.065818', 4, 18),
(15, '2024-07-10 09:36:16.525589', '2024-07-10 09:39:05.204702', 4, 19),
(16, '2024-07-10 11:49:51.098540', '2024-07-10 11:50:01.204087', 3, 21),
(17, '2024-07-11 04:07:44.512835', '2024-07-11 04:07:56.184852', 3, 22),
(18, '2024-07-11 04:19:17.247147', '2024-07-11 04:19:24.158443', 3, 26),
(19, '2024-07-11 04:19:17.247147', '2024-07-11 04:19:25.900263', 3, 27),
(20, '2024-07-10 09:43:31.304316', '2024-07-11 07:11:17.782111', 4, 20),
(21, '2024-07-11 07:11:10.819998', '2024-07-11 07:11:28.799739', 3, 29),
(22, '2024-07-11 07:17:18.756655', '2024-07-11 07:17:45.945403', 4, 30),
(23, '2024-07-11 07:45:12.167323', '2024-07-11 07:45:17.466177', 4, 31),
(24, '2024-07-12 07:09:52.021092', '2024-07-12 07:09:58.027261', 4, 32),
(25, '2024-07-12 08:18:20.370515', '2024-07-12 08:19:56.147282', 3, 37),
(26, '2024-07-12 08:19:44.956115', '2024-07-12 08:19:57.969495', 3, 38),
(27, '2024-07-12 08:10:39.024023', '2024-07-12 08:20:07.692707', 4, 36),
(28, '2024-07-12 08:10:39.023004', '2024-07-12 08:20:08.955332', 4, 35),
(29, '2024-07-12 08:10:39.021632', '2024-07-12 08:20:10.143026', 4, 34),
(30, '2024-07-12 09:26:03.137003', '2024-07-12 09:26:08.567174', 3, 39),
(31, '2024-07-13 03:33:30.117776', '2024-07-13 03:33:34.835181', 4, 40),
(32, '2024-07-13 03:50:03.819710', '2024-07-13 03:50:08.675584', 3, 41),
(33, '2024-07-13 10:18:58.497907', '2024-07-13 10:19:07.681917', 3, 42),
(34, '2024-07-13 11:46:45.229678', '2024-07-13 11:50:05.873730', 3, 43),
(35, '2024-07-14 07:45:14.856015', '2024-07-14 07:45:35.916095', 4, 44),
(36, '2024-07-14 12:17:58.963903', '2024-07-14 12:18:08.151674', 4, 46),
(37, '2024-07-15 04:33:39.087857', '2024-07-15 04:33:51.810617', 3, 47),
(38, '2024-07-14 12:18:24.925535', '2024-07-15 04:33:58.666480', 4, 45),
(39, '2024-07-16 07:09:18.224281', '2024-07-16 07:14:32.604841', 4, 53),
(40, '2024-07-16 07:09:18.225281', '2024-07-16 07:14:34.394481', 4, 54),
(41, '2024-07-16 07:26:34.797904', '2024-07-16 07:26:48.017270', 3, 48),
(42, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:49.378025', 3, 50),
(43, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:50.613824', 3, 51),
(44, '2024-07-16 07:26:34.803727', '2024-07-16 07:26:51.746022', 3, 52),
(45, '2024-07-17 02:18:48.910941', '2024-07-17 02:19:21.038477', 3, 55),
(46, '2024-07-19 04:09:15.526599', '2024-07-19 04:14:52.113020', 3, 61),
(48, '2024-07-22 02:13:54.013449', '2024-07-22 02:15:09.467982', 3, 62),
(49, '2024-07-22 02:13:54.019970', '2024-07-22 02:15:11.065312', 3, 63),
(50, '2024-07-22 02:19:53.488560', '2024-07-22 02:20:28.811872', 3, 64),
(51, '2024-07-22 10:59:15.604581', '2024-07-22 10:59:30.385372', 4, 65),
(52, '2024-07-22 13:23:39.466192', '2024-07-23 01:28:39.704373', 3, 66),
(53, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:54.643320', 4, 71),
(54, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:56.119319', 4, 72),
(55, '2024-07-23 01:28:27.513999', '2024-07-23 01:28:57.476970', 4, 73),
(56, '2024-07-23 01:28:27.529615', '2024-07-23 01:28:58.763754', 4, 74),
(57, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:00.096852', 4, 75),
(58, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:01.352833', 4, 76),
(59, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:02.592324', 4, 77),
(60, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:05.253820', 4, 78),
(61, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:06.649891', 4, 79),
(62, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:07.952748', 4, 80),
(63, '2024-07-23 01:28:27.529615', '2024-07-23 01:29:09.412210', 4, 81),
(64, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:10.746290', 4, 67),
(65, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:13.352117', 4, 68),
(66, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:14.811569', 4, 69),
(67, '2024-07-23 01:28:27.513999', '2024-07-23 01:29:16.098165', 4, 70),
(68, '2024-07-23 02:04:07.964214', '2024-07-23 02:04:25.382062', 4, 85),
(69, '2024-07-23 02:08:46.523782', '2024-07-23 02:08:54.255927', 3, 84),
(70, '2024-07-23 02:10:22.956495', '2024-07-23 02:10:31.123525', 3, 83),
(71, '2024-07-23 02:21:13.111606', '2024-07-23 02:21:20.668959', 3, 82),
(72, '2024-07-23 02:29:21.154547', '2024-07-25 08:05:43.894535', 4, 86),
(73, '2024-07-26 08:54:30.425653', '2024-07-26 08:54:46.567658', 3, 94),
(74, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:48.321421', 3, 95),
(75, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:49.366751', 3, 96),
(76, '2024-07-26 08:54:30.441278', '2024-07-26 08:54:56.400441', 3, 97),
(77, '2024-07-26 08:54:30.441278', '2024-07-26 08:55:03.829175', 3, 98),
(78, '2024-07-26 08:54:34.291610', '2024-07-26 08:55:25.531957', 4, 89),
(79, '2024-07-26 08:54:34.291610', '2024-07-26 08:55:27.388026', 4, 90),
(80, '2024-07-26 08:54:34.305125', '2024-07-26 08:55:29.242656', 4, 91),
(81, '2024-07-26 08:54:34.305125', '2024-07-26 08:55:31.015371', 4, 92),
(82, '2024-07-26 08:54:34.307632', '2024-07-26 08:55:32.715785', 4, 93),
(83, '2024-07-28 11:24:17.386787', '2024-07-28 11:24:27.160275', 3, 99),
(84, '2024-07-29 03:54:08.870260', '2024-07-29 03:54:18.904561', 3, 100),
(85, '2024-08-07 09:20:56.336446', '2024-08-07 09:21:14.657766', 3, 104),
(86, '2024-08-08 08:01:24.664532', '2024-08-08 08:01:34.339001', 3, 105),
(87, '2024-08-08 08:12:51.654076', '2024-08-08 08:12:58.989163', 3, 101),
(88, '2024-08-08 08:12:51.654076', '2024-08-08 08:13:00.794358', 3, 102),
(89, '2024-08-08 08:41:45.756336', '2024-08-08 08:42:27.693769', 4, 106),
(90, '2024-08-08 08:49:59.837522', '2024-08-08 08:50:08.240226', 4, 107),
(91, '2024-08-08 11:10:20.448447', '2024-08-08 11:10:27.025466', 4, 108),
(92, '2024-08-12 03:10:29.816535', '2024-08-12 03:10:53.620582', 3, 109),
(93, '2024-08-12 06:41:13.460289', '2024-08-12 06:41:32.968676', 4, 110),
(94, '2024-08-12 14:53:09.106878', '2024-08-12 14:53:24.403094', 3, 112),
(95, '2024-08-12 14:53:09.106878', '2024-08-12 14:53:25.681669', 3, 111),
(96, '2024-08-12 14:53:12.001424', '2024-08-12 14:53:39.696586', 4, 113),
(97, '2024-08-12 14:53:12.002441', '2024-08-12 14:53:41.809147', 4, 114),
(98, '2024-08-12 14:53:12.002711', '2024-08-12 14:53:43.167020', 4, 115),
(99, '2024-08-12 15:06:05.170130', '2024-08-12 15:06:13.450706', 4, 116),
(100, '2024-08-18 03:57:50.251501', '2024-08-18 03:57:59.679994', 3, 123),
(101, '2024-08-18 03:57:50.258329', '2024-08-18 03:58:04.103496', 3, 124),
(102, '2024-08-18 03:57:30.812358', '2024-08-18 03:58:11.899714', 4, 117),
(103, '2024-08-18 03:57:30.814304', '2024-08-18 03:58:17.481706', 4, 121),
(104, '2024-08-18 03:57:30.814304', '2024-08-18 03:58:26.823728', 4, 122),
(105, '2024-08-19 05:16:20.913772', '2024-08-19 05:16:37.189684', 3, 125),
(106, '2024-08-19 05:36:26.823606', '2024-08-19 05:36:39.956797', 3, 126),
(107, '2024-08-19 05:36:29.352004', '2024-08-19 05:36:47.981446', 4, 127),
(108, '2024-08-19 05:36:29.352004', '2024-08-19 05:36:49.824625', 4, 128),
(109, '2024-08-19 05:56:38.605932', '2024-08-19 05:56:48.316990', 3, 129);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_deliverystaff`
--

CREATE TABLE `delivery_deliverystaff` (
  `id` bigint(20) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_deliverystaff`
--

INSERT INTO `delivery_deliverystaff` (`id`, `is_available`, `user_id`, `phone_number`) VALUES
(3, 1, 5, '0121231212'),
(4, 1, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(131, '2024-07-09 03:35:21.660486', '2', 'Delivery Staff: delivery', 3, '', 47, 5),
(140, '2024-07-09 11:57:11.365911', '8', 'admin', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 8),
(141, '2024-07-09 11:57:13.701875', '1', 'mony', 2, '[]', 4, 8),
(142, '2024-07-10 07:46:51.809794', '1', 'mony', 3, '', 4, 8),
(143, '2024-07-11 03:56:13.150130', '8', '', 1, '[{\"added\": {}}]', 42, 8),
(144, '2024-07-11 03:56:25.108696', '8', '', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(145, '2024-07-11 03:56:59.253011', '8', '', 2, '[{\"changed\": {\"fields\": [\"Url name\"]}}]', 42, 8),
(146, '2024-07-11 04:25:27.210327', '8', '', 2, '[{\"changed\": {\"fields\": [\"Authenticated only\"]}}]', 42, 8),
(147, '2024-07-11 04:25:50.534788', '3', '', 2, '[{\"changed\": {\"fields\": [\"Authenticated only\"]}}]', 42, 8),
(148, '2024-07-11 11:06:11.865029', '5', 'Dell', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 8, 8),
(149, '2024-07-11 11:09:23.261724', '6', 'Razer', 1, '[{\"added\": {}}]', 8, 8),
(150, '2024-07-11 11:10:50.470065', '6', 'Razer', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 8, 8),
(151, '2024-07-11 11:12:40.008973', '3', 'MacOS', 1, '[{\"added\": {}}]', 15, 8),
(152, '2024-07-11 11:13:06.359421', '7', 'Apple', 1, '[{\"added\": {}}]', 8, 8),
(153, '2024-07-11 11:14:25.328899', '8', 'Lenovo', 1, '[{\"added\": {}}]', 8, 8),
(154, '2024-07-11 11:15:21.283484', '9', 'Alienware', 1, '[{\"added\": {}}]', 8, 8),
(155, '2024-07-11 11:18:02.445297', '2', 'Intel - Core I9 14900HX - 24 cores - 32 threads', 1, '[{\"added\": {}}]', 20, 8),
(156, '2024-07-11 11:19:43.798653', '3', 'AMD - Ryzen 5 7535HS - 8 cores - 12 threads', 1, '[{\"added\": {}}]', 20, 8),
(157, '2024-07-11 11:20:43.360475', '3', 'NVIDIA - RTX 3060 - 6 GB VRAM - DDR6', 1, '[{\"added\": {}}]', 21, 8),
(158, '2024-07-11 11:21:07.847164', '4', 'AMD - RX 7900XT - 12 GB VRAM - DDR6', 1, '[{\"added\": {}}]', 21, 8),
(159, '2024-07-11 11:21:39.049839', '3', 'Samsung - 32GB - M.2 NVME', 1, '[{\"added\": {}}]', 22, 8),
(160, '2024-07-11 14:35:59.131637', '9', 'Alienware', 3, '', 8, 8),
(161, '2024-07-11 14:42:08.634641', '9', 'test2', 3, '', 11, 8),
(162, '2024-07-11 14:42:08.637612', '8', 'test2', 3, '', 11, 8),
(163, '2024-07-11 14:42:08.638612', '7', 'test2', 3, '', 11, 8),
(164, '2024-07-11 14:42:08.640093', '6', 'test2', 3, '', 11, 8),
(165, '2024-07-11 14:42:08.642266', '5', 'test1', 3, '', 11, 8),
(166, '2024-07-11 14:42:08.643187', '4', 'test1', 3, '', 11, 8),
(167, '2024-07-11 14:42:08.644216', '3', 'Test', 3, '', 11, 8),
(168, '2024-07-11 14:46:42.923230', '14', 'test', 3, '', 11, 8),
(169, '2024-07-11 14:46:42.926230', '13', 'test1', 3, '', 11, 8),
(170, '2024-07-11 14:46:42.926815', '12', 'test1', 3, '', 11, 8),
(171, '2024-07-11 14:46:42.927842', '11', 'test', 3, '', 11, 8),
(172, '2024-07-11 14:46:42.928841', '10', 'test', 3, '', 11, 8),
(173, '2024-07-11 14:54:49.243503', '7', 'kk', 3, '', 9, 8),
(174, '2024-07-11 14:54:49.246503', '6', 'no', 3, '', 9, 8),
(175, '2024-07-11 14:54:49.248633', '5', 'tes', 3, '', 9, 8),
(176, '2024-07-11 14:54:49.249835', '4', 'phone', 3, '', 9, 8),
(177, '2024-07-11 14:54:49.250841', '3', 'phone', 3, '', 9, 8),
(178, '2024-07-11 14:54:49.251840', '2', 'phone', 3, '', 9, 8),
(179, '2024-07-11 15:42:36.741589', '10', 'Alienware', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 8, 8),
(180, '2024-07-12 02:35:33.674960', '2', 'ROG G16 Strix - $22.22 - 2024', 2, '[{\"changed\": {\"name\": \"product image\", \"object\": \"Image for ROG G16 Strix\", \"fields\": [\"Image\"]}}]', 23, 8),
(181, '2024-07-12 03:34:45.130185', '1', 'Percentage discount on ROG G16 Strix', 1, '[{\"added\": {}}]', 51, 8),
(182, '2024-07-12 03:36:34.612433', '1', 'Fixed Amount discount on ROG G16 Strix', 2, '[{\"changed\": {\"fields\": [\"Discount type\", \"Value\"]}}]', 51, 8),
(183, '2024-07-12 07:50:44.518325', '4', 'Delivery by: delivery2', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(184, '2024-07-12 07:50:47.274640', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(185, '2024-07-12 07:53:30.863151', '4', 'Delivery by: delivery2', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(186, '2024-07-12 07:54:43.674130', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(187, '2024-07-12 07:55:05.606369', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(188, '2024-07-12 07:58:29.971775', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(189, '2024-07-12 07:59:32.428547', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(190, '2024-07-12 08:00:19.661610', '4', 'Delivery by: delivery2', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(191, '2024-07-12 08:00:49.426557', '3', 'Delivery by: delivery', 2, '[]', 47, 8),
(192, '2024-07-12 08:00:52.150846', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(193, '2024-07-12 08:03:16.814899', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(194, '2024-07-12 08:05:30.744991', '3', 'Delivery by: delivery', 2, '[{\"changed\": {\"fields\": [\"Is available\"]}}]', 47, 8),
(195, '2024-07-13 10:13:21.750337', '1', 'Test', 1, '[{\"added\": {}}]', 53, 8),
(196, '2024-07-13 10:13:28.394189', '2', 'Test2', 1, '[{\"added\": {}}]', 53, 8),
(197, '2024-07-14 09:25:27.310029', '1', 'Ads-1', 2, '[{\"changed\": {\"fields\": [\"Priority\"]}}]', 34, 8),
(198, '2024-07-14 09:25:36.658179', '4', 'Ads-4', 2, '[{\"changed\": {\"fields\": [\"Priority\"]}}]', 34, 8),
(199, '2024-07-14 09:25:47.659310', '4', 'Ads-4', 2, '[{\"changed\": {\"fields\": [\"Priority\"]}}]', 34, 8),
(200, '2024-07-14 09:25:52.523321', '1', 'Ads-1', 2, '[{\"changed\": {\"fields\": [\"Priority\"]}}]', 34, 8),
(201, '2024-07-14 11:48:46.529921', '9', 'mony', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 8),
(202, '2024-07-14 11:50:00.321603', '9', 'mony', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 8),
(203, '2024-07-14 11:57:58.344226', '9', 'mony', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 8),
(204, '2024-07-14 12:12:44.662593', '16', 'Apple', 1, '[{\"added\": {}}]', 11, 8),
(205, '2024-07-14 12:13:11.170155', '5', 'Apple - M3 - 8 cores - 10 threads', 1, '[{\"added\": {}}]', 20, 8),
(206, '2024-07-14 12:13:33.643523', '4', 'Apple', 1, '[{\"added\": {}}]', 14, 8),
(207, '2024-07-14 12:13:46.204783', '5', 'Apple - 8GB - None', 1, '[{\"added\": {}}]', 22, 8),
(208, '2024-07-14 12:14:05.197245', '3', '14.2 inches - None panel', 1, '[{\"added\": {}}]', 12, 8),
(209, '2024-07-14 12:14:20.488655', '8', 'Type-C Thunderbolt', 1, '[{\"added\": {}}]', 16, 8),
(210, '2024-07-14 12:14:39.149056', '5', 'Macbook - $12.59 - 2024', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"laptop spec\", \"object\": \"Specifications for Macbook M3 Chip\"}}]', 23, 8),
(211, '2024-07-14 12:14:42.295612', '5', 'Macbook Pro - $12.59 - 2024', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 23, 8),
(212, '2024-07-14 12:15:09.944119', '5', 'Macbook Pro - $12.59 - 2024', 2, '[{\"added\": {\"name\": \"product image\", \"object\": \"Image for Macbook Pro\"}}]', 23, 8),
(213, '2024-07-14 12:19:36.479642', '5', 'Apple - M3 - 8-core CPU with 4 performance cores and 4 efficiency cores cores - None threads', 2, '[{\"changed\": {\"fields\": [\"Cores\", \"Threads\"]}}]', 20, 8),
(214, '2024-07-14 12:19:48.250229', '4', 'Apple', 1, '[{\"added\": {}}]', 13, 8),
(215, '2024-07-14 12:19:56.961410', '6', 'Apple - 10-core GPU Hardware-accelerated ray tracing - None GB VRAM - None', 1, '[{\"added\": {}}]', 21, 8),
(216, '2024-07-14 12:19:59.394852', '5', 'Macbook Pro - $12.59 - 2024', 2, '[{\"changed\": {\"name\": \"laptop spec\", \"object\": \"Specifications for Macbook Pro M3 Chip\", \"fields\": [\"Gpu\"]}}]', 23, 8),
(217, '2024-07-15 04:32:49.651148', '9', 'mony', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 8),
(218, '2024-07-15 04:33:04.155557', '5', 'Macbook Pro - $12.59 - 2024', 2, '[{\"changed\": {\"fields\": [\"Model\"]}}]', 23, 8),
(219, '2024-07-16 03:44:19.022890', '10', 'test', 3, '', 4, 8),
(220, '2024-07-16 04:32:05.621894', '9', 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212, Ratanakiri, Ratanakiri', 2, '[]', 32, 8),
(221, '2024-07-16 04:33:35.339772', '9', 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212, Ratanakiri, Ratanakiri', 3, '', 32, 8),
(222, '2024-07-16 04:33:47.084185', '8', 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212, Ratanakiri, Ratanakiri', 3, '', 32, 8),
(223, '2024-07-16 04:33:47.087187', '6', 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212, Ratanakiri, Ratanakiri', 3, '', 32, 8),
(224, '2024-07-17 03:15:42.083512', '1', 'Footer Information', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"social media\", \"object\": \"Facebook for Footer Information\"}}]', 43, 8),
(225, '2024-07-17 03:15:57.951967', '1', 'Footer Information', 2, '[{\"changed\": {\"name\": \"social media\", \"object\": \"Facebook for Footer Information\", \"fields\": [\"Icon class\"]}}]', 43, 8),
(226, '2024-07-17 03:17:06.316064', '1', 'Footer Information', 2, '[{\"added\": {\"name\": \"social media\", \"object\": \"Youtube for Footer Information\"}}, {\"added\": {\"name\": \"social media\", \"object\": \"Telgram for Footer Information\"}}]', 43, 8),
(227, '2024-07-22 02:13:39.818375', '5', 'Delivery by: lyhong', 3, '', 47, 8),
(228, '2024-07-23 10:43:35.473381', '1', 'Footer Information', 2, '[{\"changed\": {\"fields\": [\"Copyright text\"]}}]', 43, 8),
(229, '2024-07-23 14:27:17.372764', '1', 'Asus Tuf Dash F15 - FX507ZE - 15 units in stock', 1, '[{\"added\": {}}]', 25, 8),
(230, '2024-07-23 14:45:31.242213', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 1, '[{\"added\": {}}]', 25, 8),
(231, '2024-07-23 14:47:17.279301', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(232, '2024-07-23 14:49:22.990014', '2', 'ASUS TUF Gaming F15 - FX506LH - 11 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(233, '2024-07-23 14:49:25.464259', '1', 'Asus Tuf Dash F15 - FX507ZE - 12 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(234, '2024-07-23 15:00:01.732241', '1', 'Asus Tuf Dash F15 - FX507ZE - 15 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(235, '2024-07-23 15:02:23.503533', '1', 'Asus Tuf Dash F15 - FX507ZE - 5 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(236, '2024-07-23 15:05:11.809354', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(237, '2024-07-23 15:05:14.410500', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(238, '2024-07-23 15:07:35.837769', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(239, '2024-07-23 15:08:35.877448', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(240, '2024-07-23 15:09:14.728392', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(241, '2024-07-23 15:12:03.434027', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(242, '2024-07-23 15:14:42.189885', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(243, '2024-07-23 15:15:47.322980', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(244, '2024-07-24 01:43:24.264992', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(245, '2024-07-24 01:48:50.450302', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(246, '2024-07-24 01:50:23.164749', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(247, '2024-07-24 02:04:36.553981', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(248, '2024-07-24 02:08:22.003735', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(249, '2024-07-24 02:27:44.313691', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(250, '2024-07-24 02:27:56.336796', '1', 'Asus Tuf Dash F15 - FX507ZE - 100 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(251, '2024-07-24 02:28:33.662733', '1', 'Asus Tuf Dash F15 - FX507ZE - 0 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(252, '2024-07-24 02:32:58.901586', '2', 'ASUS TUF Gaming F15 - FX506LH - 0 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(253, '2024-07-24 02:40:56.236086', '2', 'ASUS TUF Gaming F15 - FX506LH - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(254, '2024-07-24 02:40:58.618586', '1', 'Asus Tuf Dash F15 - FX507ZE - 10 units in stock', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 25, 8),
(255, '2024-07-29 07:53:35.786338', '9', 'Compare', 1, '[{\"added\": {}}]', 42, 8),
(256, '2024-08-01 09:24:23.870956', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(257, '2024-08-01 09:24:49.099290', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(258, '2024-08-01 09:24:57.852503', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(259, '2024-08-01 09:25:08.731453', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(260, '2024-08-01 09:25:17.058745', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(261, '2024-08-01 09:25:25.951583', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(262, '2024-08-01 09:25:33.436123', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(263, '2024-08-01 09:25:39.971576', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(264, '2024-08-01 09:25:46.822665', '9', 'Compare', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(265, '2024-08-01 09:25:53.302284', '8', '', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(266, '2024-08-01 09:26:08.289199', '8', '', 2, '[{\"changed\": {\"fields\": [\"Order\"]}}]', 42, 8),
(267, '2024-08-13 03:08:19.478533', '2', '5b45111e-f041-41f8-90c8-00916dd80624', 1, '[{\"added\": {}}]', 59, 8),
(268, '2024-08-19 07:17:16.146966', '1', 'Google', 3, '', 39, 8);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(36, 'account', 'emailaddress'),
(37, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(34, 'advertisements', 'advertisement'),
(59, 'api', 'apikey'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(48, 'delivery', 'deliveryassignment'),
(49, 'delivery', 'deliveryassignmenthistory'),
(47, 'delivery', 'deliverystaff'),
(45, 'home', 'aboutus'),
(46, 'home', 'contactus'),
(43, 'home', 'footer'),
(42, 'home', 'menuitem'),
(54, 'home', 'socialmedia'),
(44, 'home', 'socialmedialink'),
(41, 'ipn', 'paypalipn'),
(29, 'orders', 'cartitem'),
(53, 'orders', 'event'),
(28, 'orders', 'order'),
(55, 'orders', 'orderaddress'),
(30, 'orders', 'orderhistory'),
(31, 'orders', 'orderhistoryitem'),
(61, 'orders', 'productrating'),
(56, 'orders', 'userpreferences'),
(7, 'products', 'batteryspec'),
(8, 'products', 'brand'),
(9, 'products', 'category'),
(10, 'products', 'color'),
(11, 'products', 'cpubrand'),
(20, 'products', 'cpuspec'),
(51, 'products', 'discount'),
(12, 'products', 'displayspec'),
(13, 'products', 'gpubrand'),
(21, 'products', 'gpuspec'),
(27, 'products', 'laptopspec'),
(14, 'products', 'memorybrand'),
(22, 'products', 'memoryspec'),
(15, 'products', 'operatingsystem'),
(16, 'products', 'portspec'),
(23, 'products', 'product'),
(24, 'products', 'productimage'),
(57, 'products', 'refreshrate'),
(58, 'products', 'resolutionspec'),
(25, 'products', 'stock'),
(17, 'products', 'storagebrand'),
(26, 'products', 'storagespec'),
(18, 'products', 'webcamspec'),
(19, 'products', 'wirelessconnectivity'),
(52, 'review', 'productreview'),
(6, 'sessions', 'session'),
(35, 'sites', 'site'),
(38, 'socialaccount', 'socialaccount'),
(39, 'socialaccount', 'socialapp'),
(40, 'socialaccount', 'socialtoken'),
(32, 'userprofile', 'address'),
(50, 'userprofile', 'notification'),
(60, 'userprofile', 'rating'),
(33, 'userprofile', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-24 13:04:50.512765'),
(2, 'auth', '0001_initial', '2024-06-24 13:04:50.733511'),
(3, 'account', '0001_initial', '2024-06-24 13:04:50.797764'),
(4, 'account', '0002_email_max_length', '2024-06-24 13:04:50.815934'),
(5, 'account', '0003_alter_emailaddress_create_unique_verified_email', '2024-06-24 13:04:50.825993'),
(6, 'account', '0004_alter_emailaddress_drop_unique_email', '2024-06-24 13:04:51.001353'),
(7, 'account', '0005_emailaddress_idx_upper_email', '2024-06-24 13:04:51.015975'),
(8, 'account', '0006_emailaddress_lower', '2024-06-24 13:04:51.023412'),
(9, 'account', '0007_emailaddress_idx_email', '2024-06-24 13:04:51.031871'),
(10, 'account', '0008_emailaddress_unique_primary_email_fixup', '2024-06-24 13:04:51.041579'),
(11, 'account', '0009_emailaddress_unique_primary_email', '2024-06-24 13:04:51.045867'),
(12, 'admin', '0001_initial', '2024-06-24 13:04:51.092072'),
(13, 'admin', '0002_logentry_remove_auto_add', '2024-06-24 13:04:51.097038'),
(14, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-24 13:04:51.101908'),
(15, 'advertisements', '0001_initial', '2024-06-24 13:04:51.108604'),
(16, 'contenttypes', '0002_remove_content_type_name', '2024-06-24 13:04:51.140535'),
(17, 'auth', '0002_alter_permission_name_max_length', '2024-06-24 13:04:51.165360'),
(18, 'auth', '0003_alter_user_email_max_length', '2024-06-24 13:04:51.171134'),
(19, 'auth', '0004_alter_user_username_opts', '2024-06-24 13:04:51.179616'),
(20, 'auth', '0005_alter_user_last_login_null', '2024-06-24 13:04:51.198067'),
(21, 'auth', '0006_require_contenttypes_0002', '2024-06-24 13:04:51.198910'),
(22, 'auth', '0007_alter_validators_add_error_messages', '2024-06-24 13:04:51.198910'),
(23, 'auth', '0008_alter_user_username_max_length', '2024-06-24 13:04:51.210299'),
(24, 'auth', '0009_alter_user_last_name_max_length', '2024-06-24 13:04:51.218963'),
(25, 'auth', '0010_alter_group_name_max_length', '2024-06-24 13:04:51.227205'),
(26, 'auth', '0011_update_proxy_permissions', '2024-06-24 13:04:51.231913'),
(27, 'auth', '0012_alter_user_first_name_max_length', '2024-06-24 13:04:51.239072'),
(28, 'ipn', '0001_initial', '2024-06-24 13:04:51.256388'),
(29, 'ipn', '0002_paypalipn_mp_id', '2024-06-24 13:04:51.261187'),
(30, 'ipn', '0003_auto_20141117_1647', '2024-06-24 13:04:51.308140'),
(31, 'ipn', '0004_auto_20150612_1826', '2024-06-24 13:04:51.616618'),
(32, 'ipn', '0005_auto_20151217_0948', '2024-06-24 13:04:51.635994'),
(33, 'ipn', '0006_auto_20160108_1112', '2024-06-24 13:04:51.650528'),
(34, 'ipn', '0007_auto_20160219_1135', '2024-06-24 13:04:51.659809'),
(35, 'ipn', '0008_auto_20181128_1032', '2024-06-24 13:04:51.664263'),
(36, 'ipn', '0009_alter_paypalipn_id', '2024-06-24 13:04:51.692084'),
(37, 'products', '0001_initial', '2024-06-24 13:04:52.420998'),
(38, 'orders', '0001_initial', '2024-06-24 13:04:52.643872'),
(39, 'sessions', '0001_initial', '2024-06-24 13:04:52.662541'),
(40, 'sites', '0001_initial', '2024-06-24 13:04:52.665563'),
(41, 'sites', '0002_alter_domain_unique', '2024-06-24 13:04:52.680844'),
(42, 'socialaccount', '0001_initial', '2024-06-24 13:04:52.847202'),
(43, 'socialaccount', '0002_token_max_lengths', '2024-06-24 13:04:52.875729'),
(44, 'socialaccount', '0003_extra_data_default_dict', '2024-06-24 13:04:52.881989'),
(45, 'socialaccount', '0004_app_provider_id_settings', '2024-06-24 13:04:52.902270'),
(46, 'socialaccount', '0005_socialtoken_nullable_app', '2024-06-24 13:04:53.076151'),
(47, 'socialaccount', '0006_alter_socialaccount_extra_data', '2024-06-24 13:04:53.107745'),
(48, 'userprofile', '0001_initial', '2024-06-24 13:04:53.193361'),
(49, 'home', '0001_initial', '2024-06-30 06:14:32.524684'),
(50, 'home', '0002_menuitem_url_name_auth_alter_menuitem_url_name', '2024-06-30 06:21:02.625143'),
(51, 'home', '0003_alter_menuitem_name', '2024-06-30 06:35:30.475063'),
(52, 'home', '0004_footer', '2024-06-30 06:55:41.854234'),
(53, 'home', '0005_socialmedialink_delete_footer', '2024-06-30 07:04:25.453073'),
(54, 'home', '0006_socialmedialink_icon', '2024-06-30 07:20:01.229458'),
(55, 'home', '0007_delete_socialmedialink', '2024-07-01 08:59:49.136857'),
(56, 'userprofile', '0002_alter_userprofile_user', '2024-07-01 08:59:49.151169'),
(57, 'userprofile', '0003_alter_userprofile_user', '2024-07-01 09:03:32.295260'),
(58, 'home', '0008_aboutus', '2024-07-04 09:01:05.387926'),
(59, 'home', '0009_alter_aboutus_content', '2024-07-04 09:11:01.480872'),
(60, 'home', '0010_contactus', '2024-07-04 09:20:03.392465'),
(61, 'delivery', '0001_initial', '2024-07-09 03:20:11.171416'),
(62, 'delivery', '0002_remove_deliveryassignment_status_and_more', '2024-07-09 03:23:29.975205'),
(63, 'delivery', '0003_deliveryassignmenthistory', '2024-07-09 07:32:18.530069'),
(64, 'delivery', '0004_deliverystaff_phone_number', '2024-07-09 09:19:25.870332'),
(65, 'orders', '0002_order_status', '2024-07-10 07:56:52.625388'),
(66, 'userprofile', '0004_notification', '2024-07-11 03:52:40.542552'),
(67, 'userprofile', '0005_notification_delivery_staff', '2024-07-11 06:55:08.217275'),
(68, 'userprofile', '0006_remove_notification_delivery_staff', '2024-07-11 07:02:53.830301'),
(69, 'products', '0002_product_created_at', '2024-07-11 08:39:23.042485'),
(70, 'products', '0003_discount', '2024-07-12 03:33:17.323643'),
(71, 'products', '0004_delete_discount', '2024-07-12 03:55:20.997467'),
(72, 'review', '0001_initial', '2024-07-12 07:00:12.470142'),
(73, 'userprofile', '0007_notification_order', '2024-07-12 07:18:14.606245'),
(74, 'userprofile', '0008_remove_notification_order', '2024-07-12 07:23:25.354712'),
(75, 'orders', '0003_event', '2024-07-13 10:11:54.891574'),
(76, 'orders', '0004_delete_event', '2024-07-13 10:14:12.814267'),
(77, 'orders', '0005_alter_orderhistory_ordered_date', '2024-07-13 10:17:29.837739'),
(78, 'orders', '0006_alter_orderhistory_ordered_date', '2024-07-13 12:42:41.022530'),
(79, 'advertisements', '0002_alter_advertisement_options_advertisement_priority', '2024-07-14 09:24:09.806079'),
(80, 'home', '0011_footer_socialmedia', '2024-07-15 15:03:47.800791'),
(81, 'orders', '0007_orderaddress_orderhistory_order_address', '2024-07-16 04:04:29.830002'),
(82, 'orders', '0008_order_order_address', '2024-07-16 04:11:24.707238'),
(83, 'orders', '0009_alter_order_order_address', '2024-07-16 04:47:43.576993'),
(84, 'orders', '0010_userpreferences', '2024-07-22 14:48:20.797786'),
(85, 'orders', '0011_delete_userpreferences', '2024-07-22 15:02:05.327016'),
(86, 'products', '0005_displayspec_refresh_rate', '2024-07-23 08:26:30.236230'),
(87, 'products', '0006_remove_displayspec_refresh_rate', '2024-07-23 08:26:49.256725'),
(88, 'products', '0007_refreshrate_laptopspec_refresh_rate', '2024-07-23 08:28:36.165589'),
(89, 'products', '0008_stock_updated_at', '2024-07-25 07:49:54.166199'),
(90, 'orders', '0012_orderhistory_transaction_id', '2024-07-26 08:23:24.851496'),
(91, 'orders', '0013_remove_orderhistory_transaction_id_and_more', '2024-07-26 08:41:04.282619'),
(92, 'orders', '0014_remove_orderhistory_paypal_transaction_id', '2024-07-26 08:53:34.256486'),
(93, 'delivery', '0005_alter_deliveryassignmenthistory_options', '2024-07-28 11:40:36.889005'),
(94, 'delivery', '0006_alter_deliveryassignmenthistory_options', '2024-07-28 11:43:34.688133'),
(95, 'products', '0009_displayspec_resolution', '2024-07-29 03:05:21.660635'),
(96, 'products', '0010_resolutionspec_remove_displayspec_resolution_and_more', '2024-07-29 03:08:33.061657'),
(97, 'api', '0001_initial', '2024-08-05 03:28:06.916322'),
(98, 'userprofile', '0009_rating', '2024-08-07 09:02:37.222378'),
(99, 'userprofile', '0010_delete_rating', '2024-08-07 09:13:06.667708'),
(100, 'orders', '0015_productrating', '2024-08-07 09:16:19.060424'),
(101, 'userprofile', '0011_notification_notification_type_and_more', '2024-08-07 09:20:29.781384'),
(102, 'userprofile', '0012_notification_is_rated', '2024-08-08 08:04:56.907256'),
(103, 'orders', '0016_alter_productrating_rating', '2024-08-08 08:11:36.834028'),
(104, 'orders', '0017_alter_productrating_rating', '2024-08-08 09:17:03.243087'),
(105, 'orders', '0018_order_payment_method_orderhistory_payment_method', '2024-08-12 12:17:53.228331'),
(106, 'orders', '0019_alter_order_payment_method', '2024-08-12 12:21:58.219859'),
(107, 'orders', '0020_orderhistory_receipt', '2024-08-12 12:48:18.976960'),
(108, 'orders', '0021_alter_orderhistory_payment_method', '2024-08-12 13:05:33.357322'),
(109, 'api', '0002_remove_apikey_created_at_apikey_user', '2024-08-13 03:06:21.019773');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('03slfqo5slssjh4ykfuva29xdmr78mq8', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sS683:8UUJpYXqyVluVbCuyUnqXtt3WEMe36TwmvqNuQLRDfE', '2024-07-26 02:35:23.055924'),
('168bmb7ndbxnvry2b2h2lzqsuapapcvq', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRorx:op67C5xNjBvqmTbzkq-osgLZPyc1jL33NxR-ZZdyJ9o', '2024-07-25 08:09:37.408501'),
('2zm7l13u3tqicw8s83ipg2lo9tox9va1', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sOGYB:GhLIG5WLGjg2HoM4wowD4_BjOONsILvqH3_XfVxOdnM', '2024-07-15 12:54:31.087002'),
('4z649ta2k8cnulo909hzv552v6jx7voi', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sPOUI:SuZ0HhQCrmceEWg5KOd0G4T-NlFuV5QIOvKrF50a8zI', '2024-07-18 15:35:10.781629'),
('53hfyruj1dute07m82sik3tsrmud50hb', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRSGk:nzIb3reCLgcbx41dd85jzViIOx84iS3rdLOfJ2jKPng', '2024-07-24 08:01:42.419027'),
('6g6t0x9ao7dihrcfn79hw4chu1zeff1d', '.eJxVjMsOgjAUBf-la9NQrS1l6d4vMKa5LwQflLSwMv67kLDQ7cyc81YR5qmLc5Ece1aNCmr3yxDoIcMq-A7DLWlKw5R71GuiN1v0ObE8T1v7d9BB6ZY1tCT71jgODAdET-5I7KQCy0Ec2wXWnjzW1nAt1lRorBcfKtcCegvLKaXXCFk4jjnxTFNRzeX6-QKkmEF6:1sfv6X:2H9nH-5oG-fZ5rPMbCMpRWqkE0yIUAIu_tcErlO78gg', '2024-09-02 05:38:57.187531'),
('6ivs7b4i81u5npnfny5mfda5tpuok3rr', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sOD2L:8s_vJFxrgBy1w-x8vGQXxKCDTOCbiYWhlWivul7fToQ', '2024-07-15 09:09:25.828842'),
('6vityhizw3bzdh9m164827qi985ptxtf', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sbDxL:FZ82quwpnldVF6WKHThumBlAfDKViXHEzgPVg-p7czQ', '2024-08-20 06:46:03.275817'),
('7s9hlicszsns6ss2rxayb77jyf6fr4cz', '.eJxVjDsOwjAQBe_iGln-ZP2hpOcM1nrXJgHkSHFSIe4OkVJA-2bmvUTCbR3T1suSJhZnobU4_Y4Z6VHaTviO7TZLmtu6TFnuijxol9eZy_NyuH8HI_bxWxNlMIrYsnZK-RA8hVgBIzgPNZhBe_BlsNEWZ8AQI-vC0UBgduireH8A8uE3vg:1sfvNv:Udf4hQKOsKSgrPOOfKkdpB18ZFRBPThr6tGoWkkhj3k', '2024-09-02 05:56:55.003395'),
('8u2vozrkj4e9qzhzzpg9t5w45wi3plqu', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sTDN6:d0vYN42SyRwuzHaxKH8xgjZaZsR9d7hmdau3JTRNiXw', '2024-07-29 04:31:32.610324'),
('91wmhak6fweun9jndbrhrzx3738gsbiw', 'e30:1sR2DY:qbef5g09zTjrRrzKhDMI7DmJy0OwMp8MzBNXJHi8dsA', '2024-07-23 04:12:40.691355'),
('9vywd0gwzbtap6nqf8yngmtes1exk5oj', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sWtTw:vADRE9DE2kG54eR5XM_YlReyJXMHzsGYqELKDTpzV-Y', '2024-08-08 08:05:48.433229'),
('az9jc0sb97fsenfe1irmu5ro4xn3c34o', '.eJxVjEsOgjAUAO_StWmgrx9w6Z4zNO9TLGpKQmFlvLtpwkK3M5N5q4jHnuNR0xYXUVcF6vLLCPmZShPywHJfNa9l3xbSLdGnrXpaJb1uZ_s3yFhz24IT8cDC3YACFhObEGjGuffBOGP82INlk4DIDwEZrOu8dQyJCEZSny_spTfz:1sfvL9:pUn7eprluzA7V7N3Oeh6PxP9NHU8FhIIpjDh4GJoeIw', '2024-09-02 05:54:03.049620'),
('b3jsca1h0mt030ld308rzz0y3g7fpwnx', '.eJxVj0FuwyAQRe8yawthsMF42X1OUFXWMExi2gQig9VWUe7e0maT3ei_pyfNDZAo76kuuNeVU42ENea0XLiuORSYX2_wf8MMVyzlM28BOsAKc2-V7qVVUgrppLNu6mAvvCW88K995nSC-1sHf-2lkSW2jIanzSN9cGogvGM6ZUE51S160RTxoEUccuDzy8N9CqxY1pbVYwhGUyA5YdADMilr_RGPvbFqVMq4Xg-kWHtvJoukh1GaYSTN3mvnW7RwKe19_rrG7Rtmef8B2I1f0Q:1sbytc:IlH0e521jkzoiR11Y1Zi_SKqpy9xxWnzJGTRtxz2g44', '2024-08-22 08:53:20.112682'),
('bemnya2w7ruei1n10lcegp7hbayy79n6', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sdWcj:7FBPw-ZzqOzJnjlQkXem6KWZ4D24KpIdoA2zOU-mHlg', '2024-08-26 15:06:17.412666'),
('cggvx4s9xq08cca9h7bd6tzsel2rmcko', 'e30:1sR2Cr:F5JSBDRnoHdWt2XkVYx1S30Zj9qxypXWxbeG0ThGouI', '2024-07-23 04:11:57.696544'),
('cgzdxxelu1bmx1m725joeciwca4u4ggz', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sPOiF:kJ72rWszGTDrfi7WgbmVxzYESPfJjX3SPyHU-mz6ITg', '2024-07-18 15:49:35.063727'),
('cup3cfedixxe9qxqzq59lxhmtqtbvyjn', '.eJxVjEsOgjAUAO_StWmgrx9w6Z4zNO9TLGpKQmFlvLtpwkK3M5N5q4jHnuNR0xYXUVcF6vLLCPmZShPywHJfNa9l3xbSLdGnrXpaJb1uZ_s3yFhz24IT8cDC3YACFhObEGjGuffBOGP82INlk4DIDwEZrOu8dQyJCEZSny_spTfz:1sfvJt:Xfk2Y79ztCNr9PUl6c01F3cBOtKBkaHs5DSdcvpkoEs', '2024-09-02 05:52:45.814860'),
('czr77s9j5p7mvc4160nhkq1xqebqqk9j', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRVog:icRDyWyAfkUBw4lBXjr2A_b1txoShIr3hkXz1uvdPfQ', '2024-07-24 11:48:58.471891'),
('e4ouwtnaoou1dw4ptiw327y7k50qr36e', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRnW1:TqBTLA5RTeVQR12hL1IxmyBU332lrLwgKdOISyhntLw', '2024-07-25 06:42:53.990453'),
('fj0w3917kx5jlwx74tqgqh0fq9qqw60n', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRTlV:DpklzW6dIBx4_S6MC5nGrvMlzUI1MnNvNInu45bfqko', '2024-07-24 09:37:33.915003'),
('fuxeqrq7g3jb2ugrbu0acvb10a2un1i5', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sV3XZ:-4ZlrVXyuuxOzgs7Cj9xiBflq_C32_LYbUq2zQ3p2WY', '2024-08-03 06:25:57.220762'),
('fxr3scjq11jm0w8xox8n1ta9mqyy2waq', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sdOew:tMcOhVAkzlZRJblyB6I39EsvG8LROOj-MY2WHFtod1s', '2024-08-26 06:36:02.488820'),
('g0r6y4fzw1x72z99bdfvs4ylu05y1p3q', '.eJxVjEEOwiAQRe_C2hChU2hduu8ZyMwwSNVAUtqV8e7apAvd_vfef6mA25rD1mQJc1QX5dTpdyPkh5QdxDuWW9Vcy7rMpHdFH7TpqUZ5Xg_37yBjy9-azLkjH6HzTM6RUE80CjLJ6EWsTyI-ohsAzODYGtdLsswWLEDCaNX7AxRaOPQ:1sR7Uc:UUuuEFBafnD43vgk15dW4QlQyc4F0b961U3yD23XSdM', '2024-07-23 09:50:38.775155'),
('g2ao5pjqd4nz63pjfnvq761phcqjhf58', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sVicL:VaZg51WBMFt3iO6EZxvrTmyANhCS3aacRfjcAIUCb58', '2024-08-05 02:17:37.114573'),
('g6tm5qvnn7n69ris5a784cabff13zze5', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sRSa0:4D5aJqt4PQNc9Y0dBtbkExL_9S-7x0pEV1ayxp3y_dA', '2024-07-24 08:21:36.849644'),
('gxkqtco2g1qt3kfhvmgtcd6du82as30r', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sR7Fc:kHYqYHz2wVq6wMNMkmmFZfLC6zE2X3x205HfcBcYeuY', '2024-07-23 09:35:08.859310'),
('gypa2itljpamr9k82runikhpdjsrqpvh', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sUH0X:rbidM-wtsX3uUVXHrTT0Hb81pBNdMWKjecz-irn0QqA', '2024-08-01 02:36:37.241157'),
('icjkdikvsw31jt766s3bruwg626uenv4', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sUIiQ:ZPu4CBCKhCMWUkBHyI4G1JTTe90r2Z80csq-lOzwIXs', '2024-08-01 04:26:02.878128'),
('ivwti6h7j2dhi38aw7u79nm6wdsvdamt', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRo0b:_NvnoD1AoUjnZGR56eW1IbX7CzzL5rZMGKNMkSGbKks', '2024-07-25 07:14:29.297622'),
('j3bmngzppquanybeiyyeh2e5feejljr1', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sR7U0:Irt6EU59yes6qnLLcgdGrUizf-A9AgItF0ZsIIh2ftQ', '2024-07-23 09:50:00.762809'),
('l647vqm6e8osdn1quilgu5am3hk92d8p', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRS2d:NjNy2NL6jOe0qmt6q9w902L9lo685-i3LWvqN8vK9tI', '2024-07-24 07:47:07.760455'),
('lk4c3ft4gar72lx6ueix4rcvsoefzaok', '.eJxVjMsOwiAQRf-FtSE8ZAou3fsNZGAGqRqalHZl_HfbpAvd3nPOfYuI61Lj2nmOI4mLsOL0uyXMT247oAe2-yTz1JZ5THJX5EG7vE3Er-vh_h1U7HWrswECrcEar9JgtFIeCZVOxTu2DgoVd0ZmCKBYOe20ZQtDCOjJblB8vsUfN3A:1sR5e2:2IRIyZU9KSIKZGvZ6YiOBU18RzvmWZj8n3sKNrnyo6M', '2024-07-23 07:52:14.224195'),
('mbvvbq5ofs5nmsbjz0n6d91q1vc4uxe6', 'eyJjb21wYXJlZF9wcm9kdWN0cyI6W119:1sYe9B:eoAk1EFDXLfChGHf9XNl7RFebJB6y8iIhPdsMK-aNmA', '2024-08-13 04:07:37.038642'),
('mvb6f06hhm9lnj3i6ridlljwm6gncwm2', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sSCWn:1SEvpxfwjs3-xV9O7G8ORF5HSRxufpk5mDmH7klW3nY', '2024-07-26 09:25:21.702476'),
('mxb0gpf06bn6ude8r2wkmy5tb5qoro0a', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sdP3y:dc28gvl-1BAm11z33U-d7z-S2txTuLHq6_GYEJN0JXU', '2024-08-26 07:01:54.157735'),
('mxfaxmfwnl8mny39mjmr042dwgtr16pp', '.eJxVjMsOwiAQRf-FtSFYGB4u3fcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxYXAeL0uyWkB7cd5Du22yxpbusyJbkr8qBdjnPm5_Vw_w4q9vqtnc4KgvGFlSkAGrM1PhUk5mI9aSraEEMYnNZkwzkF9MoNLntvgmEQ7w_tgTfN:1sSTlu:O5a_peuI1IWw6D91Erm91ArC7lF-O6zEJdk8pw8F5xA', '2024-07-27 03:50:06.673673'),
('nj5tvu8dum345gh31bwfqb2gzaceuamy', '.eJxVjDsOwjAQBe_iGln-ZP2hpOcM1nrXJgHkSHFSIe4OkVJA-2bmvUTCbR3T1suSJhZnobU4_Y4Z6VHaTviO7TZLmtu6TFnuijxol9eZy_NyuH8HI_bxWxNlMIrYsnZK-RA8hVgBIzgPNZhBe_BlsNEWZ8AQI-vC0UBgduireH8A8uE3vg:1sfwoW:J6gQNG1A6KA_L3hB4-6U5rBMgmiUPCFeMRtby-9_xlc', '2024-09-02 07:28:28.940832'),
('nq1nwkpjmx0jk7i9rydcjfsu963p7rgm', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sRo1y:uyk3T1ouJQ2flHB2Fd-Z9ecWfx06e_va4zC5i0Rdo2Y', '2024-07-25 07:15:54.457227'),
('p6szdrqk4pnubk3xksggv2wif20i75ho', '.eJxVkL1uwzAMhN-Fs2H4R5asjAWKAgU6dmkQCBRFx2pcK7DkLIbfvUqbJQOX-45H4jaIgTxOSBTWOZmYMHGEwwatrz8v7xOO9NrcwtcbHI4bXJdAHDOHKZz9DAU4TAiHeZ2mAq4XYkPBsbnx4gfPyz_Zi1o1rRBC66qUbaX7rjvtBRhc02jWyIvxLmdqeNIs0oXnO3DfOJ9DSWFOi7fl3VI-aCw_8sHp5eF9ChgxjnkbB-JmqKXTDltrFcmOnOQKhdMsnchir0jZXtSuZ1FXthaKla7kgFYJzKEUfq64sDO5ALdSyg0c_97t8jQSTvsvT4Jseg:1sdOpv:bx0AVaNVrq3j3gkRp_WhTE-NpKyUex8VQLquMaLtmrk', '2024-08-26 06:47:23.997882'),
('pdag86krdzxcd9rk8kdb7vf13c8mwk8h', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sfvHq:VNXzPtPZY1tKpDCCDqiPeL7AnBtMAo9SKgrBzGvfoQo', '2024-09-02 05:50:38.122384'),
('pzqramytqo7j5hcmf0nnpyqesc9s3ms1', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1slSOi:ZXIp1k6O2e1_QUz9aI7MqYnlDzjdjC3HnbG-g693g4w', '2024-09-17 12:12:36.066403'),
('q5kcijm1i1gdf6k7w7f8dbcmtws4a3vb', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sOYVQ:b9trt400BM1hXrwuRYc1nUUjVWoSBSo48nijw4pwRnc', '2024-07-16 08:04:52.862945'),
('qi59jsjkv514410ur8ayatk147l8mtyz', '.eJxVjDkOwjAUBe_iGlk2GC-U9Jwh-ptxANlSnFSIu5NIKaCdmffeaoBlLsPSZRpGVheV1OGXIdBT6ib4AfXeNLU6TyPqLdG77frWWF7Xvf07KNDLuoZMcszWc2I4IQbyZ2IvBhwn8exWGAMFjM5yFGcNWhckJOMzYHCgPl8jjDj6:1sTvI7:4Ly5t_QlhzDVEyI8vAnvYT9HAbhetqiAWptsKGe5gqM', '2024-07-31 03:25:19.388935'),
('s3qhlxiusr4r7g0arp8v9e47uhw5fbob', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sTDPV:8N-jWIIkCGWww4gtJAfo_PEsREAnVLrv8JKvagkgZ50', '2024-07-29 04:34:01.148834'),
('sce8jc3tqtvloug6ra87sv1zqzap2fr3', '.eJxVjMsOwiAQRf-FtSGlUGBcuvcbyDAz2KqBpI-V8d-1SRe6veec-1IJt3VM2yJzmlidVVSn3y0jPaTugO9Yb01Tq-s8Zb0r-qCLvjaW5-Vw_w5GXMZvHag4z0ARTdezlWCjZZ-RqQvijQBAVzIM0WQzRDcIogsxuFykJwuk3h_wDTgg:1sRoTl:eqec4pWy_kuRyoPLq3TTLchWyGyyGV7IY-61R8-HRqA', '2024-07-25 07:44:37.958124'),
('urgjl7ooyn0v1ovtaos9lcn0282bnlnl', '.eJxVjMsOgjAQAP-lZ9NAtw_g6N0vMKbZ7hbBByUtnIz_riQc9DozmZfwuC6DX0vMfmTRCRCHXxaQ7nHaBN9wuiZJaVryGOSWyN0WeUocH8e9_RsMWIZtC4bZAjFVDTJojKScCz32tXXKKGXbGjSpCCHYxiGBNpXVhiCGAG34Tik9Z8yR_ZwTr7QU0Z0v7w9WH0Bz:1sfv5u:sqfypikl-jW7WiW8lrefBVPztES4cjwTUSyd8RGjweQ', '2024-09-02 05:38:18.379508'),
('uwhiyrz14pe3tmwzrckmyf8vmhw9rwr1', '.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJdvrdENKD2g7yHdqt89TbuszId4UfdPBrz_S8HO7fQYVRv_WEQiurgqTgsWjnLeoSnPGOkhSCUKVivA2TCqUI66FI7Y0GQNKoyLH3B8aXN40:1sPDtA:dZu7cruqjUtPZ0uoFEoMuIPX8hd5akaqLyfANC5yiJw', '2024-07-18 04:16:08.307499'),
('wjyv6mjh34xpat1snwjdp7qddhs6qhyq', '.eJxVjDsOwjAQBe_iGln-ZP2hpOcM1nrXJgHkSHFSIe4OkVJA-2bmvUTCbR3T1suSJhZnobU4_Y4Z6VHaTviO7TZLmtu6TFnuijxol9eZy_NyuH8HI_bxWxNlMIrYsnZK-RA8hVgBIzgPNZhBe_BlsNEWZ8AQI-vC0UBgduireH8A8uE3vg:1sfulL:cYOYbo3ECsuC8nM1qYlAFXDPZQldCtBueeyXVNrwXuA', '2024-09-02 05:17:03.135233'),
('wpynoy4n523it0wdf3litsofi35zm6da', '.eJxVjEEOwiAQRe_C2hChU2hduu8ZyMwwSNVAUtqV8e7apAvd_vfef6mA25rD1mQJc1QX5dTpdyPkh5QdxDuWW9Vcy7rMpHdFH7TpqUZ5Xg_37yBjy9-azLkjH6HzTM6RUE80CjLJ6EWsTyI-ohsAzODYGtdLsswWLEDCaNX7AxRaOPQ:1sRo3V:BwKQEC7tCevNkjcup8j9JwYWfW4X2KBGqFoaqHwddtI', '2024-07-25 07:17:29.584197');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'Example Site'),
(2, 'http://127.0.0.1:8000', 'http://127.0.0.1:8000');

-- --------------------------------------------------------

--
-- Table structure for table `home_aboutus`
--

CREATE TABLE `home_aboutus` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `last_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_aboutus`
--

INSERT INTO `home_aboutus` (`id`, `title`, `content`, `last_updated`) VALUES
(1, 'Angkor Empire Shop', '<p>Welcome to Angkor Empire Shop, your premier destination for all your computing needs in Cambodia. Established in 2015, we&#39;ve been at the forefront of providing cutting-edge technology solutions to our community for nearly a decade.</p>\r\n\r\n<p><u><strong>Our Journey</strong></u>: Angkor Empire Shop started as a modest computer repair service in the heart of Siem Reap. Fueled by our passion for technology and unwavering commitment to customer satisfaction, we&#39;ve evolved into the comprehensive tech solution provider we are today. Our growth is a testament to the trust and loyalty of our valued customers, and we&#39;re honored to be a cornerstone of Cambodia&#39;s burgeoning tech landscape.</p>\r\n\r\n<p><em><u><strong>Our Vision</strong></u></em>: At Angkor Empire Shop, we strive to bridge the digital divide by offering top-tier computer products and expert services that empower Cambodians in their digital endeavors. Whether you&#39;re a student, professional, gaming enthusiast, or business owner, we&#39;re dedicated to equipping you with the right tools and support to thrive in our increasingly connected world.</p>\r\n\r\n<p><em><u><strong>Our Offerings</strong></u></em>:</p>\r\n\r\n<ul>\r\n	<li>A diverse selection of computers, laptops, and accessories from global brands</li>\r\n	<li>Customized PCs built to meet your specific requirements</li>\r\n	<li>Professional repair services for all computer makes and models</li>\r\n	<li>Expert staff to guide you through your technology decisions</li>\r\n	<li>Regular tech workshops and training sessions on emerging technologies</li>\r\n</ul>\r\n\r\n<p><em><u><strong>Our Team</strong></u></em>: The backbone of Angkor Empire Shop is our team of tech-savvy professionals. Each member of our family is more than an employee; they&#39;re technology advocates passionate about enhancing your digital experience. From our sales representatives to our repair specialists, we&#39;re committed to continuous learning to stay ahead in the rapidly evolving tech industry.</p>\r\n\r\n<p><em><u><strong>Community </strong></u></em>Engagement: We believe in nurturing the community that has been integral to our success. Angkor Empire Shop actively participates in local technology education initiatives, sponsors coding workshops for youth, and provides internship opportunities for aspiring IT professionals, contributing to Cambodia&#39;s digital future.</p>\r\n\r\n<p><em><u><strong>Our Commitment</strong></u></em>: When you choose Angkor Empire Shop, you&#39;re not just purchasing a product or service &ndash; you&#39;re partnering with a team dedicated to your technological empowerment. We pledge to always offer sincere advice, premium products, and dependable support.</p>\r\n\r\n<p><em><u><strong>Visit Us</strong></u></em>: We warmly invite you to our store to experience the Angkor Empire Shop difference. Whether you need a new computer, require a quick repair, or seek tech guidance, our doors are always open.</p>\r\n\r\n<p><strong>Thank you</strong> for considering Angkor Empire Shop as your technology partner. We&#39;re excited to be part of your digital journey and contribute to Cambodia&#39;s technological advancement!</p>', '2024-07-04 09:13:22.826689');

-- --------------------------------------------------------

--
-- Table structure for table `home_contactus`
--

CREATE TABLE `home_contactus` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `map_embed` longtext DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_contactus`
--

INSERT INTO `home_contactus` (`id`, `title`, `content`, `email`, `phone`, `address`, `map_embed`, `last_updated`) VALUES
(1, 'Contact Us', '<p><strong>You can contact us through various ways:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'angkorempireshop@gmail.com', '+85512121212', 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212 St2112', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3907.920342739831!2d104.85443537476314!3d11.629026442889785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3109527b5a6c6599%3A0x947e61c3ff00c21d!2sACLEDA%20University%20of%20Business!5e0!3m2!1sen!2skh!4v1720085071489!5m2!1sen!2skh\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2024-07-04 09:27:06.813498');

-- --------------------------------------------------------

--
-- Table structure for table `home_footer`
--

CREATE TABLE `home_footer` (
  `id` bigint(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `copyright_text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_footer`
--

INSERT INTO `home_footer` (`id`, `phone_number`, `copyright_text`) VALUES
(1, '012121212 / 09191919', 'copy; 2024 Angkor Empire Computer Shop. All rights reserved.');

-- --------------------------------------------------------

--
-- Table structure for table `home_menuitem`
--

CREATE TABLE `home_menuitem` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url_name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `authenticated_only` tinyint(1) NOT NULL,
  `url_name_auth` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_menuitem`
--

INSERT INTO `home_menuitem` (`id`, `name`, `url_name`, `order`, `icon`, `authenticated_only`, `url_name_auth`) VALUES
(1, 'Home', 'home:home', 0, NULL, 0, NULL),
(2, 'Product', 'products:product_list', 0, NULL, 0, NULL),
(3, '', 'orders:cart_detail', 1, 'fa-solid fa-cart-shopping', 1, NULL),
(4, 'Contact', 'home:contact', 0, NULL, 0, NULL),
(5, 'About us', 'home:about-us', 0, NULL, 0, NULL),
(8, '', 'home:notifications', 1, 'fa-solid fa-bell', 1, NULL),
(9, 'Compare', 'home:compare', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_socialmedia`
--

CREATE TABLE `home_socialmedia` (
  `id` bigint(20) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `footer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_socialmedia`
--

INSERT INTO `home_socialmedia` (`id`, `platform`, `url`, `icon_class`, `footer_id`) VALUES
(1, 'Facebook', 'https://www.facebook.com/acleda.aub', 'fa-brands fa-facebook', 1),
(2, 'Youtube', 'https://www.youtube.com/', 'fa-brands fa-youtube', 1),
(3, 'Telgram', 'https://t.me/ouddommony_kim/', 'fa-brands fa-telegram', 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_products`
--

CREATE TABLE `myapp_products` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `price` float NOT NULL,
  `category` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_cartitem`
--

CREATE TABLE `orders_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `subtotal` decimal(10,2) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_order`
--

CREATE TABLE `orders_order` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `order_address_id` bigint(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderaddress`
--

CREATE TABLE `orders_orderaddress` (
  `id` bigint(20) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_orderaddress`
--

INSERT INTO `orders_orderaddress` (`id`, `address1`, `address2`, `city`, `province`, `phone`) VALUES
(3, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212', NULL, 'Prey Veng', 'Prey Veng', '012121122'),
(4, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212', NULL, 'Stung Treng', 'Stung Treng', '012121122'),
(5, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 1212', NULL, 'Ratanakiri', 'Ratanakiri', '012121122'),
(6, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Ratanakiri', 'Ratanakiri', '0123123123'),
(7, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Kep', 'Kep', '0123123123'),
(8, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Takeo', 'Takeo', '0123123123'),
(9, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Kandal', 'Kandal', '0123123123'),
(10, 'Khan Psar Tuek Thal Sangkat Tuek Tla Khan Sen Sok', NULL, 'Siem Reap', 'Siem Reap', '012312313'),
(11, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Siem Reap', 'Siem Reap', '0123123123'),
(12, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 123123', NULL, 'Phnom Penh', 'Phnom Penh', '0123123123'),
(13, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 12121212', NULL, 'Phnom Penh', 'Phnom Penh', '0121212121'),
(14, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 39I', NULL, 'Battambang', 'Ratanakiri', '0121212121'),
(15, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 39I', NULL, 'Battambang', 'Battambang', '0121212121'),
(16, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 12121212', NULL, 'Siem Reap', 'Siem Reap', '0121212121'),
(17, 'Sangkat Chrang Chomres 1 Khan Russey Keo House No 39I', NULL, 'Kampong Cham', 'Kampong Cham', '0123123123');

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderhistory`
--

CREATE TABLE `orders_orderhistory` (
  `id` bigint(20) NOT NULL,
  `ordered_date` datetime(6) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_address_id` bigint(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `receipt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_orderhistory`
--

INSERT INTO `orders_orderhistory` (`id`, `ordered_date`, `total_price`, `status`, `qr_code`, `user_id`, `order_address_id`, `payment_method`, `receipt`) VALUES
(6, '2024-07-05 09:45:08.696207', 1.50, 'Completed', 'qr_codes/order_6_qr.png', 2, NULL, NULL, NULL),
(7, '2024-07-06 09:10:15.655401', 5.00, 'Completed', 'qr_codes/order_7_qr.png', 2, NULL, NULL, NULL),
(8, '2024-07-09 03:02:30.816870', 74.42, 'Completed', 'qr_codes/order_8_qr.png', 2, NULL, NULL, NULL),
(9, '2024-07-09 07:51:39.307975', 47.44, 'Completed', 'qr_codes/order_9_qr.png', 2, NULL, NULL, NULL),
(10, '2024-07-09 07:54:53.013684', 16.49, 'Completed', 'qr_codes/order_10_qr.png', 4, NULL, NULL, NULL),
(11, '2024-07-09 09:30:28.356169', 5.00, 'Completed', 'qr_codes/order_11_qr.png', 4, NULL, NULL, NULL),
(12, '2024-07-09 09:32:13.865322', 22.22, 'Completed', 'qr_codes/order_12_qr.png', 4, NULL, NULL, NULL),
(13, '2024-07-09 09:35:34.162177', 1.50, 'Completed', 'qr_codes/order_13_qr.png', 4, NULL, NULL, NULL),
(14, '2024-07-09 09:36:29.739508', 9.99, 'Completed', 'qr_codes/order_14_qr.png', 4, NULL, NULL, NULL),
(15, '2024-07-09 09:38:15.616021', 1.50, 'Completed', 'qr_codes/order_15_qr.png', 4, NULL, NULL, NULL),
(16, '2024-07-09 09:40:56.681505', 5.00, 'Completed', 'qr_codes/order_16_qr.png', 4, NULL, NULL, NULL),
(17, '2024-07-09 09:41:20.416965', 22.22, 'Completed', 'qr_codes/order_17_qr.png', 4, NULL, NULL, NULL),
(18, '2024-07-10 08:10:05.824487', 13.00, 'Completed', 'qr_codes/order_18_qr.png', 9, NULL, NULL, NULL),
(19, '2024-07-10 09:18:35.217990', 1.50, 'Completed', 'qr_codes/order_19_qr.png', 9, NULL, NULL, NULL),
(20, '2024-07-10 09:37:58.213871', 1.50, 'Completed', 'qr_codes/order_20_qr.png', 9, NULL, NULL, NULL),
(21, '2024-07-10 11:49:37.761316', 1.50, 'Completed', 'qr_codes/order_21_qr.png', 9, NULL, NULL, NULL),
(22, '2024-07-11 04:07:15.269096', 1.50, 'Completed', 'qr_codes/order_22_qr.png', 9, NULL, NULL, NULL),
(23, '2024-07-11 04:16:12.221458', 1.50, 'Completed', 'qr_codes/order_23_qr.png', 9, NULL, NULL, NULL),
(24, '2024-07-11 04:16:42.428736', 5.00, 'Completed', 'qr_codes/order_24_qr.png', 9, NULL, NULL, NULL),
(25, '2024-07-11 04:17:16.427349', 22.22, 'Completed', 'qr_codes/order_25_qr.png', 9, NULL, NULL, NULL),
(26, '2024-07-11 04:18:54.036302', 5.00, 'Completed', 'qr_codes/order_26_qr.png', 9, NULL, NULL, NULL),
(27, '2024-07-11 04:19:11.796166', 1.50, 'Completed', 'qr_codes/order_27_qr.png', 9, NULL, NULL, NULL),
(28, '2024-07-11 04:22:46.869748', 9.99, 'Completed', 'qr_codes/order_28_qr.png', 9, NULL, NULL, NULL),
(29, '2024-07-11 06:56:39.529007', 5.00, 'Completed', 'qr_codes/order_29_qr.png', 9, NULL, NULL, NULL),
(30, '2024-07-11 07:13:53.405667', 1.50, 'Completed', 'qr_codes/order_30_qr.png', 9, NULL, NULL, NULL),
(31, '2024-07-11 07:45:03.971967', 10.00, 'Completed', 'qr_codes/order_31_qr.png', 9, NULL, NULL, NULL),
(32, '2024-07-12 07:09:41.930288', 1.50, 'Completed', 'qr_codes/order_32_qr.png', 9, NULL, NULL, NULL),
(33, '2024-07-12 07:20:58.604105', 5.00, 'Completed', 'qr_codes/order_33_qr.png', 9, NULL, NULL, NULL),
(34, '2024-07-12 07:24:38.033582', 1.50, 'Completed', 'qr_codes/order_34_qr.png', 9, NULL, NULL, NULL),
(35, '2024-07-12 07:37:13.616289', 22.22, 'Completed', 'qr_codes/order_35_qr.png', 9, NULL, NULL, NULL),
(36, '2024-07-12 07:46:45.687224', 9.99, 'Completed', 'qr_codes/order_36_qr.png', 9, NULL, NULL, NULL),
(37, '2024-07-12 08:17:16.792831', 5.00, 'Completed', 'qr_codes/order_37_qr.png', 9, NULL, NULL, NULL),
(38, '2024-07-12 08:19:20.039843', 9.99, 'Completed', 'qr_codes/order_38_qr.png', 9, NULL, NULL, NULL),
(39, '2024-07-12 09:25:47.554886', 1.50, 'Completed', 'qr_codes/order_39_qr.png', 9, NULL, NULL, NULL),
(40, '2024-07-13 03:33:09.159923', 1.50, 'Completed', 'qr_codes/order_40_qr.png', 9, NULL, NULL, NULL),
(41, '2024-07-13 03:49:42.660737', 22.22, 'Completed', 'qr_codes/order_41_qr.png', 9, NULL, NULL, NULL),
(42, '2024-07-13 10:18:31.452637', 1.50, 'Completed', 'qr_codes/order_42_qr.png', 9, NULL, NULL, NULL),
(43, '2024-07-13 11:46:33.742500', 5.00, 'Completed', 'qr_codes/order_43_qr.png', 9, NULL, NULL, NULL),
(44, '2024-07-14 07:44:39.111920', 3.00, 'Completed', 'qr_codes/order_44_qr.png', 9, NULL, NULL, NULL),
(45, '2024-07-14 09:06:09.312988', 1.50, 'Completed', 'qr_codes/order_45_qr.png', 9, NULL, NULL, NULL),
(46, '2024-07-14 12:17:22.013414', 39.81, 'Completed', 'qr_codes/order_46_qr.png', 9, NULL, NULL, NULL),
(47, '2024-07-15 04:32:20.645718', 25.18, 'Completed', 'qr_codes/order_47_qr.png', 9, NULL, NULL, NULL),
(48, '2024-07-16 03:56:34.942197', 14.09, 'Completed', 'qr_codes/order_48_qr_SyeNiz3.png', 8, NULL, NULL, NULL),
(49, '2024-07-16 03:58:30.099727', 5.00, 'Cancelled', 'qr_codes/order_49_qr.png', 8, NULL, NULL, NULL),
(50, '2024-07-16 04:06:52.908049', 1.50, 'Completed', 'qr_codes/order_50_qr.png', 9, NULL, NULL, NULL),
(51, '2024-07-16 04:07:50.010484', 5.00, 'Completed', 'qr_codes/order_51_qr.png', 9, NULL, NULL, NULL),
(52, '2024-07-16 04:15:47.517880', 22.22, 'Completed', 'qr_codes/order_52_qr.png', 9, NULL, NULL, NULL),
(53, '2024-07-16 04:43:18.440079', 1.50, 'Completed', 'qr_codes/order_53_qr.png', 9, 7, NULL, NULL),
(54, '2024-07-16 04:44:14.789262', 5.00, 'Completed', 'qr_codes/order_54_qr.png', 9, 8, NULL, NULL),
(55, '2024-07-16 07:33:41.069047', 17.59, 'Completed', 'qr_codes/order_55_qr.png', 9, 9, NULL, NULL),
(56, '2024-07-16 07:36:28.852705', 1.50, 'Completed', 'qr_codes/order_56_qr.png', 9, 8, NULL, NULL),
(57, '2024-07-18 03:34:17.944002', 23.72, 'Cancelled', 'qr_codes/order_57_qr.png', 9, 8, NULL, NULL),
(58, '2024-07-18 04:19:33.416599', 1.50, 'Completed', 'qr_codes/order_58_qr.png', 9, 8, NULL, NULL),
(59, '2024-07-18 04:29:32.801468', 1.50, 'Cancelled', 'qr_codes/order_59_qr.png', 9, 8, NULL, NULL),
(60, '2024-07-18 04:29:40.374342', 27.22, 'Completed', 'qr_codes/order_60_qr.png', 3, 10, NULL, NULL),
(61, '2024-07-19 04:09:04.888337', 37.77, 'Completed', 'qr_codes/order_61_qr.png', 9, 11, NULL, NULL),
(62, '2024-07-22 02:09:36.402378', 9.99, 'Completed', 'qr_codes/order_62_qr.png', 9, 12, NULL, NULL),
(63, '2024-07-22 02:11:22.836391', 12.59, 'Completed', 'qr_codes/order_63_qr_ZWXMKrR.png', 9, 12, NULL, NULL),
(64, '2024-07-22 02:19:01.665984', 34.81, 'Completed', 'qr_codes/order_64_qr_gsjuR99.png', 9, 12, NULL, NULL),
(65, '2024-07-22 10:58:57.925767', 27.22, 'Completed', 'qr_codes/order_65_qr_rNpAOIt.png', 9, 12, NULL, NULL),
(66, '2024-07-22 13:22:59.300968', 1.50, 'Completed', 'qr_codes/order_66_qr_aGJ7Jxs.png', 9, 12, NULL, NULL),
(67, '2024-07-22 15:02:37.218826', 12.59, 'Completed', '', 9, 12, NULL, NULL),
(68, '2024-07-22 15:03:58.359445', 5.00, 'Completed', 'qr_codes/order_68_qr_nkmMYsF.png', 9, 12, NULL, NULL),
(69, '2024-07-22 15:06:04.379756', 22.22, 'Completed', '', 9, 12, NULL, NULL),
(70, '2024-07-22 15:07:44.143669', 9.99, 'Completed', 'qr_codes/order_70_qr_4rVuNK2.png', 9, 12, NULL, NULL),
(71, '2024-07-22 15:08:36.273557', 1.50, 'Completed', 'qr_codes/order_71_qr.png', 2, 13, NULL, NULL),
(72, '2024-07-22 15:11:04.963846', 5.00, 'Completed', '', 2, 13, NULL, NULL),
(73, '2024-07-22 15:12:01.565844', 5.00, 'Completed', '', 2, 13, NULL, NULL),
(74, '2024-07-22 15:13:02.725064', 9.99, 'Completed', 'qr_codes/order_74_qr_uWxm2WR.png', 2, 13, NULL, NULL),
(75, '2024-07-22 15:14:41.649309', 22.22, 'Completed', '', 2, 13, NULL, NULL),
(76, '2024-07-22 15:16:38.721709', 5.00, 'Completed', 'qr_codes/order_76_qr.png', 2, 13, NULL, NULL),
(77, '2024-07-22 15:18:47.928445', 12.59, 'Completed', '', 2, 13, NULL, NULL),
(78, '2024-07-22 15:19:42.670855', 12.59, 'Completed', 'qr_codes/order_78_qr.png', 2, 13, NULL, NULL),
(79, '2024-07-22 15:21:50.657438', 1.50, 'Completed', '', 2, 13, NULL, NULL),
(80, '2024-07-22 15:22:45.191691', 12.59, 'Completed', 'qr_codes/order_80_qr.png', 2, 13, NULL, NULL),
(81, '2024-07-22 15:26:08.857949', 1.50, 'Completed', 'qr_codes/order_81_qr.png', 2, 13, NULL, NULL),
(82, '2024-07-23 01:31:27.740894', 46.30, 'Completed', 'qr_codes/order_82_qr.png', 2, 13, NULL, NULL),
(83, '2024-07-23 01:32:30.195454', 1.50, 'Completed', 'qr_codes/order_83_qr.png', 2, 13, NULL, NULL),
(84, '2024-07-23 01:33:28.008316', 14.09, 'Completed', 'qr_codes/order_84_qr.png', 2, 13, NULL, NULL),
(85, '2024-07-23 02:02:36.492936', 51.30, 'Completed', 'qr_codes/order_85_qr.png', 2, 13, NULL, NULL),
(86, '2024-07-23 02:22:49.327511', 12.59, 'Completed', 'qr_codes/order_86_qr.png', 2, 13, NULL, NULL),
(87, '2024-07-24 01:52:18.615506', 15.00, 'Cancelled', 'qr_codes/order_87_qr.png', 9, 12, NULL, NULL),
(88, '2024-07-24 02:05:31.281552', 15.00, 'Completed', 'qr_codes/order_88_qr.png', 9, 12, NULL, NULL),
(89, '2024-07-24 02:08:58.944214', 15.00, 'Completed', 'qr_codes/order_89_qr.png', 9, 12, NULL, NULL),
(90, '2024-07-24 02:46:21.190053', 1114.00, 'Completed', 'qr_codes/order_90_qr.png', 8, 15, NULL, NULL),
(91, '2024-07-26 08:10:40.294998', 1.50, 'Completed', 'qr_codes/order_91_qr.png', 9, 12, NULL, NULL),
(92, '2024-07-26 08:14:24.424826', 3.00, 'Completed', 'qr_codes/order_92_qr.png', 9, 12, NULL, NULL),
(93, '2024-07-26 08:20:02.515139', 4.50, 'Completed', 'qr_codes/order_93_qr.png', 9, 12, NULL, NULL),
(94, '2024-07-26 08:25:31.030505', 1499.00, 'Completed', 'qr_codes/order_94_qr.png', 9, 12, NULL, NULL),
(95, '2024-07-26 08:39:08.060250', 1.50, 'Completed', 'qr_codes/order_95_qr.png', 9, 12, NULL, NULL),
(96, '2024-07-26 08:42:03.759185', 3.00, 'Completed', 'qr_codes/order_96_qr.png', 9, 12, NULL, NULL),
(97, '2024-07-26 08:46:07.507903', 1.50, 'Completed', 'qr_codes/order_97_qr.png', 9, 12, NULL, NULL),
(98, '2024-07-26 08:51:56.205465', 1.50, 'Completed', 'qr_codes/order_98_qr.png', 9, 12, NULL, NULL),
(99, '2024-07-28 11:23:50.898944', 1.50, 'Completed', 'qr_codes/order_99_qr.png', 9, 12, NULL, NULL),
(100, '2024-07-29 03:53:17.979776', 1500.50, 'Completed', 'qr_codes/order_100_qr.png', 8, 15, NULL, NULL),
(101, '2024-07-29 14:43:28.183799', 11.49, 'Completed', 'qr_codes/order_101_qr.png', 2, 13, NULL, NULL),
(102, '2024-07-31 07:13:54.876070', 5.00, 'Completed', 'qr_codes/order_102_qr.png', 3, 10, NULL, NULL),
(103, '2024-07-31 08:44:11.149946', 1499.00, 'Completed', 'qr_codes/order_103_qr.png', 9, 12, NULL, NULL),
(104, '2024-08-02 09:02:19.520889', 1499.00, 'Completed', 'qr_codes/order_104_qr.png', 9, 12, NULL, NULL),
(105, '2024-08-08 08:01:15.143677', 6.50, 'Completed', 'qr_codes/order_105_qr.png', 9, 12, NULL, NULL),
(106, '2024-08-08 08:41:25.996556', 1.50, 'Completed', 'qr_codes/order_106_qr.png', 3, 10, NULL, NULL),
(107, '2024-08-08 08:49:29.254970', 1505.50, 'Completed', 'qr_codes/order_107_qr.png', 3, 10, NULL, NULL),
(108, '2024-08-08 11:10:02.568234', 1505.50, 'Completed', 'qr_codes/order_108_qr.png', 3, 10, NULL, NULL),
(109, '2024-08-12 03:09:08.297931', 8596.00, 'Completed', 'qr_codes/order_109_qr.png', 9, 12, NULL, NULL),
(110, '2024-08-12 06:37:36.216149', 2920.22, 'Completed', 'qr_codes/order_110_qr.png', 9, 12, NULL, NULL),
(111, '2024-08-12 12:54:22.524191', 1.50, 'Completed', 'qr_codes/order_111_qr.png', 9, 12, NULL, ''),
(112, '2024-08-12 12:55:14.823963', 1.50, 'Completed', 'qr_codes/order_112_qr.png', 9, 12, 'aba_bank', 'receipts/ABA_USD.jpg'),
(113, '2024-08-12 13:06:56.722327', 1.50, 'Completed', 'qr_codes/order_113_qr.png', 9, 12, 'acleda_bank', 'receipts/photo_2024-08-12_20-06-46.jpg'),
(114, '2024-08-12 13:09:53.974463', 1.50, 'Completed', 'qr_codes/order_114_qr.png', 9, 12, 'paypal', ''),
(115, '2024-08-12 14:47:26.525024', 5.00, 'Completed', 'qr_codes/order_115_qr.png', 9, 12, 'wing_bank', 'receipts/photo_2024-08-12_21-45-00.jpg'),
(116, '2024-08-12 15:05:27.419239', 4297.00, 'Completed', 'qr_codes/order_116_qr.png', 2, 16, 'acleda_bank', 'receipts/photo_2024-08-12_20-06-46_fK6jyBP.jpg'),
(117, '2024-08-12 15:09:13.996368', 2699.00, 'Completed', 'qr_codes/order_117_qr.png', 2, 16, 'aba_bank', 'receipts/photo_2024-08-12_22-09-03.jpg'),
(121, '2024-08-13 11:17:55.128057', 1104.00, 'Completed', 'qr_codes/order_121_qr.png', 9, 12, 'acleda_bank', 'receipts/photo_2024-08-12_20-06-46_NPtFo5W.jpg'),
(122, '2024-08-14 04:10:49.044964', 1.50, 'Completed', 'qr_codes/order_122_qr.png', 9, 12, 'paypal', ''),
(123, '2024-08-18 03:51:03.156640', 9395.00, 'Completed', 'qr_codes/order_123_qr.png', 9, 12, 'acleda_bank', 'receipts/photo_2024-08-12_20-06-46_yGQwj4W.jpg'),
(124, '2024-08-18 03:54:11.633878', 7096.00, 'Completed', 'qr_codes/order_124_qr.png', 3, 10, 'wing_bank', 'receipts/photo_2024-08-12_21-45-00_1P6yuvH.jpg'),
(125, '2024-08-19 05:14:44.535291', 999.00, 'Completed', 'qr_codes/order_125_qr.png', 9, 12, 'paypal', ''),
(126, '2024-08-19 05:17:44.442095', 1299.00, 'Completed', 'qr_codes/order_126_qr.png', 9, 12, 'wing_bank', 'receipts/photo_2024-08-12_21-45-00_Tcld7xw.jpg'),
(127, '2024-08-19 05:20:53.178834', 5497.00, 'Completed', 'qr_codes/order_127_qr.png', 2, 16, 'aba_bank', 'receipts/photo_2024-08-12_22-09-03_MHW9nhC.jpg'),
(128, '2024-08-19 05:21:51.351766', 3299.00, 'Completed', 'qr_codes/order_128_qr.png', 3, 10, 'acleda_bank', 'receipts/photo_2024-08-12_20-06-46_tliFLcK.jpg'),
(129, '2024-08-19 05:53:31.244744', 1299.00, 'Completed', 'qr_codes/order_129_qr.png', 3, 10, 'acleda_bank', 'receipts/1000004143.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderhistoryitem`
--

CREATE TABLE `orders_orderhistoryitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `subtotal` decimal(10,2) NOT NULL,
  `order_history_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_orderhistoryitem`
--

INSERT INTO `orders_orderhistoryitem` (`id`, `quantity`, `subtotal`, `order_history_id`, `product_id`) VALUES
(8, 1, 1.50, 6, 1),
(9, 1, 5.00, 7, 4),
(10, 2, 10.00, 8, 4),
(11, 2, 44.44, 8, 2),
(12, 2, 19.98, 8, 3),
(13, 2, 3.00, 9, 1),
(14, 2, 44.44, 9, 2),
(15, 1, 1.50, 10, 1),
(16, 1, 9.99, 10, 3),
(17, 1, 5.00, 10, 4),
(18, 1, 5.00, 11, 4),
(19, 1, 22.22, 12, 2),
(20, 1, 1.50, 13, 1),
(21, 1, 9.99, 14, 3),
(22, 1, 1.50, 15, 1),
(23, 1, 5.00, 16, 4),
(24, 1, 22.22, 17, 2),
(25, 2, 3.00, 18, 1),
(26, 2, 10.00, 18, 4),
(27, 1, 1.50, 19, 1),
(28, 1, 1.50, 20, 1),
(29, 1, 1.50, 21, 1),
(30, 1, 1.50, 22, 1),
(31, 1, 1.50, 23, 1),
(32, 1, 5.00, 24, 4),
(33, 1, 22.22, 25, 2),
(34, 1, 5.00, 26, 4),
(35, 1, 1.50, 27, 1),
(36, 1, 9.99, 28, 3),
(37, 1, 5.00, 29, 4),
(38, 1, 1.50, 30, 1),
(39, 2, 10.00, 31, 4),
(40, 1, 1.50, 32, 1),
(41, 1, 5.00, 33, 4),
(42, 1, 1.50, 34, 1),
(43, 1, 22.22, 35, 2),
(44, 1, 9.99, 36, 3),
(45, 1, 5.00, 37, 4),
(46, 1, 9.99, 38, 3),
(47, 1, 1.50, 39, 1),
(48, 1, 1.50, 40, 1),
(49, 1, 22.22, 41, 2),
(50, 1, 1.50, 42, 1),
(51, 1, 5.00, 43, 4),
(52, 2, 3.00, 44, 1),
(53, 1, 1.50, 45, 1),
(54, 1, 12.59, 46, 5),
(55, 1, 5.00, 46, 4),
(56, 1, 22.22, 46, 2),
(57, 2, 25.18, 47, 5),
(58, 1, 12.59, 48, 5),
(59, 1, 1.50, 48, 1),
(60, 1, 5.00, 49, 4),
(61, 1, 1.50, 50, 1),
(62, 1, 5.00, 51, 4),
(63, 1, 22.22, 52, 2),
(64, 1, 1.50, 53, 1),
(65, 1, 5.00, 54, 4),
(66, 1, 5.00, 55, 4),
(67, 1, 12.59, 55, 5),
(68, 1, 1.50, 56, 1),
(69, 1, 22.22, 57, 2),
(70, 1, 1.50, 57, 1),
(71, 1, 1.50, 58, 1),
(72, 1, 1.50, 59, 1),
(73, 1, 5.00, 60, 4),
(74, 1, 22.22, 60, 2),
(75, 3, 37.77, 61, 5),
(76, 1, 9.99, 62, 3),
(77, 1, 12.59, 63, 5),
(78, 1, 12.59, 64, 5),
(79, 1, 22.22, 64, 2),
(80, 1, 5.00, 65, 4),
(81, 1, 22.22, 65, 2),
(82, 1, 1.50, 66, 1),
(83, 1, 12.59, 67, 5),
(84, 1, 5.00, 68, 4),
(85, 1, 22.22, 69, 2),
(86, 1, 9.99, 70, 3),
(87, 1, 1.50, 71, 1),
(88, 1, 5.00, 72, 4),
(89, 1, 5.00, 73, 4),
(90, 1, 9.99, 74, 3),
(91, 1, 22.22, 75, 2),
(92, 1, 5.00, 76, 4),
(93, 1, 12.59, 77, 5),
(94, 1, 12.59, 78, 5),
(95, 1, 1.50, 79, 1),
(96, 1, 12.59, 80, 5),
(97, 1, 1.50, 81, 1),
(98, 1, 1.50, 82, 1),
(99, 1, 12.59, 82, 5),
(100, 1, 22.22, 82, 2),
(101, 1, 9.99, 82, 3),
(102, 1, 1.50, 83, 1),
(103, 1, 1.50, 84, 1),
(104, 1, 12.59, 84, 5),
(105, 1, 22.22, 85, 2),
(106, 1, 1.50, 85, 1),
(107, 1, 12.59, 85, 5),
(108, 1, 5.00, 85, 4),
(109, 1, 9.99, 85, 3),
(110, 1, 12.59, 86, 5),
(111, 10, 15.00, 87, 1),
(112, 10, 15.00, 88, 1),
(113, 10, 15.00, 89, 1),
(114, 10, 15.00, 90, 1),
(115, 1, 1099.00, 90, 8),
(116, 1, 1.50, 91, 1),
(117, 2, 3.00, 92, 1),
(118, 3, 4.50, 93, 1),
(119, 1, 1499.00, 94, 24),
(120, 1, 1.50, 95, 1),
(121, 2, 3.00, 96, 1),
(122, 1, 1.50, 97, 1),
(123, 1, 1.50, 98, 1),
(124, 1, 1.50, 99, 1),
(125, 1, 1499.00, 100, 26),
(126, 1, 1.50, 100, 1),
(127, 1, 9.99, 101, 3),
(128, 1, 1.50, 101, 1),
(129, 1, 5.00, 102, 4),
(130, 1, 1499.00, 103, 26),
(131, 1, 1499.00, 104, 26),
(132, 1, 5.00, 105, 4),
(133, 1, 1.50, 105, 1),
(134, 1, 1.50, 106, 1),
(135, 1, 1.50, 107, 1),
(136, 1, 5.00, 107, 4),
(137, 1, 1499.00, 107, 24),
(138, 1, 1.50, 108, 1),
(139, 1, 5.00, 108, 4),
(140, 1, 1499.00, 108, 24),
(141, 1, 2499.00, 109, 25),
(142, 1, 1899.00, 109, 5),
(143, 1, 1999.00, 109, 20),
(144, 1, 2199.00, 109, 23),
(145, 1, 22.22, 110, 2),
(146, 1, 1299.00, 110, 10),
(147, 1, 1599.00, 110, 11),
(148, 1, 1.50, 111, 1),
(149, 1, 1.50, 112, 1),
(150, 1, 1.50, 113, 1),
(151, 1, 1.50, 114, 1),
(152, 1, 5.00, 115, 4),
(153, 1, 1999.00, 116, 20),
(154, 1, 1099.00, 116, 21),
(155, 1, 1199.00, 116, 22),
(156, 1, 2699.00, 117, 19),
(163, 1, 1099.00, 121, 8),
(164, 1, 5.00, 121, 4),
(165, 1, 1.50, 122, 1),
(166, 1, 2399.00, 123, 16),
(167, 1, 1199.00, 123, 14),
(168, 1, 1999.00, 123, 13),
(169, 1, 1599.00, 123, 11),
(170, 1, 2199.00, 123, 12),
(171, 1, 1199.00, 124, 14),
(172, 1, 1499.00, 124, 15),
(173, 1, 2399.00, 124, 16),
(174, 1, 1999.00, 124, 13),
(175, 1, 999.00, 125, 1),
(176, 1, 1299.00, 126, 9),
(177, 1, 2199.00, 127, 12),
(178, 1, 1399.00, 127, 17),
(179, 1, 1899.00, 127, 18),
(180, 1, 3299.00, 128, 30),
(181, 1, 1299.00, 129, 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders_productrating`
--

CREATE TABLE `orders_productrating` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_history_item_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_productrating`
--

INSERT INTO `orders_productrating` (`id`, `rating`, `comment`, `created_at`, `order_history_item_id`, `product_id`, `user_id`) VALUES
(1, 5, 'It a great product.', '2024-08-08 08:02:18.184468', 132, 4, 9),
(3, 5, 'Reasonable Price', '2024-08-08 08:03:12.890334', 133, 1, 9),
(4, 5, '', '2024-08-08 08:09:26.426140', 131, 26, 9),
(5, 5, '', '2024-08-08 08:40:30.791152', 129, 4, 3),
(6, 4, '', '2024-08-08 08:48:14.658071', 134, 1, 3),
(7, 5, '', '2024-08-08 09:05:51.098374', 135, 1, 3),
(8, 4, 'good good', '2024-08-08 09:29:38.337025', 136, 4, 3),
(9, 5, '', '2024-08-08 11:08:42.813888', 137, 24, 3),
(10, 5, '', '2024-08-08 11:30:16.750415', 140, 24, 3),
(11, 5, 'This laptop is good for the price and performance.', '2024-08-11 13:16:18.317220', 138, 1, 3),
(12, 3, 'It\'s alright.', '2024-08-11 13:21:29.437203', 139, 4, 3),
(13, 5, 'Phenomenon', '2024-08-12 03:11:40.636816', 141, 25, 9),
(14, 4, '', '2024-08-12 03:12:19.610169', 143, 20, 9),
(15, 4, '', '2024-08-12 03:12:23.834542', 142, 5, 9),
(16, 4, '', '2024-08-12 03:12:26.402775', 144, 23, 9),
(17, 4, 'Awesome', '2024-08-12 06:42:04.975012', 147, 11, 9),
(18, 4, 'Good performance, but a bit heavy.', '2024-08-12 06:42:21.514290', 145, 2, 9),
(19, 4, '', '2024-08-12 06:42:27.655661', 146, 10, 9),
(21, 4, '', '2024-08-12 14:59:25.598208', 149, 1, 9),
(22, 5, '', '2024-08-12 14:59:29.306295', 148, 1, 9),
(23, 5, '', '2024-08-12 14:59:32.210539', 150, 1, 9),
(24, 5, '', '2024-08-12 14:59:34.902428', 151, 1, 9),
(25, 5, '', '2024-08-12 14:59:37.625518', 152, 4, 9),
(26, 5, '', '2024-08-12 15:06:36.003136', 128, 1, 2),
(27, 4, '', '2024-08-12 15:06:39.898288', 127, 3, 2),
(28, 4, '', '2024-08-12 15:06:44.010201', 154, 21, 2),
(29, 5, '', '2024-08-12 15:06:47.176087', 153, 20, 2),
(30, 5, '', '2024-08-12 15:06:49.357143', 155, 22, 2),
(31, 4, 'Great product.', '2024-08-18 03:59:03.038491', 172, 15, 3),
(32, 3, 'Decent quality.', '2024-08-18 03:59:13.877082', 171, 14, 3),
(33, 4, 'Excellence.', '2024-08-18 03:59:24.474329', 173, 16, 3),
(35, 4, 'great', '2024-08-18 03:59:50.537214', 174, 13, 3),
(36, 3, 'Okay', '2024-08-18 04:00:12.356340', 167, 14, 9),
(37, 4, 'I give it a 8/10.', '2024-08-18 04:00:27.871772', 166, 16, 9),
(38, 5, 'The best laptop.', '2024-08-18 04:00:38.461153', 170, 12, 9),
(39, 4, 'Compact and great performance.', '2024-08-18 04:00:51.437807', 169, 11, 9),
(40, 4, 'Good', '2024-08-18 04:01:02.589287', 163, 8, 9),
(41, 4, 'Good', '2024-08-18 04:01:10.870721', 164, 4, 9),
(42, 5, 'Best laptop for price', '2024-08-18 04:01:24.532684', 165, 1, 9),
(43, 4, '', '2024-08-19 05:15:34.609260', 168, 13, 9),
(44, 5, 'Phenomenal', '2024-08-19 05:37:41.208844', 180, 30, 3),
(45, 4, '', '2024-08-19 05:57:14.060193', 181, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` bigint(20) NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_batteryspec`
--

CREATE TABLE `products_batteryspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `battery` int(11) DEFAULT NULL,
  `battery_detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_batteryspec`
--

INSERT INTO `products_batteryspec` (`id`, `slug`, `battery`, `battery_detail`) VALUES
(1, '96', 96, NULL),
(3, '120', 120, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_brand`
--

CREATE TABLE `products_brand` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_brand`
--

INSERT INTO `products_brand` (`id`, `slug`, `name`, `logo`) VALUES
(1, 'asus', 'Asus', 'content/e75f0aba-c18d-4482-ac4b-e1b018f5c11c/asus-logo.png'),
(2, 'rog', 'ROG', 'content/7d0b5054-7df5-4ff5-be71-669326a568f9/rog-logo.png'),
(3, 'acer', 'Acer', 'content/63296f2a-84dd-4bc4-baa7-d678d7aa21f3/acer-logo.png'),
(4, 'msi', 'MSI', 'content/059aaaf1-1c35-496d-a9f2-b6ef91d1e383/msi-logo.png'),
(5, 'dell', 'Dell', 'content/c0af13b2-080a-4e6c-9222-ffac52924f24/Dell_Logo.svg.png'),
(6, 'razer', 'Razer', 'content/02525370-0b76-43d7-aac4-2343aa1c4f3b/razer.png'),
(7, 'apple', 'Apple', 'content/f77fb65c-1e65-4388-8318-b9584a386c2a/apple.png'),
(8, 'lenovo', 'Lenovo', 'content/694ef8a1-8ff5-40fc-aad9-2a97a40a0bdd/lenovo.png');

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `slug`, `name`) VALUES
(1, 'laptop', 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `products_color`
--

CREATE TABLE `products_color` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_color`
--

INSERT INTO `products_color` (`id`, `slug`, `name`) VALUES
(1, 'gray', 'Gray'),
(2, 'black', 'Black'),
(3, 'white', 'White'),
(4, 'titanium', 'Titanium'),
(5, 'blue-navy', 'Blue Navy');

-- --------------------------------------------------------

--
-- Table structure for table `products_cpubrand`
--

CREATE TABLE `products_cpubrand` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_cpubrand`
--

INSERT INTO `products_cpubrand` (`id`, `slug`, `name`) VALUES
(1, 'intel', 'Intel'),
(2, 'amd', 'AMD'),
(16, 'apple', 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `products_cpuspec`
--

CREATE TABLE `products_cpuspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `cores` varchar(100) DEFAULT NULL,
  `threads` varchar(100) DEFAULT NULL,
  `cpu_detail` varchar(200) DEFAULT NULL,
  `cpu_brand_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_cpuspec`
--

INSERT INTO `products_cpuspec` (`id`, `slug`, `model`, `cores`, `threads`, `cpu_detail`, `cpu_brand_id`) VALUES
(1, 'core-i7-12700h', 'Core i7-12700H', '10', '16', NULL, 1),
(2, 'core-i9-14900hx', 'Core I9 14900HX', '24', '32', NULL, 1),
(3, 'ryzen-5-7535hs', 'Ryzen 5 7535HS', '8', '12', NULL, 2),
(5, 'm3', 'M3', '8-core CPU with 4 performance cores and 4 efficiency cores', NULL, NULL, 16),
(6, 'm1', 'M1', '10', NULL, NULL, 16),
(7, 'core-i5-12500h', 'Core i5-12500H', '4', '8', NULL, 1),
(8, 'core-i5-150u', 'Core i5-150U', '4-P cores 8-E cores', '12', NULL, 1),
(9, 'ryzen-7-7735hs', 'Ryzen 7 7735HS', '8', '12', NULL, 2),
(10, 'm2', 'M2', '8', '12', NULL, 16);

-- --------------------------------------------------------

--
-- Table structure for table `products_displayspec`
--

CREATE TABLE `products_displayspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `display` varchar(100) DEFAULT NULL,
  `display_detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_displayspec`
--

INSERT INTO `products_displayspec` (`id`, `slug`, `display`, `display_detail`) VALUES
(1, '153', '15.3', NULL),
(3, '142', '14.2', NULL),
(4, '16', '16', NULL),
(5, '18', '18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_gpubrand`
--

CREATE TABLE `products_gpubrand` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_gpubrand`
--

INSERT INTO `products_gpubrand` (`id`, `slug`, `name`) VALUES
(1, 'nvidia', 'NVIDIA'),
(2, 'amd', 'AMD'),
(4, 'apple', 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `products_gpuspec`
--

CREATE TABLE `products_gpuspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `vram` varchar(100) DEFAULT NULL,
  `vram_type` varchar(100) DEFAULT NULL,
  `gpu_detail` varchar(200) DEFAULT NULL,
  `gpu_brand_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_gpuspec`
--

INSERT INTO `products_gpuspec` (`id`, `slug`, `model`, `vram`, `vram_type`, `gpu_detail`, `gpu_brand_id`) VALUES
(1, 'rtx-3070', 'RTX 3070', '8', 'GDDR6', NULL, 1),
(2, 'rx-7900xt', 'RX 7900XT', '12', 'GDDR6', NULL, 2),
(3, 'rtx-3060', 'RTX 3060', '6', 'DDR6', NULL, 1),
(4, 'rx-7900xt-1', 'RX 7900XT', '12', 'DDR6', NULL, 2),
(6, '10-core-gpu-hardware-accelerated-ray-tracing', '10-core GPU Hardware-accelerated ray tracing', NULL, NULL, NULL, 4),
(7, 'gpu-spec', '8-core GPU', NULL, NULL, NULL, 4),
(8, 'rtx3050-ti', 'RTX3050 Ti', '4', 'GDDR6', NULL, 1),
(9, 'rtx-3080-ti', 'RTX 3080 Ti', '8', 'GDDR6', NULL, 1),
(10, '3090', 'RTX 3090', '12', 'GDDR6', NULL, 1),
(11, 'rtx-4060', 'RTX 4060', '8', 'GDDR6', NULL, 1),
(12, 'rtx-4070', 'RTX 4070', '10', 'GDDR6', NULL, 1),
(13, 'rtx-4080', 'RTX 4080', '12', 'GDDR6', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_laptopspec`
--

CREATE TABLE `products_laptopspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `battery_id` bigint(20) DEFAULT NULL,
  `cpu_id` bigint(20) DEFAULT NULL,
  `display_id` bigint(20) DEFAULT NULL,
  `memory_id` bigint(20) DEFAULT NULL,
  `operating_system_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `storage_id` bigint(20) DEFAULT NULL,
  `webcam_id` bigint(20) DEFAULT NULL,
  `refresh_rate_id` bigint(20) DEFAULT NULL,
  `resolution_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_laptopspec`
--

INSERT INTO `products_laptopspec` (`id`, `slug`, `weight`, `battery_id`, `cpu_id`, `display_id`, `memory_id`, `operating_system_id`, `product_id`, `storage_id`, `webcam_id`, `refresh_rate_id`, `resolution_id`) VALUES
(1, 'asus-tuf-dash-f15-100-2024', 2.50, 1, 1, 1, 1, 1, 1, 1, 2, 2, NULL),
(2, 'rog-g16-strix-2222-2024', 3.00, 1, 3, 1, 2, 1, 2, 1, 2, 2, NULL),
(3, 'msi-katana-gf76-999-2023', 2.80, 1, 1, 1, 1, 1, 3, 1, 2, 2, NULL),
(4, 'asus-tuf-f17-5-2024', 2.80, 1, 1, 1, 1, 1, 4, 1, 1, 2, NULL),
(5, 'macbook-1259-2024', 1.80, 1, 5, 3, 5, 3, 5, 2, 2, 6, 4),
(8, 'asus-tuf-gaming-f15-1099-2024', 2.50, 1, 1, 1, 1, 1, 8, 2, 1, 2, NULL),
(9, 'asus-tuf-gaming-a15-1299-2023', 2.50, 1, 9, 1, 1, 1, 9, 1, 2, 2, NULL),
(10, 'asus-rog-strix-g15-1299-2023', 3.00, 1, 9, 1, 1, 1, 10, 2, 1, 2, NULL),
(11, 'rog-zephyrus-g14-1599-2023', 2.10, 1, 1, 3, 1, 1, 11, 1, 2, 2, NULL),
(12, 'asus-rog-strix-scar-18-2199-2024', 3.20, 3, 2, 5, 1, 1, 12, 1, 2, 2, NULL),
(13, 'acer-predator-helios-300-1999-2024', 2.80, 1, 2, 4, 2, 1, 13, 1, 1, 2, NULL),
(14, 'acer-nitro-5-1199-2024', 2.80, 1, 1, 1, 2, 1, 14, 1, 1, 2, NULL),
(15, 'acer-predator-triton-300-se-1499-2024', 2.70, 1, 1, 4, 1, 2, 15, 1, 1, 2, NULL),
(16, 'acer-predator-helios-18-2399-2024', 3.00, 1, 2, 5, 3, 1, 16, 1, 2, 2, NULL),
(17, 'msi-stealth-gs66-1399-2023', 2.60, 1, 1, 4, 1, 1, 17, 1, 2, 4, NULL),
(18, 'msi-stealth-gs66-1899-2023', 2.80, 1, 1, 4, 1, 1, 18, 1, 1, 4, NULL),
(19, 'msi-titan-gt77-2024-2699-2024', 3.30, 3, 2, 5, 3, 1, 19, 1, 2, 2, NULL),
(20, 'alienware-m15-r7-2023-1999-2023', 2.90, 1, 1, 1, 2, 1, 20, 1, 1, 2, NULL),
(21, 'dell-g15-1099-2024', 2.70, 1, 1, 1, 1, 1, 21, 2, 2, 2, NULL),
(22, 'dell-1199-2024', 2.90, 1, 1, 4, 1, 1, 22, 1, 2, 2, NULL),
(23, 'alienware-m15-r7-2199-2024', 2.80, 1, 1, 4, 1, 1, 23, 1, 2, 2, NULL),
(24, 'macbook-air-1499-2024', 2.00, 3, 5, 3, 5, 3, 24, 2, 2, 6, NULL),
(25, 'macbook-pro-2499-2021', 2.80, 3, 6, 4, 6, 3, 25, 2, 2, 6, NULL),
(26, 'macbook-air-1499-2022', 2.20, 3, 10, 3, 5, 3, 26, 2, 2, 6, 4),
(27, 'razer-blade-14-rz09-1699-2022', 2.40, 3, 1, 3, 2, 1, 27, 1, 2, 2, 4),
(28, 'razer-blade-15-rz09-0369x-2599-2023', 3.00, 3, 2, 1, 3, 1, 28, 1, 2, 4, 4),
(29, 'razer-blade-16-rz09-0509-2699-2023', 3.10, 3, 2, 4, 3, 1, 29, 1, 2, 4, 4),
(30, 'razer-blade-18-rz09-0509-3299-2023', 3.30, 3, 2, 5, 3, 1, 30, 1, 2, 4, 4),
(31, 'lenovo-legion-5-pro-16iah7h-1599-2023', 2.70, 1, 1, 1, 1, 1, 31, 1, 2, 2, 4),
(32, 'lenovo-legion-7i-pro-82wq0095ya-2199-2023', 2.70, 3, 1, 1, 1, 1, 32, 1, 2, 4, 4),
(33, 'lenovo-legion-9-16irx9-2999-2023', 3.00, 3, 2, 4, 3, 1, 33, 1, 2, 4, 4),
(34, 'lenovo-ideapad-3-15arh7-1299-2023', 2.50, 3, 3, 1, 1, 1, 34, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_laptopspec_gpu`
--

CREATE TABLE `products_laptopspec_gpu` (
  `id` bigint(20) NOT NULL,
  `laptopspec_id` bigint(20) NOT NULL,
  `gpuspec_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_laptopspec_gpu`
--

INSERT INTO `products_laptopspec_gpu` (`id`, `laptopspec_id`, `gpuspec_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(9, 5, 6),
(12, 8, 3),
(13, 9, 1),
(14, 10, 8),
(15, 11, 1),
(16, 12, 1),
(17, 13, 9),
(18, 14, 1),
(19, 15, 1),
(20, 16, 12),
(21, 17, 1),
(22, 18, 12),
(23, 19, 13),
(24, 20, 13),
(25, 21, 3),
(26, 22, 1),
(27, 23, 11),
(28, 24, 7),
(29, 25, 7),
(30, 26, 7),
(31, 27, 1),
(32, 28, 13),
(33, 29, 13),
(34, 30, 13),
(35, 31, 11),
(36, 32, 11),
(37, 33, 12),
(38, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_laptopspec_port`
--

CREATE TABLE `products_laptopspec_port` (
  `id` bigint(20) NOT NULL,
  `laptopspec_id` bigint(20) NOT NULL,
  `portspec_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_laptopspec_port`
--

INSERT INTO `products_laptopspec_port` (`id`, `laptopspec_id`, `portspec_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(10, 2, 4),
(11, 2, 5),
(12, 2, 6),
(13, 3, 1),
(14, 3, 2),
(15, 3, 3),
(16, 3, 4),
(17, 3, 5),
(18, 3, 6),
(19, 4, 1),
(20, 4, 2),
(21, 4, 3),
(22, 4, 4),
(23, 4, 5),
(24, 4, 6),
(26, 5, 4),
(27, 5, 5),
(28, 5, 6),
(25, 5, 8),
(43, 8, 1),
(44, 8, 2),
(45, 8, 3),
(46, 8, 4),
(47, 8, 5),
(48, 8, 6),
(49, 8, 8),
(50, 9, 1),
(51, 9, 2),
(52, 9, 3),
(53, 9, 4),
(54, 9, 5),
(55, 9, 6),
(56, 9, 8),
(57, 10, 1),
(58, 10, 2),
(59, 10, 3),
(60, 10, 4),
(61, 10, 5),
(62, 10, 6),
(63, 10, 8),
(64, 11, 1),
(65, 11, 2),
(66, 11, 3),
(67, 11, 4),
(68, 11, 5),
(69, 11, 6),
(70, 11, 8),
(71, 12, 1),
(72, 12, 2),
(73, 12, 3),
(74, 12, 4),
(75, 12, 5),
(76, 12, 6),
(77, 12, 8),
(78, 13, 1),
(79, 13, 2),
(80, 13, 3),
(81, 13, 4),
(82, 13, 5),
(83, 13, 6),
(84, 13, 8),
(85, 14, 1),
(86, 14, 2),
(87, 14, 3),
(88, 14, 4),
(89, 14, 5),
(90, 14, 6),
(91, 14, 8),
(92, 15, 1),
(93, 15, 2),
(94, 15, 3),
(95, 15, 4),
(96, 15, 5),
(97, 15, 6),
(98, 15, 8),
(99, 16, 1),
(100, 16, 2),
(101, 16, 3),
(102, 16, 4),
(103, 16, 5),
(104, 16, 6),
(105, 16, 8),
(106, 17, 1),
(107, 17, 2),
(108, 17, 3),
(109, 17, 4),
(110, 17, 5),
(111, 17, 6),
(112, 17, 8),
(113, 18, 1),
(114, 18, 2),
(115, 18, 3),
(116, 18, 4),
(117, 18, 5),
(118, 18, 6),
(119, 18, 8),
(120, 19, 1),
(121, 19, 2),
(122, 19, 3),
(123, 19, 4),
(124, 19, 5),
(125, 19, 6),
(126, 19, 8),
(127, 20, 1),
(128, 20, 2),
(129, 20, 3),
(130, 20, 4),
(131, 20, 5),
(132, 20, 6),
(133, 20, 8),
(134, 21, 1),
(135, 21, 2),
(136, 21, 3),
(137, 21, 4),
(138, 21, 5),
(139, 21, 6),
(140, 21, 8),
(141, 22, 1),
(142, 22, 2),
(143, 22, 3),
(144, 22, 4),
(145, 22, 5),
(146, 22, 6),
(147, 22, 8),
(148, 23, 1),
(149, 23, 2),
(150, 23, 3),
(151, 23, 4),
(152, 23, 5),
(153, 23, 6),
(154, 23, 8),
(156, 24, 5),
(157, 24, 6),
(155, 24, 8),
(159, 25, 4),
(160, 25, 5),
(161, 25, 6),
(158, 25, 8),
(163, 26, 4),
(164, 26, 5),
(165, 26, 6),
(162, 26, 8),
(166, 27, 1),
(167, 27, 2),
(168, 27, 3),
(169, 27, 4),
(170, 27, 5),
(171, 27, 6),
(172, 27, 8),
(173, 28, 1),
(174, 28, 2),
(175, 28, 3),
(176, 28, 4),
(177, 28, 5),
(178, 28, 6),
(179, 28, 8),
(180, 29, 1),
(181, 29, 2),
(182, 29, 3),
(183, 29, 4),
(184, 29, 5),
(185, 29, 6),
(186, 29, 8),
(187, 30, 1),
(188, 30, 2),
(189, 30, 3),
(190, 30, 4),
(191, 30, 5),
(192, 30, 6),
(193, 30, 8),
(194, 31, 1),
(195, 31, 2),
(196, 31, 3),
(197, 31, 4),
(198, 31, 5),
(199, 31, 6),
(200, 31, 8),
(201, 32, 1),
(202, 32, 2),
(203, 32, 3),
(204, 32, 4),
(205, 32, 5),
(206, 32, 6),
(207, 32, 8),
(208, 33, 1),
(209, 33, 2),
(210, 33, 3),
(211, 33, 4),
(212, 33, 5),
(213, 33, 6),
(214, 33, 8),
(215, 34, 1),
(216, 34, 2),
(217, 34, 3),
(218, 34, 4),
(219, 34, 5),
(220, 34, 6),
(221, 34, 8);

-- --------------------------------------------------------

--
-- Table structure for table `products_laptopspec_wireless_connectivity`
--

CREATE TABLE `products_laptopspec_wireless_connectivity` (
  `id` bigint(20) NOT NULL,
  `laptopspec_id` bigint(20) NOT NULL,
  `wirelessconnectivity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_laptopspec_wireless_connectivity`
--

INSERT INTO `products_laptopspec_wireless_connectivity` (`id`, `laptopspec_id`, `wirelessconnectivity_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2),
(9, 5, 1),
(10, 5, 2),
(13, 8, 1),
(14, 8, 2),
(15, 9, 1),
(16, 9, 2),
(17, 10, 1),
(18, 10, 2),
(19, 11, 1),
(20, 11, 2),
(21, 12, 1),
(22, 12, 2),
(23, 13, 1),
(24, 13, 2),
(25, 14, 1),
(26, 14, 2),
(27, 15, 1),
(28, 15, 2),
(29, 16, 1),
(30, 16, 2),
(31, 17, 1),
(32, 17, 2),
(33, 18, 1),
(34, 18, 2),
(35, 19, 1),
(36, 19, 2),
(37, 20, 1),
(38, 20, 2),
(39, 21, 1),
(40, 21, 2),
(41, 22, 1),
(42, 22, 2),
(43, 23, 1),
(44, 23, 2),
(45, 24, 1),
(46, 24, 2),
(47, 25, 1),
(48, 25, 2),
(49, 26, 1),
(50, 26, 2),
(51, 27, 1),
(52, 27, 2),
(53, 28, 1),
(54, 28, 2),
(55, 29, 1),
(56, 29, 2),
(57, 30, 1),
(58, 30, 2),
(59, 31, 1),
(60, 31, 2),
(61, 32, 1),
(62, 32, 2),
(63, 33, 1),
(64, 33, 2),
(65, 34, 1),
(66, 34, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_memorybrand`
--

CREATE TABLE `products_memorybrand` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_memorybrand`
--

INSERT INTO `products_memorybrand` (`id`, `slug`, `name`) VALUES
(1, 'crucial', 'Crucial'),
(2, 'samsung', 'Samsung'),
(4, 'apple', 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `products_memoryspec`
--

CREATE TABLE `products_memoryspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `memory_brand_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_memoryspec`
--

INSERT INTO `products_memoryspec` (`id`, `slug`, `capacity`, `type`, `speed`, `memory_brand_id`) VALUES
(1, '16', 16, 'DDR5', 4800, 2),
(2, '16-1', 16, 'DDR5', 4800, 1),
(3, '32', 32, 'M.2 NVME', 4800, 2),
(5, '8', 8, 'DDR5', 4800, 4),
(6, '16-2', 16, 'DDR5', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `products_operatingsystem`
--

CREATE TABLE `products_operatingsystem` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `operating_system` varchar(100) DEFAULT NULL,
  `operating_system_detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_operatingsystem`
--

INSERT INTO `products_operatingsystem` (`id`, `slug`, `operating_system`, `operating_system_detail`) VALUES
(1, 'window-11-pro', 'Window 11 Pro', NULL),
(2, 'window-10-pro', 'Window 10 Pro', NULL),
(3, 'macos', 'MacOS', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_portspec`
--

CREATE TABLE `products_portspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `port` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_portspec`
--

INSERT INTO `products_portspec` (`id`, `slug`, `port`) VALUES
(1, 'usb-30', 'USB 3.0'),
(2, 'usb-32', 'USB 3.2'),
(3, 'ethernet', 'Ethernet'),
(4, 'hdmi-21', 'HDMI 2.1'),
(5, '35-mm', '3.5 mm'),
(6, 'type-c', 'Type C'),
(8, 'type-c-thunderbolt', 'Type-C Thunderbolt');

-- --------------------------------------------------------

--
-- Table structure for table `products_product`
--

CREATE TABLE `products_product` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `warranty_months` int(11) DEFAULT NULL,
  `warranty_years` int(11) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_product`
--

INSERT INTO `products_product` (`id`, `slug`, `name`, `model`, `description`, `price`, `year`, `warranty_months`, `warranty_years`, `brand_id`, `category_id`, `color_id`, `created_at`) VALUES
(1, 'asus-tuf-dash-f15-fx507ze', 'Asus Tuf Dash F15', 'FX507ZE', '', 999.00, '2024', NULL, 2, 1, 1, 1, '2024-04-11 08:39:23.000000'),
(2, 'rog-g16-strix-gze16yz', 'ROG G16 Strix', 'GZE16YZ', '', 1299.00, '2024', 12, NULL, 2, 1, 2, '2024-05-11 08:39:23.000000'),
(3, 'msi-katana-gf76-11ue-464kh', 'MSI Katana GF76', '11UE-464KH', '', 899.00, '2023', NULL, 2, 4, 1, 2, '2024-06-11 08:39:23.000000'),
(4, 'asus-tuf-f17-f17cxze', 'Asus Tuf F17', 'F17CXZE', '', 1159.00, '2024', NULL, 1, 1, 1, 1, '2024-07-11 08:39:23.000000'),
(5, 'macbook-m3-chip', 'Macbook Pro', 'M3', '', 1899.00, '2024', NULL, 2, 7, 1, 4, '2024-07-14 12:14:39.000000'),
(8, 'asus-tuf-gaming-f15-fx506lh', 'ASUS TUF Gaming F15', 'FX506LH', '', 1099.00, '2024', NULL, 2, 1, 1, 1, '2024-07-23 07:42:12.000000'),
(9, 'asus-tuf-gaming-a15-fa507nu', 'ASUS TUF Gaming A15', 'FA507NU', '', 1299.00, '2023', NULL, 2, 1, 1, 1, '2024-07-23 07:46:22.000000'),
(10, 'asus-rog-strix-g15-advantage-edition', 'ASUS ROG Strix G15', 'Advantage Edition', '', 1299.00, '2023', NULL, 1, 2, 1, 2, '2024-07-23 07:50:08.000000'),
(11, 'rog-zephyrus-g14-ga402', 'ROG Zephyrus G14', 'GA402', '', 1599.00, '2023', NULL, 2, 2, 1, 3, '2024-07-23 07:55:37.000000'),
(12, 'asus-rog-strix-scar-18-g834jy', 'ASUS ROG Strix Scar 18', 'G834JY', '', 2199.00, '2024', NULL, 2, 2, 1, 2, '2024-07-23 07:59:31.000000'),
(13, 'acer-predator-helios-300-ph315', 'Acer Predator Helios 300', 'PH315', '', 1999.00, '2024', NULL, 2, 3, 1, 2, '2024-07-23 08:02:28.000000'),
(14, 'acer-nitro-5-an517', 'Acer Nitro 5', 'AN517', '', 1199.00, '2024', NULL, 2, 3, 1, 2, '2024-07-23 08:06:44.000000'),
(15, 'acer-predator-triton-300-se-pt314', 'Acer Predator Triton 300 SE', 'PT314', '', 1499.00, '2024', NULL, 2, 3, 1, 1, '2024-07-23 08:09:52.000000'),
(16, 'acer-predator-helios-18-ph18', 'Acer Predator Helios 18', 'PH18', '', 2399.00, '2024', NULL, 2, 3, 1, 4, '2024-07-23 08:11:33.000000'),
(17, 'msi-stealth-gs66-10sf-683', 'MSI Stealth GS66', '10SF-683', '', 1399.00, '2023', NULL, 1, 4, 1, 2, '2024-07-23 08:14:18.000000'),
(18, 'msi-stealth-gs66-11ue-046us', 'MSI Stealth GS66', '11UE-046US', '', 1899.00, '2023', NULL, 1, 4, 1, 2, '2024-07-23 08:16:00.000000'),
(19, 'msi-titan-gt77-2024-12ugs', 'MSI Titan GT77 (2024)', '12UGS', '', 2699.00, '2024', NULL, 2, 4, 1, 2, '2024-07-23 08:17:49.000000'),
(20, 'alienware-m15-r7-2023-awm15r7', 'Alienware M15 R7', '‎AWM15R7', '', 1999.00, '2023', NULL, 2, 5, 1, 1, '2024-07-23 08:21:21.000000'),
(21, 'dell-g15-none', 'Dell', 'G15', '', 1099.00, '2024', NULL, 2, 5, 1, 1, '2024-07-23 08:59:18.000000'),
(22, 'dell-g16', 'Dell', 'G16', '', 1199.00, '2024', NULL, 2, 5, 1, 2, '2024-07-23 09:22:40.000000'),
(23, 'alienware-m15-r7-awm15r7', 'Alienware M15 R7', '‎AWM15R7', '', 2199.00, '2024', NULL, 2, 5, 1, 1, '2024-07-23 09:25:51.000000'),
(24, 'macbook-air-m3', 'Macbook Air', 'M3', '', 1499.00, '2024', NULL, 1, 7, 1, 1, '2024-07-23 09:30:31.000000'),
(25, 'macbook-pro-m1', 'Macbook Pro', 'M1', '', 2499.00, '2021', NULL, 1, 7, 1, 1, '2024-07-23 10:26:52.000000'),
(26, 'macbook-air-m2', 'Macbook Air', 'M2', '', 1499.00, '2022', NULL, 1, 7, 1, 5, '2024-07-23 10:30:14.000000'),
(27, 'razer-blade-14-rz09', 'Razer Blade 14', 'RZ09', '', 1699.00, '2022', NULL, 2, 6, 1, 2, '2024-08-13 01:57:15.000000'),
(28, 'razer-blade-15-rz09-0369x', 'Razer Blade 15', 'RZ09-0369x', '', 2599.00, '2023', NULL, 2, 6, 1, 2, '2024-08-13 02:01:26.000000'),
(29, 'razer-blade-16-rz09-0509', 'Razer Blade 16', 'RZ09-0509', '', 2699.00, '2023', NULL, 2, 6, 1, 3, '2024-08-13 02:04:34.000000'),
(30, 'razer-blade-18-rz09-0509', 'Razer Blade 18', 'RZ09-0509', '', 3299.00, '2023', NULL, 2, 6, 1, 2, '2024-08-13 02:06:01.000000'),
(31, 'lenovo-legion-5-pro-16iah7h', 'Lenovo Legion 5 Pro', '16IAH7H', '', 1599.00, '2023', NULL, 2, 8, 1, 4, '2024-08-13 02:09:35.000000'),
(32, 'lenovo-legion-7i-pro-82wq0095ya', 'Lenovo Legion 7i Pro', '82WQ0095YA', '', 2199.00, '2023', NULL, 2, 8, 1, 2, '2024-08-13 02:11:06.000000'),
(33, 'lenovo-legion-9-16irx9', 'Lenovo Legion 9', '16IRX9', '', 2999.00, '2023', NULL, 2, 8, 1, 2, '2024-08-13 02:14:15.000000'),
(34, 'lenovo-ideapad-3-15arh7', 'Lenovo Ideapad 3', '15ARH7', '', 1299.00, '2023', NULL, 2, 8, 1, 1, '2024-08-13 02:18:21.000000');

-- --------------------------------------------------------

--
-- Table structure for table `products_productimage`
--

CREATE TABLE `products_productimage` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_productimage`
--

INSERT INTO `products_productimage` (`id`, `image`, `product_id`) VALUES
(1, 'content/57d9e0ee-24f3-4843-a790-27b6fc0d9e3c/asus-tuf-dash-f15.png', 1),
(2, 'content/006da649-db7a-4a54-8d68-ef326333fe4a/w800_1.png', 1),
(3, 'content/04831069-ad0c-4faa-9510-7b18978aaeb8/w800.png', 1),
(5, 'content/d79204da-b2bb-4bad-9b8d-e7d051955c91/ROG_G16_Strix.webp', 2),
(6, 'content/9d50284e-7194-4878-bc8d-71875146ec1e/h732.png', 2),
(7, 'content/87f3ac80-45f4-43d2-99a1-88438d0dfca4/h732-2023-04-24T100652.028_d82c1dba-cdf8-4_ZEyU17p.webp', 2),
(8, 'content/f66da2ae-63e4-4bae-be8a-7681a61c84c2/image-removebg-preview_1.png', 3),
(9, 'content/ddd5964f-025c-46a3-9ac6-3e8104c2fb37/image-removebg-preview.png', 3),
(10, 'content/2ee23b96-bb42-4af6-b35b-d6feac33ded8/image-removebg-preview_2.png', 3),
(11, 'content/74a1e3dd-21cc-4635-8a8e-e394e24c78bc/download.png', 4),
(12, 'content/b5659d79-ac11-43d9-b807-73e27743b5b6/download_1.png', 4),
(16, 'content/af08edb4-067b-4eaf-b76e-b46b9220f7e1/m3_mac.png', 5),
(23, 'content/117521f1-9dc8-4fed-8b3a-3645e2703357/FX506LH.png', 8),
(24, 'content/2d3fea97-95cf-4f88-a74d-6d99dcba4549/FX506LH2.png', 8),
(25, 'content/59614564-212c-41e7-9c4e-a1f1d16cb2d7/FX506LH3.png', 8),
(26, 'content/c21897eb-947c-4a0e-9298-4e18ae4c0906/FX506LH4.png', 8),
(27, 'content/b27b13e4-6140-47f3-8a5d-b375ce8c0a20/FX506LH.png', 8),
(28, 'content/64308451-dc8d-4922-b2d4-84203d313a81/ASUS_TUF_Gaming_A15.png', 9),
(29, 'content/300f843f-c283-4bf3-91d4-d08b3181cdb2/ASUS_TUF_Gaming_A15_2.png', 9),
(30, 'content/4eb6558f-c2a4-4159-a585-a725819287df/ASUS_TUF_Gaming_A15_3.png', 9),
(31, 'content/a2416872-9f15-4da0-839b-29bf062349e5/ASUS_TUF_Gaming_A15.png', 9),
(32, 'content/4ce4808b-5e2d-4a38-b295-2e1cb691fc53/ASUS_ROG_Strix_G15_Advantage_Edition.jpg', 10),
(33, 'content/e6105745-0f6b-4f08-8b69-ae9a1709b328/ASUS_ROG_Strix_G15_Advantage_Edition2.jpg', 10),
(38, 'content/b663e0b5-d9c8-4662-ade9-2f41f5447359/GA402.png', 11),
(39, 'content/94b108dd-6d8d-44b4-9566-ed000301cf92/GA4022.png', 11),
(40, 'content/fc267bd2-1433-4daa-9949-fa32c1e47d24/ASUS_ROG_Strix_Scar_18_2024.png', 12),
(41, 'content/a227440e-6e04-47f4-b307-a1271f9bf3a4/ASUS_ROG_Strix_Scar_18_20242.png', 12),
(42, 'content/ed6c737a-47c9-422d-ba7e-139348f2b043/ASUS_ROG_Strix_Scar_18_20243.png', 12),
(43, 'content/eda573ab-76af-4cf8-8af3-c5f7492d068c/Acer_Predator_Helios_300_2024.webp', 13),
(44, 'content/50469e33-56e3-4339-915d-d2ce4236c63a/Acer_Predator_Helios_300_20242.png', 13),
(45, 'content/51cbf3b5-8d3c-480d-b604-215b81094d4a/Acer_Predator_Helios_300_20243.webp', 13),
(46, 'content/ca5a001d-855c-407b-ad76-05d2e305901f/Acer_Nitro_5_2024.webp', 14),
(47, 'content/5466d493-cbd7-4f12-bba1-37a2da857164/Acer_Nitro_5_20242.png', 14),
(48, 'content/374eed1c-6aab-4f2f-868e-9097945fc049/Acer_Nitro_5_20243.webp', 14),
(49, 'content/cd449c53-86f7-494a-9594-aee582a2b36e/Acer_Predator_Triton_300_SE_2024.png', 15),
(50, 'content/d6ccdd87-2459-446d-a8f6-e804883207c8/Acer_Predator_Triton_300_SE_20242.webp', 15),
(51, 'content/5a86cd8c-8f71-4799-8cac-ff32a98e67b8/Acer_Predator_Helios_18_2024.png', 16),
(52, 'content/fb75d34f-7933-4b46-8603-6b00a538168e/Acer_Predator_Helios_18_2024_2.png', 16),
(53, 'content/1b513a69-a38b-42f1-82b5-7e2c15dae299/Acer_Predator_Helios_18_2024_3.png', 16),
(54, 'content/a4ec43be-7463-44d1-bd00-c1af9098963b/MSI_Stealth_GS66_2023.webp', 17),
(55, 'content/8f34b7e6-2a30-42af-aea2-d14afda1c439/MSI_Stealth_GS66_2023_2.png', 17),
(56, 'content/395e87c3-2922-4d51-b9ce-05c1ef163c17/MSI_Stealth_GS66_20233.jpg', 17),
(57, 'content/a77c57a5-c907-4ed0-b630-6bf189e56211/MSI_Raider_GE76_2023.webp', 18),
(58, 'content/6ccf94ca-12ef-4234-b28f-d6c47521c1dd/MSI_Raider_GE76_20233.png', 18),
(59, 'content/8a8c0bd2-de17-4a95-87d8-96564b2897d5/MSI_Raider_GE76_20234.webp', 18),
(61, 'content/a4c85884-76e5-4cbb-b9f1-74428ece6b7d/MSI_Titan_GT77_2024.png', 19),
(62, 'content/0b50a96d-1ecf-487e-ae83-566ba7a34a4d/MSI_Titan_GT77_20242.png', 19),
(63, 'content/300fb37d-6f86-4d40-bf60-1f16a8e554ce/MSI_Titan_GT77_20243.png', 19),
(64, 'content/1d15d11d-d944-4d35-8f01-a113ecb76db4/MSI_Raider_GE76_20234.webp', 19),
(65, 'content/781aa140-6d36-4a4c-92f0-3405bcfd64fe/Alienware_m15_R7_2023.png', 20),
(66, 'content/7f1ab52a-81c4-4743-ba61-f056e6d30e95/Alienware_m15_R7_20232.png', 20),
(67, 'content/044f199a-cb97-475c-850d-eb577e892779/Alienware_m15_R7_20233.webp', 20),
(68, 'content/feb03870-362a-4e76-a41e-c7344ab5517b/Dell_g15_2024.webp', 21),
(69, 'content/be949c84-5404-4a59-a30a-b401712143af/Dell_g15_2024_2.webp', 21),
(70, 'content/4e7456da-d496-4d16-9860-28100e224bae/Dell_G16_2024.png', 22),
(71, 'content/475a5e88-db03-4fbc-942a-1c1e6d01dca7/Dell_G16_20242.jpg', 22),
(72, 'content/09c636e8-90d2-42e0-b8f8-44bf9cb093ef/Alienware_m15_R7_2023.png', 23),
(73, 'content/81048193-6cb0-49f9-ac92-cf5ba15f8191/Alienware_m15_R7_20232.png', 23),
(74, 'content/8b81fcc6-e222-4133-8a23-1c5c14087dd5/Alienware_m15_R7_20233.webp', 23),
(75, 'content/2aeea318-cf5d-4c72-b62b-c94445ae6309/macbook_pro_m3.png', 5),
(77, 'content/c1481e8e-4a4f-4c84-afe4-aa73990a85e0/macbook_pro_m3_2.webp', 5),
(78, 'content/d5123e6c-fc41-47b8-9784-491892164464/macbook_air_m3.png', 24),
(79, 'content/3d74a58b-00e5-4312-a0fd-ab171c57ad8d/macbook_air_m3.webp', 24),
(80, 'content/0c7dde4e-5031-4b25-94d5-72c748a506ca/macbook_air_m3_4.webp', 24),
(81, 'content/46dbb6f8-02bf-4a03-8ae0-386e1e99c44c/macbook_pro_mq_16_inches.png', 25),
(82, 'content/dc18df92-c442-45b1-8026-5ccb9cce22da/macbook_pro_mq_16_inches_2.png', 25),
(83, 'content/13656d45-5165-40eb-91be-1f5b06061892/macbook_pro_mq_16_inches_3.png', 25),
(84, 'content/bf3b4a0a-c141-45a6-89b3-24c3d5ca9539/macbook_air_m2.webp', 26),
(85, 'content/e50a0ead-89cc-4472-a2fa-fdabb31b8763/macbook_air_m2_2.png', 26),
(86, 'content/bf6dcd12-f4f4-4c5d-89af-c511bca96a78/razer.png', 27),
(87, 'content/e280e6ed-f749-4bbe-a7e0-a2609f87b0cb/razer1.png', 27),
(88, 'content/578990ea-3f5d-4541-9afa-3cf44015d2e2/razer.png', 27),
(89, 'content/a5d77446-55b4-4539-9aa9-a9d8e2af95a0/razer_blade_15.png', 28),
(90, 'content/d83dbbbc-3df0-42fb-953a-eedc7fa641a9/razer_blade_15_1.jpg', 28),
(91, 'content/bf662c87-f780-4bb3-a520-012568401e27/razer_blade_15_2.png', 28),
(92, 'content/beb07b56-104d-4316-ab01-313acf915e68/razer_blade_15.png', 28),
(93, 'content/084d10a9-cf7c-4435-9270-bd02894e2fac/razer_blade_16.png', 29),
(94, 'content/afa527b0-d9c4-4b62-90e5-d4fe5f985781/razer_blade_16_2.jpg', 29),
(95, 'content/fc3fe689-072c-4d61-b760-7727c43ff660/razer_blade_16.png', 29),
(96, 'content/eeae026d-0302-44e5-8cdd-fbd95111bb1e/Razer_blade_18.png', 30),
(97, 'content/afdfb5ee-eaf6-4514-92fa-63cbd2c5dcef/Razer_blade_18_1.png', 30),
(98, 'content/a119f7bf-37af-4092-b011-2e5a1c721649/Razer_blade_18.png', 30),
(99, 'content/72528ad0-5175-4cdb-9685-76565dda372a/Lenovo_legion_5_pro.webp', 31),
(100, 'content/d7de47af-4fc0-4099-a954-2c3791cd6ae5/Lenovo_legion_5_pro_2.webp', 31),
(101, 'content/982f34b5-5c85-4d63-9d6c-f7e4ac5eb2e7/Lenovo_legion_5_pro_3.webp', 31),
(102, 'content/b9ec6f83-edff-4cc1-a90b-1cd86bfde0d3/Lenovo_legion_5_pro.webp', 31),
(103, 'content/eefc3198-bce7-4d2c-ab5a-a5175cc8d3b8/lenovo_legion_7i_pro.webp', 32),
(104, 'content/e8c8255f-c360-45af-a794-d1177e281695/lenovo_legion_7i_pro_2.png', 32),
(105, 'content/2a1ef56c-ea36-49e1-88a0-9c38f6b36dbc/lenovo_legion_7i_pro.webp', 32),
(106, 'content/7a1fad40-0aff-4cd8-b2f8-1a1b1fd828aa/Lenovo_legion_9.webp', 33),
(107, 'content/13906631-d2da-4a10-8138-aab55342adbe/Lenovo_legion_9_2.webp', 33),
(108, 'content/87e16532-f09b-420a-b40e-9e14f5baf7b4/Lenovo_legion_9.webp', 33),
(109, 'content/cddf8c08-96f3-4532-95f5-1ba4c509820f/lenovo_gaming_ideapad3.webp', 34),
(110, 'content/d4354ad7-72bc-4106-b34b-d977b7bf1b79/lenovo_gaming_ideapad3_2.webp', 34),
(111, 'content/c05d8de7-123a-4f2f-b6b0-f68078d1a264/lenovo_gaming_ideapad3_3.webp', 34),
(112, 'content/af9e16f1-d65b-47a8-9067-fa75e8e9874c/lenovo_gaming_ideapad3.webp', 34);

-- --------------------------------------------------------

--
-- Table structure for table `products_refreshrate`
--

CREATE TABLE `products_refreshrate` (
  `id` bigint(20) NOT NULL,
  `rate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_refreshrate`
--

INSERT INTO `products_refreshrate` (`id`, `rate`) VALUES
(6, '120'),
(2, '144'),
(4, '165'),
(5, '170'),
(3, '60');

-- --------------------------------------------------------

--
-- Table structure for table `products_resolutionspec`
--

CREATE TABLE `products_resolutionspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `resolution` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_resolutionspec`
--

INSERT INTO `products_resolutionspec` (`id`, `slug`, `resolution`) VALUES
(1, 'hd', 'Full HD'),
(3, 'hd-1', 'HD'),
(4, '2k', '2K'),
(5, '4k', '4K');

-- --------------------------------------------------------

--
-- Table structure for table `products_stock`
--

CREATE TABLE `products_stock` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `product_id` bigint(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_stock`
--

INSERT INTO `products_stock` (`id`, `quantity`, `product_id`, `updated_at`) VALUES
(1, 86, 1, '2024-07-26 08:47:58.595386'),
(2, 9, 8, '2024-07-25 07:49:54.146773'),
(3, 148, 14, '2024-07-25 07:49:54.146773'),
(4, 7, 24, '2024-07-25 07:49:54.146773'),
(5, 7, 26, '2024-07-25 07:49:54.146773'),
(6, 100, 3, '2024-08-13 01:43:54.130558'),
(8, 12, 25, '2024-07-25 07:53:05.009328'),
(9, 18, 16, '2024-07-31 06:52:50.822953'),
(10, 18, 13, '2024-07-31 06:53:02.185374'),
(11, 14, 4, '2024-07-31 06:53:11.383468'),
(12, 19, 21, '2024-07-31 06:53:22.342140'),
(13, 19, 10, '2024-07-31 06:55:37.678199'),
(14, 19, 5, '2024-08-12 03:05:48.179171'),
(15, 13, 20, '2024-08-12 03:06:22.146799'),
(16, 19, 23, '2024-08-12 03:06:32.349118'),
(17, 19, 2, '2024-08-12 06:36:33.634082'),
(18, 18, 11, '2024-08-12 06:36:52.129917'),
(19, 19, 22, '2024-08-12 15:04:23.597937'),
(20, 24, 19, '2024-08-12 15:08:01.519691'),
(21, 23, 12, '2024-08-12 15:11:48.137716'),
(22, 20, 31, '2024-08-18 03:45:33.389182'),
(23, 20, 32, '2024-08-18 03:45:43.012102'),
(24, 20, 33, '2024-08-18 03:46:07.914797'),
(25, 19, 30, '2024-08-18 03:46:26.275279'),
(26, 20, 29, '2024-08-18 03:46:35.396861'),
(27, 20, 28, '2024-08-18 03:46:41.657014'),
(28, 20, 27, '2024-08-18 03:46:47.237054'),
(29, 19, 18, '2024-08-18 03:47:14.039418'),
(30, 19, 17, '2024-08-18 03:47:25.012284'),
(31, 19, 15, '2024-08-18 03:47:43.523349'),
(32, 18, 9, '2024-08-19 05:17:20.091528');

-- --------------------------------------------------------

--
-- Table structure for table `products_storagebrand`
--

CREATE TABLE `products_storagebrand` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_storagebrand`
--

INSERT INTO `products_storagebrand` (`id`, `slug`, `name`) VALUES
(1, 'samsung', 'Samsung'),
(2, 'crucial', 'Crucial');

-- --------------------------------------------------------

--
-- Table structure for table `products_storagespec`
--

CREATE TABLE `products_storagespec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `capacity_type` varchar(100) NOT NULL,
  `interface` varchar(100) DEFAULT NULL,
  `read_speed` int(11) DEFAULT NULL,
  `write_speed` int(11) DEFAULT NULL,
  `form_factor` varchar(100) DEFAULT NULL,
  `storage_brand_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_storagespec`
--

INSERT INTO `products_storagespec` (`id`, `slug`, `type`, `capacity`, `capacity_type`, `interface`, `read_speed`, `write_speed`, `form_factor`, `storage_brand_id`) VALUES
(1, '1', 'M.2 NVME', 1, 'TB', '3x4', 5000, 5000, 'M.2', 1),
(2, '512', 'M.2 NVME', 512, 'GB', '3x4', 5000, 5000, 'M.2', 2),
(4, '2', 'M.2 NVME', 2, 'TB', '3x4', 5000, 5000, 'M.2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_webcamspec`
--

CREATE TABLE `products_webcamspec` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `webcam` varchar(100) DEFAULT NULL,
  `webcam_detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_webcamspec`
--

INSERT INTO `products_webcamspec` (`id`, `slug`, `webcam`, `webcam_detail`) VALUES
(1, '720p', '720p', NULL),
(2, '1080p', '1080p', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_wirelessconnectivity`
--

CREATE TABLE `products_wirelessconnectivity` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `wireless_connectivity` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_wirelessconnectivity`
--

INSERT INTO `products_wirelessconnectivity` (`id`, `slug`, `wireless_connectivity`) VALUES
(1, 'wifi-6', 'Wifi 6'),
(2, 'bluetooth-53', 'Bluetooth 5.3');

-- --------------------------------------------------------

--
-- Table structure for table `review_productreview`
--

CREATE TABLE `review_productreview` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`extra_data`)),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`settings`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userprofile_address`
--

CREATE TABLE `userprofile_address` (
  `id` bigint(20) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address_confirmed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userprofile_notification`
--

CREATE TABLE `userprofile_notification` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `related_object_id` int(11) DEFAULT NULL,
  `is_rated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofile_notification`
--

INSERT INTO `userprofile_notification` (`id`, `message`, `created_at`, `is_read`, `user_id`, `notification_type`, `related_object_id`, `is_rated`) VALUES
(51, 'Your order #79 has been delivered and marked as completed.', '2024-07-23 01:29:06.665480', 1, 2, 'GENERAL', NULL, 0),
(52, 'Your order #80 has been delivered and marked as completed.', '2024-07-23 01:29:07.952748', 1, 2, 'GENERAL', NULL, 0),
(53, 'Your order #81 has been delivered and marked as completed.', '2024-07-23 01:29:09.430846', 1, 2, 'GENERAL', NULL, 0),
(54, 'Your order #67 has been delivered and marked as completed.', '2024-07-23 01:29:10.761928', 1, 9, 'GENERAL', NULL, 0),
(55, 'Your order #68 has been delivered and marked as completed.', '2024-07-23 01:29:13.367753', 1, 9, 'GENERAL', NULL, 0),
(56, 'Your order #69 has been delivered and marked as completed.', '2024-07-23 01:29:14.827196', 1, 9, 'GENERAL', NULL, 0),
(57, 'Your order #70 has been delivered and marked as completed.', '2024-07-23 01:29:16.113791', 1, 9, 'GENERAL', NULL, 0),
(58, 'Your order #85 has been delivered and marked as completed.', '2024-07-23 02:04:25.397697', 1, 2, 'GENERAL', NULL, 0),
(59, 'Your order #84 has been delivered and marked as completed.', '2024-07-23 02:08:54.255927', 1, 2, 'GENERAL', NULL, 0),
(60, 'Your order #83 has been delivered and marked as completed.', '2024-07-23 02:10:31.139547', 1, 2, 'GENERAL', NULL, 0),
(61, 'Your order #82 has been delivered and marked as completed.', '2024-07-23 02:21:20.672627', 1, 2, 'GENERAL', NULL, 0),
(62, 'Your order #86 has been delivered and marked as completed.', '2024-07-25 08:05:43.910169', 1, 2, 'GENERAL', NULL, 0),
(63, 'Your order #87 has been cancelled.', '2024-07-25 15:09:51.437650', 1, 9, 'GENERAL', NULL, 0),
(64, 'Your order #88 has been completed.', '2024-07-25 15:09:57.757307', 1, 9, 'GENERAL', NULL, 0),
(65, 'Your order #94 has been delivered and marked as completed.', '2024-07-26 08:54:46.567658', 1, 9, 'GENERAL', NULL, 0),
(66, 'Your order #95 has been delivered and marked as completed.', '2024-07-26 08:54:48.337439', 1, 9, 'GENERAL', NULL, 0),
(67, 'Your order #96 has been delivered and marked as completed.', '2024-07-26 08:54:49.366751', 1, 9, 'GENERAL', NULL, 0),
(68, 'Your order #97 has been delivered and marked as completed.', '2024-07-26 08:54:56.400441', 1, 9, 'GENERAL', NULL, 0),
(69, 'Your order #98 has been delivered and marked as completed.', '2024-07-26 08:55:03.829175', 1, 9, 'GENERAL', NULL, 0),
(70, 'Your order #89 has been delivered and marked as completed.', '2024-07-26 08:55:25.531957', 1, 9, 'GENERAL', NULL, 0),
(71, 'Your order #90 has been delivered and marked as completed.', '2024-07-26 08:55:27.410154', 1, 8, 'GENERAL', NULL, 0),
(72, 'Your order #91 has been delivered and marked as completed.', '2024-07-26 08:55:29.258279', 1, 9, 'GENERAL', NULL, 0),
(73, 'Your order #92 has been delivered and marked as completed.', '2024-07-26 08:55:31.015371', 1, 9, 'GENERAL', NULL, 0),
(74, 'Your order #93 has been delivered and marked as completed.', '2024-07-26 08:55:32.717795', 1, 9, 'GENERAL', NULL, 0),
(75, 'Your order #99 has been delivered and marked as completed.', '2024-07-28 11:24:27.165963', 1, 9, 'GENERAL', NULL, 0),
(76, 'Your order #100 has been delivered and marked as completed.', '2024-07-29 03:54:18.911970', 1, 8, 'GENERAL', NULL, 0),
(77, 'Your order #104 has been delivered. Please rate the product: Macbook Air', '2024-08-07 09:21:14.665818', 1, 9, 'RATE_PRODUCT', 131, 0),
(78, 'Your order #104 has been delivered and marked as completed.', '2024-08-07 09:21:14.667975', 1, 9, 'GENERAL', NULL, 0),
(79, 'Your order #105 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-08 08:01:34.339001', 1, 9, 'RATE_PRODUCT', 132, 0),
(80, 'Your order #105 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-08 08:01:34.354626', 1, 9, 'RATE_PRODUCT', 133, 0),
(81, 'Your order #105 has been delivered and marked as completed.', '2024-08-08 08:01:34.354626', 1, 9, 'GENERAL', NULL, 0),
(82, 'Your order #103 has been completed.', '2024-08-08 08:12:31.489029', 1, 9, 'GENERAL', NULL, 0),
(83, 'Your order #101 has been delivered. Please rate the product: MSI Katana GF76', '2024-08-08 08:12:59.003052', 1, 2, 'RATE_PRODUCT', 127, 0),
(84, 'Your order #101 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-08 08:12:59.003052', 1, 2, 'RATE_PRODUCT', 128, 0),
(85, 'Your order #101 has been delivered and marked as completed.', '2024-08-08 08:12:59.009889', 1, 2, 'GENERAL', NULL, 0),
(86, 'Your order #102 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-08 08:13:00.801369', 1, 3, 'RATE_PRODUCT', 129, 0),
(87, 'Your order #102 has been delivered and marked as completed.', '2024-08-08 08:13:00.801369', 1, 3, 'GENERAL', NULL, 0),
(88, 'Your order #106 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-08 08:42:27.711839', 1, 3, 'RATE_PRODUCT', 134, 0),
(89, 'Your order #106 has been delivered and marked as completed.', '2024-08-08 08:42:27.711839', 1, 3, 'GENERAL', NULL, 0),
(90, 'Your order #107 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-08 08:50:08.251625', 1, 3, 'RATE_PRODUCT', 135, 0),
(91, 'Your order #107 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-08 08:50:08.254622', 1, 3, 'RATE_PRODUCT', 136, 0),
(92, 'Your order #107 has been delivered. Please rate the product: Macbook Air', '2024-08-08 08:50:08.256680', 1, 3, 'RATE_PRODUCT', 137, 0),
(93, 'Your order #107 has been delivered and marked as completed.', '2024-08-08 08:50:08.259676', 1, 3, 'GENERAL', NULL, 0),
(94, 'Your order #108 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-08 11:10:27.025466', 1, 3, 'RATE_PRODUCT', 138, 0),
(95, 'Your order #108 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-08 11:10:27.025466', 1, 3, 'RATE_PRODUCT', 139, 0),
(96, 'Your order #108 has been delivered. Please rate the product: Macbook Air', '2024-08-08 11:10:27.041104', 1, 3, 'RATE_PRODUCT', 140, 0),
(97, 'Your order #108 has been delivered and marked as completed.', '2024-08-08 11:10:27.041104', 1, 3, 'GENERAL', NULL, 0),
(98, 'Your order #109 has been delivered. Please rate the product: Macbook Pro', '2024-08-12 03:10:53.630520', 1, 9, 'RATE_PRODUCT', 141, 0),
(99, 'Your order #109 has been delivered. Please rate the product: Macbook Pro', '2024-08-12 03:10:53.631630', 1, 9, 'RATE_PRODUCT', 142, 0),
(100, 'Your order #109 has been delivered. Please rate the product: Alienware M15 R7', '2024-08-12 03:10:53.631630', 1, 9, 'RATE_PRODUCT', 143, 0),
(101, 'Your order #109 has been delivered. Please rate the product: Alienware M15 R7', '2024-08-12 03:10:53.637212', 1, 9, 'RATE_PRODUCT', 144, 0),
(102, 'Your order #109 has been delivered and marked as completed.', '2024-08-12 03:10:53.637903', 1, 9, 'GENERAL', NULL, 0),
(103, 'Your order #110 has been delivered. Please rate the product: ROG G16 Strix', '2024-08-12 06:41:32.984320', 1, 9, 'RATE_PRODUCT', 145, 0),
(104, 'Your order #110 has been delivered. Please rate the product: ASUS ROG Strix G15', '2024-08-12 06:41:32.984320', 1, 9, 'RATE_PRODUCT', 146, 0),
(105, 'Your order #110 has been delivered. Please rate the product: ROG Zephyrus G14', '2024-08-12 06:41:32.984320', 1, 9, 'RATE_PRODUCT', 147, 0),
(106, 'Your order #110 has been delivered and marked as completed.', '2024-08-12 06:41:32.999905', 1, 9, 'GENERAL', NULL, 0),
(107, 'Your order #112 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-12 14:53:24.406286', 1, 9, 'RATE_PRODUCT', 149, 0),
(108, 'Your order #112 has been delivered and marked as completed.', '2024-08-12 14:53:24.406286', 1, 9, 'GENERAL', NULL, 0),
(109, 'Your order #111 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-12 14:53:25.685735', 1, 9, 'RATE_PRODUCT', 148, 0),
(110, 'Your order #111 has been delivered and marked as completed.', '2024-08-12 14:53:25.685735', 1, 9, 'GENERAL', NULL, 0),
(111, 'Your order #113 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-12 14:53:39.696586', 1, 9, 'RATE_PRODUCT', 150, 0),
(112, 'Your order #113 has been delivered and marked as completed.', '2024-08-12 14:53:39.696586', 1, 9, 'GENERAL', NULL, 0),
(113, 'Your order #114 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-12 14:53:41.809147', 1, 9, 'RATE_PRODUCT', 151, 0),
(114, 'Your order #114 has been delivered and marked as completed.', '2024-08-12 14:53:41.824771', 1, 9, 'GENERAL', NULL, 0),
(115, 'Your order #115 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-12 14:53:43.167020', 1, 9, 'RATE_PRODUCT', 152, 0),
(116, 'Your order #115 has been delivered and marked as completed.', '2024-08-12 14:53:43.167020', 1, 9, 'GENERAL', NULL, 0),
(117, 'Your order #116 has been delivered. Please rate the product: Alienware M15 R7', '2024-08-12 15:06:13.450706', 1, 2, 'RATE_PRODUCT', 153, 0),
(118, 'Your order #116 has been delivered. Please rate the product: Dell', '2024-08-12 15:06:13.450706', 1, 2, 'RATE_PRODUCT', 154, 0),
(119, 'Your order #116 has been delivered. Please rate the product: Dell', '2024-08-12 15:06:13.466300', 1, 2, 'RATE_PRODUCT', 155, 0),
(120, 'Your order #116 has been delivered and marked as completed.', '2024-08-12 15:06:13.466300', 1, 2, 'GENERAL', NULL, 0),
(121, 'Your order #123 has been delivered. Please rate the product: Acer Predator Helios 18', '2024-08-18 03:57:59.686565', 1, 9, 'RATE_PRODUCT', 166, 0),
(122, 'Your order #123 has been delivered. Please rate the product: Acer Nitro 5', '2024-08-18 03:57:59.686565', 1, 9, 'RATE_PRODUCT', 167, 0),
(123, 'Your order #123 has been delivered. Please rate the product: Acer Predator Helios 300', '2024-08-18 03:57:59.693348', 1, 9, 'RATE_PRODUCT', 168, 0),
(124, 'Your order #123 has been delivered. Please rate the product: ROG Zephyrus G14', '2024-08-18 03:57:59.693348', 1, 9, 'RATE_PRODUCT', 169, 0),
(125, 'Your order #123 has been delivered. Please rate the product: ASUS ROG Strix Scar 18', '2024-08-18 03:57:59.693348', 1, 9, 'RATE_PRODUCT', 170, 0),
(126, 'Your order #123 has been delivered and marked as completed.', '2024-08-18 03:57:59.702535', 1, 9, 'GENERAL', NULL, 0),
(127, 'Your order #124 has been delivered. Please rate the product: Acer Nitro 5', '2024-08-18 03:58:04.111019', 1, 3, 'RATE_PRODUCT', 171, 0),
(128, 'Your order #124 has been delivered. Please rate the product: Acer Predator Triton 300 SE', '2024-08-18 03:58:04.111019', 1, 3, 'RATE_PRODUCT', 172, 0),
(129, 'Your order #124 has been delivered. Please rate the product: Acer Predator Helios 18', '2024-08-18 03:58:04.116298', 1, 3, 'RATE_PRODUCT', 173, 0),
(130, 'Your order #124 has been delivered. Please rate the product: Acer Predator Helios 300', '2024-08-18 03:58:04.117369', 1, 3, 'RATE_PRODUCT', 174, 0),
(131, 'Your order #124 has been delivered and marked as completed.', '2024-08-18 03:58:04.117369', 1, 3, 'GENERAL', NULL, 0),
(132, 'Your order #117 has been delivered. Please rate the product: MSI Titan GT77 (2024)', '2024-08-18 03:58:11.908018', 0, 2, 'RATE_PRODUCT', 156, 0),
(133, 'Your order #117 has been delivered and marked as completed.', '2024-08-18 03:58:11.908018', 0, 2, 'GENERAL', NULL, 0),
(134, 'Your order #121 has been delivered. Please rate the product: ASUS TUF Gaming F15', '2024-08-18 03:58:17.483074', 1, 9, 'RATE_PRODUCT', 163, 0),
(135, 'Your order #121 has been delivered. Please rate the product: Asus Tuf F17', '2024-08-18 03:58:17.489936', 1, 9, 'RATE_PRODUCT', 164, 0),
(136, 'Your order #121 has been delivered and marked as completed.', '2024-08-18 03:58:17.489936', 1, 9, 'GENERAL', NULL, 0),
(137, 'Your order #122 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-18 03:58:26.825981', 1, 9, 'RATE_PRODUCT', 165, 0),
(138, 'Your order #122 has been delivered and marked as completed.', '2024-08-18 03:58:26.825981', 1, 9, 'GENERAL', NULL, 0),
(139, 'Your order #125 has been delivered. Please rate the product: Asus Tuf Dash F15', '2024-08-19 05:16:37.201297', 0, 9, 'RATE_PRODUCT', 175, 0),
(140, 'Your order #125 has been delivered and marked as completed.', '2024-08-19 05:16:37.201297', 0, 9, 'GENERAL', NULL, 0),
(141, 'Your order #126 has been delivered. Please rate the product: ASUS TUF Gaming A15', '2024-08-19 05:36:39.966356', 0, 9, 'RATE_PRODUCT', 176, 0),
(142, 'Your order #126 has been delivered and marked as completed.', '2024-08-19 05:36:39.967363', 0, 9, 'GENERAL', NULL, 0),
(143, 'Your order #127 has been delivered. Please rate the product: ASUS ROG Strix Scar 18', '2024-08-19 05:36:47.986721', 0, 2, 'RATE_PRODUCT', 177, 0),
(144, 'Your order #127 has been delivered. Please rate the product: MSI Stealth GS66', '2024-08-19 05:36:47.986721', 0, 2, 'RATE_PRODUCT', 178, 0),
(145, 'Your order #127 has been delivered. Please rate the product: MSI Stealth GS66', '2024-08-19 05:36:47.992415', 0, 2, 'RATE_PRODUCT', 179, 0),
(146, 'Your order #127 has been delivered and marked as completed.', '2024-08-19 05:36:47.993369', 0, 2, 'GENERAL', NULL, 0),
(147, 'Your order #128 has been delivered. Please rate the product: Razer Blade 18', '2024-08-19 05:36:49.829865', 1, 3, 'RATE_PRODUCT', 180, 0),
(148, 'Your order #128 has been delivered and marked as completed.', '2024-08-19 05:36:49.835647', 1, 3, 'GENERAL', NULL, 0),
(149, 'Your order #129 has been delivered. Please rate the product: ASUS TUF Gaming A15', '2024-08-19 05:56:48.330237', 1, 3, 'RATE_PRODUCT', 181, 0),
(150, 'Your order #129 has been delivered and marked as completed.', '2024-08-19 05:56:48.330237', 1, 3, 'GENERAL', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userprofile_userprofile`
--

CREATE TABLE `userprofile_userprofile` (
  `id` bigint(20) NOT NULL,
  `pfp` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  ADD KEY `account_emailaddress_email_03be32b2` (`email`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `advertisements_advertisement`
--
ALTER TABLE `advertisements_advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_apikey`
--
ALTER TABLE `api_apikey`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `api_apikey_user_id_7ebe0e24_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `delivery_deliveryassignment`
--
ALTER TABLE `delivery_deliveryassignment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_deliveryassignment_order_id_a7f3b67d_uniq` (`order_id`),
  ADD KEY `delivery_deliveryass_delivery_staff_id_a9d0042e_fk_delivery_` (`delivery_staff_id`);

--
-- Indexes for table `delivery_deliveryassignmenthistory`
--
ALTER TABLE `delivery_deliveryassignmenthistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_deliveryass_delivery_staff_id_0744a5bb_fk_delivery_` (`delivery_staff_id`),
  ADD KEY `delivery_deliveryass_order_id_9f7862a1_fk_orders_or` (`order_id`);

--
-- Indexes for table `delivery_deliverystaff`
--
ALTER TABLE `delivery_deliverystaff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `home_aboutus`
--
ALTER TABLE `home_aboutus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_contactus`
--
ALTER TABLE `home_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_footer`
--
ALTER TABLE `home_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_menuitem`
--
ALTER TABLE `home_menuitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_socialmedia`
--
ALTER TABLE `home_socialmedia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_socialmedia_footer_id_d1f1e201_fk_home_footer_id` (`footer_id`);

--
-- Indexes for table `myapp_products`
--
ALTER TABLE `myapp_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_cartitem`
--
ALTER TABLE `orders_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_cartitem_product_id_55063ee7_fk_products_product_id` (`product_id`),
  ADD KEY `orders_cartitem_order_id_17861e27_fk_orders_order_id` (`order_id`);

--
-- Indexes for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_order_user_id_e9b59eb1_fk_auth_user_id` (`user_id`),
  ADD KEY `orders_order_order_address_id_a5b0738f_fk_orders_orderaddress_id` (`order_address_id`);

--
-- Indexes for table `orders_orderaddress`
--
ALTER TABLE `orders_orderaddress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_orderhistory`
--
ALTER TABLE `orders_orderhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_orderhistory_user_id_1dd0ecc9_fk_auth_user_id` (`user_id`),
  ADD KEY `orders_orderhistory_order_address_id_084dcfde_fk_orders_or` (`order_address_id`);

--
-- Indexes for table `orders_orderhistoryitem`
--
ALTER TABLE `orders_orderhistoryitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_orderhistoryi_order_history_id_8553234b_fk_orders_or` (`order_history_id`),
  ADD KEY `orders_orderhistoryi_product_id_288488eb_fk_products_` (`product_id`);

--
-- Indexes for table `orders_productrating`
--
ALTER TABLE `orders_productrating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_productrating_user_id_product_id_order_6978d7c8_uniq` (`user_id`,`product_id`,`order_history_item_id`),
  ADD KEY `orders_productrating_order_history_item_i_9df5e3a4_fk_orders_or` (`order_history_item_id`),
  ADD KEY `orders_productrating_product_id_5fb20cce_fk_products_product_id` (`product_id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`);

--
-- Indexes for table `products_batteryspec`
--
ALTER TABLE `products_batteryspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_brand`
--
ALTER TABLE `products_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_color`
--
ALTER TABLE `products_color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_cpubrand`
--
ALTER TABLE `products_cpubrand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_cpuspec`
--
ALTER TABLE `products_cpuspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_cpuspec_cpu_brand_id_4316f762_fk_products_cpubrand_id` (`cpu_brand_id`);

--
-- Indexes for table `products_displayspec`
--
ALTER TABLE `products_displayspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_gpubrand`
--
ALTER TABLE `products_gpubrand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_gpuspec`
--
ALTER TABLE `products_gpuspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_gpuspec_gpu_brand_id_d7912867_fk_products_gpubrand_id` (`gpu_brand_id`);

--
-- Indexes for table `products_laptopspec`
--
ALTER TABLE `products_laptopspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `products_laptopspec_battery_id_be6fa70d_fk_products_` (`battery_id`),
  ADD KEY `products_laptopspec_cpu_id_09a41ad6_fk_products_cpuspec_id` (`cpu_id`),
  ADD KEY `products_laptopspec_display_id_b833d8d3_fk_products_` (`display_id`),
  ADD KEY `products_laptopspec_memory_id_1bfab4bb_fk_products_memoryspec_id` (`memory_id`),
  ADD KEY `products_laptopspec_operating_system_id_51cb9de7_fk_products_` (`operating_system_id`),
  ADD KEY `products_laptopspec_storage_id_aeffc831_fk_products_` (`storage_id`),
  ADD KEY `products_laptopspec_webcam_id_ab95b0ed_fk_products_webcamspec_id` (`webcam_id`),
  ADD KEY `products_laptopspec_refresh_rate_id_8226597b_fk_products_` (`refresh_rate_id`),
  ADD KEY `products_laptopspec_resolution_id_785f3dcd_fk_products_` (`resolution_id`);

--
-- Indexes for table `products_laptopspec_gpu`
--
ALTER TABLE `products_laptopspec_gpu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_laptopspec_gpu_laptopspec_id_gpuspec_id_d4364eaa_uniq` (`laptopspec_id`,`gpuspec_id`),
  ADD KEY `products_laptopspec__gpuspec_id_11a538f1_fk_products_` (`gpuspec_id`);

--
-- Indexes for table `products_laptopspec_port`
--
ALTER TABLE `products_laptopspec_port`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_laptopspec_port_laptopspec_id_portspec_id_bf635a32_uniq` (`laptopspec_id`,`portspec_id`),
  ADD KEY `products_laptopspec__portspec_id_57a10a00_fk_products_` (`portspec_id`);

--
-- Indexes for table `products_laptopspec_wireless_connectivity`
--
ALTER TABLE `products_laptopspec_wireless_connectivity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_laptopspec_wire_laptopspec_id_wirelessco_8b541986_uniq` (`laptopspec_id`,`wirelessconnectivity_id`),
  ADD KEY `products_laptopspec__wirelessconnectivity_b86530ac_fk_products_` (`wirelessconnectivity_id`);

--
-- Indexes for table `products_memorybrand`
--
ALTER TABLE `products_memorybrand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_memoryspec`
--
ALTER TABLE `products_memoryspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_memoryspec_memory_brand_id_460a9e52_fk_products_` (`memory_brand_id`);

--
-- Indexes for table `products_operatingsystem`
--
ALTER TABLE `products_operatingsystem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_portspec`
--
ALTER TABLE `products_portspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_product_brand_id_3e2e8fd1_fk_products_brand_id` (`brand_id`),
  ADD KEY `products_product_category_id_9b594869_fk_products_category_id` (`category_id`),
  ADD KEY `products_product_color_id_ea90b1b8_fk_products_color_id` (`color_id`);

--
-- Indexes for table `products_productimage`
--
ALTER TABLE `products_productimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_productimage_product_id_e747596a_fk_products_product_id` (`product_id`);

--
-- Indexes for table `products_refreshrate`
--
ALTER TABLE `products_refreshrate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rate` (`rate`);

--
-- Indexes for table `products_resolutionspec`
--
ALTER TABLE `products_resolutionspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_stock`
--
ALTER TABLE `products_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `products_storagebrand`
--
ALTER TABLE `products_storagebrand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_storagespec`
--
ALTER TABLE `products_storagespec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `products_storagespec_storage_brand_id_d0e9e27d_fk_products_` (`storage_brand_id`);

--
-- Indexes for table `products_webcamspec`
--
ALTER TABLE `products_webcamspec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products_wirelessconnectivity`
--
ALTER TABLE `products_wirelessconnectivity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `review_productreview`
--
ALTER TABLE `review_productreview`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `review_productreview_product_id_user_id_order_id_c956fc3c_uniq` (`product_id`,`user_id`,`order_id`),
  ADD KEY `review_productreview_order_id_72db4918_fk_orders_orderhistory_id` (`order_id`),
  ADD KEY `review_productreview_user_id_5a746793_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- Indexes for table `userprofile_address`
--
ALTER TABLE `userprofile_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userprofile_address_user_id_cb0ab88c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `userprofile_notification`
--
ALTER TABLE `userprofile_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userprofile_notification_user_id_86677c34_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `userprofile_userprofile`
--
ALTER TABLE `userprofile_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements_advertisement`
--
ALTER TABLE `advertisements_advertisement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `api_apikey`
--
ALTER TABLE `api_apikey`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `delivery_deliveryassignment`
--
ALTER TABLE `delivery_deliveryassignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `delivery_deliveryassignmenthistory`
--
ALTER TABLE `delivery_deliveryassignmenthistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `delivery_deliverystaff`
--
ALTER TABLE `delivery_deliverystaff`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_aboutus`
--
ALTER TABLE `home_aboutus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_contactus`
--
ALTER TABLE `home_contactus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_footer`
--
ALTER TABLE `home_footer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_menuitem`
--
ALTER TABLE `home_menuitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `home_socialmedia`
--
ALTER TABLE `home_socialmedia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `myapp_products`
--
ALTER TABLE `myapp_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_cartitem`
--
ALTER TABLE `orders_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `orders_order`
--
ALTER TABLE `orders_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders_orderaddress`
--
ALTER TABLE `orders_orderaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders_orderhistory`
--
ALTER TABLE `orders_orderhistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `orders_orderhistoryitem`
--
ALTER TABLE `orders_orderhistoryitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `orders_productrating`
--
ALTER TABLE `orders_productrating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_batteryspec`
--
ALTER TABLE `products_batteryspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_brand`
--
ALTER TABLE `products_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products_color`
--
ALTER TABLE `products_color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products_cpubrand`
--
ALTER TABLE `products_cpubrand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products_cpuspec`
--
ALTER TABLE `products_cpuspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products_displayspec`
--
ALTER TABLE `products_displayspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products_gpubrand`
--
ALTER TABLE `products_gpubrand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_gpuspec`
--
ALTER TABLE `products_gpuspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products_laptopspec`
--
ALTER TABLE `products_laptopspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products_laptopspec_gpu`
--
ALTER TABLE `products_laptopspec_gpu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products_laptopspec_port`
--
ALTER TABLE `products_laptopspec_port`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `products_laptopspec_wireless_connectivity`
--
ALTER TABLE `products_laptopspec_wireless_connectivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products_memorybrand`
--
ALTER TABLE `products_memorybrand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_memoryspec`
--
ALTER TABLE `products_memoryspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_operatingsystem`
--
ALTER TABLE `products_operatingsystem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_portspec`
--
ALTER TABLE `products_portspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products_productimage`
--
ALTER TABLE `products_productimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `products_refreshrate`
--
ALTER TABLE `products_refreshrate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_resolutionspec`
--
ALTER TABLE `products_resolutionspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products_stock`
--
ALTER TABLE `products_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products_storagebrand`
--
ALTER TABLE `products_storagebrand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_storagespec`
--
ALTER TABLE `products_storagespec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_webcamspec`
--
ALTER TABLE `products_webcamspec`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_wirelessconnectivity`
--
ALTER TABLE `products_wirelessconnectivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_productreview`
--
ALTER TABLE `review_productreview`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userprofile_address`
--
ALTER TABLE `userprofile_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userprofile_notification`
--
ALTER TABLE `userprofile_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `userprofile_userprofile`
--
ALTER TABLE `userprofile_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `api_apikey`
--
ALTER TABLE `api_apikey`
  ADD CONSTRAINT `api_apikey_user_id_7ebe0e24_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `delivery_deliveryassignment`
--
ALTER TABLE `delivery_deliveryassignment`
  ADD CONSTRAINT `delivery_deliveryass_delivery_staff_id_a9d0042e_fk_delivery_` FOREIGN KEY (`delivery_staff_id`) REFERENCES `delivery_deliverystaff` (`id`),
  ADD CONSTRAINT `delivery_deliveryass_order_id_a7f3b67d_fk_orders_or` FOREIGN KEY (`order_id`) REFERENCES `orders_orderhistory` (`id`);

--
-- Constraints for table `delivery_deliveryassignmenthistory`
--
ALTER TABLE `delivery_deliveryassignmenthistory`
  ADD CONSTRAINT `delivery_deliveryass_delivery_staff_id_0744a5bb_fk_delivery_` FOREIGN KEY (`delivery_staff_id`) REFERENCES `delivery_deliverystaff` (`id`),
  ADD CONSTRAINT `delivery_deliveryass_order_id_9f7862a1_fk_orders_or` FOREIGN KEY (`order_id`) REFERENCES `orders_orderhistory` (`id`);

--
-- Constraints for table `delivery_deliverystaff`
--
ALTER TABLE `delivery_deliverystaff`
  ADD CONSTRAINT `delivery_deliverystaff_user_id_6c950fc8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `home_socialmedia`
--
ALTER TABLE `home_socialmedia`
  ADD CONSTRAINT `home_socialmedia_footer_id_d1f1e201_fk_home_footer_id` FOREIGN KEY (`footer_id`) REFERENCES `home_footer` (`id`);

--
-- Constraints for table `orders_cartitem`
--
ALTER TABLE `orders_cartitem`
  ADD CONSTRAINT `orders_cartitem_order_id_17861e27_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  ADD CONSTRAINT `orders_cartitem_product_id_55063ee7_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`);

--
-- Constraints for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD CONSTRAINT `orders_order_order_address_id_a5b0738f_fk_orders_orderaddress_id` FOREIGN KEY (`order_address_id`) REFERENCES `orders_orderaddress` (`id`),
  ADD CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orders_orderhistory`
--
ALTER TABLE `orders_orderhistory`
  ADD CONSTRAINT `orders_orderhistory_order_address_id_084dcfde_fk_orders_or` FOREIGN KEY (`order_address_id`) REFERENCES `orders_orderaddress` (`id`),
  ADD CONSTRAINT `orders_orderhistory_user_id_1dd0ecc9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orders_orderhistoryitem`
--
ALTER TABLE `orders_orderhistoryitem`
  ADD CONSTRAINT `orders_orderhistoryi_order_history_id_8553234b_fk_orders_or` FOREIGN KEY (`order_history_id`) REFERENCES `orders_orderhistory` (`id`),
  ADD CONSTRAINT `orders_orderhistoryi_product_id_288488eb_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`);

--
-- Constraints for table `orders_productrating`
--
ALTER TABLE `orders_productrating`
  ADD CONSTRAINT `orders_productrating_order_history_item_i_9df5e3a4_fk_orders_or` FOREIGN KEY (`order_history_item_id`) REFERENCES `orders_orderhistoryitem` (`id`),
  ADD CONSTRAINT `orders_productrating_product_id_5fb20cce_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `orders_productrating_user_id_42832bc0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `products_cpuspec`
--
ALTER TABLE `products_cpuspec`
  ADD CONSTRAINT `products_cpuspec_cpu_brand_id_4316f762_fk_products_cpubrand_id` FOREIGN KEY (`cpu_brand_id`) REFERENCES `products_cpubrand` (`id`);

--
-- Constraints for table `products_gpuspec`
--
ALTER TABLE `products_gpuspec`
  ADD CONSTRAINT `products_gpuspec_gpu_brand_id_d7912867_fk_products_gpubrand_id` FOREIGN KEY (`gpu_brand_id`) REFERENCES `products_gpubrand` (`id`);

--
-- Constraints for table `products_laptopspec`
--
ALTER TABLE `products_laptopspec`
  ADD CONSTRAINT `products_laptopspec_battery_id_be6fa70d_fk_products_` FOREIGN KEY (`battery_id`) REFERENCES `products_batteryspec` (`id`),
  ADD CONSTRAINT `products_laptopspec_cpu_id_09a41ad6_fk_products_cpuspec_id` FOREIGN KEY (`cpu_id`) REFERENCES `products_cpuspec` (`id`),
  ADD CONSTRAINT `products_laptopspec_display_id_b833d8d3_fk_products_` FOREIGN KEY (`display_id`) REFERENCES `products_displayspec` (`id`),
  ADD CONSTRAINT `products_laptopspec_memory_id_1bfab4bb_fk_products_memoryspec_id` FOREIGN KEY (`memory_id`) REFERENCES `products_memoryspec` (`id`),
  ADD CONSTRAINT `products_laptopspec_operating_system_id_51cb9de7_fk_products_` FOREIGN KEY (`operating_system_id`) REFERENCES `products_operatingsystem` (`id`),
  ADD CONSTRAINT `products_laptopspec_product_id_2cd58c94_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `products_laptopspec_refresh_rate_id_8226597b_fk_products_` FOREIGN KEY (`refresh_rate_id`) REFERENCES `products_refreshrate` (`id`),
  ADD CONSTRAINT `products_laptopspec_resolution_id_785f3dcd_fk_products_` FOREIGN KEY (`resolution_id`) REFERENCES `products_resolutionspec` (`id`),
  ADD CONSTRAINT `products_laptopspec_storage_id_aeffc831_fk_products_` FOREIGN KEY (`storage_id`) REFERENCES `products_storagespec` (`id`),
  ADD CONSTRAINT `products_laptopspec_webcam_id_ab95b0ed_fk_products_webcamspec_id` FOREIGN KEY (`webcam_id`) REFERENCES `products_webcamspec` (`id`);

--
-- Constraints for table `products_laptopspec_gpu`
--
ALTER TABLE `products_laptopspec_gpu`
  ADD CONSTRAINT `products_laptopspec__gpuspec_id_11a538f1_fk_products_` FOREIGN KEY (`gpuspec_id`) REFERENCES `products_gpuspec` (`id`),
  ADD CONSTRAINT `products_laptopspec__laptopspec_id_03e0ab81_fk_products_` FOREIGN KEY (`laptopspec_id`) REFERENCES `products_laptopspec` (`id`);

--
-- Constraints for table `products_laptopspec_port`
--
ALTER TABLE `products_laptopspec_port`
  ADD CONSTRAINT `products_laptopspec__laptopspec_id_8ae6b9bd_fk_products_` FOREIGN KEY (`laptopspec_id`) REFERENCES `products_laptopspec` (`id`),
  ADD CONSTRAINT `products_laptopspec__portspec_id_57a10a00_fk_products_` FOREIGN KEY (`portspec_id`) REFERENCES `products_portspec` (`id`);

--
-- Constraints for table `products_laptopspec_wireless_connectivity`
--
ALTER TABLE `products_laptopspec_wireless_connectivity`
  ADD CONSTRAINT `products_laptopspec__laptopspec_id_e692daf6_fk_products_` FOREIGN KEY (`laptopspec_id`) REFERENCES `products_laptopspec` (`id`),
  ADD CONSTRAINT `products_laptopspec__wirelessconnectivity_b86530ac_fk_products_` FOREIGN KEY (`wirelessconnectivity_id`) REFERENCES `products_wirelessconnectivity` (`id`);

--
-- Constraints for table `products_memoryspec`
--
ALTER TABLE `products_memoryspec`
  ADD CONSTRAINT `products_memoryspec_memory_brand_id_460a9e52_fk_products_` FOREIGN KEY (`memory_brand_id`) REFERENCES `products_memorybrand` (`id`);

--
-- Constraints for table `products_product`
--
ALTER TABLE `products_product`
  ADD CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`),
  ADD CONSTRAINT `products_product_category_id_9b594869_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`),
  ADD CONSTRAINT `products_product_color_id_ea90b1b8_fk_products_color_id` FOREIGN KEY (`color_id`) REFERENCES `products_color` (`id`);

--
-- Constraints for table `products_productimage`
--
ALTER TABLE `products_productimage`
  ADD CONSTRAINT `products_productimage_product_id_e747596a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`);

--
-- Constraints for table `products_stock`
--
ALTER TABLE `products_stock`
  ADD CONSTRAINT `products_stock_product_id_170f916b_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`);

--
-- Constraints for table `products_storagespec`
--
ALTER TABLE `products_storagespec`
  ADD CONSTRAINT `products_storagespec_storage_brand_id_d0e9e27d_fk_products_` FOREIGN KEY (`storage_brand_id`) REFERENCES `products_storagebrand` (`id`);

--
-- Constraints for table `review_productreview`
--
ALTER TABLE `review_productreview`
  ADD CONSTRAINT `review_productreview_order_id_72db4918_fk_orders_orderhistory_id` FOREIGN KEY (`order_id`) REFERENCES `orders_orderhistory` (`id`),
  ADD CONSTRAINT `review_productreview_product_id_7e3754d1_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `review_productreview_user_id_5a746793_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `userprofile_address`
--
ALTER TABLE `userprofile_address`
  ADD CONSTRAINT `userprofile_address_user_id_cb0ab88c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userprofile_notification`
--
ALTER TABLE `userprofile_notification`
  ADD CONSTRAINT `userprofile_notification_user_id_86677c34_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userprofile_userprofile`
--
ALTER TABLE `userprofile_userprofile`
  ADD CONSTRAINT `userprofile_userprofile_user_id_59dda034_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
