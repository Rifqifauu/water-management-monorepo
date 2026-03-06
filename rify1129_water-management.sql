-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 06 Mar 2026 pada 10.25
-- Versi server: 11.4.10-MariaDB-cll-lve
-- Versi PHP: 8.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rify1129_water-management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-boost.roster.scan', 'a:2:{s:6:\"roster\";O:21:\"Laravel\\Roster\\Roster\":3:{s:13:\"\0*\0approaches\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:9:{i:0;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^12.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:LARAVEL\";s:14:\"\0*\0packageName\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"12.41.1\";s:6:\"\0*\0dev\";b:0;}i:1;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.3.8\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PROMPTS\";s:14:\"\0*\0packageName\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:5:\"0.3.8\";s:6:\"\0*\0dev\";b:0;}i:2;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^4.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:SANCTUM\";s:14:\"\0*\0packageName\";s:15:\"laravel/sanctum\";s:10:\"\0*\0version\";s:5:\"4.2.1\";s:6:\"\0*\0dev\";b:0;}i:3;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.4.1\";s:10:\"\0*\0package\";E:33:\"Laravel\\Roster\\Enums\\Packages:MCP\";s:14:\"\0*\0packageName\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"0.4.1\";s:6:\"\0*\0dev\";b:1;}i:4;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.24\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PINT\";s:14:\"\0*\0packageName\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.26.0\";s:6:\"\0*\0dev\";b:1;}i:5;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.41\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:SAIL\";s:14:\"\0*\0packageName\";s:12:\"laravel/sail\";s:10:\"\0*\0version\";s:6:\"1.50.0\";s:6:\"\0*\0dev\";b:1;}i:6;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^4.1\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PEST\";s:14:\"\0*\0packageName\";s:12:\"pestphp/pest\";s:10:\"\0*\0version\";s:5:\"4.1.6\";s:6:\"\0*\0dev\";b:1;}i:7;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"12.4.4\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PHPUNIT\";s:14:\"\0*\0packageName\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:6:\"12.4.4\";s:6:\"\0*\0dev\";b:1;}i:8;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:41:\"Laravel\\Roster\\Enums\\Packages:TAILWINDCSS\";s:14:\"\0*\0packageName\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:6:\"4.1.17\";s:6:\"\0*\0dev\";b:1;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:21:\"\0*\0nodePackageManager\";E:43:\"Laravel\\Roster\\Enums\\NodePackageManager:NPM\";}s:9:\"timestamp\";i:1765364812;}', 1765451212);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-tide_samarinda_fixed', 'a:576:{i:0;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:00 WITA\";s:6:\"tinggi\";s:6:\"2.53 m\";}i:1;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:10 WITA\";s:6:\"tinggi\";s:6:\"2.50 m\";}i:2;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:20 WITA\";s:6:\"tinggi\";s:6:\"2.48 m\";}i:3;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:30 WITA\";s:6:\"tinggi\";s:6:\"2.44 m\";}i:4;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:40 WITA\";s:6:\"tinggi\";s:6:\"2.41 m\";}i:5;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 08:50 WITA\";s:6:\"tinggi\";s:6:\"2.38 m\";}i:6;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:00 WITA\";s:6:\"tinggi\";s:6:\"2.34 m\";}i:7;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:10 WITA\";s:6:\"tinggi\";s:6:\"2.30 m\";}i:8;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:20 WITA\";s:6:\"tinggi\";s:6:\"2.27 m\";}i:9;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:30 WITA\";s:6:\"tinggi\";s:6:\"2.23 m\";}i:10;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:40 WITA\";s:6:\"tinggi\";s:6:\"2.19 m\";}i:11;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 09:50 WITA\";s:6:\"tinggi\";s:6:\"2.16 m\";}i:12;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:00 WITA\";s:6:\"tinggi\";s:6:\"2.13 m\";}i:13;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:10 WITA\";s:6:\"tinggi\";s:6:\"2.09 m\";}i:14;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:20 WITA\";s:6:\"tinggi\";s:6:\"2.06 m\";}i:15;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:30 WITA\";s:6:\"tinggi\";s:6:\"2.03 m\";}i:16;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:40 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:17;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 10:50 WITA\";s:6:\"tinggi\";s:6:\"1.99 m\";}i:18;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:00 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:19;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:10 WITA\";s:6:\"tinggi\";s:6:\"1.95 m\";}i:20;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:20 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:21;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:30 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:22;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:40 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:23;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 11:50 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:24;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:00 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:25;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:10 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:26;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:20 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:27;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:30 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:28;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:40 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:29;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 12:50 WITA\";s:6:\"tinggi\";s:6:\"1.95 m\";}i:30;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:00 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:31;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:10 WITA\";s:6:\"tinggi\";s:6:\"1.99 m\";}i:32;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:20 WITA\";s:6:\"tinggi\";s:6:\"2.02 m\";}i:33;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:30 WITA\";s:6:\"tinggi\";s:6:\"2.06 m\";}i:34;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:40 WITA\";s:6:\"tinggi\";s:6:\"2.10 m\";}i:35;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 13:50 WITA\";s:6:\"tinggi\";s:6:\"2.15 m\";}i:36;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:00 WITA\";s:6:\"tinggi\";s:6:\"2.20 m\";}i:37;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:10 WITA\";s:6:\"tinggi\";s:6:\"2.25 m\";}i:38;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:20 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:39;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:30 WITA\";s:6:\"tinggi\";s:6:\"2.38 m\";}i:40;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:40 WITA\";s:6:\"tinggi\";s:6:\"2.44 m\";}i:41;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 14:50 WITA\";s:6:\"tinggi\";s:6:\"2.51 m\";}i:42;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:00 WITA\";s:6:\"tinggi\";s:6:\"2.59 m\";}i:43;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:10 WITA\";s:6:\"tinggi\";s:6:\"2.66 m\";}i:44;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:20 WITA\";s:6:\"tinggi\";s:6:\"2.74 m\";}i:45;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:30 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:46;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:40 WITA\";s:6:\"tinggi\";s:6:\"2.89 m\";}i:47;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 15:50 WITA\";s:6:\"tinggi\";s:6:\"2.96 m\";}i:48;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:00 WITA\";s:6:\"tinggi\";s:6:\"3.03 m\";}i:49;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:10 WITA\";s:6:\"tinggi\";s:6:\"3.10 m\";}i:50;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:20 WITA\";s:6:\"tinggi\";s:6:\"3.17 m\";}i:51;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:30 WITA\";s:6:\"tinggi\";s:6:\"3.23 m\";}i:52;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:40 WITA\";s:6:\"tinggi\";s:6:\"3.29 m\";}i:53;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 16:50 WITA\";s:6:\"tinggi\";s:6:\"3.35 m\";}i:54;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:00 WITA\";s:6:\"tinggi\";s:6:\"3.40 m\";}i:55;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:10 WITA\";s:6:\"tinggi\";s:6:\"3.45 m\";}i:56;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:20 WITA\";s:6:\"tinggi\";s:6:\"3.50 m\";}i:57;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:30 WITA\";s:6:\"tinggi\";s:6:\"3.54 m\";}i:58;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:40 WITA\";s:6:\"tinggi\";s:6:\"3.58 m\";}i:59;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 17:50 WITA\";s:6:\"tinggi\";s:6:\"3.61 m\";}i:60;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:00 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:61;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:10 WITA\";s:6:\"tinggi\";s:6:\"3.67 m\";}i:62;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:20 WITA\";s:6:\"tinggi\";s:6:\"3.69 m\";}i:63;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:30 WITA\";s:6:\"tinggi\";s:6:\"3.71 m\";}i:64;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:40 WITA\";s:6:\"tinggi\";s:6:\"3.72 m\";}i:65;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 18:50 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:66;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:00 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:67;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:10 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:68;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:20 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:69;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:30 WITA\";s:6:\"tinggi\";s:6:\"3.72 m\";}i:70;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:40 WITA\";s:6:\"tinggi\";s:6:\"3.71 m\";}i:71;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 19:50 WITA\";s:6:\"tinggi\";s:6:\"3.69 m\";}i:72;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:00 WITA\";s:6:\"tinggi\";s:6:\"3.67 m\";}i:73;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:10 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:74;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:20 WITA\";s:6:\"tinggi\";s:6:\"3.61 m\";}i:75;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:30 WITA\";s:6:\"tinggi\";s:6:\"3.58 m\";}i:76;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:40 WITA\";s:6:\"tinggi\";s:6:\"3.54 m\";}i:77;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 20:50 WITA\";s:6:\"tinggi\";s:6:\"3.50 m\";}i:78;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:00 WITA\";s:6:\"tinggi\";s:6:\"3.46 m\";}i:79;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:10 WITA\";s:6:\"tinggi\";s:6:\"3.41 m\";}i:80;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:20 WITA\";s:6:\"tinggi\";s:6:\"3.36 m\";}i:81;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:30 WITA\";s:6:\"tinggi\";s:6:\"3.31 m\";}i:82;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:40 WITA\";s:6:\"tinggi\";s:6:\"3.26 m\";}i:83;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 21:50 WITA\";s:6:\"tinggi\";s:6:\"3.21 m\";}i:84;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:00 WITA\";s:6:\"tinggi\";s:6:\"3.15 m\";}i:85;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:10 WITA\";s:6:\"tinggi\";s:6:\"3.10 m\";}i:86;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:20 WITA\";s:6:\"tinggi\";s:6:\"3.04 m\";}i:87;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:30 WITA\";s:6:\"tinggi\";s:6:\"2.98 m\";}i:88;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:40 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:89;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 22:50 WITA\";s:6:\"tinggi\";s:6:\"2.87 m\";}i:90;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:00 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:91;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:10 WITA\";s:6:\"tinggi\";s:6:\"2.75 m\";}i:92;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:20 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:93;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:30 WITA\";s:6:\"tinggi\";s:6:\"2.64 m\";}i:94;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:40 WITA\";s:6:\"tinggi\";s:6:\"2.59 m\";}i:95;a:2:{s:5:\"waktu\";s:22:\"02 Jan 2026 23:50 WITA\";s:6:\"tinggi\";s:6:\"2.53 m\";}i:96;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:00 WITA\";s:6:\"tinggi\";s:6:\"2.48 m\";}i:97;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:10 WITA\";s:6:\"tinggi\";s:6:\"2.42 m\";}i:98;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:20 WITA\";s:6:\"tinggi\";s:6:\"2.37 m\";}i:99;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:30 WITA\";s:6:\"tinggi\";s:6:\"2.32 m\";}i:100;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:40 WITA\";s:6:\"tinggi\";s:6:\"2.27 m\";}i:101;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 00:50 WITA\";s:6:\"tinggi\";s:6:\"2.22 m\";}i:102;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:00 WITA\";s:6:\"tinggi\";s:6:\"2.17 m\";}i:103;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:10 WITA\";s:6:\"tinggi\";s:6:\"2.13 m\";}i:104;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:20 WITA\";s:6:\"tinggi\";s:6:\"2.08 m\";}i:105;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:30 WITA\";s:6:\"tinggi\";s:6:\"2.05 m\";}i:106;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:40 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:107;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 01:50 WITA\";s:6:\"tinggi\";s:6:\"1.98 m\";}i:108;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:00 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:109;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:10 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:110;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:20 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:111;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:30 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:112;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:40 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:113;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 02:50 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:114;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:00 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:115;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:10 WITA\";s:6:\"tinggi\";s:6:\"1.95 m\";}i:116;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:20 WITA\";s:6:\"tinggi\";s:6:\"1.98 m\";}i:117;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:30 WITA\";s:6:\"tinggi\";s:6:\"2.00 m\";}i:118;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:40 WITA\";s:6:\"tinggi\";s:6:\"2.04 m\";}i:119;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 03:50 WITA\";s:6:\"tinggi\";s:6:\"2.07 m\";}i:120;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:00 WITA\";s:6:\"tinggi\";s:6:\"2.11 m\";}i:121;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:10 WITA\";s:6:\"tinggi\";s:6:\"2.15 m\";}i:122;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:20 WITA\";s:6:\"tinggi\";s:6:\"2.19 m\";}i:123;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:30 WITA\";s:6:\"tinggi\";s:6:\"2.23 m\";}i:124;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:40 WITA\";s:6:\"tinggi\";s:6:\"2.27 m\";}i:125;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 04:50 WITA\";s:6:\"tinggi\";s:6:\"2.32 m\";}i:126;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:00 WITA\";s:6:\"tinggi\";s:6:\"2.36 m\";}i:127;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:10 WITA\";s:6:\"tinggi\";s:6:\"2.40 m\";}i:128;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:20 WITA\";s:6:\"tinggi\";s:6:\"2.44 m\";}i:129;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:30 WITA\";s:6:\"tinggi\";s:6:\"2.47 m\";}i:130;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:40 WITA\";s:6:\"tinggi\";s:6:\"2.51 m\";}i:131;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 05:50 WITA\";s:6:\"tinggi\";s:6:\"2.54 m\";}i:132;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:00 WITA\";s:6:\"tinggi\";s:6:\"2.58 m\";}i:133;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:10 WITA\";s:6:\"tinggi\";s:6:\"2.61 m\";}i:134;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:20 WITA\";s:6:\"tinggi\";s:6:\"2.63 m\";}i:135;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:30 WITA\";s:6:\"tinggi\";s:6:\"2.66 m\";}i:136;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:40 WITA\";s:6:\"tinggi\";s:6:\"2.68 m\";}i:137;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 06:50 WITA\";s:6:\"tinggi\";s:6:\"2.69 m\";}i:138;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:00 WITA\";s:6:\"tinggi\";s:6:\"2.71 m\";}i:139;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:10 WITA\";s:6:\"tinggi\";s:6:\"2.72 m\";}i:140;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:20 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:141;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:30 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:142;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:40 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:143;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 07:50 WITA\";s:6:\"tinggi\";s:6:\"2.72 m\";}i:144;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:00 WITA\";s:6:\"tinggi\";s:6:\"2.71 m\";}i:145;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:10 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:146;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:20 WITA\";s:6:\"tinggi\";s:6:\"2.68 m\";}i:147;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:30 WITA\";s:6:\"tinggi\";s:6:\"2.66 m\";}i:148;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:40 WITA\";s:6:\"tinggi\";s:6:\"2.64 m\";}i:149;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 08:50 WITA\";s:6:\"tinggi\";s:6:\"2.61 m\";}i:150;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:00 WITA\";s:6:\"tinggi\";s:6:\"2.57 m\";}i:151;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:10 WITA\";s:6:\"tinggi\";s:6:\"2.54 m\";}i:152;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:20 WITA\";s:6:\"tinggi\";s:6:\"2.50 m\";}i:153;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:30 WITA\";s:6:\"tinggi\";s:6:\"2.46 m\";}i:154;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:40 WITA\";s:6:\"tinggi\";s:6:\"2.42 m\";}i:155;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 09:50 WITA\";s:6:\"tinggi\";s:6:\"2.38 m\";}i:156;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:00 WITA\";s:6:\"tinggi\";s:6:\"2.33 m\";}i:157;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:10 WITA\";s:6:\"tinggi\";s:6:\"2.29 m\";}i:158;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:20 WITA\";s:6:\"tinggi\";s:6:\"2.25 m\";}i:159;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:30 WITA\";s:6:\"tinggi\";s:6:\"2.20 m\";}i:160;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:40 WITA\";s:6:\"tinggi\";s:6:\"2.16 m\";}i:161;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 10:50 WITA\";s:6:\"tinggi\";s:6:\"2.12 m\";}i:162;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:00 WITA\";s:6:\"tinggi\";s:6:\"2.08 m\";}i:163;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:10 WITA\";s:6:\"tinggi\";s:6:\"2.05 m\";}i:164;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:20 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:165;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:30 WITA\";s:6:\"tinggi\";s:6:\"1.98 m\";}i:166;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:40 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:167;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 11:50 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:168;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:00 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:169;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:10 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:170;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:20 WITA\";s:6:\"tinggi\";s:6:\"1.87 m\";}i:171;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:30 WITA\";s:6:\"tinggi\";s:6:\"1.86 m\";}i:172;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:40 WITA\";s:6:\"tinggi\";s:6:\"1.85 m\";}i:173;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 12:50 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:174;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:00 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:175;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:10 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:176;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:20 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:177;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:30 WITA\";s:6:\"tinggi\";s:6:\"1.85 m\";}i:178;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:40 WITA\";s:6:\"tinggi\";s:6:\"1.86 m\";}i:179;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 13:50 WITA\";s:6:\"tinggi\";s:6:\"1.88 m\";}i:180;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:00 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:181;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:10 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:182;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:20 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:183;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:30 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:184;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:40 WITA\";s:6:\"tinggi\";s:6:\"2.05 m\";}i:185;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 14:50 WITA\";s:6:\"tinggi\";s:6:\"2.11 m\";}i:186;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:00 WITA\";s:6:\"tinggi\";s:6:\"2.17 m\";}i:187;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:10 WITA\";s:6:\"tinggi\";s:6:\"2.23 m\";}i:188;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:20 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:189;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:30 WITA\";s:6:\"tinggi\";s:6:\"2.38 m\";}i:190;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:40 WITA\";s:6:\"tinggi\";s:6:\"2.46 m\";}i:191;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 15:50 WITA\";s:6:\"tinggi\";s:6:\"2.54 m\";}i:192;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:00 WITA\";s:6:\"tinggi\";s:6:\"2.63 m\";}i:193;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:10 WITA\";s:6:\"tinggi\";s:6:\"2.71 m\";}i:194;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:20 WITA\";s:6:\"tinggi\";s:6:\"2.80 m\";}i:195;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:30 WITA\";s:6:\"tinggi\";s:6:\"2.89 m\";}i:196;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:40 WITA\";s:6:\"tinggi\";s:6:\"2.97 m\";}i:197;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 16:50 WITA\";s:6:\"tinggi\";s:6:\"3.05 m\";}i:198;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:00 WITA\";s:6:\"tinggi\";s:6:\"3.13 m\";}i:199;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:10 WITA\";s:6:\"tinggi\";s:6:\"3.20 m\";}i:200;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:20 WITA\";s:6:\"tinggi\";s:6:\"3.28 m\";}i:201;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:30 WITA\";s:6:\"tinggi\";s:6:\"3.34 m\";}i:202;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:40 WITA\";s:6:\"tinggi\";s:6:\"3.41 m\";}i:203;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 17:50 WITA\";s:6:\"tinggi\";s:6:\"3.46 m\";}i:204;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:00 WITA\";s:6:\"tinggi\";s:6:\"3.52 m\";}i:205;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:10 WITA\";s:6:\"tinggi\";s:6:\"3.57 m\";}i:206;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:20 WITA\";s:6:\"tinggi\";s:6:\"3.61 m\";}i:207;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:30 WITA\";s:6:\"tinggi\";s:6:\"3.66 m\";}i:208;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:40 WITA\";s:6:\"tinggi\";s:6:\"3.69 m\";}i:209;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 18:50 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:210;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:00 WITA\";s:6:\"tinggi\";s:6:\"3.75 m\";}i:211;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:10 WITA\";s:6:\"tinggi\";s:6:\"3.78 m\";}i:212;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:20 WITA\";s:6:\"tinggi\";s:6:\"3.80 m\";}i:213;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:30 WITA\";s:6:\"tinggi\";s:6:\"3.81 m\";}i:214;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:40 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:215;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 19:50 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:216;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:00 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:217;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:10 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:218;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:20 WITA\";s:6:\"tinggi\";s:6:\"3.82 m\";}i:219;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:30 WITA\";s:6:\"tinggi\";s:6:\"3.81 m\";}i:220;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:40 WITA\";s:6:\"tinggi\";s:6:\"3.79 m\";}i:221;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 20:50 WITA\";s:6:\"tinggi\";s:6:\"3.77 m\";}i:222;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:00 WITA\";s:6:\"tinggi\";s:6:\"3.75 m\";}i:223;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:10 WITA\";s:6:\"tinggi\";s:6:\"3.71 m\";}i:224;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:20 WITA\";s:6:\"tinggi\";s:6:\"3.68 m\";}i:225;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:30 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:226;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:40 WITA\";s:6:\"tinggi\";s:6:\"3.60 m\";}i:227;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 21:50 WITA\";s:6:\"tinggi\";s:6:\"3.55 m\";}i:228;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:00 WITA\";s:6:\"tinggi\";s:6:\"3.50 m\";}i:229;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:10 WITA\";s:6:\"tinggi\";s:6:\"3.45 m\";}i:230;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:20 WITA\";s:6:\"tinggi\";s:6:\"3.39 m\";}i:231;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:30 WITA\";s:6:\"tinggi\";s:6:\"3.34 m\";}i:232;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:40 WITA\";s:6:\"tinggi\";s:6:\"3.28 m\";}i:233;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 22:50 WITA\";s:6:\"tinggi\";s:6:\"3.22 m\";}i:234;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:00 WITA\";s:6:\"tinggi\";s:6:\"3.16 m\";}i:235;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:10 WITA\";s:6:\"tinggi\";s:6:\"3.09 m\";}i:236;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:20 WITA\";s:6:\"tinggi\";s:6:\"3.03 m\";}i:237;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:30 WITA\";s:6:\"tinggi\";s:6:\"2.97 m\";}i:238;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:40 WITA\";s:6:\"tinggi\";s:6:\"2.91 m\";}i:239;a:2:{s:5:\"waktu\";s:22:\"03 Jan 2026 23:50 WITA\";s:6:\"tinggi\";s:6:\"2.85 m\";}i:240;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:00 WITA\";s:6:\"tinggi\";s:6:\"2.79 m\";}i:241;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:10 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:242;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:20 WITA\";s:6:\"tinggi\";s:6:\"2.67 m\";}i:243;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:30 WITA\";s:6:\"tinggi\";s:6:\"2.61 m\";}i:244;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:40 WITA\";s:6:\"tinggi\";s:6:\"2.55 m\";}i:245;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 00:50 WITA\";s:6:\"tinggi\";s:6:\"2.49 m\";}i:246;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:00 WITA\";s:6:\"tinggi\";s:6:\"2.43 m\";}i:247;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:10 WITA\";s:6:\"tinggi\";s:6:\"2.37 m\";}i:248;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:20 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:249;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:30 WITA\";s:6:\"tinggi\";s:6:\"2.26 m\";}i:250;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:40 WITA\";s:6:\"tinggi\";s:6:\"2.20 m\";}i:251;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 01:50 WITA\";s:6:\"tinggi\";s:6:\"2.15 m\";}i:252;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:00 WITA\";s:6:\"tinggi\";s:6:\"2.10 m\";}i:253;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:10 WITA\";s:6:\"tinggi\";s:6:\"2.05 m\";}i:254;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:20 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:255;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:30 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:256;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:40 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:257;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 02:50 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:258;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:00 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:259;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:10 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:260;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:20 WITA\";s:6:\"tinggi\";s:6:\"1.88 m\";}i:261;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:30 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:262;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:40 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:263;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 03:50 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:264;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:00 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:265;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:10 WITA\";s:6:\"tinggi\";s:6:\"1.98 m\";}i:266;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:20 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:267;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:30 WITA\";s:6:\"tinggi\";s:6:\"2.06 m\";}i:268;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:40 WITA\";s:6:\"tinggi\";s:6:\"2.10 m\";}i:269;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 04:50 WITA\";s:6:\"tinggi\";s:6:\"2.15 m\";}i:270;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:00 WITA\";s:6:\"tinggi\";s:6:\"2.20 m\";}i:271;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:10 WITA\";s:6:\"tinggi\";s:6:\"2.25 m\";}i:272;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:20 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:273;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:30 WITA\";s:6:\"tinggi\";s:6:\"2.36 m\";}i:274;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:40 WITA\";s:6:\"tinggi\";s:6:\"2.41 m\";}i:275;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 05:50 WITA\";s:6:\"tinggi\";s:6:\"2.46 m\";}i:276;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:00 WITA\";s:6:\"tinggi\";s:6:\"2.50 m\";}i:277;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:10 WITA\";s:6:\"tinggi\";s:6:\"2.55 m\";}i:278;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:20 WITA\";s:6:\"tinggi\";s:6:\"2.59 m\";}i:279;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:30 WITA\";s:6:\"tinggi\";s:6:\"2.63 m\";}i:280;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:40 WITA\";s:6:\"tinggi\";s:6:\"2.67 m\";}i:281;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 06:50 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:282;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:00 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:283;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:10 WITA\";s:6:\"tinggi\";s:6:\"2.75 m\";}i:284;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:20 WITA\";s:6:\"tinggi\";s:6:\"2.78 m\";}i:285;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:30 WITA\";s:6:\"tinggi\";s:6:\"2.79 m\";}i:286;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:40 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:287;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 07:50 WITA\";s:6:\"tinggi\";s:6:\"2.82 m\";}i:288;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:00 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:289;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:10 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:290;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:20 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:291;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:30 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:292;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:40 WITA\";s:6:\"tinggi\";s:6:\"2.82 m\";}i:293;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 08:50 WITA\";s:6:\"tinggi\";s:6:\"2.80 m\";}i:294;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:00 WITA\";s:6:\"tinggi\";s:6:\"2.78 m\";}i:295;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:10 WITA\";s:6:\"tinggi\";s:6:\"2.76 m\";}i:296;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:20 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:297;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:30 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:298;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:40 WITA\";s:6:\"tinggi\";s:6:\"2.67 m\";}i:299;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 09:50 WITA\";s:6:\"tinggi\";s:6:\"2.63 m\";}i:300;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:00 WITA\";s:6:\"tinggi\";s:6:\"2.59 m\";}i:301;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:10 WITA\";s:6:\"tinggi\";s:6:\"2.55 m\";}i:302;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:20 WITA\";s:6:\"tinggi\";s:6:\"2.50 m\";}i:303;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:30 WITA\";s:6:\"tinggi\";s:6:\"2.45 m\";}i:304;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:40 WITA\";s:6:\"tinggi\";s:6:\"2.40 m\";}i:305;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 10:50 WITA\";s:6:\"tinggi\";s:6:\"2.35 m\";}i:306;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:00 WITA\";s:6:\"tinggi\";s:6:\"2.30 m\";}i:307;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:10 WITA\";s:6:\"tinggi\";s:6:\"2.26 m\";}i:308;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:20 WITA\";s:6:\"tinggi\";s:6:\"2.21 m\";}i:309;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:30 WITA\";s:6:\"tinggi\";s:6:\"2.16 m\";}i:310;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:40 WITA\";s:6:\"tinggi\";s:6:\"2.12 m\";}i:311;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 11:50 WITA\";s:6:\"tinggi\";s:6:\"2.08 m\";}i:312;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:00 WITA\";s:6:\"tinggi\";s:6:\"2.04 m\";}i:313;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:10 WITA\";s:6:\"tinggi\";s:6:\"2.00 m\";}i:314;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:20 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:315;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:30 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:316;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:40 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:317;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 12:50 WITA\";s:6:\"tinggi\";s:6:\"1.88 m\";}i:318;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:00 WITA\";s:6:\"tinggi\";s:6:\"1.86 m\";}i:319;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:10 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:320;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:20 WITA\";s:6:\"tinggi\";s:6:\"1.82 m\";}i:321;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:30 WITA\";s:6:\"tinggi\";s:6:\"1.80 m\";}i:322;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:40 WITA\";s:6:\"tinggi\";s:6:\"1.79 m\";}i:323;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 13:50 WITA\";s:6:\"tinggi\";s:6:\"1.79 m\";}i:324;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:00 WITA\";s:6:\"tinggi\";s:6:\"1.78 m\";}i:325;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:10 WITA\";s:6:\"tinggi\";s:6:\"1.78 m\";}i:326;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:20 WITA\";s:6:\"tinggi\";s:6:\"1.79 m\";}i:327;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:30 WITA\";s:6:\"tinggi\";s:6:\"1.80 m\";}i:328;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:40 WITA\";s:6:\"tinggi\";s:6:\"1.82 m\";}i:329;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 14:50 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:330;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:00 WITA\";s:6:\"tinggi\";s:6:\"1.87 m\";}i:331;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:10 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:332;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:20 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:333;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:30 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:334;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:40 WITA\";s:6:\"tinggi\";s:6:\"2.07 m\";}i:335;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 15:50 WITA\";s:6:\"tinggi\";s:6:\"2.13 m\";}i:336;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:00 WITA\";s:6:\"tinggi\";s:6:\"2.21 m\";}i:337;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:10 WITA\";s:6:\"tinggi\";s:6:\"2.29 m\";}i:338;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:20 WITA\";s:6:\"tinggi\";s:6:\"2.37 m\";}i:339;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:30 WITA\";s:6:\"tinggi\";s:6:\"2.46 m\";}i:340;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:40 WITA\";s:6:\"tinggi\";s:6:\"2.55 m\";}i:341;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 16:50 WITA\";s:6:\"tinggi\";s:6:\"2.64 m\";}i:342;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:00 WITA\";s:6:\"tinggi\";s:6:\"2.74 m\";}i:343;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:10 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:344;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:20 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:345;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:30 WITA\";s:6:\"tinggi\";s:6:\"3.01 m\";}i:346;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:40 WITA\";s:6:\"tinggi\";s:6:\"3.10 m\";}i:347;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 17:50 WITA\";s:6:\"tinggi\";s:6:\"3.18 m\";}i:348;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:00 WITA\";s:6:\"tinggi\";s:6:\"3.26 m\";}i:349;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:10 WITA\";s:6:\"tinggi\";s:6:\"3.33 m\";}i:350;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:20 WITA\";s:6:\"tinggi\";s:6:\"3.40 m\";}i:351;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:30 WITA\";s:6:\"tinggi\";s:6:\"3.46 m\";}i:352;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:40 WITA\";s:6:\"tinggi\";s:6:\"3.52 m\";}i:353;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 18:50 WITA\";s:6:\"tinggi\";s:6:\"3.57 m\";}i:354;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:00 WITA\";s:6:\"tinggi\";s:6:\"3.62 m\";}i:355;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:10 WITA\";s:6:\"tinggi\";s:6:\"3.66 m\";}i:356;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:20 WITA\";s:6:\"tinggi\";s:6:\"3.70 m\";}i:357;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:30 WITA\";s:6:\"tinggi\";s:6:\"3.74 m\";}i:358;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:40 WITA\";s:6:\"tinggi\";s:6:\"3.77 m\";}i:359;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 19:50 WITA\";s:6:\"tinggi\";s:6:\"3.79 m\";}i:360;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:00 WITA\";s:6:\"tinggi\";s:6:\"3.82 m\";}i:361;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:10 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:362;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:20 WITA\";s:6:\"tinggi\";s:6:\"3.85 m\";}i:363;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:30 WITA\";s:6:\"tinggi\";s:6:\"3.86 m\";}i:364;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:40 WITA\";s:6:\"tinggi\";s:6:\"3.86 m\";}i:365;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 20:50 WITA\";s:6:\"tinggi\";s:6:\"3.87 m\";}i:366;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:00 WITA\";s:6:\"tinggi\";s:6:\"3.86 m\";}i:367;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:10 WITA\";s:6:\"tinggi\";s:6:\"3.85 m\";}i:368;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:20 WITA\";s:6:\"tinggi\";s:6:\"3.84 m\";}i:369;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:30 WITA\";s:6:\"tinggi\";s:6:\"3.82 m\";}i:370;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:40 WITA\";s:6:\"tinggi\";s:6:\"3.79 m\";}i:371;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 21:50 WITA\";s:6:\"tinggi\";s:6:\"3.76 m\";}i:372;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:00 WITA\";s:6:\"tinggi\";s:6:\"3.73 m\";}i:373;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:10 WITA\";s:6:\"tinggi\";s:6:\"3.69 m\";}i:374;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:20 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:375;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:30 WITA\";s:6:\"tinggi\";s:6:\"3.60 m\";}i:376;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:40 WITA\";s:6:\"tinggi\";s:6:\"3.54 m\";}i:377;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 22:50 WITA\";s:6:\"tinggi\";s:6:\"3.49 m\";}i:378;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:00 WITA\";s:6:\"tinggi\";s:6:\"3.43 m\";}i:379;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:10 WITA\";s:6:\"tinggi\";s:6:\"3.37 m\";}i:380;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:20 WITA\";s:6:\"tinggi\";s:6:\"3.31 m\";}i:381;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:30 WITA\";s:6:\"tinggi\";s:6:\"3.25 m\";}i:382;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:40 WITA\";s:6:\"tinggi\";s:6:\"3.19 m\";}i:383;a:2:{s:5:\"waktu\";s:22:\"04 Jan 2026 23:50 WITA\";s:6:\"tinggi\";s:6:\"3.13 m\";}i:384;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:00 WITA\";s:6:\"tinggi\";s:6:\"3.06 m\";}i:385;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:10 WITA\";s:6:\"tinggi\";s:6:\"3.00 m\";}i:386;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:20 WITA\";s:6:\"tinggi\";s:6:\"2.94 m\";}i:387;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:30 WITA\";s:6:\"tinggi\";s:6:\"2.88 m\";}i:388;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:40 WITA\";s:6:\"tinggi\";s:6:\"2.82 m\";}i:389;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 00:50 WITA\";s:6:\"tinggi\";s:6:\"2.76 m\";}i:390;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:00 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:391;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:10 WITA\";s:6:\"tinggi\";s:6:\"2.64 m\";}i:392;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:20 WITA\";s:6:\"tinggi\";s:6:\"2.58 m\";}i:393;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:30 WITA\";s:6:\"tinggi\";s:6:\"2.52 m\";}i:394;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:40 WITA\";s:6:\"tinggi\";s:6:\"2.46 m\";}i:395;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 01:50 WITA\";s:6:\"tinggi\";s:6:\"2.40 m\";}i:396;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:00 WITA\";s:6:\"tinggi\";s:6:\"2.34 m\";}i:397;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:10 WITA\";s:6:\"tinggi\";s:6:\"2.28 m\";}i:398;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:20 WITA\";s:6:\"tinggi\";s:6:\"2.22 m\";}i:399;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:30 WITA\";s:6:\"tinggi\";s:6:\"2.16 m\";}i:400;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:40 WITA\";s:6:\"tinggi\";s:6:\"2.11 m\";}i:401;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 02:50 WITA\";s:6:\"tinggi\";s:6:\"2.06 m\";}i:402;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:00 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:403;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:10 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:404;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:20 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:405;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:30 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:406;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:40 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:407;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 03:50 WITA\";s:6:\"tinggi\";s:6:\"1.88 m\";}i:408;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:00 WITA\";s:6:\"tinggi\";s:6:\"1.88 m\";}i:409;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:10 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:410;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:20 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:411;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:30 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:412;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:40 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:413;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 04:50 WITA\";s:6:\"tinggi\";s:6:\"2.00 m\";}i:414;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:00 WITA\";s:6:\"tinggi\";s:6:\"2.05 m\";}i:415;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:10 WITA\";s:6:\"tinggi\";s:6:\"2.10 m\";}i:416;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:20 WITA\";s:6:\"tinggi\";s:6:\"2.15 m\";}i:417;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:30 WITA\";s:6:\"tinggi\";s:6:\"2.21 m\";}i:418;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:40 WITA\";s:6:\"tinggi\";s:6:\"2.27 m\";}i:419;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 05:50 WITA\";s:6:\"tinggi\";s:6:\"2.33 m\";}i:420;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:00 WITA\";s:6:\"tinggi\";s:6:\"2.39 m\";}i:421;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:10 WITA\";s:6:\"tinggi\";s:6:\"2.45 m\";}i:422;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:20 WITA\";s:6:\"tinggi\";s:6:\"2.51 m\";}i:423;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:30 WITA\";s:6:\"tinggi\";s:6:\"2.56 m\";}i:424;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:40 WITA\";s:6:\"tinggi\";s:6:\"2.61 m\";}i:425;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 06:50 WITA\";s:6:\"tinggi\";s:6:\"2.66 m\";}i:426;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:00 WITA\";s:6:\"tinggi\";s:6:\"2.70 m\";}i:427;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:10 WITA\";s:6:\"tinggi\";s:6:\"2.74 m\";}i:428;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:20 WITA\";s:6:\"tinggi\";s:6:\"2.77 m\";}i:429;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:30 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:430;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:40 WITA\";s:6:\"tinggi\";s:6:\"2.83 m\";}i:431;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 07:50 WITA\";s:6:\"tinggi\";s:6:\"2.86 m\";}i:432;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:00 WITA\";s:6:\"tinggi\";s:6:\"2.88 m\";}i:433;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:10 WITA\";s:6:\"tinggi\";s:6:\"2.89 m\";}i:434;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:20 WITA\";s:6:\"tinggi\";s:6:\"2.91 m\";}i:435;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:30 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:436;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:40 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:437;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 08:50 WITA\";s:6:\"tinggi\";s:6:\"2.93 m\";}i:438;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:00 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:439;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:10 WITA\";s:6:\"tinggi\";s:6:\"2.92 m\";}i:440;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:20 WITA\";s:6:\"tinggi\";s:6:\"2.91 m\";}i:441;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:30 WITA\";s:6:\"tinggi\";s:6:\"2.89 m\";}i:442;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:40 WITA\";s:6:\"tinggi\";s:6:\"2.87 m\";}i:443;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 09:50 WITA\";s:6:\"tinggi\";s:6:\"2.85 m\";}i:444;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:00 WITA\";s:6:\"tinggi\";s:6:\"2.82 m\";}i:445;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:10 WITA\";s:6:\"tinggi\";s:6:\"2.79 m\";}i:446;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:20 WITA\";s:6:\"tinggi\";s:6:\"2.75 m\";}i:447;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:30 WITA\";s:6:\"tinggi\";s:6:\"2.71 m\";}i:448;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:40 WITA\";s:6:\"tinggi\";s:6:\"2.67 m\";}i:449;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 10:50 WITA\";s:6:\"tinggi\";s:6:\"2.62 m\";}i:450;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:00 WITA\";s:6:\"tinggi\";s:6:\"2.57 m\";}i:451;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:10 WITA\";s:6:\"tinggi\";s:6:\"2.52 m\";}i:452;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:20 WITA\";s:6:\"tinggi\";s:6:\"2.47 m\";}i:453;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:30 WITA\";s:6:\"tinggi\";s:6:\"2.42 m\";}i:454;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:40 WITA\";s:6:\"tinggi\";s:6:\"2.36 m\";}i:455;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 11:50 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:456;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:00 WITA\";s:6:\"tinggi\";s:6:\"2.26 m\";}i:457;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:10 WITA\";s:6:\"tinggi\";s:6:\"2.21 m\";}i:458;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:20 WITA\";s:6:\"tinggi\";s:6:\"2.16 m\";}i:459;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:30 WITA\";s:6:\"tinggi\";s:6:\"2.11 m\";}i:460;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:40 WITA\";s:6:\"tinggi\";s:6:\"2.07 m\";}i:461;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 12:50 WITA\";s:6:\"tinggi\";s:6:\"2.03 m\";}i:462;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:00 WITA\";s:6:\"tinggi\";s:6:\"1.99 m\";}i:463;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:10 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:464;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:20 WITA\";s:6:\"tinggi\";s:6:\"1.92 m\";}i:465;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:30 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:466;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:40 WITA\";s:6:\"tinggi\";s:6:\"1.87 m\";}i:467;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 13:50 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:468;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:00 WITA\";s:6:\"tinggi\";s:6:\"1.82 m\";}i:469;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:10 WITA\";s:6:\"tinggi\";s:6:\"1.80 m\";}i:470;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:20 WITA\";s:6:\"tinggi\";s:6:\"1.79 m\";}i:471;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:30 WITA\";s:6:\"tinggi\";s:6:\"1.78 m\";}i:472;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:40 WITA\";s:6:\"tinggi\";s:6:\"1.77 m\";}i:473;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 14:50 WITA\";s:6:\"tinggi\";s:6:\"1.76 m\";}i:474;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:00 WITA\";s:6:\"tinggi\";s:6:\"1.77 m\";}i:475;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:10 WITA\";s:6:\"tinggi\";s:6:\"1.77 m\";}i:476;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:20 WITA\";s:6:\"tinggi\";s:6:\"1.79 m\";}i:477;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:30 WITA\";s:6:\"tinggi\";s:6:\"1.81 m\";}i:478;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:40 WITA\";s:6:\"tinggi\";s:6:\"1.84 m\";}i:479;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 15:50 WITA\";s:6:\"tinggi\";s:6:\"1.87 m\";}i:480;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:00 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:481;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:10 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:482;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:20 WITA\";s:6:\"tinggi\";s:6:\"2.03 m\";}i:483;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:30 WITA\";s:6:\"tinggi\";s:6:\"2.09 m\";}i:484;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:40 WITA\";s:6:\"tinggi\";s:6:\"2.17 m\";}i:485;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 16:50 WITA\";s:6:\"tinggi\";s:6:\"2.25 m\";}i:486;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:00 WITA\";s:6:\"tinggi\";s:6:\"2.34 m\";}i:487;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:10 WITA\";s:6:\"tinggi\";s:6:\"2.43 m\";}i:488;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:20 WITA\";s:6:\"tinggi\";s:6:\"2.52 m\";}i:489;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:30 WITA\";s:6:\"tinggi\";s:6:\"2.62 m\";}i:490;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:40 WITA\";s:6:\"tinggi\";s:6:\"2.72 m\";}i:491;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 17:50 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:492;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:00 WITA\";s:6:\"tinggi\";s:6:\"2.91 m\";}i:493;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:10 WITA\";s:6:\"tinggi\";s:6:\"3.00 m\";}i:494;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:20 WITA\";s:6:\"tinggi\";s:6:\"3.09 m\";}i:495;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:30 WITA\";s:6:\"tinggi\";s:6:\"3.17 m\";}i:496;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:40 WITA\";s:6:\"tinggi\";s:6:\"3.25 m\";}i:497;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 18:50 WITA\";s:6:\"tinggi\";s:6:\"3.32 m\";}i:498;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:00 WITA\";s:6:\"tinggi\";s:6:\"3.39 m\";}i:499;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:10 WITA\";s:6:\"tinggi\";s:6:\"3.45 m\";}i:500;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:20 WITA\";s:6:\"tinggi\";s:6:\"3.50 m\";}i:501;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:30 WITA\";s:6:\"tinggi\";s:6:\"3.55 m\";}i:502;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:40 WITA\";s:6:\"tinggi\";s:6:\"3.60 m\";}i:503;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 19:50 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:504;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:00 WITA\";s:6:\"tinggi\";s:6:\"3.68 m\";}i:505;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:10 WITA\";s:6:\"tinggi\";s:6:\"3.71 m\";}i:506;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:20 WITA\";s:6:\"tinggi\";s:6:\"3.74 m\";}i:507;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:30 WITA\";s:6:\"tinggi\";s:6:\"3.76 m\";}i:508;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:40 WITA\";s:6:\"tinggi\";s:6:\"3.79 m\";}i:509;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 20:50 WITA\";s:6:\"tinggi\";s:6:\"3.80 m\";}i:510;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:00 WITA\";s:6:\"tinggi\";s:6:\"3.82 m\";}i:511;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:10 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:512;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:20 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:513;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:30 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:514;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:40 WITA\";s:6:\"tinggi\";s:6:\"3.83 m\";}i:515;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 21:50 WITA\";s:6:\"tinggi\";s:6:\"3.82 m\";}i:516;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:00 WITA\";s:6:\"tinggi\";s:6:\"3.80 m\";}i:517;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:10 WITA\";s:6:\"tinggi\";s:6:\"3.78 m\";}i:518;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:20 WITA\";s:6:\"tinggi\";s:6:\"3.75 m\";}i:519;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:30 WITA\";s:6:\"tinggi\";s:6:\"3.72 m\";}i:520;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:40 WITA\";s:6:\"tinggi\";s:6:\"3.69 m\";}i:521;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 22:50 WITA\";s:6:\"tinggi\";s:6:\"3.64 m\";}i:522;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:00 WITA\";s:6:\"tinggi\";s:6:\"3.60 m\";}i:523;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:10 WITA\";s:6:\"tinggi\";s:6:\"3.55 m\";}i:524;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:20 WITA\";s:6:\"tinggi\";s:6:\"3.49 m\";}i:525;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:30 WITA\";s:6:\"tinggi\";s:6:\"3.44 m\";}i:526;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:40 WITA\";s:6:\"tinggi\";s:6:\"3.38 m\";}i:527;a:2:{s:5:\"waktu\";s:22:\"05 Jan 2026 23:50 WITA\";s:6:\"tinggi\";s:6:\"3.32 m\";}i:528;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:00 WITA\";s:6:\"tinggi\";s:6:\"3.26 m\";}i:529;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:10 WITA\";s:6:\"tinggi\";s:6:\"3.20 m\";}i:530;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:20 WITA\";s:6:\"tinggi\";s:6:\"3.14 m\";}i:531;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:30 WITA\";s:6:\"tinggi\";s:6:\"3.08 m\";}i:532;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:40 WITA\";s:6:\"tinggi\";s:6:\"3.01 m\";}i:533;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 00:50 WITA\";s:6:\"tinggi\";s:6:\"2.95 m\";}i:534;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:00 WITA\";s:6:\"tinggi\";s:6:\"2.89 m\";}i:535;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:10 WITA\";s:6:\"tinggi\";s:6:\"2.84 m\";}i:536;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:20 WITA\";s:6:\"tinggi\";s:6:\"2.78 m\";}i:537;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:30 WITA\";s:6:\"tinggi\";s:6:\"2.72 m\";}i:538;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:40 WITA\";s:6:\"tinggi\";s:6:\"2.66 m\";}i:539;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 01:50 WITA\";s:6:\"tinggi\";s:6:\"2.60 m\";}i:540;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:00 WITA\";s:6:\"tinggi\";s:6:\"2.54 m\";}i:541;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:10 WITA\";s:6:\"tinggi\";s:6:\"2.48 m\";}i:542;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:20 WITA\";s:6:\"tinggi\";s:6:\"2.43 m\";}i:543;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:30 WITA\";s:6:\"tinggi\";s:6:\"2.37 m\";}i:544;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:40 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:545;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 02:50 WITA\";s:6:\"tinggi\";s:6:\"2.25 m\";}i:546;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:00 WITA\";s:6:\"tinggi\";s:6:\"2.19 m\";}i:547;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:10 WITA\";s:6:\"tinggi\";s:6:\"2.14 m\";}i:548;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:20 WITA\";s:6:\"tinggi\";s:6:\"2.09 m\";}i:549;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:30 WITA\";s:6:\"tinggi\";s:6:\"2.04 m\";}i:550;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:40 WITA\";s:6:\"tinggi\";s:6:\"2.00 m\";}i:551;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 03:50 WITA\";s:6:\"tinggi\";s:6:\"1.96 m\";}i:552;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:00 WITA\";s:6:\"tinggi\";s:6:\"1.93 m\";}i:553;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:10 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:554;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:20 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:555;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:30 WITA\";s:6:\"tinggi\";s:6:\"1.89 m\";}i:556;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:40 WITA\";s:6:\"tinggi\";s:6:\"1.90 m\";}i:557;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 04:50 WITA\";s:6:\"tinggi\";s:6:\"1.91 m\";}i:558;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:00 WITA\";s:6:\"tinggi\";s:6:\"1.94 m\";}i:559;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:10 WITA\";s:6:\"tinggi\";s:6:\"1.97 m\";}i:560;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:20 WITA\";s:6:\"tinggi\";s:6:\"2.01 m\";}i:561;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:30 WITA\";s:6:\"tinggi\";s:6:\"2.06 m\";}i:562;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:40 WITA\";s:6:\"tinggi\";s:6:\"2.12 m\";}i:563;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 05:50 WITA\";s:6:\"tinggi\";s:6:\"2.18 m\";}i:564;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:00 WITA\";s:6:\"tinggi\";s:6:\"2.24 m\";}i:565;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:10 WITA\";s:6:\"tinggi\";s:6:\"2.31 m\";}i:566;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:20 WITA\";s:6:\"tinggi\";s:6:\"2.37 m\";}i:567;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:30 WITA\";s:6:\"tinggi\";s:6:\"2.44 m\";}i:568;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:40 WITA\";s:6:\"tinggi\";s:6:\"2.50 m\";}i:569;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 06:50 WITA\";s:6:\"tinggi\";s:6:\"2.57 m\";}i:570;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:00 WITA\";s:6:\"tinggi\";s:6:\"2.62 m\";}i:571;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:10 WITA\";s:6:\"tinggi\";s:6:\"2.68 m\";}i:572;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:20 WITA\";s:6:\"tinggi\";s:6:\"2.73 m\";}i:573;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:30 WITA\";s:6:\"tinggi\";s:6:\"2.77 m\";}i:574;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:40 WITA\";s:6:\"tinggi\";s:6:\"2.81 m\";}i:575;a:2:{s:5:\"waktu\";s:22:\"06 Jan 2026 07:50 WITA\";s:6:\"tinggi\";s:6:\"2.85 m\";}}', 1767369109);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-tide_samarinda_msl_v1', 'a:0:{}', 1772673990);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `infrastructure_masters`
--

CREATE TABLE `infrastructure_masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_object` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `infrastructure_masters`
--

INSERT INTO `infrastructure_masters` (`id`, `id_object`, `category`, `id_lokasi`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, '20', 'JEMBATAN KAYU', 927, '1.21019634', '117.84393207', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(2, '21', 'NF', 933, '1.21023148', '117.84891745', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(3, '25', 'JEMBATAN KAYU', 951, '1.21037277', '117.87069495', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(4, '26', 'JEMBATAN KAYU', 951, '1.21038135', '117.87213298', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(5, '28', 'NF', 933, '1.21047389', '117.85701725', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(6, '30', 'NF', 933, '1.21056500', '117.85498605', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(7, '33', 'NF', 933, '1.21077192', '117.85858121', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(8, '34', 'JEMBATAN KAYU', 951, '1.21078488', '117.87586913', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(9, '57', 'JEMBATAN KAYU', 951, '1.21274742', '117.87177186', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(10, '62', 'JEMBATAN KAYU', 951, '1.21301157', '117.87047267', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(11, '63', 'JEMBATAN KAYU', 951, '1.21301927', '117.87461600', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(12, '64', 'JEMBATAN KAYU', 940, '1.21304174', '117.86105355', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(13, '66', 'JEMBATAN KAYU', 940, '1.21307651', '117.86544856', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(14, '67', 'JEMBATAN KAYU', 951, '1.21307582', '117.86759662', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(15, '74', 'PVC', 933, '1.21334316', '117.85859060', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(16, '78', 'JEMBATAN KAYU', 933, '1.21342265', '117.85803379', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(17, '79', 'JEMBATAN KAYU', 933, '1.21346713', '117.85676824', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(18, '82', 'PVC', 933, '1.21362145', '117.84908014', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(19, '83', 'JEMBATAN KAYU', 933, '1.21364260', '117.84907308', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(20, '85', 'PVC', 932, '1.21382857', '117.85861914', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(21, '90', 'JEMBATAN KAYU', 926, '1.21395020', '117.84898757', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(22, '94', 'JEMBATAN KAYU', 926, '1.21447929', '117.84197163', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(23, '95', 'JEMBATAN KAYU', 926, '1.21471009', '117.84899123', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(24, '102', 'JEMBATAN KAYU', 939, '1.21517460', '117.86742652', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(25, '112', 'JEMBATAN KAYU', 926, '1.21561169', '117.84901990', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(26, '117', 'JEMBATAN KAYU', 950, '1.21596983', '117.87001524', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(27, '118', 'JEMBATAN KAYU', 939, '1.21597309', '117.86734565', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(28, '119', 'JEMBATAN KAYU', 950, '1.21597346', '117.86947598', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(29, '120', 'JEMBATAN KAYU', 939, '1.21598935', '117.86560228', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(30, '121', 'JEMBATAN KAYU', 950, '1.21599523', '117.87125475', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(31, '122', 'JEMBATAN KAYU', 950, '1.21601795', '117.87424375', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(32, '123', 'JEMBATAN KAYU', 939, '1.21603531', '117.86333738', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(33, '124', 'PVC', 939, '1.21613833', '117.85874500', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(34, '125', 'PVC', 958, '1.21623511', '117.88190173', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(35, '126', 'JEMBATAN KAYU', 932, '1.21626957', '117.85761276', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(36, '127', 'JEMBATAN KAYU', 932, '1.21630606', '117.85125133', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(37, '128', 'JEMBATAN KAYU', 932, '1.21641415', '117.85016465', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(38, '130', 'NF', 932, '1.21645727', '117.84926564', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(39, '131', 'JEMBATAN KAYU', 926, '1.21645891', '117.84894731', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(40, '135', 'JEMBATAN KAYU', 925, '1.21663187', '117.84185908', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(41, '136', 'PVC', 925, '1.21671614', '117.84732833', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(42, '139', 'PVC', 959, '1.21679846', '117.87893387', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(43, '143', 'NF', 931, '1.21703817', '117.85866726', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(44, '164', 'JEMBATAN KAYU', 949, '1.21863860', '117.86962064', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(45, '165', 'JEMBATAN KAYU', 949, '1.21865597', '117.87182263', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(46, '167', 'NF', 938, '1.21892546', '117.85964595', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(47, '169', 'JEMBATAN KAYU', 938, '1.21917418', '117.86389562', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(48, '170', 'JEMBATAN KAYU', 931, '1.21919419', '117.85253539', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(49, '173', 'JEMBATAN KAYU', 931, '1.21929429', '117.85110993', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(50, '177', 'JEMBATAN KAYU', 931, '1.21937595', '117.85034956', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(51, '178', 'JEMBATAN KAYU', 924, '1.21939848', '117.84133639', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(52, '187', 'JEMBATAN KAYU', 937, '1.22021333', '117.86748206', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(53, '189', 'PVC', 930, '1.22051000', '117.85840667', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(54, '191', 'JEMBATAN KAYU', 958, '1.22086926', '117.88106272', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(55, '200', 'JEMBATAN KAYU', 957, '1.22140469', '117.87653330', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(56, '201', 'JEMBATAN KAYU', 924, '1.22143543', '117.84781936', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(57, '202', 'JEMBATAN KAYU', 958, '1.22148443', '117.88097304', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(58, '203', 'JEMBATAN KAYU', 930, '1.22156848', '117.85842837', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(59, '210', 'NF', 948, '1.22222379', '117.87640623', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(60, '211', 'PVC', 948, '1.22224048', '117.87470509', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(61, '212', 'JEMBATAN KAYU', 948, '1.22232846', '117.87179479', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(62, '213', 'NF', 948, '1.22233642', '117.87274718', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(63, '214', 'JEMBATAN KAYU', 948, '1.22237226', '117.87627304', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(64, '215', 'JEMBATAN KAYU', 948, '1.22239157', '117.87406105', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(65, '217', 'PVC', 937, '1.22256361', '117.86695433', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(66, '218', 'JEMBATAN KAYU', 947, '1.22261914', '117.86899277', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(67, '219', 'JEMBATAN KAYU', 937, '1.22270314', '117.86102965', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(68, '220', 'JEMBATAN KAYU', 930, '1.22272285', '117.85731471', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(69, '221', 'JEMBATAN KAYU', 930, '1.22277755', '117.85600251', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(70, '222', 'JEMBATAN KAYU', 930, '1.22285434', '117.85297166', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(71, '223', 'JEMBATAN KAYU', 930, '1.22286159', '117.85143360', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(72, '225', 'JEMBATAN KAYU', 947, '1.22295131', '117.86927377', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(73, '226', 'JEMBATAN KAYU', 924, '1.22302501', '117.84459111', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(74, '229', 'PVC', 947, '1.22368885', '117.86798889', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(75, '230', 'PVC', 936, '1.22375123', '117.86755078', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(76, '232', 'PVC', 947, '1.22387992', '117.86819914', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(77, '233', 'NF', 956, '1.22398030', '117.88536886', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(78, '236', 'JEMBATAN KAYU', 947, '1.22463193', '117.87528152', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(79, '237', 'JEMBATAN KAYU', 947, '1.22468011', '117.87586181', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(80, '238', 'JEMBATAN KAYU', 947, '1.22471733', '117.87062922', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(81, '239', 'NF', 946, '1.22472580', '117.87238183', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(82, '241', 'JEMBATAN KAYU', 936, '1.22476466', '117.86417603', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(83, '242', 'JEMBATAN KAYU', 946, '1.22476326', '117.87548132', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(84, '243', 'JEMBATAN KAYU', 936, '1.22481858', '117.86529053', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(85, '244', 'PVC', 947, '1.22485447', '117.86825765', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(86, '245', 'PVC', 946, '1.22486677', '117.87060559', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(87, '246', 'NF', 929, '1.22489380', '117.85647355', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(88, '247', 'PVC', 946, '1.22489104', '117.86977792', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(89, '248', 'NF', 936, '1.22495527', '117.86219878', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(90, '250', 'JEMBATAN KAYU', 946, '1.22504209', '117.87559654', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(91, '251', 'NF', 929, '1.22509442', '117.85146742', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(92, '252', 'PVC', 923, '1.22519672', '117.84752072', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(93, '253', 'PVC', 923, '1.22521178', '117.84924128', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(94, '254', 'JEMBATAN KAYU', 923, '1.22521309', '117.84813299', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(95, '255', 'PVC', 947, '1.22521890', '117.86812840', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(96, '256', 'PVC', 923, '1.22523724', '117.84477944', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(97, '257', 'JEMBATAN KAYU', 923, '1.22524064', '117.84683875', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(98, '258', 'JEMBATAN KAYU', 923, '1.22525030', '117.84490638', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(99, '260', 'JEMBATAN KAYU', 928, '1.22541173', '117.84931944', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(100, '263', 'JEMBATAN KAYU', 935, '1.22554170', '117.86000823', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(101, '267', 'JEMBATAN KAYU', 922, '1.22605453', '117.84768386', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(102, '269', 'JEMBATAN KAYU', 935, '1.22619470', '117.86190258', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(103, '274', 'JEMBATAN KAYU', 955, '1.22646973', '117.87757413', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(104, '275', 'PVC', 946, '1.22660939', '117.86976321', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(105, '276', 'JEMBATAN KAYU', 928, '1.22677770', '117.84934683', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(106, '280', 'JEMBATAN KAYU', 935, '1.22711609', '117.86600130', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(107, '282', 'JEMBATAN KAYU', 935, '1.22713458', '117.86478796', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(108, '283', 'JEMBATAN KAYU', 928, '1.22729058', '117.85795730', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(109, '284', 'JEMBATAN KAYU', 934, '1.22728935', '117.86174115', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(110, '286', 'PVC', 934, '1.22731928', '117.85870468', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(111, '287', 'NF', 928, '1.22737343', '117.85349039', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(112, '289', 'JEMBATAN KAYU', 928, '1.22742708', '117.85545874', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(113, '290', 'NF', 928, '1.22745547', '117.85154906', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(114, '291', 'PVC', 945, '1.22762480', '117.86979854', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(115, '303', 'JEMBATAN KAYU', 954, '1.22900809', '117.88183668', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(116, '306', 'PVC', 945, '1.22942995', '117.86950922', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(117, '307', 'JEMBATAN KAYU', 934, '1.22944949', '117.86761086', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(118, '309', 'JEMBATAN KAYU', 901, '1.22966675', '117.85817170', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(119, '310', 'JEMBATAN KAYU', 901, '1.22971267', '117.85528023', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(120, '311', 'JEMBATAN KAYU', 901, '1.22974410', '117.85221388', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(121, '312', 'PVC', 901, '1.22977553', '117.85203979', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(122, '313', 'PVC', 901, '1.22980710', '117.85149191', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(123, '314', 'PVC', 901, '1.22984167', '117.85007667', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(124, '315', 'JEMBATAN KAYU', 893, '1.22989889', '117.84865576', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(125, '316', 'JEMBATAN KAYU', 893, '1.22995356', '117.84743343', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(126, '318', 'PVC', 893, '1.22999345', '117.84450832', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(127, '319', 'JEMBATAN KAYU', 893, '1.23003400', '117.84448937', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(128, '320', 'JEMBATAN KAYU', 900, '1.23019464', '117.85859097', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(129, '322', 'JEMBATAN KAYU', 942, '1.23091098', '117.86768469', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(130, '323', 'JEMBATAN KAYU', 892, '1.23118985', '117.84932664', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(131, '328', 'NF', 944, '1.23178582', '117.87194362', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(132, '329', 'JEMBATAN KAYU', 944, '1.23183707', '117.86952603', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(133, '331', 'PVC', 944, '1.23188651', '117.86851028', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(134, '332', 'JEMBATAN KAYU', 953, '1.23199150', '117.88445302', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(135, '333', 'JEMBATAN KAYU', 953, '1.23204991', '117.88241454', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(136, '334', 'JEMBATAN KAYU', 942, '1.23207847', '117.85941717', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(137, '335', 'PVC', 900, '1.23209602', '117.85634587', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(138, '336', 'JEMBATAN KAYU', 900, '1.23210414', '117.85500185', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(139, '337', 'PVC', 900, '1.23212593', '117.85505071', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(140, '339', 'PVC', 900, '1.23221281', '117.85102271', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(141, '340', 'JEMBATAN KAYU', 892, '1.23227863', '117.84687692', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(142, '341', 'PVC', 892, '1.23228333', '117.84450167', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(143, '342', 'JEMBATAN KAYU', 892, '1.23229751', '117.84439628', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(144, '343', 'JEMBATAN KAYU', 892, '1.23237103', '117.84079219', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(145, '345', 'NF', 885, '1.23248958', '117.84033364', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(146, '347', 'JEMBATAN KAYU', 952, '1.23273415', '117.88535061', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(147, '348', 'JEMBATAN KAYU', 891, '1.23299561', '117.84939104', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(148, '351', 'JEMBATAN KAYU', 941, '1.23344179', '117.85867829', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(149, '352', 'NF', 885, '1.23354167', '117.83211500', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(150, '353', 'JEMBATAN KAYU', 885, '1.23354915', '117.83242045', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(151, '355', 'NF', 885, '1.23383333', '117.83560167', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(152, '358', 'NF', 855, '1.23400239', '117.83123861', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(153, '363', 'JEMBATAN KAYU', 885, '1.23409063', '117.83825815', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(154, '364', 'JEMBATAN KAYU', 899, '1.23409834', '117.85267628', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(155, '365', 'JEMBATAN KAYU', 943, '1.23411527', '117.87390381', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(156, '366', 'NF', 943, '1.23422492', '117.87059635', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(157, '367', 'PVC', 943, '1.23425566', '117.86809401', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(158, '368', 'PVC', 943, '1.23425758', '117.86783783', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(159, '369', 'JEMBATAN KAYU', 943, '1.23426091', '117.87118056', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(160, '370', 'PVC', 915, '1.23437164', '117.86795725', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(161, '371', 'JEMBATAN KAYU', 941, '1.23437835', '117.86298402', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(162, '372', 'NF', 941, '1.23438391', '117.86406560', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(163, '373', 'JEMBATAN KAYU', 941, '1.23440923', '117.86133637', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(164, '374', 'NF', 941, '1.23441451', '117.86050055', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(165, '375', 'JEMBATAN KAYU', 899, '1.23446243', '117.85603752', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(166, '376', 'PVC', 941, '1.23446165', '117.86416542', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(167, '377', 'PVC', 941, '1.23448253', '117.86251865', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(168, '378', 'JEMBATAN KAYU', 899, '1.23452923', '117.85285453', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(169, '379', 'PVC', 899, '1.23455923', '117.85016425', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(170, '381', 'JEMBATAN KAYU', 899, '1.23457528', '117.85031998', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(171, '382', 'PVC', 899, '1.23459463', '117.84964604', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(172, '383', 'JEMBATAN KAYU', 941, '1.23458938', '117.86671210', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(173, '384', 'NF', 891, '1.23463036', '117.84780341', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(174, '385', 'JEMBATAN KAYU', 890, '1.23473084', '117.84477454', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(175, '386', 'JEMBATAN KAYU', 891, '1.23474107', '117.84108054', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(176, '388', 'PVC', 915, '1.23493325', '117.87681816', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(177, '389', 'JEMBATAN KAYU', 921, '1.23519010', '117.87937149', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(178, '390', 'PVC', 915, '1.23525881', '117.86938753', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(179, '391', 'JEMBATAN KAYU', 915, '1.23532799', '117.87232236', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(180, '392', 'NF', 855, '1.23541417', '117.82846785', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(181, '393', 'JEMBATAN KAYU', 952, '1.23546934', '117.88249655', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(182, '395', 'PVC', 915, '1.23558065', '117.86891964', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(183, '396', 'PVC', 915, '1.23569891', '117.87029703', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(184, '397', 'NF', 952, '1.23580843', '117.88600511', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(185, '401', 'JEMBATAN KAYU', 898, '1.23611111', '117.85864313', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(186, '402', 'PVC', 915, '1.23633121', '117.86903023', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(187, '403', 'JEMBATAN KAYU', 907, '1.23635222', '117.86782233', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(188, '405', 'PVC', 915, '1.23641151', '117.87417404', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(189, '407', 'JEMBATAN KAYU', 898, '1.23649577', '117.85000944', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(190, '408', 'JEMBATAN KAYU', 898, '1.23652466', '117.85865848', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(191, '409', 'NF', 915, '1.23656907', '117.87351387', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(192, '410', 'JEMBATAN KAYU', 885, '1.23658673', '117.84038906', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(193, '411', 'PVC', 915, '1.23664326', '117.86928829', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(194, '412', 'PVC', 915, '1.23665362', '117.87154466', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(195, '413', 'JEMBATAN KAYU', 915, '1.23666045', '117.87073252', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(196, '414', 'NF', 908, '1.23672468', '117.86392406', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(197, '418', 'PVC', 908, '1.23682763', '117.86577390', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(198, '419', 'JEMBATAN KAYU', 898, '1.23686547', '117.85636383', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(199, '421', 'JEMBATAN KAYU', 898, '1.23692375', '117.85360454', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(200, '422', 'JEMBATAN KAYU', 914, '1.23691863', '117.87681677', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(201, '424', 'JEMBATAN KAYU', 898, '1.23695083', '117.85290951', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(202, '426', 'JEMBATAN KAYU', 908, '1.23697043', '117.86707445', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(203, '427', 'JEMBATAN KAYU', 898, '1.23698769', '117.85022517', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(204, '429', 'PVC', 897, '1.23703807', '117.84996245', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(205, '432', 'NF', 890, '1.23710996', '117.84496404', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(206, '433', 'PVC', 889, '1.23711078', '117.84949903', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(207, '434', 'JEMBATAN KAYU', 890, '1.23711949', '117.84345408', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(208, '435', 'NF', 885, '1.23718250', '117.84023911', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(209, '437', 'JEMBATAN KAYU', 921, '1.23724379', '117.87831783', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(210, '438', 'JEMBATAN KAYU', 885, '1.23730658', '117.83325663', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(211, '439', 'JEMBATAN KAYU', 855, '1.23735833', '117.82843500', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(212, '440', 'JEMBATAN KAYU', 855, '1.23735955', '117.82812984', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(213, '441', 'JEMBATAN KAYU', 855, '1.23735907', '117.83112716', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(214, '442', 'PVC', 907, '1.23740893', '117.86694666', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(215, '445', 'PVC', 907, '1.23753256', '117.86708569', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(216, '449', 'JEMBATAN KAYU', 921, '1.23782222', '117.87989987', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(217, '450', 'PVC', 920, '1.23782677', '117.87938716', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(218, '451', 'PVC', 920, '1.23792020', '117.87885375', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(219, '452', 'PVC', 921, '1.23794080', '117.88090739', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(220, '453', 'JEMBATAN KAYU', 907, '1.23800559', '117.86789473', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(221, '455', 'PVC', 907, '1.23806752', '117.86573451', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(222, '456', 'JEMBATAN KAYU', 921, '1.23810642', '117.88325568', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(223, '457', 'PVC', 920, '1.23815373', '117.88404130', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(224, '458', 'PVC', 920, '1.23817250', '117.88088644', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(225, '462', 'PVC', 907, '1.23840639', '117.86732264', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(226, '463', 'JEMBATAN KAYU', 889, '1.23845634', '117.84964713', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(227, '465', 'NF', 914, '1.23874396', '117.87169331', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(228, '466', 'JEMBATAN KAYU', 907, '1.23880370', '117.86722532', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(229, '467', 'JEMBATAN KAYU', 914, '1.23883248', '117.86856951', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(230, '469', 'PVC', 907, '1.23897872', '117.86505669', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(231, '470', 'PVC', 907, '1.23901181', '117.86287831', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(232, '471', 'PVC', 906, '1.23903100', '117.86789699', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(233, '472', 'PVC', 913, '1.23907274', '117.86848048', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(234, '474', 'JEMBATAN KAYU', 897, '1.23922183', '117.85865213', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(235, '476', 'PVC', 906, '1.23925391', '117.86573504', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(236, '477', 'PVC', 907, '1.23925847', '117.86216662', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(237, '478', 'JEMBATAN KAYU', 897, '1.23926831', '117.85643320', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(238, '480', 'PVC', 913, '1.23933985', '117.87393088', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(239, '481', 'JEMBATAN KAYU', 907, '1.23935777', '117.85951606', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(240, '482', 'JEMBATAN KAYU', 896, '1.23941646', '117.85874017', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(241, '483', 'JEMBATAN KAYU', 889, '1.23943726', '117.84633121', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(242, '484', 'JEMBATAN KAYU', 889, '1.23944296', '117.84700516', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(243, '485', 'JEMBATAN KAYU', 889, '1.23949955', '117.84065961', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(244, '486', 'JEMBATAN KAYU', 889, '1.23949948', '117.84087532', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(245, '487', 'PVC', 884, '1.23950757', '117.84044549', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(246, '489', 'JEMBATAN KAYU', 884, '1.23956289', '117.83974895', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(247, '491', 'PVC', 913, '1.23957481', '117.87096213', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(248, '492', 'PVC', 907, '1.23959830', '117.86157816', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(249, '493', 'PVC', 907, '1.23961993', '117.86101352', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(250, '494', 'NF', 884, '1.23962967', '117.83806296', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(251, '498', 'JEMBATAN KAYU', 884, '1.23969849', '117.83415906', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(252, '499', 'PVC', 913, '1.23968716', '117.87148451', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(253, '500', 'JEMBATAN KAYU', 907, '1.23969229', '117.86009138', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(254, '501', 'NF', 884, '1.23973514', '117.83142514', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(255, '502', 'JEMBATAN KAYU', 884, '1.23973923', '117.83156158', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(256, '506', 'PVC', 888, '1.23981642', '117.84959451', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(257, '507', 'PVC', 913, '1.23981806', '117.87169838', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(258, '515', 'PVC', 906, '1.24009457', '117.86359409', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(259, '516', 'PVC', 906, '1.24013293', '117.86338198', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(260, '517', 'PVC', 913, '1.24022655', '117.87266685', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(261, '523', 'JEMBATAN KAYU', 920, '1.24043461', '117.87976491', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(262, '528', 'JEMBATAN KAYU', 919, '1.24060798', '117.88131187', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(263, '533', 'PVC', 913, '1.24109307', '117.86915285', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(264, '534', 'PVC', 913, '1.24113199', '117.87372451', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(265, '538', 'PVC', 919, '1.24120649', '117.88616671', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(266, '541', 'PVC', 906, '1.24129979', '117.86042568', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(267, '543', 'JEMBATAN KAYU', 913, '1.24134257', '117.86943715', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(268, '544', 'PVC', 912, '1.24135558', '117.87249814', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(269, '545', 'PVC', 912, '1.24135848', '117.87290589', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(270, '546', 'JEMBATAN KAYU', 913, '1.24135985', '117.87029309', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(271, '548', 'PVC', 912, '1.24140195', '117.86919171', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(272, '549', 'PVC', 912, '1.24144333', '117.86823536', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(273, '550', 'PVC', 906, '1.24144979', '117.86786974', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(274, '551', 'JEMBATAN KAYU', 906, '1.24145802', '117.86484997', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(275, '553', 'JEMBATAN KAYU', 906, '1.24148377', '117.85973584', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(276, '555', 'PVC', 906, '1.24152115', '117.86390834', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(277, '557', 'PVC', 905, '1.24155274', '117.86796995', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(278, '559', 'PVC', 920, '1.24155649', '117.88630221', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(279, '562', 'JEMBATAN KAYU', 896, '1.24159282', '117.85758439', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(280, '564', 'JEMBATAN KAYU', 896, '1.24164721', '117.85508650', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(281, '565', 'JEMBATAN KAYU', 896, '1.24169653', '117.85279751', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(282, '566', 'PVC', 895, '1.24174364', '117.85882417', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(283, '567', 'NF', 888, '1.24179649', '117.84812876', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(284, '569', 'NF', 888, '1.24180728', '117.84925700', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(285, '570', 'PVC', 888, '1.24182562', '117.84356654', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(286, '571', 'JEMBATAN KAYU', 888, '1.24185844', '117.84347869', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(287, '572', 'PVC', 888, '1.24187277', '117.84072260', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(288, '573', 'JEMBATAN KAYU', 888, '1.24188767', '117.84097494', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(289, '574', 'JEMBATAN KAYU', 883, '1.24192337', '117.83923125', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(290, '575', 'JEMBATAN KAYU', 883, '1.24192479', '117.83762580', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(291, '577', 'PVC', 905, '1.24197150', '117.86135360', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(292, '578', 'JEMBATAN KAYU', 883, '1.24198337', '117.83521607', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(293, '579', 'JEMBATAN KAYU', 883, '1.24199486', '117.83491281', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(294, '580', 'PVC', 919, '1.24199343', '117.88306745', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(295, '581', 'JEMBATAN KAYU', 853, '1.24204385', '117.83123058', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(296, '582', 'PVC', 887, '1.24205249', '117.84959580', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(297, '585', 'PVC', 919, '1.24219833', '117.88623833', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(298, '587', 'NF', 912, '1.24242770', '117.87701631', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(299, '588', 'PVC', 905, '1.24243583', '117.86149162', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(300, '592', 'PVC', 905, '1.24263000', '117.86240833', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(301, '593', 'PVC', 905, '1.24263540', '117.86203268', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(302, '600', 'PVC', 895, '1.24288665', '117.85167000', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(303, '605', 'JEMBATAN KAYU', 882, '1.24295528', '117.84050791', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(304, '606', 'NF', 918, '1.24294167', '117.88630167', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(305, '608', 'JEMBATAN KAYU', 895, '1.24312122', '117.85886116', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(306, '609', 'PVC', 918, '1.24315006', '117.88377158', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(307, '613', 'PVC', 912, '1.24327442', '117.87506607', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(308, '614', 'PVC', 905, '1.24348049', '117.86276502', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(309, '615', 'PVC', 912, '1.24348984', '117.87507185', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(310, '617', 'JEMBATAN KAYU', 912, '1.24362223', '117.87572246', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(311, '618', 'PVC', 905, '1.24365325', '117.86801534', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(312, '620', 'JEMBATAN KAYU', 912, '1.24374697', '117.87109351', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(313, '621', 'NF', 912, '1.24375664', '117.86965532', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(314, '624', 'JEMBATAN KAYU', 882, '1.24386589', '117.84052631', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(315, '626', 'JEMBATAN KAYU', 905, '1.24390715', '117.86262959', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(316, '627', 'JEMBATAN KAYU', 895, '1.24398157', '117.85594039', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(317, '628', 'NF', 918, '1.24399698', '117.88622947', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(318, '629', 'JEMBATAN KAYU', 895, '1.24404555', '117.85392713', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(319, '632', 'PVC', 904, '1.24406916', '117.86303423', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(320, '633', 'PVC', 904, '1.24407425', '117.86147923', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(321, '634', 'JEMBATAN KAYU', 895, '1.24408108', '117.85065865', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(322, '635', 'JEMBATAN KAYU', 895, '1.24408198', '117.85316318', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(323, '636', 'PVC', 904, '1.24408215', '117.86804212', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(324, '638', 'JEMBATAN KAYU', 887, '1.24413751', '117.84930910', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(325, '639', 'JEMBATAN KAYU', 894, '1.24413441', '117.85883452', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(326, '640', 'NF', 887, '1.24414011', '117.84660482', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(327, '641', 'JEMBATAN KAYU', 887, '1.24413919', '117.84962631', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(328, '642', 'PVC', 887, '1.24414467', '117.84968817', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(329, '644', 'PVC', 887, '1.24419264', '117.84463088', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(330, '646', 'JEMBATAN KAYU', 887, '1.24420253', '117.84470683', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(331, '647', 'JEMBATAN KAYU', 887, '1.24421216', '117.84454837', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(332, '649', 'JEMBATAN KAYU', 882, '1.24433712', '117.83587591', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(333, '651', 'NF', 882, '1.24437353', '117.83155298', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(334, '654', 'JEMBATAN KAYU', 886, '1.24438414', '117.84950030', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(335, '655', 'JEMBATAN KAYU', 887, '1.24445684', '117.84113194', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(336, '657', 'JEMBATAN KAYU', 881, '1.24448282', '117.83148455', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(337, '678', 'PVC', 904, '1.24508771', '117.86314290', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(338, '680', 'JEMBATAN KAYU', 887, '1.24518835', '117.84060762', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(339, '682', 'JEMBATAN KAYU', 881, '1.24536212', '117.84051304', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(340, '683', 'PVC', 904, '1.24539422', '117.86210231', '2026-02-08 05:55:05', '2026-02-08 05:55:05'),
(341, '685', 'PVC', 894, '1.24547779', '117.85399840', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(342, '690', 'PVC', 918, '1.24573305', '117.87978631', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(343, '691', 'PVC', 918, '1.24577021', '117.87723851', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(344, '692', 'PVC', 918, '1.24580147', '117.88172145', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(345, '694', 'JEMBATAN KAYU', 894, '1.24582605', '117.85885305', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(346, '696', 'JEMBATAN KAYU', 911, '1.24585571', '117.87221159', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(347, '697', 'PVC', 917, '1.24587196', '117.88067207', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(348, '698', 'PVC', 918, '1.24587526', '117.88604312', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(349, '699', 'PVC', 918, '1.24589833', '117.88615833', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(350, '700', 'JEMBATAN KAYU', 911, '1.24591232', '117.87155287', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(351, '701', 'PVC', 917, '1.24591895', '117.88463877', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(352, '702', 'PVC', 911, '1.24592641', '117.87173196', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(353, '703', 'PVC', 917, '1.24595058', '117.87975138', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(354, '705', 'PVC', 910, '1.24602399', '117.87568381', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(355, '706', 'JEMBATAN KAYU', 911, '1.24604263', '117.86858162', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(356, '707', 'PVC', 904, '1.24618036', '117.86312376', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(357, '708', 'PVC', 904, '1.24619742', '117.86350027', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(358, '709', 'PVC', 904, '1.24621442', '117.86307455', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(359, '712', 'PVC', 910, '1.24623844', '117.87569529', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(360, '713', 'PVC', 904, '1.24624628', '117.86233343', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(361, '714', 'JEMBATAN KAYU', 904, '1.24627905', '117.85977752', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(362, '716', 'JEMBATAN KAYU', 894, '1.24635081', '117.85862852', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(363, '717', 'JEMBATAN KAYU', 886, '1.24637183', '117.84965865', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(364, '718', 'NF', 894, '1.24637866', '117.85646246', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(365, '720', 'PVC', 894, '1.24639474', '117.85469733', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(366, '721', 'JEMBATAN KAYU', 894, '1.24644308', '117.85308305', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(367, '722', 'JEMBATAN KAYU', 886, '1.24649918', '117.84792459', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(368, '725', 'JEMBATAN KAYU', 886, '1.24659588', '117.84343236', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(369, '726', 'JEMBATAN KAYU', 881, '1.24667391', '117.83863062', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(370, '727', 'JEMBATAN KAYU', 881, '1.24669971', '117.83698084', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(371, '728', 'PVC', 910, '1.24669909', '117.87583166', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(372, '731', 'PVC', 851, '1.24680737', '117.83152964', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(373, '733', 'JEMBATAN KAYU', 874, '1.24688708', '117.84954698', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(374, '735', 'JEMBATAN KAYU', 851, '1.24694624', '117.82859391', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(375, '741', 'JEMBATAN KAYU', 868, '1.24741912', '117.84055797', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(376, '747', 'JEMBATAN KAYU', 868, '1.24807964', '117.84055162', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(377, '764', 'PVC', 917, '1.24840629', '117.88631871', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(378, '769', 'NF', 917, '1.24848802', '117.87893272', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(379, '772', 'JEMBATAN KAYU', 917, '1.24851453', '117.88077522', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(380, '774', 'PVC', 917, '1.24856000', '117.88621500', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(381, '775', 'PVC', 917, '1.24858146', '117.87733936', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(382, '776', 'JEMBATAN KAYU', 910, '1.24867281', '117.87296258', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(383, '778', 'JEMBATAN KAYU', 880, '1.24874518', '117.85454619', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(384, '779', 'JEMBATAN KAYU', 880, '1.24875640', '117.85213292', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(385, '780', 'PVC', 916, '1.24874929', '117.87863613', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(386, '781', 'JEMBATAN KAYU', 910, '1.24875303', '117.87096061', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(387, '782', 'JEMBATAN KAYU', 879, '1.24880328', '117.85576219', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(388, '783', 'JEMBATAN KAYU', 880, '1.24881482', '117.85118517', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(389, '784', 'JEMBATAN KAYU', 880, '1.24883942', '117.84985576', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(390, '785', 'JEMBATAN KAYU', 910, '1.24884429', '117.86856089', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(391, '786', 'NF', 850, '1.24888754', '117.83152857', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(392, '788', 'JEMBATAN KAYU', 874, '1.24893701', '117.84370165', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(393, '789', 'JEMBATAN KAYU', 874, '1.24893768', '117.84607230', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(394, '790', 'JEMBATAN KAYU', 903, '1.24896587', '117.86492499', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(395, '791', 'JEMBATAN KAYU', 903, '1.24897638', '117.86469459', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(396, '792', 'NF', 903, '1.24899336', '117.86387395', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(397, '793', 'JEMBATAN KAYU', 874, '1.24900795', '117.84102941', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(398, '794', 'JEMBATAN KAYU', 902, '1.24901893', '117.86812667', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(399, '795', 'PVC', 903, '1.24902622', '117.86447693', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(400, '796', 'JEMBATAN KAYU', 903, '1.24902921', '117.86168920', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(401, '797', 'PVC', 868, '1.24905875', '117.83917142', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(402, '798', 'JEMBATAN KAYU', 868, '1.24911665', '117.83623242', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(403, '799', 'PVC', 879, '1.24915904', '117.85891827', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(404, '800', 'PVC', 909, '1.24917306', '117.87714321', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(405, '801', 'JEMBATAN KAYU', 850, '1.24923737', '117.82810658', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(406, '802', 'JEMBATAN KAYU', 850, '1.24924374', '117.83026886', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(407, '803', 'JEMBATAN KAYU', 850, '1.24926258', '117.82918246', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(408, '805', 'JEMBATAN KAYU', 849, '1.24937858', '117.83152902', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(409, '807', 'PVC', 902, '1.24945268', '117.86378931', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(410, '808', 'PVC', 902, '1.24946015', '117.86379885', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(411, '810', 'JEMBATAN KAYU', 916, '1.24969098', '117.87945441', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(412, '819', 'JEMBATAN KAYU', 879, '1.25031816', '117.85371959', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(413, '825', 'NF', 916, '1.25061167', '117.88637000', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(414, '827', 'JEMBATAN KAYU', 916, '1.25070418', '117.87939183', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(415, '839', 'JEMBATAN KAYU', 879, '1.25108189', '117.85894463', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(416, '842', 'JEMBATAN KAYU', 879, '1.25111786', '117.85456591', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(417, '845', 'JEMBATAN KAYU', 916, '1.25115416', '117.88625866', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(418, '848', 'PVC', 916, '1.25123327', '117.88368522', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(419, '849', 'NF', 916, '1.25123665', '117.88311296', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(420, '850', 'JEMBATAN KAYU', 916, '1.25126517', '117.87902352', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(421, '852', 'JEMBATAN KAYU', 879, '1.25130197', '117.84990290', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(422, '854', 'PVC', 916, '1.25133810', '117.88146967', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(423, '855', 'JEMBATAN KAYU', 902, '1.25138865', '117.86454299', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(424, '856', 'JEMBATAN KAYU', 902, '1.25139519', '117.86290352', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(425, '857', 'PVC', 872, '1.25140264', '117.84659309', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(426, '858', 'PVC', 902, '1.25140149', '117.86315082', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(427, '859', 'PVC', 902, '1.25140337', '117.86472232', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(428, '861', 'PVC', 873, '1.25142539', '117.84088794', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(429, '862', 'PVC', 909, '1.25143134', '117.86960413', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(430, '863', 'JEMBATAN KAYU', 867, '1.25145893', '117.84010923', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(431, '865', 'PVC', 916, '1.25145862', '117.87810785', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(432, '866', 'PVC', 872, '1.25147167', '117.84501667', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(433, '868', 'JEMBATAN KAYU', 909, '1.25150245', '117.87283948', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(434, '870', 'JEMBATAN KAYU', 848, '1.25160572', '117.82686263', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(435, '871', 'JEMBATAN KAYU', 848, '1.25160713', '117.82930272', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(436, '872', 'JEMBATAN KAYU', 902, '1.25160734', '117.86051663', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(437, '874', 'JEMBATAN KAYU', 902, '1.25161839', '117.86024923', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(438, '875', 'NF', 848, '1.25163225', '117.83159294', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(439, '876', 'PVC', 902, '1.25166202', '117.85997947', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(440, '877', 'PVC', 840, '1.25169813', '117.82032340', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(441, '879', 'PVC', 830, '1.25187881', '117.81474169', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(442, '883', 'JEMBATAN KAYU', 867, '1.25196865', '117.83302659', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(443, '886', 'JEMBATAN KAYU', 878, '1.25201836', '117.85904266', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(444, '889', 'JEMBATAN KAYU', 830, '1.25208328', '117.80875768', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(445, '896', 'PVC', 848, '1.25248114', '117.82324515', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(446, '906', 'PVC', 872, '1.25274488', '117.84382884', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(447, '907', 'PVC', 866, '1.25277081', '117.84068936', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(448, '908', 'JEMBATAN KAYU', 872, '1.25277046', '117.84223389', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(449, '921', 'PVC', 878, '1.25329919', '117.85905601', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(450, '942', 'JEMBATAN KAYU', 848, '1.25382710', '117.82766965', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(451, '944', 'JEMBATAN KAYU', 866, '1.25383456', '117.84040326', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(452, '945', 'NF', 866, '1.25384839', '117.83712420', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(453, '946', 'JEMBATAN KAYU', 866, '1.25387316', '117.83474169', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(454, '948', 'JEMBATAN KAYU', 866, '1.25389401', '117.83369454', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(455, '949', 'JEMBATAN KAYU', 848, '1.25391122', '117.82954507', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(456, '951', 'JEMBATAN KAYU', 878, '1.25390902', '117.85462295', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(457, '952', 'PVC', 866, '1.25392118', '117.83194432', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(458, '953', 'PVC', 848, '1.25394222', '117.83160901', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(459, '954', 'JEMBATAN KAYU', 848, '1.25394698', '117.83043583', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(460, '956', 'JEMBATAN KAYU', 848, '1.25396057', '117.82865081', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(461, '958', 'JEMBATAN KAYU', 878, '1.25396989', '117.85276566', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(462, '959', 'JEMBATAN KAYU', 848, '1.25397881', '117.82818968', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(463, '963', 'JEMBATAN KAYU', 872, '1.25405454', '117.84966392', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(464, '966', 'JEMBATAN KAYU', 872, '1.25416516', '117.84407439', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(465, '967', 'JEMBATAN KAYU', 872, '1.25416727', '117.84333039', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(466, '969', 'JEMBATAN KAYU', 847, '1.25425231', '117.82313290', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(467, '971', 'JEMBATAN KAYU', 847, '1.25437725', '117.82316482', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(468, '976', 'JEMBATAN KAYU', 829, '1.25449458', '117.80999596', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(469, '980', 'JEMBATAN KAYU', 865, '1.25454843', '117.84068683', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(470, '1000', 'JEMBATAN KAYU', 829, '1.25565602', '117.81476374', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(471, '1011', 'JEMBATAN KAYU', 847, '1.25620041', '117.82540632', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(472, '1012', 'JEMBATAN KAYU', 865, '1.25621079', '117.83618844', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(473, '1013', 'JEMBATAN KAYU', 847, '1.25626706', '117.82229349', '2026-02-08 05:55:06', '2026-02-08 05:55:06');
INSERT INTO `infrastructure_masters` (`id`, `id_object`, `category`, `id_lokasi`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(474, '1014', 'PVC', 864, '1.25627603', '117.84070312', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(475, '1015', 'JEMBATAN KAYU', 865, '1.25628472', '117.83562770', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(476, '1016', 'JEMBATAN KAYU', 847, '1.25634568', '117.83017342', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(477, '1020', 'JEMBATAN KAYU', 847, '1.25640574', '117.82780394', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(478, '1021', 'PVC', 871, '1.25641117', '117.84981916', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(479, '1022', 'PVC', 846, '1.25642406', '117.83160461', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(480, '1024', 'JEMBATAN KAYU', 838, '1.25644121', '117.81877035', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(481, '1028', 'JEMBATAN KAYU', 838, '1.25646864', '117.81784460', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(482, '1032', 'JEMBATAN KAYU', 838, '1.25655400', '117.81555668', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(483, '1034', 'JEMBATAN KAYU', 877, '1.25657421', '117.85518050', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(484, '1035', 'PVC', 837, '1.25659205', '117.81483905', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(485, '1037', 'PVC', 829, '1.25660026', '117.81383557', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(486, '1040', 'NF', 877, '1.25664745', '117.85253808', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(487, '1044', 'NF', 871, '1.25676809', '117.84452707', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(488, '1046', 'JEMBATAN KAYU', 871, '1.25678941', '117.84381391', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(489, '1048', 'PVC', 871, '1.25679074', '117.84633645', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(490, '1052', 'JEMBATAN KAYU', 864, '1.25688664', '117.84074326', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(491, '1054', 'PVC', 870, '1.25691468', '117.84584696', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(492, '1060', 'JEMBATAN KAYU', 828, '1.25723975', '117.81474193', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(493, '1063', 'JEMBATAN KAYU', 864, '1.25741126', '117.84072646', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(494, '1065', 'JEMBATAN KAYU', 876, '1.25751743', '117.85915796', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(495, '1074', 'JEMBATAN KAYU', 876, '1.25812353', '117.85917138', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(496, '1078', 'JEMBATAN KAYU', 870, '1.25844450', '117.84524670', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(497, '1080', 'NF', 864, '1.25853545', '117.83587055', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(498, '1081', 'JEMBATAN KAYU', 828, '1.25855689', '117.81474471', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(499, '1082', 'JEMBATAN KAYU', 846, '1.25865100', '117.82943761', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(500, '1083', 'JEMBATAN KAYU', 864, '1.25865898', '117.83373268', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(501, '1085', 'JEMBATAN KAYU', 846, '1.25871799', '117.82444441', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(502, '1086', 'PVC', 864, '1.25871748', '117.83196202', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(503, '1087', 'JEMBATAN KAYU', 846, '1.25873294', '117.83005510', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(504, '1088', 'JEMBATAN KAYU', 837, '1.25873860', '117.81995748', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(505, '1089', 'JEMBATAN KAYU', 837, '1.25875713', '117.81858233', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(506, '1091', 'JEMBATAN KAYU', 837, '1.25876629', '117.81820483', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(507, '1092', 'JEMBATAN KAYU', 837, '1.25878469', '117.81723414', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(508, '1093', 'JEMBATAN KAYU', 846, '1.25878302', '117.82251907', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(509, '1094', 'PVC', 837, '1.25879962', '117.81490980', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(510, '1095', 'JEMBATAN KAYU', 837, '1.25881799', '117.81560493', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(511, '1096', 'JEMBATAN KAYU', 837, '1.25881971', '117.82093720', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(512, '1108', 'JEMBATAN KAYU', 876, '1.25923971', '117.85730607', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(513, '1111', 'JEMBATAN KAYU', 876, '1.25929153', '117.85562948', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(514, '1117', 'JEMBATAN KAYU', 845, '1.25937417', '117.83164854', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(515, '1118', 'JEMBATAN KAYU', 875, '1.25939312', '117.85916555', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(516, '1120', 'JEMBATAN KAYU', 876, '1.25947105', '117.85102351', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(517, '1123', 'JEMBATAN KAYU', 870, '1.25947968', '117.84700996', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(518, '1124', 'JEMBATAN KAYU', 870, '1.25948136', '117.84582021', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(519, '1127', 'JEMBATAN KAYU', 870, '1.25952253', '117.84521200', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(520, '1130', 'JEMBATAN KAYU', 870, '1.25954814', '117.84475990', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(521, '1131', 'JEMBATAN KAYU', 870, '1.25960278', '117.84322847', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(522, '1132', 'JEMBATAN KAYU', 827, '1.25964794', '117.81476764', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(523, '1133', 'JEMBATAN KAYU', 870, '1.25963970', '117.84237551', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(524, '1136', 'PVC', 863, '1.25965157', '117.84083210', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(525, '1137', 'JEMBATAN KAYU', 870, '1.25965329', '117.84180317', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(526, '1146', 'PVC', 869, '1.25985167', '117.84991833', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(527, '1150', 'PVC', 863, '1.25996797', '117.84082815', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(528, '1166', 'JEMBATAN KAYU', 863, '1.26045489', '117.84075248', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(529, '1177', 'PVC', 869, '1.26092994', '117.84092003', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(530, '1179', 'JEMBATAN KAYU', 863, '1.26094870', '117.83944407', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(531, '1181', 'JEMBATAN KAYU', 863, '1.26096706', '117.83863516', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(532, '1182', 'JEMBATAN KAYU', 863, '1.26099487', '117.83655896', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(533, '1183', 'JEMBATAN KAYU', 863, '1.26101313', '117.83604665', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(534, '1185', 'JEMBATAN KAYU', 836, '1.26102474', '117.82221698', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(535, '1188', 'JEMBATAN KAYU', 845, '1.26108749', '117.82985397', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(536, '1190', 'JEMBATAN KAYU', 836, '1.26109666', '117.82182088', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(537, '1191', 'JEMBATAN KAYU', 845, '1.26109973', '117.82838679', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(538, '1192', 'JEMBATAN KAYU', 845, '1.26110862', '117.82665311', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(539, '1193', 'JEMBATAN KAYU', 845, '1.26112520', '117.82510834', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(540, '1194', 'PVC', 845, '1.26113439', '117.82257277', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(541, '1195', 'JEMBATAN KAYU', 845, '1.26113305', '117.82882936', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(542, '1197', 'JEMBATAN KAYU', 836, '1.26115438', '117.81763743', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(543, '1198', 'JEMBATAN KAYU', 845, '1.26115502', '117.82793683', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(544, '1199', 'JEMBATAN KAYU', 836, '1.26116227', '117.81839046', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(545, '1200', 'NF', 836, '1.26116586', '117.81876409', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(546, '1205', 'JEMBATAN KAYU', 869, '1.26123672', '117.84673553', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(547, '1207', 'JEMBATAN KAYU', 835, '1.26124925', '117.82253731', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(548, '1211', 'JEMBATAN KAYU', 835, '1.26136435', '117.81872354', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(549, '1214', 'JEMBATAN KAYU', 862, '1.26147415', '117.84075799', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(550, '1218', 'NF', 835, '1.26156210', '117.82099877', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(551, '1221', 'JEMBATAN KAYU', 869, '1.26159553', '117.84419324', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(552, '1224', 'JEMBATAN KAYU', 835, '1.26170461', '117.81796211', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(553, '1226', 'JEMBATAN KAYU', 869, '1.26174214', '117.84663338', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(554, '1250', 'JEMBATAN KAYU', 869, '1.26231948', '117.84462044', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(555, '1259', 'JEMBATAN KAYU', 835, '1.26253980', '117.81946355', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(556, '1265', 'JEMBATAN KAYU', 844, '1.26270477', '117.83163851', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(557, '1268', 'JEMBATAN KAYU', 869, '1.26276578', '117.84655331', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(558, '1269', 'JEMBATAN KAYU', 869, '1.26276945', '117.84734875', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(559, '1270', 'JEMBATAN KAYU', 869, '1.26277082', '117.84754407', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(560, '1271', 'JEMBATAN KAYU', 869, '1.26279657', '117.84605678', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(561, '1272', 'JEMBATAN KAYU', 869, '1.26283172', '117.84440330', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(562, '1273', 'JEMBATAN KAYU', 869, '1.26283652', '117.84468762', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(563, '1274', 'JEMBATAN KAYU', 835, '1.26285389', '117.82244844', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(564, '1284', 'JEMBATAN KAYU', 862, '1.26328375', '117.83735224', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(565, '1285', 'JEMBATAN KAYU', 862, '1.26328710', '117.83689081', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(566, '1286', 'PVC', 862, '1.26329800', '117.84023705', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(567, '1291', 'PVC', 862, '1.26344058', '117.83182221', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(568, '1292', 'NF', 844, '1.26345890', '117.82301252', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(569, '1294', 'JEMBATAN KAYU', 844, '1.26349456', '117.82753930', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(570, '1295', 'JEMBATAN KAYU', 844, '1.26350812', '117.82854485', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(571, '1296', 'JEMBATAN KAYU', 844, '1.26351940', '117.82559525', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(572, '1297', 'JEMBATAN KAYU', 844, '1.26352411', '117.82910217', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(573, '1300', 'JEMBATAN KAYU', 835, '1.26355988', '117.82232343', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(574, '1301', 'JEMBATAN KAYU', 858, '1.26356731', '117.84063869', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(575, '1303', 'PVC', 844, '1.26358335', '117.82332229', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(576, '1304', 'JEMBATAN KAYU', 835, '1.26365779', '117.81909819', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(577, '1305', 'JEMBATAN KAYU', 835, '1.26366778', '117.82040165', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(578, '1307', 'JEMBATAN KAYU', 834, '1.26372393', '117.81744240', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(579, '1312', 'PVC', 834, '1.26377637', '117.81463409', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(580, '1313', 'JEMBATAN KAYU', 858, '1.26377091', '117.84079213', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(581, '1315', 'JEMBATAN KAYU', 834, '1.26383137', '117.82251291', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(582, '1319', 'JEMBATAN KAYU', 834, '1.26398996', '117.81976824', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(583, '1324', 'PVC', 861, '1.26415845', '117.84104888', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(584, '1325', 'JEMBATAN KAYU', 834, '1.26426331', '117.81940905', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(585, '1332', 'NF', 843, '1.26455167', '117.82397893', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(586, '1334', 'NF', 843, '1.26464490', '117.82474878', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(587, '1341', 'PVC', 834, '1.26479680', '117.81625097', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(588, '1353', 'PVC', 858, '1.26511421', '117.83185422', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(589, '1356', 'JEMBATAN KAYU', 858, '1.26516474', '117.84095477', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(590, '1368', 'JEMBATAN KAYU', 843, '1.26531896', '117.83168124', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(591, '1369', 'JEMBATAN KAYU', 834, '1.26543205', '117.82258292', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(592, '1374', 'PVC', 834, '1.26555554', '117.82002771', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(593, '1375', 'JEMBATAN KAYU', 861, '1.26558887', '117.84194668', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(594, '1376', 'PVC', 861, '1.26560891', '117.84338273', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(595, '1377', 'JEMBATAN KAYU', 858, '1.26561274', '117.84110229', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(596, '1378', 'PVC', 858, '1.26564954', '117.83818310', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(597, '1379', 'PVC', 857, '1.26566875', '117.83977742', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(598, '1380', 'JEMBATAN KAYU', 860, '1.26567733', '117.84210573', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(599, '1381', 'JEMBATAN KAYU', 857, '1.26572186', '117.84100465', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(600, '1382', 'JEMBATAN KAYU', 843, '1.26574340', '117.83155079', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(601, '1384', 'JEMBATAN KAYU', 843, '1.26575636', '117.82683549', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(602, '1385', 'NF', 843, '1.26575576', '117.82871398', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(603, '1386', 'PVC', 857, '1.26576538', '117.83528650', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(604, '1387', 'JEMBATAN KAYU', 843, '1.26577434', '117.82720401', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(605, '1390', 'JEMBATAN KAYU', 834, '1.26583659', '117.82094238', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(606, '1391', 'PVC', 857, '1.26583833', '117.83449333', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(607, '1392', 'JEMBATAN KAYU', 857, '1.26585280', '117.83679744', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(608, '1393', 'PVC', 834, '1.26586765', '117.82002062', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(609, '1394', 'JEMBATAN KAYU', 833, '1.26589014', '117.82257806', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(610, '1396', 'JEMBATAN KAYU', 834, '1.26593959', '117.81963617', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(611, '1397', 'JEMBATAN KAYU', 833, '1.26594914', '117.81805428', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(612, '1398', 'JEMBATAN KAYU', 834, '1.26595840', '117.81737120', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(613, '1408', 'JEMBATAN KAYU', 833, '1.26659225', '117.81750107', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(614, '1409', 'JEMBATAN KAYU', 842, '1.26661419', '117.83172251', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(615, '1411', 'PVC', 860, '1.26672109', '117.84254811', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(616, '1413', 'JEMBATAN KAYU', 833, '1.26676965', '117.81759139', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(617, '1416', 'PVC', 857, '1.26697780', '117.83831187', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(618, '1418', 'JEMBATAN KAYU', 842, '1.26711949', '117.83173308', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(619, '1424', 'JEMBATAN KAYU', 833, '1.26736149', '117.82260556', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(620, '1426', 'NF', 832, '1.26739032', '117.81795324', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(621, '1446', 'JEMBATAN KAYU', 832, '1.26782228', '117.81633816', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(622, '1456', 'NF', 833, '1.26794171', '117.82264204', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(623, '1458', 'JEMBATAN KAYU', 857, '1.26795917', '117.84069565', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(624, '1460', 'PVC', 860, '1.26798371', '117.84157384', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(625, '1461', 'PVC', 857, '1.26798938', '117.84064440', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(626, '1462', 'JEMBATAN KAYU', 857, '1.26799590', '117.83904188', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(627, '1463', 'PVC', 860, '1.26799652', '117.84286990', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(628, '1465', 'PVC', 857, '1.26801643', '117.83965389', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(629, '1466', 'PVC', 833, '1.26804485', '117.82053817', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(630, '1468', 'JEMBATAN KAYU', 842, '1.26812534', '117.83044043', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(631, '1469', 'JEMBATAN KAYU', 842, '1.26813170', '117.83164938', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(632, '1470', 'JEMBATAN KAYU', 857, '1.26815490', '117.83253315', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(633, '1471', 'JEMBATAN KAYU', 833, '1.26816470', '117.82163207', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(634, '1472', 'JEMBATAN KAYU', 842, '1.26817119', '117.82852600', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(635, '1474', 'PVC', 832, '1.26819672', '117.81532294', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(636, '1475', 'JEMBATAN KAYU', 833, '1.26820073', '117.82102103', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(637, '1476', 'JEMBATAN KAYU', 833, '1.26820425', '117.81980143', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(638, '1477', 'JEMBATAN KAYU', 832, '1.26821702', '117.82266143', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(639, '1479', 'PVC', 832, '1.26822167', '117.81928000', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(640, '1480', 'PVC', 832, '1.26822706', '117.81706592', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(641, '1482', 'JEMBATAN KAYU', 832, '1.26823500', '117.81865858', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(642, '1483', 'PVC', 832, '1.26823756', '117.81832825', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(643, '1484', 'PVC', 832, '1.26824347', '117.81904021', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(644, '1486', 'JEMBATAN KAYU', 842, '1.26827117', '117.82704301', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(645, '1487', 'JEMBATAN KAYU', 842, '1.26827107', '117.82736658', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(646, '1492', 'PVC', 832, '1.26845312', '117.81549008', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(647, '1501', 'JEMBATAN KAYU', 841, '1.26901312', '117.83177773', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(648, '1502', 'JEMBATAN KAYU', 832, '1.26902202', '117.82091476', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(649, '1504', 'JEMBATAN KAYU', 832, '1.26903388', '117.81848988', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(650, '1509', 'JEMBATAN KAYU', 832, '1.26931018', '117.82272641', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(651, '1512', 'JEMBATAN KAYU', 832, '1.26941285', '117.82130004', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(652, '1520', 'JEMBATAN KAYU', 832, '1.26978879', '117.81847774', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(653, '1524', 'PVC', 832, '1.26999737', '117.81596821', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(654, '1527', 'PVC', 832, '1.27042833', '117.81757500', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(655, '1529', 'JEMBATAN KAYU', 832, '1.27044076', '117.81890129', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(656, '1530', 'PVC', 832, '1.27046794', '117.82274743', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(657, '1734', 'PVC', 958, '1.21702912', '117.88237970', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(658, '1735', 'PVC', 941, '1.23201891', '117.86758113', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(659, '1736', 'PVC', 944, '1.22966352', '117.86764756', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(660, '1737', 'PVC', 942, '1.22964610', '117.86452988', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(661, '1738', 'PVC', 907, '1.23681866', '117.86262197', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(662, '1739', 'PVC', 872, '1.25276817', '117.84189122', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(663, '1740', 'PVC', 872, '1.25278160', '117.84186936', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(664, '1741', 'PVC', 873, '1.25139045', '117.84158445', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(665, '1742', 'PVC', 870, '1.25858453', '117.84797761', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(666, '1743', 'PVC', 871, '1.25515662', '117.84762077', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(667, '1744', 'PVC', 835, '1.26137482', '117.82088339', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(668, '1745', 'PVC', 834, '1.26368336', '117.82234170', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(669, '1746', 'PVC', 844, '1.26315924', '117.82244840', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(670, '1747', 'NF', 862, '1.26231916', '117.83172316', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(671, '1748', 'NF', 872, '1.25145977', '117.84271169', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(672, '1749', 'NF', 898, '1.23479356', '117.85222327', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(673, '1750', 'NF', 831, '1.25072557', '117.80799699', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(674, '1751', 'NF', 843, '1.26356091', '117.82596471', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(675, '1752', 'NF', 840, '1.24984086', '117.81484163', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(676, '1753', 'NF', 833, '1.26617593', '117.82017419', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(677, '1754', 'NF', 936, '1.22277217', '117.86407499', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(678, '1755', 'NF', 925, '1.21843508', '117.84820101', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(679, '1756', 'NF', 938, '1.21609669', '117.86302239', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(680, '1768', 'NF', 889, '1.23718004', '117.84585973', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(681, '1794', 'PVC', 933, '1.21349333', '117.85224167', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(682, '1795', 'PVC', 933, '1.21201333', '117.85250833', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(683, '1796', 'PVC', 933, '1.21353167', '117.85456667', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(684, '1797', 'PVC', 932, '1.21622833', '117.85388000', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(685, '1798', 'PVC', 873, '1.25135167', '117.84294595', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(686, '1799', 'PVC', 956, '1.22168667', '117.88546167', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(687, '1800', 'PVC', 873, '1.24998112', '117.84497785', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(688, '1801', 'PVC', 957, '1.21956140', '117.87820873', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(689, '1802', 'PVC', 948, '1.22062529', '117.87556526', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(690, '1803', 'NF', 912, '1.24200739', '117.87701360', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(691, '1804', 'NF', 913, '1.23899644', '117.87694745', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(692, '1805', 'NF', 913, '1.24095317', '117.87699522', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(693, '1806', 'NF', 942, '1.23204637', '117.86415421', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(694, '1840', 'NF', 902, '1.25004292', '117.86564003', '2026-02-08 05:55:06', '2026-02-08 05:55:06'),
(695, 'TEST Infra', 'NF', 827, '-7.42476274', '109.34064485', '2026-02-11 03:08:08', '2026-02-11 03:54:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` enum('Mandau Air','Mandor','Asisten','Lainnya') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `jabatan`, `created_at`, `updated_at`) VALUES
(1, 'Yudistra', 'Asisten', '2025-12-10 00:04:13', '2025-12-14 05:15:07'),
(2, 'Test User', 'Mandau Air', '2025-12-10 03:16:38', '2025-12-10 03:16:38'),
(3, 'ADRIAN', 'Mandau Air', '2025-12-12 04:53:11', '2025-12-12 04:53:11'),
(4, 'SLAMET', 'Mandau Air', '2025-12-12 04:53:22', '2025-12-12 04:53:22'),
(5, 'EVENSIUS A', 'Mandau Air', '2025-12-12 04:53:30', '2025-12-12 04:53:30'),
(6, 'Mandau Air Kebun 1', 'Mandau Air', '2025-12-13 19:12:58', '2025-12-13 19:12:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `afdeling` varchar(50) NOT NULL,
  `blok` varchar(20) NOT NULL,
  `luas_ha` decimal(10,2) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL COMMENT 'Titik tengah X',
  `longitude` decimal(11,8) DEFAULT NULL COMMENT 'Titik tengah Y',
  `batas_area` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Menyimpan GeoJSON Polygon jika perlu' CHECK (json_valid(`batas_area`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id`, `afdeling`, `blok`, `luas_ha`, `latitude`, `longitude`, `batas_area`, `created_at`, `updated_at`) VALUES
(827, 'A', 'A11', NULL, NULL, NULL, NULL, NULL, NULL),
(828, 'A', 'A12', NULL, NULL, NULL, NULL, NULL, NULL),
(829, 'A', 'A13', NULL, NULL, NULL, NULL, NULL, NULL),
(830, 'A', 'A14', NULL, NULL, NULL, NULL, NULL, NULL),
(831, 'A', 'A15', NULL, NULL, NULL, NULL, NULL, NULL),
(832, 'A', 'B07', NULL, NULL, NULL, NULL, NULL, NULL),
(833, 'A', 'B08', NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'A', 'B09', NULL, NULL, NULL, NULL, NULL, NULL),
(835, 'A', 'B10', NULL, NULL, NULL, NULL, NULL, NULL),
(836, 'A', 'B11', NULL, NULL, NULL, NULL, NULL, NULL),
(837, 'A', 'B12', NULL, NULL, NULL, NULL, NULL, NULL),
(838, 'A', 'B13', NULL, NULL, NULL, NULL, NULL, NULL),
(839, 'A', 'B14', NULL, NULL, NULL, NULL, NULL, NULL),
(840, 'A', 'B15', NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'A', 'C07', NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'A', 'C08', NULL, NULL, NULL, NULL, NULL, NULL),
(843, 'A', 'C09', NULL, NULL, NULL, NULL, NULL, NULL),
(844, 'A', 'C10', NULL, NULL, NULL, NULL, NULL, NULL),
(845, 'A', 'C11', NULL, NULL, NULL, NULL, NULL, NULL),
(846, 'A', 'C12', NULL, NULL, NULL, NULL, NULL, NULL),
(847, 'A', 'C13', NULL, NULL, NULL, NULL, NULL, NULL),
(848, 'A', 'C14', NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'A', 'C15', NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'A', 'C16', NULL, NULL, NULL, NULL, NULL, NULL),
(851, 'A', 'C17', NULL, NULL, NULL, NULL, NULL, NULL),
(852, 'A', 'C18', NULL, NULL, NULL, NULL, NULL, NULL),
(853, 'A', 'C19', NULL, NULL, NULL, NULL, NULL, NULL),
(854, 'A', 'C20', NULL, NULL, NULL, NULL, NULL, NULL),
(855, 'A', 'C21', NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'A', 'D07', NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'A', 'D08', NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'A', 'D09', NULL, NULL, NULL, NULL, NULL, NULL),
(859, 'A', 'E07', NULL, NULL, NULL, NULL, NULL, NULL),
(860, 'A', 'E08', NULL, NULL, NULL, NULL, NULL, NULL),
(861, 'A', 'E09', NULL, NULL, NULL, NULL, NULL, NULL),
(862, 'B', 'D10', NULL, NULL, NULL, NULL, NULL, NULL),
(863, 'B', 'D11', NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'B', 'D12', NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'B', 'D13', NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'B', 'D14', NULL, NULL, NULL, NULL, NULL, NULL),
(867, 'B', 'D15', NULL, NULL, NULL, NULL, NULL, NULL),
(868, 'B', 'D16', NULL, NULL, NULL, NULL, NULL, NULL),
(869, 'B', 'E10', NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'B', 'E11', NULL, NULL, NULL, NULL, NULL, NULL),
(871, 'B', 'E12', NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'B', 'E13', NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'B', 'E14', NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'B', 'E15', NULL, NULL, NULL, NULL, NULL, NULL),
(875, 'B', 'F10', NULL, NULL, NULL, NULL, NULL, NULL),
(876, 'B', 'F11', NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'B', 'F12', NULL, NULL, NULL, NULL, NULL, NULL),
(878, 'B', 'F13', NULL, NULL, NULL, NULL, NULL, NULL),
(879, 'B', 'F14', NULL, NULL, NULL, NULL, NULL, NULL),
(880, 'B', 'F15', NULL, NULL, NULL, NULL, NULL, NULL),
(881, 'C', 'D17', NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'C', 'D18', NULL, NULL, NULL, NULL, NULL, NULL),
(883, 'C', 'D19', NULL, NULL, NULL, NULL, NULL, NULL),
(884, 'C', 'D20', NULL, NULL, NULL, NULL, NULL, NULL),
(885, 'C', 'D21', NULL, NULL, NULL, NULL, NULL, NULL),
(886, 'C', 'E16', NULL, NULL, NULL, NULL, NULL, NULL),
(887, 'C', 'E17', NULL, NULL, NULL, NULL, NULL, NULL),
(888, 'C', 'E18', NULL, NULL, NULL, NULL, NULL, NULL),
(889, 'C', 'E19', NULL, NULL, NULL, NULL, NULL, NULL),
(890, 'C', 'E20', NULL, NULL, NULL, NULL, NULL, NULL),
(891, 'C', 'E21', NULL, NULL, NULL, NULL, NULL, NULL),
(892, 'C', 'E22', NULL, NULL, NULL, NULL, NULL, NULL),
(893, 'C', 'E23', NULL, NULL, NULL, NULL, NULL, NULL),
(894, 'C', 'F16', NULL, NULL, NULL, NULL, NULL, NULL),
(895, 'C', 'F17', NULL, NULL, NULL, NULL, NULL, NULL),
(896, 'C', 'F18', NULL, NULL, NULL, NULL, NULL, NULL),
(897, 'C', 'F19', NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'C', 'F20', NULL, NULL, NULL, NULL, NULL, NULL),
(899, 'C', 'F21', NULL, NULL, NULL, NULL, NULL, NULL),
(900, 'C', 'F22', NULL, NULL, NULL, NULL, NULL, NULL),
(901, 'C', 'F23', NULL, NULL, NULL, NULL, NULL, NULL),
(902, 'D', 'G14', NULL, NULL, NULL, NULL, NULL, NULL),
(903, 'D', 'G15', NULL, NULL, NULL, NULL, NULL, NULL),
(904, 'D', 'G16', NULL, NULL, NULL, NULL, NULL, NULL),
(905, 'D', 'G17', NULL, NULL, NULL, NULL, NULL, NULL),
(906, 'D', 'G18', NULL, NULL, NULL, NULL, NULL, NULL),
(907, 'D', 'G19', NULL, NULL, NULL, NULL, NULL, NULL),
(908, 'D', 'G20', NULL, NULL, NULL, NULL, NULL, NULL),
(909, 'D', 'H14', NULL, NULL, NULL, NULL, NULL, NULL),
(910, 'D', 'H15', NULL, NULL, NULL, NULL, NULL, NULL),
(911, 'D', 'H16', NULL, NULL, NULL, NULL, NULL, NULL),
(912, 'D', 'H17', NULL, NULL, NULL, NULL, NULL, NULL),
(913, 'D', 'H18', NULL, NULL, NULL, NULL, NULL, NULL),
(914, 'D', 'H19', NULL, NULL, NULL, NULL, NULL, NULL),
(915, 'D', 'H20', NULL, NULL, NULL, NULL, NULL, NULL),
(916, 'D', 'I14', NULL, NULL, NULL, NULL, NULL, NULL),
(917, 'D', 'I15', NULL, NULL, NULL, NULL, NULL, NULL),
(918, 'D', 'I16', NULL, NULL, NULL, NULL, NULL, NULL),
(919, 'D', 'I17', NULL, NULL, NULL, NULL, NULL, NULL),
(920, 'D', 'I18', NULL, NULL, NULL, NULL, NULL, NULL),
(921, 'D', 'I19', NULL, NULL, NULL, NULL, NULL, NULL),
(922, 'E', 'E24', NULL, NULL, NULL, NULL, NULL, NULL),
(923, 'E', 'E25', NULL, NULL, NULL, NULL, NULL, NULL),
(924, 'E', 'E26', NULL, NULL, NULL, NULL, NULL, NULL),
(925, 'E', 'E27', NULL, NULL, NULL, NULL, NULL, NULL),
(926, 'E', 'E28', NULL, NULL, NULL, NULL, NULL, NULL),
(927, 'E', 'E29', NULL, NULL, NULL, NULL, NULL, NULL),
(928, 'E', 'F24', NULL, NULL, NULL, NULL, NULL, NULL),
(929, 'E', 'F25', NULL, NULL, NULL, NULL, NULL, NULL),
(930, 'E', 'F26', NULL, NULL, NULL, NULL, NULL, NULL),
(931, 'E', 'F27', NULL, NULL, NULL, NULL, NULL, NULL),
(932, 'E', 'F28', NULL, NULL, NULL, NULL, NULL, NULL),
(933, 'E', 'F29', NULL, NULL, NULL, NULL, NULL, NULL),
(934, 'E', 'G23', NULL, NULL, NULL, NULL, NULL, NULL),
(935, 'E', 'G24', NULL, NULL, NULL, NULL, NULL, NULL),
(936, 'E', 'G25', NULL, NULL, NULL, NULL, NULL, NULL),
(937, 'E', 'G26', NULL, NULL, NULL, NULL, NULL, NULL),
(938, 'E', 'G27', NULL, NULL, NULL, NULL, NULL, NULL),
(939, 'E', 'G28', NULL, NULL, NULL, NULL, NULL, NULL),
(940, 'E', 'G29', NULL, NULL, NULL, NULL, NULL, NULL),
(941, 'F', 'G21', NULL, NULL, NULL, NULL, NULL, NULL),
(942, 'F', 'G22', NULL, NULL, NULL, NULL, NULL, NULL),
(943, 'F', 'H21', NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'F', 'H22', NULL, NULL, NULL, NULL, NULL, NULL),
(945, 'F', 'H23', NULL, NULL, NULL, NULL, NULL, NULL),
(946, 'F', 'H24', NULL, NULL, NULL, NULL, NULL, NULL),
(947, 'F', 'H25', NULL, NULL, NULL, NULL, NULL, NULL),
(948, 'F', 'H26', NULL, NULL, NULL, NULL, NULL, NULL),
(949, 'F', 'H27', NULL, NULL, NULL, NULL, NULL, NULL),
(950, 'F', 'H28', NULL, NULL, NULL, NULL, NULL, NULL),
(951, 'F', 'H29', NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'F', 'I20', NULL, NULL, NULL, NULL, NULL, NULL),
(953, 'F', 'I21', NULL, NULL, NULL, NULL, NULL, NULL),
(954, 'F', 'I22', NULL, NULL, NULL, NULL, NULL, NULL),
(955, 'F', 'I23', NULL, NULL, NULL, NULL, NULL, NULL),
(956, 'F', 'I24', NULL, NULL, NULL, NULL, NULL, NULL),
(957, 'F', 'I25', NULL, NULL, NULL, NULL, NULL, NULL),
(958, 'F', 'I26', NULL, NULL, NULL, NULL, NULL, NULL),
(959, 'F', 'I27', NULL, NULL, NULL, NULL, NULL, NULL),
(960, 'G', 'J13', NULL, NULL, NULL, NULL, NULL, NULL),
(961, 'G', 'J14', NULL, NULL, NULL, NULL, NULL, NULL),
(962, 'G', 'J15', NULL, NULL, NULL, NULL, NULL, NULL),
(963, 'G', 'J16', NULL, NULL, NULL, NULL, NULL, NULL),
(964, 'G', 'J17', NULL, NULL, NULL, NULL, NULL, NULL),
(965, 'G', 'J18', NULL, NULL, NULL, NULL, NULL, NULL),
(966, 'G', 'J19', NULL, NULL, NULL, NULL, NULL, NULL),
(967, 'G', 'J20', NULL, NULL, NULL, NULL, NULL, NULL),
(968, 'G', 'J21', NULL, NULL, NULL, NULL, NULL, NULL),
(969, 'G', 'J22', NULL, NULL, NULL, NULL, NULL, NULL),
(970, 'G', 'J23', NULL, NULL, NULL, NULL, NULL, NULL),
(971, 'G', 'J25', NULL, NULL, NULL, NULL, NULL, NULL),
(972, 'G', 'J26', NULL, NULL, NULL, NULL, NULL, NULL),
(973, 'G', 'J27', NULL, NULL, NULL, NULL, NULL, NULL),
(974, 'G', 'K13', NULL, NULL, NULL, NULL, NULL, NULL),
(975, 'G', 'K14', NULL, NULL, NULL, NULL, NULL, NULL),
(976, 'G', 'K15', NULL, NULL, NULL, NULL, NULL, NULL),
(977, 'G', 'K16', NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'G', 'K17', NULL, NULL, NULL, NULL, NULL, NULL),
(979, 'G', 'K18', NULL, NULL, NULL, NULL, NULL, NULL),
(980, 'G', 'L12', NULL, NULL, NULL, NULL, NULL, NULL),
(981, 'G', 'L13', NULL, NULL, NULL, NULL, NULL, NULL),
(982, 'G', 'L14', NULL, NULL, NULL, NULL, NULL, NULL),
(983, 'G', 'M09', NULL, NULL, NULL, NULL, NULL, NULL),
(984, 'G', 'N13', NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'H', 'I07', NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'H', 'I08', NULL, NULL, NULL, NULL, NULL, NULL),
(987, 'H', 'I09', NULL, NULL, NULL, NULL, NULL, NULL),
(988, 'H', 'I10', NULL, NULL, NULL, NULL, NULL, NULL),
(989, 'H', 'I11', NULL, NULL, NULL, NULL, NULL, NULL),
(990, 'H', 'I12', NULL, NULL, NULL, NULL, NULL, NULL),
(991, 'H', 'I13', NULL, NULL, NULL, NULL, NULL, NULL),
(992, 'H', 'J08', NULL, NULL, NULL, NULL, NULL, NULL),
(993, 'H', 'J09', NULL, NULL, NULL, NULL, NULL, NULL),
(994, 'H', 'J10', NULL, NULL, NULL, NULL, NULL, NULL),
(995, 'H', 'J11', NULL, NULL, NULL, NULL, NULL, NULL),
(996, 'H', 'J12', NULL, NULL, NULL, NULL, NULL, NULL),
(997, 'H', 'K08', NULL, NULL, NULL, NULL, NULL, NULL),
(998, 'H', 'K09', NULL, NULL, NULL, NULL, NULL, NULL),
(999, 'H', 'K10', NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 'H', 'K11', NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 'H', 'K12', NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 'I', 'F01', NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 'I', 'F02', NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 'I', 'F03', NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 'I', 'F04', NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 'I', 'G01', NULL, NULL, NULL, NULL, NULL, NULL),
(1007, 'I', 'G02', NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 'I', 'G03', NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 'I', 'H01', NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 'I', 'H02', NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 'I', 'H03', NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 'I', 'H04', NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 'I', 'I01', NULL, NULL, NULL, NULL, NULL, NULL),
(1014, 'I', 'I02', NULL, NULL, NULL, NULL, NULL, NULL),
(1015, 'I', 'I03', NULL, NULL, NULL, NULL, NULL, NULL),
(1016, 'I', 'I04', NULL, NULL, NULL, NULL, NULL, NULL),
(1017, 'I', 'I05', NULL, NULL, NULL, NULL, NULL, NULL),
(1018, 'I', 'I06', NULL, NULL, NULL, NULL, NULL, NULL),
(1019, 'I', 'J01', NULL, NULL, NULL, NULL, NULL, NULL),
(1020, 'I', 'J02', NULL, NULL, NULL, NULL, NULL, NULL),
(1021, 'I', 'J03', NULL, NULL, NULL, NULL, NULL, NULL),
(1022, 'I', 'J04', NULL, NULL, NULL, NULL, NULL, NULL),
(1023, 'I', 'J05', NULL, NULL, NULL, NULL, NULL, NULL),
(1024, 'I', 'J06', NULL, NULL, NULL, NULL, NULL, NULL),
(1025, 'I', 'J07', NULL, NULL, NULL, NULL, NULL, NULL),
(1026, 'J', 'K01', NULL, NULL, NULL, NULL, NULL, NULL),
(1027, 'J', 'K02', NULL, NULL, NULL, NULL, NULL, NULL),
(1028, 'J', 'K03', NULL, NULL, NULL, NULL, NULL, NULL),
(1029, 'J', 'K04', NULL, NULL, NULL, NULL, NULL, NULL),
(1030, 'J', 'K05', NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 'J', 'K06', NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 'J', 'K07', NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 'J', 'L04', NULL, NULL, NULL, NULL, NULL, NULL),
(1034, 'J', 'L05', NULL, NULL, NULL, NULL, NULL, NULL),
(1035, 'J', 'L06', NULL, NULL, NULL, NULL, NULL, NULL),
(1036, 'J', 'L07', NULL, NULL, NULL, NULL, NULL, NULL),
(1037, 'J', 'L08', NULL, NULL, NULL, NULL, NULL, NULL),
(1038, 'J', 'L09', NULL, NULL, NULL, NULL, NULL, NULL),
(1039, 'J', 'L10', NULL, NULL, NULL, NULL, NULL, NULL),
(1040, 'J', 'L11', NULL, NULL, NULL, NULL, NULL, NULL),
(1041, 'J', 'M04', NULL, NULL, NULL, NULL, NULL, NULL),
(1042, 'J', 'M05', NULL, NULL, NULL, NULL, NULL, NULL),
(1043, 'J', 'M06', NULL, NULL, NULL, NULL, NULL, NULL),
(1044, 'J', 'M08', NULL, NULL, NULL, NULL, NULL, NULL),
(1045, 'K', 'L01', NULL, NULL, NULL, NULL, NULL, NULL),
(1046, 'K', 'L02', NULL, NULL, NULL, NULL, NULL, NULL),
(1047, 'K', 'L03', NULL, NULL, NULL, NULL, NULL, NULL),
(1048, 'K', 'M02', NULL, NULL, NULL, NULL, NULL, NULL),
(1049, 'K', 'M03', NULL, NULL, NULL, NULL, NULL, NULL),
(1050, 'K', 'N02', NULL, NULL, NULL, NULL, NULL, NULL),
(1051, 'K', 'N03', NULL, NULL, NULL, NULL, NULL, NULL),
(1052, 'K', 'N04', NULL, NULL, NULL, NULL, NULL, NULL),
(1053, 'K', 'N05', NULL, NULL, NULL, NULL, NULL, NULL),
(1054, 'K', 'N06', NULL, NULL, NULL, NULL, NULL, NULL),
(1055, 'K', 'N07', NULL, NULL, NULL, NULL, NULL, NULL),
(1056, 'K', 'O03', NULL, NULL, NULL, NULL, NULL, NULL),
(1057, 'K', 'O04', NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 'K', 'O05', NULL, NULL, NULL, NULL, NULL, NULL),
(1059, 'K', 'O06', NULL, NULL, NULL, NULL, NULL, NULL),
(1060, 'K', 'O07', NULL, NULL, NULL, NULL, NULL, NULL),
(1061, 'K', 'P05', NULL, NULL, NULL, NULL, NULL, NULL),
(1062, 'K', 'P06', NULL, NULL, NULL, NULL, NULL, NULL),
(1063, 'L', 'M07', NULL, NULL, NULL, NULL, NULL, NULL),
(1064, 'L', 'N08', NULL, NULL, NULL, NULL, NULL, NULL),
(1065, 'L', 'N09', NULL, NULL, NULL, NULL, NULL, NULL),
(1066, 'L', 'N10', NULL, NULL, NULL, NULL, NULL, NULL),
(1067, 'L', 'N11', NULL, NULL, NULL, NULL, NULL, NULL),
(1068, 'L', 'N12', NULL, NULL, NULL, NULL, NULL, NULL),
(1069, 'L', 'N14', NULL, NULL, NULL, NULL, NULL, NULL),
(1070, 'L', 'N15', NULL, NULL, NULL, NULL, NULL, NULL),
(1071, 'L', 'N16', NULL, NULL, NULL, NULL, NULL, NULL),
(1072, 'L', 'N17', NULL, NULL, NULL, NULL, NULL, NULL),
(1073, 'L', 'N18', NULL, NULL, NULL, NULL, NULL, NULL),
(1074, 'L', 'O08', NULL, NULL, NULL, NULL, NULL, NULL),
(1075, 'L', 'O09', NULL, NULL, NULL, NULL, NULL, NULL),
(1076, 'L', 'O10', NULL, NULL, NULL, NULL, NULL, NULL),
(1077, 'L', 'O11', NULL, NULL, NULL, NULL, NULL, NULL),
(1078, 'L', 'O12', NULL, NULL, NULL, NULL, NULL, NULL),
(1079, 'L', 'O15', NULL, NULL, NULL, NULL, NULL, NULL),
(1080, 'L', 'O16', NULL, NULL, NULL, NULL, NULL, NULL),
(1081, 'L', 'O17', NULL, NULL, NULL, NULL, NULL, NULL),
(1082, 'L', 'P07', NULL, NULL, NULL, NULL, NULL, NULL),
(1083, 'L', 'P08', NULL, NULL, NULL, NULL, NULL, NULL),
(1084, 'L', 'P09', NULL, NULL, NULL, NULL, NULL, NULL),
(1085, 'L', 'P10', NULL, NULL, NULL, NULL, NULL, NULL),
(1086, 'L', 'P11', NULL, NULL, NULL, NULL, NULL, NULL),
(1087, 'M', 'S19', NULL, NULL, NULL, NULL, NULL, NULL),
(1088, 'M', 'S20', NULL, NULL, NULL, NULL, NULL, NULL),
(1089, 'M', 'S21', NULL, NULL, NULL, NULL, NULL, NULL),
(1090, 'M', 'S22', NULL, NULL, NULL, NULL, NULL, NULL),
(1091, 'M', 'S26', NULL, NULL, NULL, NULL, NULL, NULL),
(1092, 'M', 'T18', NULL, NULL, NULL, NULL, NULL, NULL),
(1093, 'M', 'T19', NULL, NULL, NULL, NULL, NULL, NULL),
(1094, 'M', 'T20', NULL, NULL, NULL, NULL, NULL, NULL),
(1095, 'M', 'T21', NULL, NULL, NULL, NULL, NULL, NULL),
(1096, 'M', 'T22', NULL, NULL, NULL, NULL, NULL, NULL),
(1097, 'M', 'T23', NULL, NULL, NULL, NULL, NULL, NULL),
(1098, 'M', 'T24', NULL, NULL, NULL, NULL, NULL, NULL),
(1099, 'M', 'T25', NULL, NULL, NULL, NULL, NULL, NULL),
(1100, 'M', 'T26', NULL, NULL, NULL, NULL, NULL, NULL),
(1101, 'M', 'T27', NULL, NULL, NULL, NULL, NULL, NULL),
(1102, 'M', 'T28', NULL, NULL, NULL, NULL, NULL, NULL),
(1103, 'M', 'T29', NULL, NULL, NULL, NULL, NULL, NULL),
(1104, 'M', 'U24', NULL, NULL, NULL, NULL, NULL, NULL),
(1105, 'M', 'U25', NULL, NULL, NULL, NULL, NULL, NULL),
(1106, 'M', 'U26', NULL, NULL, NULL, NULL, NULL, NULL),
(1107, 'M', 'U27', NULL, NULL, NULL, NULL, NULL, NULL),
(1108, 'M', 'U28', NULL, NULL, NULL, NULL, NULL, NULL),
(1109, 'M', 'U29', NULL, NULL, NULL, NULL, NULL, NULL),
(1110, 'M', 'V24', NULL, NULL, NULL, NULL, NULL, NULL),
(1111, 'M', 'V25', NULL, NULL, NULL, NULL, NULL, NULL),
(1112, 'M', 'V26', NULL, NULL, NULL, NULL, NULL, NULL),
(1113, 'M', 'V27', NULL, NULL, NULL, NULL, NULL, NULL),
(1114, 'M', 'V28', NULL, NULL, NULL, NULL, NULL, NULL),
(1115, 'M', 'V29', NULL, NULL, NULL, NULL, NULL, NULL),
(1116, 'M', 'V30', NULL, NULL, NULL, NULL, NULL, NULL),
(1117, 'M', 'V31', NULL, NULL, NULL, NULL, NULL, NULL),
(1118, 'M', 'V32', NULL, NULL, NULL, NULL, NULL, NULL),
(1119, 'M', 'V33', NULL, NULL, NULL, NULL, NULL, NULL),
(1120, 'N', 'O18', NULL, NULL, NULL, NULL, NULL, NULL),
(1121, 'N', 'O19', NULL, NULL, NULL, NULL, NULL, NULL),
(1122, 'N', 'O20', NULL, NULL, NULL, NULL, NULL, NULL),
(1123, 'N', 'O21', NULL, NULL, NULL, NULL, NULL, NULL),
(1124, 'N', 'O22', NULL, NULL, NULL, NULL, NULL, NULL),
(1125, 'N', 'O23', NULL, NULL, NULL, NULL, NULL, NULL),
(1126, 'N', 'O24', NULL, NULL, NULL, NULL, NULL, NULL),
(1127, 'N', 'O25', NULL, NULL, NULL, NULL, NULL, NULL),
(1128, 'N', 'O26', NULL, NULL, NULL, NULL, NULL, NULL),
(1129, 'N', 'O27', NULL, NULL, NULL, NULL, NULL, NULL),
(1130, 'N', 'O28', NULL, NULL, NULL, NULL, NULL, NULL),
(1131, 'N', 'O29', NULL, NULL, NULL, NULL, NULL, NULL),
(1132, 'N', 'O30', NULL, NULL, NULL, NULL, NULL, NULL),
(1133, 'N', 'O31', NULL, NULL, NULL, NULL, NULL, NULL),
(1134, 'N', 'O32', NULL, NULL, NULL, NULL, NULL, NULL),
(1135, 'N', 'P12', NULL, NULL, NULL, NULL, NULL, NULL),
(1136, 'N', 'P13', NULL, NULL, NULL, NULL, NULL, NULL),
(1137, 'N', 'P14', NULL, NULL, NULL, NULL, NULL, NULL),
(1138, 'N', 'P15', NULL, NULL, NULL, NULL, NULL, NULL),
(1139, 'N', 'P16', NULL, NULL, NULL, NULL, NULL, NULL),
(1140, 'N', 'P17', NULL, NULL, NULL, NULL, NULL, NULL),
(1141, 'N', 'P18', NULL, NULL, NULL, NULL, NULL, NULL),
(1142, 'N', 'P19', NULL, NULL, NULL, NULL, NULL, NULL),
(1143, 'N', 'P20', NULL, NULL, NULL, NULL, NULL, NULL),
(1144, 'N', 'P21', NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'N', 'P22', NULL, NULL, NULL, NULL, NULL, NULL),
(1146, 'N', 'P23', NULL, NULL, NULL, NULL, NULL, NULL),
(1147, 'N', 'P24', NULL, NULL, NULL, NULL, NULL, NULL),
(1148, 'N', 'P25', NULL, NULL, NULL, NULL, NULL, NULL),
(1149, 'N', 'P26', NULL, NULL, NULL, NULL, NULL, NULL),
(1150, 'N', 'P27', NULL, NULL, NULL, NULL, NULL, NULL),
(1151, 'N', 'P28', NULL, NULL, NULL, NULL, NULL, NULL),
(1152, 'N', 'P29', NULL, NULL, NULL, NULL, NULL, NULL),
(1153, 'N', 'P30', NULL, NULL, NULL, NULL, NULL, NULL),
(1154, 'N', 'P31', NULL, NULL, NULL, NULL, NULL, NULL),
(1155, 'N', 'P32', NULL, NULL, NULL, NULL, NULL, NULL),
(1156, 'N', 'Q10', NULL, NULL, NULL, NULL, NULL, NULL),
(1157, 'N', 'Q11', NULL, NULL, NULL, NULL, NULL, NULL),
(1158, 'N', 'Q12', NULL, NULL, NULL, NULL, NULL, NULL),
(1159, 'N', 'Q13', NULL, NULL, NULL, NULL, NULL, NULL),
(1160, 'N', 'Q14', NULL, NULL, NULL, NULL, NULL, NULL),
(1161, 'N', 'Q15', NULL, NULL, NULL, NULL, NULL, NULL),
(1162, 'N', 'Q17', NULL, NULL, NULL, NULL, NULL, NULL),
(1163, 'N', 'Q18', NULL, NULL, NULL, NULL, NULL, NULL),
(1164, 'N', 'Q19', NULL, NULL, NULL, NULL, NULL, NULL),
(1165, 'N', 'Q20', NULL, NULL, NULL, NULL, NULL, NULL),
(1166, 'N', 'Q21', NULL, NULL, NULL, NULL, NULL, NULL),
(1167, 'N', 'Q22', NULL, NULL, NULL, NULL, NULL, NULL),
(1168, 'N', 'Q23', NULL, NULL, NULL, NULL, NULL, NULL),
(1169, 'N', 'Q24', NULL, NULL, NULL, NULL, NULL, NULL),
(1170, 'N', 'Q25', NULL, NULL, NULL, NULL, NULL, NULL),
(1171, 'N', 'Q26', NULL, NULL, NULL, NULL, NULL, NULL),
(1172, 'N', 'Q27', NULL, NULL, NULL, NULL, NULL, NULL),
(1173, 'N', 'Q28', NULL, NULL, NULL, NULL, NULL, NULL),
(1174, 'N', 'Q29', NULL, NULL, NULL, NULL, NULL, NULL),
(1175, 'N', 'Q30', NULL, NULL, NULL, NULL, NULL, NULL),
(1176, 'N', 'Q31', NULL, NULL, NULL, NULL, NULL, NULL),
(1177, 'N', 'R17', NULL, NULL, NULL, NULL, NULL, NULL),
(1178, 'N', 'R18', NULL, NULL, NULL, NULL, NULL, NULL),
(1179, 'N', 'R19', NULL, NULL, NULL, NULL, NULL, NULL),
(1180, 'N', 'R20', NULL, NULL, NULL, NULL, NULL, NULL),
(1181, 'N', 'R21', NULL, NULL, NULL, NULL, NULL, NULL),
(1182, 'N', 'R22', NULL, NULL, NULL, NULL, NULL, NULL),
(1183, 'N', 'R23', NULL, NULL, NULL, NULL, NULL, NULL),
(1184, 'N', 'R24', NULL, NULL, NULL, NULL, NULL, NULL),
(1185, 'N', 'R25', NULL, NULL, NULL, NULL, NULL, NULL),
(1186, 'N', 'R26', NULL, NULL, NULL, NULL, NULL, NULL),
(1187, 'N', 'R27', NULL, NULL, NULL, NULL, NULL, NULL),
(1188, 'N', 'R28', NULL, NULL, NULL, NULL, NULL, NULL),
(1189, 'N', 'R29', NULL, NULL, NULL, NULL, NULL, NULL),
(1190, 'N', 'S23', NULL, NULL, NULL, NULL, NULL, NULL),
(1191, 'N', 'S24', NULL, NULL, NULL, NULL, NULL, NULL),
(1192, 'N', 'S25', NULL, NULL, NULL, NULL, NULL, NULL),
(1193, 'N', 'S26', NULL, NULL, NULL, NULL, NULL, NULL),
(1194, 'N', 'S27', NULL, NULL, NULL, NULL, NULL, NULL),
(1195, 'N', 'S28', NULL, NULL, NULL, NULL, NULL, NULL),
(1196, 'N', 'S29', NULL, NULL, NULL, NULL, NULL, NULL),
(1197, 'N', 'T17', NULL, NULL, NULL, NULL, NULL, NULL),
(1198, 'PLASMA PELAWAN INDAH', 'I08P', NULL, NULL, NULL, NULL, NULL, NULL),
(1199, 'PLASMA PELAWAN INDAH', 'I09P', NULL, NULL, NULL, NULL, NULL, NULL),
(1200, 'PLASMA PELAWAN INDAH', 'I10P', NULL, NULL, NULL, NULL, NULL, NULL),
(1201, 'PLASMA PELAWAN INDAH', 'I11P', NULL, NULL, NULL, NULL, NULL, NULL),
(1202, 'PLASMA PELAWAN INDAH', 'I12P', NULL, NULL, NULL, NULL, NULL, NULL),
(1203, 'PLASMA PELAWAN INDAH', 'I13P', NULL, NULL, NULL, NULL, NULL, NULL),
(1204, 'PLASMA PELAWAN INDAH', 'J08P', NULL, NULL, NULL, NULL, NULL, NULL),
(1205, 'PLASMA TEPIAN TERAP LESTARI', 'J24', NULL, NULL, NULL, NULL, NULL, NULL),
(1206, 'PLASMA TEPIAN TERAP LESTARI', 'K19', NULL, NULL, NULL, NULL, NULL, NULL),
(1207, 'PLASMA TEPIAN TERAP LESTARI', 'K20', NULL, NULL, NULL, NULL, NULL, NULL),
(1208, 'PLASMA TEPIAN TERAP LESTARI', 'K21', NULL, NULL, NULL, NULL, NULL, NULL),
(1209, 'PLASMA TEPIAN TERAP LESTARI', 'K22', NULL, NULL, NULL, NULL, NULL, NULL),
(1210, 'PLASMA TEPIAN TERAP LESTARI', 'K23', NULL, NULL, NULL, NULL, NULL, NULL),
(1211, 'PLASMA TEPIAN TERAP LESTARI', 'K24', NULL, NULL, NULL, NULL, NULL, NULL),
(1212, 'PLASMA TEPIAN TERAP LESTARI', 'K25', NULL, NULL, NULL, NULL, NULL, NULL),
(1213, 'PLASMA TEPIAN TERAP LESTARI', 'L17', NULL, NULL, NULL, NULL, NULL, NULL),
(1214, 'PLASMA TEPIAN TERAP LESTARI', 'L18', NULL, NULL, NULL, NULL, NULL, NULL),
(1215, 'PLASMA TEPIAN TERAP LESTARI', 'L19', NULL, NULL, NULL, NULL, NULL, NULL),
(1216, 'PLASMA TEPIAN TERAP LESTARI', 'M01', NULL, NULL, NULL, NULL, NULL, NULL),
(1217, 'PLASMA TEPIAN TERAP LESTARI', 'N01', NULL, NULL, NULL, NULL, NULL, NULL),
(1218, 'PLASMA TEPIAN TERAP LESTARI', 'O01', NULL, NULL, NULL, NULL, NULL, NULL),
(1219, 'PLASMA TEPIAN TERAP LESTARI', 'O02', NULL, NULL, NULL, NULL, NULL, NULL),
(1220, 'PLASMA TUNAS HARAPAN JAYA', 'G08', NULL, NULL, NULL, NULL, NULL, NULL),
(1221, 'PLASMA TUNAS HARAPAN JAYA', 'G09', NULL, NULL, NULL, NULL, NULL, NULL),
(1222, 'PLASMA TUNAS HARAPAN JAYA', 'G10', NULL, NULL, NULL, NULL, NULL, NULL),
(1223, 'PLASMA TUNAS HARAPAN JAYA', 'G11', NULL, NULL, NULL, NULL, NULL, NULL),
(1224, 'PLASMA TUNAS HARAPAN JAYA', 'G12', NULL, NULL, NULL, NULL, NULL, NULL),
(1225, 'PLASMA TUNAS HARAPAN JAYA', 'G13', NULL, NULL, NULL, NULL, NULL, NULL),
(1226, 'PLASMA TUNAS HARAPAN JAYA', 'H08', NULL, NULL, NULL, NULL, NULL, NULL),
(1227, 'PLASMA TUNAS HARAPAN JAYA', 'H09', NULL, NULL, NULL, NULL, NULL, NULL),
(1228, 'PLASMA TUNAS HARAPAN JAYA', 'H10', NULL, NULL, NULL, NULL, NULL, NULL),
(1229, 'PLASMA TUNAS HARAPAN JAYA', 'H11', NULL, NULL, NULL, NULL, NULL, NULL),
(1230, 'PLASMA TUNAS HARAPAN JAYA', 'H12', NULL, NULL, NULL, NULL, NULL, NULL),
(1231, 'PLASMA TUNAS HARAPAN JAYA', 'H13', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_07_154043_create_personal_access_tokens_table', 1),
(5, '2025_12_09_113547_create_lokasis_table', 1),
(6, '2025_12_09_113812_create_skorings_table', 1),
(7, '2025_12_09_114202_create_karyawans_table', 1),
(8, '2025_12_09_114304_create_monitoring_harians_table', 1),
(9, '2025_12_09_114626_create_monitoring_mingguans_table', 1),
(11, '2025_12_11_133058_create_skoring_harians_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_harian`
--

CREATE TABLE `monitoring_harian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `id_karyawan` bigint(20) UNSIGNED DEFAULT NULL,
  `lat_aktual` decimal(10,8) DEFAULT NULL COMMENT 'Lokasi GPS HP Petugas',
  `long_aktual` decimal(11,8) DEFAULT NULL,
  `tipe_objek` enum('Parit','Genangan','Siltpit/Rorak') NOT NULL,
  `nomor_jalur` varchar(10) DEFAULT NULL,
  `kedalaman_cm` int(11) DEFAULT NULL,
  `jumlah_pokok` int(11) DEFAULT NULL,
  `durasi_genangan` varchar(50) DEFAULT NULL,
  `kondisi_aliran` varchar(50) DEFAULT NULL,
  `penyebab` varchar(50) DEFAULT NULL,
  `tindakan` varchar(255) DEFAULT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `foto_after` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `skor_kedalaman` int(11) DEFAULT 0,
  `skor_jumlah_pokok` int(11) DEFAULT 0,
  `skor_durasi` int(11) DEFAULT 0,
  `skor_aliran` int(11) DEFAULT 0,
  `skor_penyebab` int(11) DEFAULT 0,
  `skor_tindakan` int(11) DEFAULT 0,
  `rata_rata_skor` decimal(5,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `monitoring_harian`
--

INSERT INTO `monitoring_harian` (`id`, `tanggal`, `id_lokasi`, `id_karyawan`, `lat_aktual`, `long_aktual`, `tipe_objek`, `nomor_jalur`, `kedalaman_cm`, `jumlah_pokok`, `durasi_genangan`, `kondisi_aliran`, `penyebab`, `tindakan`, `foto_path`, `foto_after`, `keterangan`, `skor_kedalaman`, `skor_jumlah_pokok`, `skor_durasi`, `skor_aliran`, `skor_penyebab`, `skor_tindakan`, `rata_rata_skor`, `created_at`, `updated_at`) VALUES
(17, '2025-12-12', 827, 1, NULL, NULL, 'Parit', '12', 30, 10, '1', 'Mengalir Sedikit', 'Daun/Sampah', 'Eskalasi', NULL, NULL, NULL, 1, 0, 0, 2, 2, 1, 1.50, '2025-12-11 23:31:09', '2025-12-11 23:31:09'),
(18, '2025-12-12', 827, 1, NULL, NULL, 'Genangan', '2', 12, 4, '1', 'Lancar', 'Areal Rendahan', 'Bersih', NULL, NULL, NULL, 2, 3, 3, 3, 1, 3, 2.50, '2025-12-12 01:32:45', '2025-12-12 01:32:45'),
(19, '2025-12-12', 827, 1, NULL, NULL, 'Parit', '2', 10, 1, '1', 'Lancar', 'Daun/Sampah', 'Bersih', NULL, NULL, NULL, 1, 0, 0, 3, 2, 3, 2.25, '2025-12-12 01:33:45', '2025-12-12 01:33:45'),
(20, '2025-12-12', 827, 1, NULL, NULL, 'Parit', '3', 10, 5, '1', 'Lancar', 'Daun/Sampah', 'Eksekusi', 'monitoring/hp7jKp7llmV2zonFacdK7MZoIZ4zQNmE3QkvmzYU.png', 'monitoring/QeusyWyXTgR6TXJGC6GoTwopdE6HASfzECRUiWjl.png', NULL, 1, 0, 0, 3, 2, 2, 2.00, '2025-12-12 02:27:38', '2025-12-12 02:27:38'),
(21, '2025-12-12', 874, 3, 1.23991204, 117.84954655, 'Genangan', '15', 60, 3, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/RcZjoEV3Cc8H5Tj8W3CBFeXV8SZq6PNOhwjFjG9X.jpg', 'monitoring/d5JlEShRK6DH262ok31PKGTOOEx8figNVlrv1Kip.jpg', NULL, 1, 3, 3, 1, 1, 2, 1.83, '2025-12-12 16:06:33', '2025-12-12 16:06:33'),
(22, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '12', 16, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/GBA9Y13SO9H2uzyQErVya4GRA60CohqEzLaXeoLM.jpg', 'monitoring/D4rqbKSh26SSO5SieSvGr8endSiSVRMBpJ4cIb3h.jpg', NULL, 1, 3, 3, 1, 1, 2, 1.83, '2025-12-13 19:48:43', '2025-12-13 19:48:43'),
(23, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '14', 17, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/B5rmW1UN4AFH1egwBm1CZPXloXsv82OQcPV7p4i7.jpg', 'monitoring/XetHNMUtV20Jpzx2Wkjz5RnyAHpbRJEYWrtOZe1L.jpg', NULL, 1, 3, 3, 1, 1, 2, 1.83, '2025-12-13 19:49:57', '2025-12-13 19:49:57'),
(24, '2025-12-01', 890, 6, NULL, NULL, 'Parit', '14', 9, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/ZA8NIoiFXmbvyiXrCYpqillKGdrV5wRD9w964AvB.jpg', 'monitoring/sDiTdDekHHo3BD98Nyc7U59wCjsTmplL7vVq3HOB.jpg', NULL, 1, 0, 0, 1, 1, 2, 1.25, '2025-12-13 19:51:38', '2025-12-13 19:51:38'),
(25, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '16', 15, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/TFouYIjVoZyqSgN05eeIfN1FB3vNvpQ4768rsFDx.jpg', 'monitoring/23vn7a5YIAzvBLZqw2nFEA7VINSkKH0oNP7Rivee.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-13 19:52:37', '2025-12-13 19:52:37'),
(26, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '20', 17, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/vlnFxO5RWgFyWg3JWice3gMq4PexyQonH6imTCSm.jpg', 'monitoring/m43uTWpAME5s9KQbBDS9glB6X008oUVK2WHlnnfT.jpg', NULL, 1, 3, 3, 1, 1, 2, 1.83, '2025-12-13 20:19:52', '2025-12-13 20:19:52'),
(27, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '20', 10, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', NULL, NULL, NULL, NULL, 2, 3, 3, 1, 1, 0, 2.00, '2025-12-13 20:21:15', '2025-12-13 20:21:15'),
(28, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '27', 8, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', NULL, NULL, NULL, NULL, 2, 3, 3, 1, 1, 0, 2.00, '2025-12-13 20:22:29', '2025-12-13 20:22:29'),
(29, '2025-12-01', 890, 6, NULL, NULL, 'Genangan', '30', 7, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', NULL, NULL, NULL, NULL, 2, 3, 3, 1, 1, 0, 2.00, '2025-12-13 20:23:05', '2025-12-13 20:23:05'),
(30, '2025-12-14', 890, 6, NULL, NULL, 'Genangan', '36', 2, 3, '2', 'Tidak Mengalir', 'Areal Rendahan', NULL, NULL, NULL, NULL, 3, 3, 3, 1, 1, 0, 2.20, '2025-12-13 20:24:14', '2025-12-13 20:24:14'),
(31, '2025-12-14', 890, 6, NULL, NULL, 'Parit', '5', 63, 1, '3', 'Mengalir Sedikit', 'Bersih', 'Bersih', NULL, NULL, NULL, 2, 0, 0, 2, 3, 3, 2.50, '2025-12-13 20:24:54', '2025-12-13 20:24:54'),
(32, '2025-12-14', 890, 6, NULL, NULL, 'Genangan', '6', 2, 1, '1', 'Mengalir Sedikit', 'Bersih', 'Bersih', NULL, NULL, NULL, 3, 3, 3, 2, 0, 3, 2.80, '2025-12-13 20:25:39', '2025-12-13 20:25:39'),
(33, '2025-12-13', 873, 6, NULL, NULL, 'Parit', '2', 11, 2, '3', 'Lancar', 'Bersih', 'Bersih', 'monitoring/XWhfCvJmzmWOs65fK8IAFtACcMamyj809J3acC6L.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-13 21:46:37', '2025-12-13 21:46:37'),
(34, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '3', 5, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/ZkG6fueeN6j41aqVp1eeW4VDZ2sN426xskjPNcWd.jpg', 'monitoring/eZweeblLdm8e4HwBjnNG7eHW9jv0BzO4ZiQVTxTD.jpg', NULL, 3, 2, 3, 1, 1, 2, 2.00, '2025-12-13 21:49:44', '2025-12-13 21:49:44'),
(35, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '4', 8, 10, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/7WtcVc9TefcpxlmfBsMX9Dc7PstlqNix4OAvAQ3I.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-13 21:51:17', '2025-12-13 21:51:17'),
(37, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '5', 7, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/nJUY4CAlX52IDUHhdZ0psZCbs9DIuEIJmAk5NMmz.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-13 21:57:50', '2025-12-13 21:57:50'),
(38, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '7', 5, 5, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/6Mu5Mg9N56HKiW9W2DT1QtKeJG6lhHJ6cD5558cd.jpg', 'monitoring/X40nip92YzoIYxHllzByqlPO3K0J7HYsgpyVDkKg.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-13 21:59:34', '2025-12-13 21:59:34'),
(39, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '11', 10, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/jA9vclpPAW9bpQRlNWFhO2pSFnK1arFG3ihM5vDd.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-13 22:01:01', '2025-12-13 22:01:01'),
(40, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '13', 10, 11, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/bMDhfpcWF44ycXscUeSpcYakWdrOWsHDZKwlKwrf.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-13 22:03:19', '2025-12-13 22:03:19'),
(41, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '14', 32, 13, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/8X54V57fCTJMl2txVogClPNNXmMARyWa6IN4MUew.jpg', NULL, NULL, 1, 2, 3, 1, 1, 1, 1.50, '2025-12-13 22:32:55', '2025-12-13 22:32:55'),
(42, '2025-12-13', 874, 6, NULL, NULL, 'Parit', '18', 42, 8, '3', 'Lancar', 'Bersih', 'Bersih', 'monitoring/4FZSbjEK1UBMLvTvIHNqfyCA9mt8gdtGKABudY9W.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-13 22:34:36', '2025-12-13 22:34:36'),
(43, '2025-12-13', 874, 6, NULL, NULL, 'Parit', '20', 36, 2, '3', 'Tidak Mengalir', 'Daun/Sampah', 'Eskalasi', 'monitoring/TeSMlHogPCUOSYX5Br61Kd8IGKnNZPPEkAoOnDbt.jpg', NULL, NULL, 1, 0, 0, 1, 2, 1, 1.25, '2025-12-13 22:35:55', '2025-12-13 22:35:55'),
(44, '2025-12-13', 874, 6, NULL, NULL, 'Genangan', '7', 6, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/gp8gVRL4aFHvu7zOnyFiaKnZ29XoDxWLv0yxcpzq.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-13 22:46:14', '2025-12-13 22:46:14'),
(45, '2025-12-15', 829, 2, -6.22939030, 106.82504380, 'Parit', '12', 15, 5, '2', 'Mengalir Sedikit', 'Daun/Sampah', 'Eksekusi', 'monitoring/th5kYxEmecGUwba0YMwZVW7qFJ36XNj52iYo3Odz.jpg', 'monitoring/zJyDsjWGV8AxrtiZsluw9xQMwsuF8tHY5n7wWMwE.jpg', NULL, 1, 0, 0, 2, 2, 2, 1.75, '2025-12-14 17:49:11', '2025-12-14 17:49:11'),
(46, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '6', 3, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/qulwMpoGYhOrhvX6l9zW5KaBbxfc6p97sZT7LElg.jpg', 'monitoring/NnuFvk9JitwthmD106thOBCqi22uMUlAOKoN2jTg.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-15 07:55:07', '2025-12-15 07:55:07'),
(47, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '6', 12, 5, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/hxgmNvluBco30uDwZSSj3u0L6TfS4DIGWUdmuEh8.jpg', 'monitoring/4EeDQrba8vuhfJMgvGRWBx11kO3vcIy5q4UePNuK.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-15 07:55:50', '2025-12-15 07:55:50'),
(48, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '7', 2, 5, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Bersih', 'monitoring/T1viEPAiE6rCNBgzftyIgNkXNQlvGwfIara81v6m.jpg', NULL, NULL, 3, 3, 3, 1, 1, 3, 2.33, '2025-12-15 07:57:17', '2025-12-15 07:57:17'),
(49, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '8', 11, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/RXkianDhArsGBr4RB5e0qEZh6bRFnQL6upzi8xVl.jpg', 'monitoring/tydMqFpbwspLviWGMPn4YiZgMdA6EseytRMLwQfe.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-15 07:58:28', '2025-12-15 07:58:28'),
(50, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '10', 2, 2, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/XIntz50pr85rGj255jGEjdmx3XLVNjhD9gtZYGTB.jpg', 'monitoring/sba4NY7B4VuagfYY9FKYL55AgI6JFqfTh5oFOTXK.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-15 07:59:25', '2025-12-15 07:59:25'),
(51, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '11', 5, 4, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/EaoTkelCBekpEGZQJQ29VgdBI0WGuepN1t0ut2tm.jpg', 'monitoring/etHnNHHJ3pPP1Avqcmdo88SMlQ2KPnQVdgQHepeH.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-15 08:00:09', '2025-12-15 08:00:09'),
(52, '2025-12-15', 881, 6, NULL, NULL, 'Parit', '21', 10, 1, '1', 'Mengalir Sedikit', 'Daun/Sampah', 'Bersih', 'monitoring/BSwJZoiNDiP465joh3QKSzwwD6ngz0BDa28haJPw.jpg', NULL, NULL, 1, 0, 0, 2, 2, 3, 2.00, '2025-12-15 08:05:04', '2025-12-15 08:05:04'),
(53, '2025-12-15', 881, 6, NULL, NULL, 'Parit', '17', 10, 1, '1', 'Mengalir Sedikit', 'Daun/Sampah', 'Bersih', 'monitoring/tvPw6OH16NnCwAS24kMNsD8yAVaxd47ROoLr9nKM.jpg', NULL, NULL, 1, 0, 0, 2, 2, 3, 2.00, '2025-12-15 08:05:43', '2025-12-15 08:05:43'),
(54, '2025-12-15', 881, 6, NULL, NULL, 'Genangan', '19', 5, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/6ZBQSlE9wd8suFNJpsNtnK9mC3d1r2KaMUqxeDXu.jpg', 'monitoring/MaSxuWwBEXQRol6LauFpTOX6EUJPBkI7SBuJiY39.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-15 08:06:54', '2025-12-15 08:06:54'),
(55, '2025-12-16', 881, 6, NULL, NULL, 'Genangan', '13', 23, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/RSPZIJWpGdXu5109BWaupW48VgGRKNTozeg3Hbui.jpg', 'monitoring/XFl8sg8n9PvXBnlXXaFay18ou86dKoF9SIwnRbYZ.jpg', NULL, 1, 3, 3, 1, 1, 2, 1.83, '2025-12-16 06:44:17', '2025-12-16 06:44:17'),
(56, '2025-12-16', 881, 6, NULL, NULL, 'Genangan', '22', 7, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/RCVYFeGSsc0RfReex3jD6mE49niVzu20MWs4jBUb.jpg', 'monitoring/iUL7RDmVpVcTG18wosDSULzebiWKg89mqFLcd8VP.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-16 06:47:06', '2025-12-16 06:47:06'),
(57, '2025-12-16', 881, 6, NULL, NULL, 'Parit', '22', 10, 3, '1', 'Lancar', 'Bersih', 'Bersih', 'monitoring/jzjHQ1x62UK2vPBk1zTITf8eXVr2GR0w9NYJWLmy.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-16 06:49:39', '2025-12-16 06:49:39'),
(58, '2025-12-16', 881, 6, NULL, NULL, 'Genangan', '23', 4, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/wis6IlTxuG54M89zVrkafftFWeuHmso2BUdjxdMu.jpg', NULL, NULL, 3, 2, 3, 1, 1, 1, 1.83, '2025-12-16 06:50:47', '2025-12-16 06:50:47'),
(59, '2025-12-16', 881, 6, NULL, NULL, 'Parit', '9', 37, 1, '1', 'Lancar', 'Bersih', 'Bersih', 'monitoring/YbrgxA5J8iFHkU88NQ9d5l797G3SV4JTYADRrYpf.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-16 06:52:39', '2025-12-16 06:52:39'),
(60, '2025-12-16', 881, 6, NULL, NULL, 'Genangan', '1', 3, 4, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Bersih', 'monitoring/IJ3gWdoTDLwXQbgHxS5ZWKEOUQn8wU68krlCSL98.jpg', NULL, NULL, 3, 3, 3, 1, 1, 3, 2.33, '2025-12-16 06:53:51', '2025-12-16 06:53:51'),
(61, '2025-12-16', 881, 6, NULL, NULL, 'Genangan', '1', 8, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/gk6lwT6jPIyXI36XDqp6detSEaEiTwCHF7R0ZblU.jpg', 'monitoring/aw35vSFRelZpy6AzvLblTP7Yns6cnhdeqCc0hlME.jpg', NULL, 2, 2, 3, 1, 1, 2, 1.83, '2025-12-16 06:55:18', '2025-12-16 06:55:18'),
(62, '2025-12-16', 882, 6, NULL, NULL, 'Genangan', '3', 3, 4, '2', 'Mengalir Sedikit', 'Areal Rendahan', 'Eksekusi', 'monitoring/obn6GrHeKj4X4cALG2nbDhArltWWIoWIQUmiLESq.jpg', 'monitoring/MJ4BdV3piOh9rub4PBclQYRm8mv32qy5TlwH6F1O.jpg', NULL, 3, 3, 3, 2, 1, 2, 2.33, '2025-12-16 06:56:52', '2025-12-16 06:56:52'),
(63, '2025-12-18', 880, 6, NULL, NULL, 'Genangan', '3', 5, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/D4wuFu0ztGOAEynwFUq0rBlAAgc2dhn8Yry1D3Q2.jpg', 'monitoring/zT4MaBcTdxDOUx0Q48RnMDLhTY8U7SCDjGzWefs8.jpg', NULL, 3, 2, 3, 1, 1, 2, 2.00, '2025-12-18 03:59:10', '2025-12-18 03:59:10'),
(64, '2025-12-18', 880, 6, NULL, NULL, 'Parit', '2', 126, 5, '1', 'Lancar', 'Bersih', 'Bersih', 'monitoring/NwXSJpNCxSO3x8bKQeCXGQd5OpROtAprU1aZqnjN.jpg', NULL, NULL, 2, 0, 0, 3, 3, 3, 2.75, '2025-12-18 04:01:27', '2025-12-18 04:01:27'),
(65, '2025-12-18', 880, 6, NULL, NULL, 'Genangan', '5', 9, 11, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/buZBANRBXJvRL3rAtyBnYWUdownFqGdPmjaqBtbR.jpg', NULL, 'Perlu alat berat karena terlalu jauh ke parit', 2, 2, 3, 1, 1, 1, 1.67, '2025-12-18 04:04:10', '2025-12-18 04:04:10'),
(86, '2025-12-22', 892, 6, 1.23222222, 117.84305560, 'Genangan', '24', 9, 1, '3', 'Mengalir Sedikit', 'Areal Rendahan', 'Eksekusi', 'monitoring/pHMkYzTs6TgVeka1mp9m3r6y7VCJ52O4eE3Yt2nN.jpg', 'monitoring/jfqJJyDnGNfMgVrUfGcQt4RRB6wKnIPLQoW1mkDh.jpg', NULL, 2, 3, 3, 2, 1, 2, 2.17, '2025-12-22 23:28:05', '2025-12-22 23:28:05'),
(87, '2025-12-22', 892, 6, 1.23222222, 117.84166670, 'Parit', '6', 76, 1, '3', 'Mengalir Sedikit', 'Areal Rendahan', 'Eksekusi', 'monitoring/pupH8wY894UsHDI6fJbELEVRI7JI3UGsxT1EJAzZ.jpg', 'monitoring/QwRYbXoe3Jn5X7k1OHwI2JtmDp6ugRCOm7Er0ukW.jpg', NULL, 2, 0, 0, 2, 1, 2, 1.75, '2025-12-22 23:34:55', '2025-12-22 23:34:55'),
(88, '2025-12-22', 892, 6, 1.23166667, 117.84333330, 'Genangan', '26', 11, 4, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/694AesXmNjNHd5I3ixNJIHlTERNXbEKxtBPUtlyU.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-22 23:37:57', '2025-12-22 23:37:57'),
(89, '2025-12-22', 892, 6, 1.23194444, 117.84333330, 'Genangan', '50', 15, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/e4tInYh6TcSbvnjTysHdSrxmU4EgXRyIm2vknh0g.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-22 23:41:30', '2025-12-22 23:41:30'),
(90, '2025-12-22', 892, 6, 1.23166667, 117.84388890, 'Genangan', '39', 11, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/358sMXx6UGoQmwcY6QkEHjGxloBJWRFPd5wM9fOT.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-22 23:46:02', '2025-12-22 23:46:02'),
(91, '2025-12-22', 892, 6, 1.23166667, 117.84500000, 'Genangan', '40', 8, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/6WWDPuomKWdkFr7d29EfOM11bwQjcyULZ5h15GKt.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-22 23:49:53', '2025-12-22 23:49:53'),
(92, '2025-12-22', 892, 6, 1.23166667, 117.84527780, 'Genangan', '42', 6, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/WYwpMSz8cvCQtlexJfrlPwGNFXD8rF2wt7B51Oir.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-22 23:53:40', '2025-12-22 23:53:40'),
(93, '2025-12-22', 892, 6, 1.23138889, 117.84611110, 'Genangan', '43', 8, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/sdOMQLMnf0XLDLyVgKmTzXOlGf8UkTtkT4XdLX86.jpg', 'monitoring/6Y1Fm5UNrEVVJyZ7vr5ScX5TUcTvlCtzOuzroYMt.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-22 23:58:58', '2025-12-22 23:58:58'),
(94, '2025-12-22', 892, 6, 1.23166667, 117.84611110, 'Genangan', '44', 5, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/2ohQPyErGDPh6nbjYH0d112hqRlE8byujzs5e9yu.jpg', 'monitoring/t8jU9ijQxBvp2GfX6U6H57iwGbOLQWTYhIpIsnem.jpg', NULL, 3, 3, 3, 1, 1, 2, 2.17, '2025-12-23 00:04:23', '2025-12-23 00:04:23'),
(95, '2025-12-22', 892, 6, 1.23166667, 117.84638890, 'Genangan', '45', 2, 1, '1', 'Tidak Mengalir', 'Areal Rendahan', 'Bersih', 'monitoring/n9HJ3PknrBPGohDNMvOHsK3OWkRltajM1GJ7Ct4f.jpg', NULL, NULL, 3, 3, 3, 1, 1, 3, 2.33, '2025-12-23 00:06:30', '2025-12-23 00:06:30'),
(96, '2025-12-22', 892, 6, 1.23166667, 117.84638890, 'Genangan', '45', 8, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/8Z7OIio6HNSakPNCtMHfVTmZ2IBUA3Vpc3De6PWJ.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 00:08:33', '2025-12-23 00:08:33'),
(97, '2025-12-22', 892, 6, 1.23194444, 117.84666670, 'Parit', '47', 5, 1, '3', 'Mengalir Sedikit', 'Bersih', 'Bersih', 'monitoring/aiZycI7k0CYZ3qwiyiXoHe7tXSpgqoYEGLFzTDUS.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2025-12-23 00:10:20', '2025-12-23 00:10:20'),
(98, '2025-12-22', 891, 6, 1.23222222, 117.84722220, 'Parit', '50', 100, 1, '1', 'Mengalir Sedikit', 'Bersih', 'Bersih', 'monitoring/NSygO5mjwrcDLlXVgJm3iiE3Ihaw4YSmXroaw7h5.jpg', NULL, NULL, 3, 0, 0, 2, 3, 3, 2.75, '2025-12-23 00:12:27', '2025-12-23 00:12:27'),
(99, '2025-12-22', 891, 6, 1.23194444, 117.84638890, 'Genangan', '43', 6, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/rKU1SaSZUJqTywfnq76yPKOGl4MyHcsOso2oSp70.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 00:14:49', '2025-12-23 00:14:49'),
(100, '2025-12-22', 891, 6, 1.23250000, 117.84638890, 'Genangan', '41', 10, 3, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/Ad4gDZH4U7a6KYnEGDyYNOx4oPQerVK3waXyfenR.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 00:16:21', '2025-12-23 00:16:21'),
(101, '2025-12-23', 891, 6, 1.23222222, 117.84027780, 'Parit', '1', 5, 1, '3', 'Lancar', 'Bersih', 'Bersih', 'monitoring/sOx6oqPZhNva9LskHQDLh228NSvADUtQnz6vIQdZ.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-23 07:29:00', '2025-12-23 07:29:00'),
(102, '2025-12-23', 891, 6, 1.23222222, 117.84111110, 'Parit', '4', 63, 2, '3', 'Lancar', 'Bersih', 'Bersih', 'monitoring/bnrkgGczJCBmEjJa8o7loCkECwoi3ASrJG4kIEOM.jpg', NULL, NULL, 2, 0, 0, 3, 3, 3, 2.75, '2025-12-23 07:30:52', '2025-12-23 07:30:52'),
(103, '2025-12-23', 891, 6, 1.23222222, 117.84194440, 'Genangan', '10', 7, 2, '3', 'Tidak Mengalir', 'Lain-lain', 'Eskalasi', 'monitoring/oGRjJaVFXspPK4ZiFEGOdLwKOvVYwEUfZDzGVb2l.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 07:32:57', '2025-12-23 07:32:57'),
(104, '2025-12-23', 891, 6, 1.23222222, 117.84222220, 'Genangan', '11', 10, 3, '3', 'Tidak Mengalir', 'Lain-lain', 'Eskalasi', 'monitoring/BznEz8OGaj3NQ4gIUiISZS6p3zvktmQlWCMmJkAi.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 07:35:46', '2025-12-23 07:35:46'),
(105, '2025-12-23', 891, 6, 1.23222222, 117.84222220, 'Genangan', '12', 18, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/GASI0aQirwcVP5zl5LoPUUAueCduOUabEnqWSqfH.jpg', NULL, NULL, 1, 2, 3, 1, 1, 1, 1.50, '2025-12-23 07:39:52', '2025-12-23 07:39:52'),
(106, '2025-12-23', 891, 6, 1.23222222, 117.84222220, 'Genangan', '12', 9, 4, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/5DCEmHbLTubjZvU94PM4RS32eXvUNQeRDkkmULr7.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 07:41:44', '2025-12-23 07:41:44'),
(107, '2025-12-23', 891, 6, 1.23277778, 117.84250000, 'Genangan', '12', 23, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/2608fjxBs6GqVMy2OUHETTNMx4I9d1W8IppiPwFj.jpg', NULL, NULL, 1, 2, 3, 1, 1, 1, 1.50, '2025-12-23 07:43:58', '2025-12-23 07:43:58'),
(108, '2025-12-23', 891, 6, 1.23305556, 117.84277780, 'Genangan', '12', 15, 18, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/sbzCK8tc70SDpkZ6XbCYLEcLriSjENnI9oPfl1Hn.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-23 07:50:34', '2025-12-23 07:50:34'),
(109, '2025-12-23', 891, 6, 1.23333333, 117.84277780, 'Genangan', '14', 7, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/HCmuxK3wt8UI9sWCKu21FO14UB9nCPOE8zCkUN12.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 07:53:03', '2025-12-23 07:53:03'),
(110, '2025-12-23', 891, 6, 1.23361111, 117.84277780, 'Genangan', '14', 13, 10, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/a8CfriKrarI4N9svgzHvVpglYNfWTW4Br9JToGDj.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-23 09:03:01', '2025-12-23 09:03:01'),
(111, '2025-12-23', 891, 6, 1.23305556, 117.85361110, 'Parit', '15', 6, 1, '1', 'Mengalir Sedikit', 'Bersih', 'Bersih', 'monitoring/vzFMxJN39Opw2T3EhXU9KYCFk97V50ptfJ1cUdRP.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2025-12-23 09:05:30', '2025-12-23 09:05:30'),
(112, '2025-12-23', 891, 6, 1.23333333, 117.84250000, 'Genangan', '18', 18, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/hrvQtS9cQmFrDA6IYVmPMCmgJm9YeHNX8ikN0qjf.jpg', NULL, NULL, 1, 2, 3, 1, 1, 1, 1.50, '2025-12-23 09:07:05', '2025-12-23 09:07:05'),
(113, '2025-12-23', 899, 6, 1.23361111, 117.84194440, 'Genangan', '1', 14, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/xgXGplgCbUGZOByGahOiuefzsa2dOvg8RL8LFfpU.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-23 09:10:51', '2025-12-23 09:10:51'),
(114, '2025-12-23', 899, 6, 1.23250000, 117.85722220, 'Genangan', '2', 19, 1, '3', 'Mengalir Sedikit', 'Areal Rendahan', 'Eskalasi', 'monitoring/cDQWtBwwpRy6F2g7KCSk6ighhQTMQwJJmQ6WkcxY.jpg', NULL, NULL, 1, 3, 3, 2, 1, 1, 1.83, '2025-12-23 09:12:28', '2025-12-23 09:12:28'),
(115, '2025-12-23', 899, 6, 1.23222222, 117.85777780, 'Genangan', '3', 6, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/fCktjRaSOdNw3wiyZfxUKDAq5Xbp8V6BC18crYVS.jpg', 'monitoring/gGNb9WUuNLG3Z7E7e9c4J5s652tiF22yF51UV4sk.jpg', NULL, 2, 0, 3, 1, 1, 2, 1.80, '2025-12-23 18:48:48', '2025-12-23 18:48:48'),
(116, '2025-12-23', 899, 6, 1.23222222, 117.85722220, 'Genangan', '4', 8, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/6TFJBxQfIwjGr4NIZ53TwwHKZPC0blkNzhYZmjqB.jpg', NULL, NULL, 2, 0, 3, 1, 1, 1, 1.60, '2025-12-23 18:50:47', '2025-12-23 18:50:47'),
(117, '2025-12-23', 899, 6, 1.23222222, 117.85722220, 'Genangan', '5', 11, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/2IfX8zsehhU6XqnWkt3TB3UylHcfMKOMn34huPjB.jpg', NULL, NULL, 2, 0, 3, 1, 1, 1, 1.60, '2025-12-23 18:52:51', '2025-12-23 18:52:51'),
(118, '2025-12-23', 899, 6, 1.23194444, 117.85722220, 'Genangan', '6', 13, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/fUA7DPHCA4J29EsO7XMKsNGle3FzS063eoPgsQj9.jpg', NULL, NULL, 2, 0, 3, 1, 1, 1, 1.60, '2025-12-23 18:54:47', '2025-12-23 18:54:47'),
(119, '2025-12-23', 899, 6, 1.23250000, 117.85638890, 'Genangan', '1', 3, NULL, '3', 'Tidak Mengalir', 'Bersih', 'Bersih', 'monitoring/nFhII61i6WXsTfF1g4uyWrroFpOfWPxmGoqDzfXt.jpg', NULL, NULL, 3, 0, 3, 1, 0, 3, 2.50, '2025-12-23 18:57:25', '2025-12-23 18:57:25'),
(120, '2025-12-23', 899, 6, 1.23277778, 117.85611110, 'Genangan', '1', 12, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/iZxfoN7z50MdISaVYOAi3dbXFSWwXDfAjUkaFwN0.jpg', NULL, NULL, 2, 0, 3, 1, 1, 1, 1.60, '2025-12-23 19:02:36', '2025-12-23 19:02:36'),
(121, '2025-12-23', 899, 6, 1.23305556, 117.85472220, 'Genangan', '6', 26, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/lnqXpDlurS6NXyq2qBm26lPgjccfnLteNFbu9iGV.jpg', NULL, NULL, 1, 0, 3, 1, 1, 1, 1.40, '2025-12-23 19:04:21', '2025-12-23 19:04:21'),
(122, '2025-12-23', 899, 6, 1.23333333, 117.85388890, 'Genangan', '7', 14, NULL, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/WqFBhLUbNXWT2imZOV1YsbJnfPzAGb0tJ4m8w35P.jpg', NULL, NULL, 2, 0, 3, 1, 1, 1, 1.60, '2025-12-23 19:07:55', '2025-12-23 19:07:55'),
(123, '2025-12-24', 885, 6, 1.23694444, 117.83916670, 'Parit', '1', 47, 1, '1', 'Lancar', 'Bersih', 'Bersih', 'monitoring/6lqUS8HLaGxK9ENlAGWwAZ6eb5ymsPVEo0SGIDEv.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2025-12-25 03:21:58', '2025-12-25 03:21:58'),
(124, '2025-12-24', 885, 6, 1.23694444, 117.83916670, 'Genangan', '6', 11, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/Bpjd2PGE8PbtV0Hbiyip7Fn8Bq2X1fZ7IpXng2rZ.jpg', 'monitoring/eFT2hnWq50JPzepH2EoiwzD7rBU5NnHxh2lBJEgn.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-25 03:23:59', '2025-12-25 03:23:59'),
(125, '2025-12-24', 885, 6, 1.23694444, 117.83833330, 'Genangan', '6', 10, 2, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/DHYfkcZini7qCnMTubVLBRSRSr2V4Ntsid9WZZHE.jpg', 'monitoring/CR2FrvyffBbn9xxIcbyKcr5zjC1efXKeocae6p9q.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-25 03:26:46', '2025-12-25 03:26:46'),
(126, '2025-12-24', 885, 6, 1.23638889, 117.83833330, 'Genangan', '15', 8, 7, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/eZw5DK0iVspfefZ9uivR5AQyycVRjqreu0AX7XfU.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 03:28:50', '2025-12-25 03:28:50'),
(127, '2025-12-24', 885, 6, 1.23638889, 117.83805560, 'Genangan', '12', 12, 8, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/6pN4sItxBYswTFwSHLg1kUJEPnl1whtOFVyQdZlH.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 03:31:39', '2025-12-25 03:31:39'),
(128, '2025-12-24', 885, 6, 1.23666667, 117.83777780, 'Genangan', '14', 9, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/dZsdgNEc5zDcViNDfGlLAru5k2QrDSvkNU8jjc86.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 03:33:06', '2025-12-25 03:33:06'),
(129, '2025-12-24', 885, 6, 1.23666667, 117.83777780, 'Genangan', '16', 25, 6, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/fha4bgTliksC3Q98hUO6zyoIhYxttLOoPQbDVvjZ.jpg', NULL, NULL, 1, 2, 3, 1, 1, 1, 1.50, '2025-12-25 03:39:56', '2025-12-25 03:39:56'),
(130, '2025-12-24', 885, 6, 1.23694444, 117.83694440, 'Genangan', '18', 7, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/FkpyRguI0XImJIEhXSqNpdnPl8PBHKDg8Go0Xlpz.jpg', NULL, NULL, 2, 3, 3, 1, 1, 1, 1.83, '2025-12-25 03:41:57', '2025-12-25 03:41:57'),
(131, '2025-12-24', 885, 6, 1.23666667, 117.83694440, 'Parit', '18', 13, 6, '3', 'Tidak Mengalir', 'Penuh', 'Bersih', 'monitoring/dl49ClUClCcoTzaeHCtrplizOzG2trnR2K9fXFK7.jpg', NULL, NULL, 1, 0, 0, 1, 1, 3, 1.50, '2025-12-25 05:31:44', '2025-12-25 05:31:44'),
(132, '2025-12-24', 885, 6, 1.23694444, 117.83555560, 'Genangan', '22', 4, 1, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Bersih', 'monitoring/B8Jb59FHgN79BmyZMk5vOsKl186OhCPCh3NuA78x.jpg', NULL, NULL, 3, 3, 3, 1, 1, 3, 2.33, '2025-12-25 05:33:37', '2025-12-25 05:33:37'),
(133, '2025-12-24', 885, 6, 1.23722222, 117.83555560, 'Parit', '18', 13, 6, '1', 'Mengalir Sedikit', 'Bersih', 'Bersih', 'monitoring/rolrkSCBHwt5SzX4S1pBS9hh8lMEcynHvMH4IYBS.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2025-12-25 05:35:07', '2025-12-25 05:35:07'),
(134, '2025-12-24', 885, 6, 1.23638889, 117.83944440, 'Parit', '22', 100, 2, '3', 'Mengalir Sedikit', 'Bersih', 'Bersih', 'monitoring/hVbQXvk7tCDTWaP2U48wAeTgr4g5CTEqpTD4Oahg.jpg', NULL, NULL, 3, 0, 0, 2, 3, 3, 2.75, '2025-12-25 05:37:21', '2025-12-25 05:37:21'),
(135, '2025-12-24', 885, 6, 1.23694444, 117.83638890, 'Genangan', '18', 7, 1, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi', 'monitoring/92o2Y59q6aAuBktQ54wPx4shdAjKJdDZWX3XhoBA.jpg', 'monitoring/0gd5OjEAdgePuzwZIIBfF3ypkUxag45kgD95FP5y.jpg', NULL, 2, 3, 3, 1, 1, 2, 2.00, '2025-12-25 05:39:20', '2025-12-25 05:39:20'),
(136, '2025-12-24', 885, 6, 1.23694444, 117.83944440, 'Genangan', '4', 3, 2, '2', 'Tidak Mengalir', 'Areal Rendahan', 'Bersih', 'monitoring/2AF21e8EmEdX7TewBVBNg0qCkbcLT6W67uylxq5z.jpg', NULL, NULL, 3, 3, 3, 1, 1, 3, 2.33, '2025-12-25 05:40:53', '2025-12-25 05:40:53'),
(137, '2025-12-24', 885, 6, 1.23583333, 117.83944440, 'Genangan', '5', 9, 13, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/OA40P2X9koLbgvQcB46T20QpkLyz44FXbdHVrHik.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 05:45:37', '2025-12-25 05:45:37'),
(138, '2025-12-24', 885, 6, 1.23555556, 117.83944440, 'Genangan', '5', 11, 15, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/8lSfU6fIxHuuWfEeKL2ZEfUtTuxVnFCFGASMdMUp.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 05:46:58', '2025-12-25 05:46:58'),
(139, '2025-12-24', 885, 6, 1.23527778, 117.83944440, 'Genangan', '5', 13, 19, '3', 'Tidak Mengalir', 'Areal Rendahan', 'Eskalasi', 'monitoring/5YMZX1ApxnScVnQNWvpEK2959iCi1nRpTIHDzVSX.jpg', NULL, NULL, 2, 2, 3, 1, 1, 1, 1.67, '2025-12-25 05:48:08', '2025-12-25 05:48:08'),
(140, '2025-12-29', 884, 6, NULL, NULL, 'Parit', '1', 26, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/eVooTGdTrpI0RQuiKNORdv5irAhT5X9pejdnOWsv.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2025-12-29 19:10:15', '2025-12-29 19:10:15'),
(142, '2025-12-29', 884, 6, 1.23944444, 117.83305560, 'Genangan', '12', 2, 2, '<1 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/XwEhmndxjLyDTWL2xnYefR2E0FgZlSZVA7b4yKVB.jpg', NULL, NULL, 3, 3, 3, 0, 1, 3, 2.60, '2025-12-29 20:15:20', '2025-12-29 20:15:20'),
(143, '2025-12-29', 884, 6, 1.23944444, 117.83333330, 'Parit', '12', 73, NULL, NULL, 'Mengalir Sedikit', 'Masalah Struktural', 'Tidak Perlu', 'monitoring/YJiu5MIKc8CRjl0fotZaHl4BjHRmbKQhm4ooLuGv.jpg', NULL, NULL, 2, 0, 0, 2, 1, 3, 2.00, '2025-12-29 20:17:57', '2025-12-29 20:17:57'),
(144, '2025-12-29', 884, 6, 1.23722222, 117.83388890, 'Parit', '21', 42, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/gmtYvB8qXUrvz6OfO9eJtOaBCqFGfuOKfM7ShmHh.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2025-12-29 20:20:22', '2025-12-29 20:20:22'),
(145, '2025-12-29', 884, 6, 1.23722222, 117.83527780, 'Genangan', '24', 1, 2, '<1 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/4MTpzHjXsEsM1QQeP4iNNA55ZBdhqtS5jUXcuYNC.jpg', NULL, NULL, 3, 3, 3, 0, 1, 3, 2.60, '2025-12-29 20:25:39', '2025-12-29 20:25:39'),
(146, '2025-12-29', 884, 6, 1.23722222, 117.83527780, 'Genangan', '25', 1, 2, '<1 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/RXxpVSTZMs5HfzbYODsv7JjfGhYJjXuTDzIspZ73.jpg', NULL, NULL, 3, 3, 3, 0, 1, 3, 2.60, '2025-12-29 20:27:48', '2025-12-29 20:27:48'),
(147, '2025-12-29', 884, 6, 1.23722222, 117.83777780, 'Genangan', '40', 7, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/BLp0v5zAUGxwt5HtgRsm14vdCyXFrduXVyX1vPlj.jpg', 'monitoring/pPLW7kckX22qACAT7mAp5J3J5VkKgqDfd6KmbiCx.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2025-12-29 20:29:44', '2025-12-29 20:29:44'),
(148, '2025-12-29', 884, 6, 1.23750000, 117.83944440, 'Genangan', '52', 2, 3, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/gNo4IK6uCiZ1XzJ1gsO7kviNadq9N7uAQoEwjYyO.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2025-12-29 20:32:17', '2025-12-29 20:32:17'),
(149, '2025-12-29', 884, 6, 1.23750000, 117.83944440, 'Parit', '51', 136, NULL, NULL, 'Tidak Mengalir', 'Penuh', 'Eskalasi', 'monitoring/nsGN2U8dJr0jBqRt49PmDtqjBIHUc6W5OTcwLuEM.jpg', 'monitoring/tmpyReiXf1huGhQ2ysMnU1SO2QAptegUrIisUlti.jpg', NULL, 2, 0, 0, 1, 1, 1, 1.25, '2025-12-29 20:36:11', '2025-12-29 20:36:11'),
(150, '2025-12-30', 898, 6, 1.23472222, 117.85166670, 'Genangan', '1', 100, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/msiHHQc2iogwOsBMV0s4HMyplmyHHB5KkErA3vPX.jpg', 'monitoring/QPQCkF8IxJZZnyoL5rAKkM268Ql1TQwp7fUWmJJC.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:03:28', '2026-01-01 04:03:28'),
(151, '2025-12-30', 898, 6, 1.23472222, 117.85027780, 'Genangan', '7', 62, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/OdMJHrPzHXaYmLYrqW92uoX2vmUFkP5InImO35Fa.jpg', 'monitoring/xSR3W9vmoWBx86ayv0BwH3Wl05KBb4M7qAEPtyoh.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-01-01 04:05:04', '2026-01-01 04:05:04'),
(152, '2025-12-30', 898, 6, 1.23472222, 117.85027780, 'Genangan', '8', 23, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/DncdjBsixsc8jG22VtrZ6RUAiQAVnTrRotMrCzsi.jpg', 'monitoring/TFnNsO2B5XdZqpiVRAjyFCDZm850GeH6wL3797B1.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-01-01 04:06:57', '2026-01-01 04:06:57'),
(153, '2025-12-30', 898, 6, 1.23472222, 117.85222220, 'Parit', '1', 30, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/vCda7k9odcAg3WS6RIhTeYkEJB1TZv13UAGI5j2Q.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-01-01 04:08:31', '2026-01-01 04:08:31'),
(154, '2025-12-30', 898, 6, 1.23583333, 117.85222220, 'Genangan', '1', 32, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/WOQtwVLpJJYEk2eRnj4YYbKXB3vgz4dCDianhUBo.jpg', 'monitoring/izW38ypxjxPhTXIbpQppcDEmv55MNmhAx6mG1NwH.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:10:12', '2026-01-01 04:10:12'),
(155, '2025-12-30', 898, 6, 1.23583333, 117.85222220, 'Genangan', '2', 110, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/eMQjYswXVKc5kVcmAmYOzCUj84JrMqcLY8P9brm6.jpg', 'monitoring/MABb2RQpSOK3LDJppJ3xiRS40LC0cgrgWtxr0hma.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:12:06', '2026-01-01 04:12:06'),
(156, '2025-12-30', 898, 6, 1.23611111, 117.85250000, 'Genangan', '4', 19, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/KBhcQxuidiTtCrJJWzNuvR5G1rcFM9S5o7fNOFrL.jpg', 'monitoring/uEJn3vktYSsOfuj6JDaU3HToSautESAb61KrvZDX.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:14:15', '2026-01-01 04:14:15'),
(157, '2025-12-30', 898, 6, 1.23611111, 117.85277780, 'Parit', '5', 8, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/tdvr1z1RncpEkjFmEwRU15cQHRufTJs6yR1rk4N7.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-01-01 04:16:19', '2026-01-01 04:16:19'),
(158, '2025-12-30', 898, 6, 1.23638889, 117.85305560, 'Genangan', '8', 15, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/E1EHYs2AOUQwfmZsSL1OjwuZri6HRA6jGi2tHtxm.jpg', 'monitoring/s6uM2xEJYs92qhPxEmnsZvYYbXdYFtGfgKOzu2AJ.jpg', NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-01-01 04:18:34', '2026-01-01 04:18:34'),
(159, '2025-12-30', 898, 6, 1.23638889, 117.85333330, 'Genangan', '9', 20, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/1PKWo7kJpbVsfELELWQJVxY078eChJyIAhIMDVnu.jpg', 'monitoring/mZC9jmLTavX90QKA7D646b2Lh6ZPIQrhae4Meunx.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:20:26', '2026-01-01 04:20:26'),
(160, '2025-12-30', 898, 6, 1.23666667, 117.85333330, 'Genangan', '10', 20, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/bKkqPqpBKg9tWccqPew1oeOcWkd2SItCOwvzx58Q.jpg', 'monitoring/vKD2yVQoALT8tFILcBV3EIcw9BDzXKVv4ZXPrs1i.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 04:22:07', '2026-01-01 04:22:07'),
(161, '2025-12-30', 898, 6, 1.23527778, 117.85388890, 'Genangan', '18', 8, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/6Qn2gx9FeowH1j0j5FomY3Yza2MAaqZXyuj8E5yN.jpg', 'monitoring/sUdkeSL6uj80SQDihibfLpEyxMYLfDjcgNqzAhJK.jpg', NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-01-01 04:23:40', '2026-01-01 04:23:40'),
(162, '2025-12-31', 899, 6, 1.23194444, 117.85777780, 'Genangan', '3', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fWdSlQk6lnQPWC8W3SnadZ5OtyNslEhDLeGFvQpe.jpg', 'monitoring/uSQ7Q82Yxz36qqoYIXFu4yoijzJbWaMDNmZIGXTe.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-01 23:30:30', '2026-01-01 23:30:30'),
(163, '2025-12-31', 899, 6, 1.23333333, 117.85750000, 'Genangan', '1', 27, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/InO7cJ5G8WbvFCFxRJd7rUKZEFrlW18w0Ss4hkb5.jpg', 'monitoring/w5fdqkbk0tJw7vOWRqTJ1VMB9NY5LQTk0yCdx9GM.jpg', NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-01-01 23:32:22', '2026-01-01 23:32:22'),
(164, '2025-12-31', 899, 6, 1.23333333, 117.85722220, 'Genangan', '2', 14, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/ftN2zd3SN8baI1i7rVS38FZ94fVkIZiF2Lw6Bbrh.jpg', 'monitoring/Li4HfuX85wjKXyXonAWysvpOfIldaAeKl10VYpHX.jpg', NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-01-01 23:34:25', '2026-01-01 23:34:25'),
(165, '2025-12-31', 899, 6, 1.23333333, 117.85722220, 'Genangan', '4', 10, 0, '>3 Hari', NULL, 'Hujan Tinggi', 'Eskalasi', 'monitoring/yM1c3N1ptqXbB5WXhf6pnjuhF7FqPzdfT3XoOIZ4.jpg', 'monitoring/YMmwYkKHwMzeApUWlw5WiOSM6CATJEpzekfDPT6W.jpg', NULL, 2, 3, 1, 0, 2, 1, 1.80, '2026-01-01 23:38:36', '2026-01-01 23:38:36'),
(166, '2025-12-31', 899, 6, 1.23388889, 117.85750000, 'Genangan', '5', 16, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/APDWY1yvxxhXAjcG4rHdL7Qh0Jj7gBi5Xmjg4RYR.jpg', 'monitoring/SFoUZPPtCqUFXSJOzyMimAv264inDYrM4cXyGDSX.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-01-01 23:43:14', '2026-01-01 23:43:14'),
(167, '2026-01-03', 831, 6, 1.25000000, 117.80805560, 'Genangan', '5', 5, 6, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/CLYRTZRlD63MpOYEjptbcbGUWOZgu5MYOOzhhiHm.jpg', 'monitoring/dXPjRLl2Xcucfp5jnLlUMMUQvDY6cwsjYAWE6dUp.jpg', NULL, 3, 2, 1, 0, 1, 2, 1.80, '2026-01-17 19:44:15', '2026-01-17 19:44:15'),
(168, '2026-01-03', 831, 6, 1.24972222, 117.80805560, 'Genangan', '5', 10, 9, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/YTVwax4xJ9ICXk06nVYSnfqT3TdpjqimB0a2vqol.jpg', 'monitoring/JWVq2W5N5polyKA8QkPlgelZinDbE6HKCLXh7mLR.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-17 19:45:21', '2026-01-17 19:45:21'),
(169, '2026-01-03', 831, 6, 1.24944444, 117.80805560, 'Genangan', '6', 10, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fmiLbmAjigo1yT1xMA9j1ZRxuMfyzWDeIQoBsJaC.jpg', 'monitoring/cX6giacekzbKdXC8az1xdadQKxArBVUqiyfB97XW.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-17 19:46:29', '2026-01-17 19:46:29'),
(170, '2026-01-03', 831, 6, 1.24972222, 117.80833330, 'Genangan', '7', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/hTLeTiZtufX1WI2eaOdhC7jqQiVqMuDVU6vLIBxL.jpg', 'monitoring/7i1uGf1rrJQKcWjWQ2cAVA6uDamBpevKcvWsc7pk.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-17 19:47:54', '2026-01-17 19:47:54'),
(171, '2026-01-03', 831, 6, 1.25000000, 117.80833330, 'Genangan', '8', 7, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/1rMGfAuEUcHSoQOx5uNk4Umlh8kx2IWmWMlyLTmM.jpg', 'monitoring/DM1ozdDd0MXaS9ZpyHO4s8gyPPcrGuKD34PzT0yf.jpg', 'Air parit tidak lancar', 2, 3, 1, 0, 1, 1, 1.60, '2026-01-17 19:49:45', '2026-01-17 19:49:45'),
(172, '2026-01-03', 831, 6, 1.25111111, 117.80861110, 'Genangan', '10', 15, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/xey8ipzMnEzwAWoLfVQD6wV6cNS8R68SWqXRME0U.jpg', 'monitoring/OYCdhJowfeNVhFGYpzLUTxDNYroGkPBwvbpucoQr.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-17 19:51:17', '2026-01-17 19:51:17'),
(173, '2026-01-03', 831, 6, 1.25111111, 117.80861110, 'Genangan', '10', 13, 7, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/2Uo3i80aOxkkrQ8oWbDjz6Aj9EryZW0OqEXQKe1Z.jpg', 'monitoring/5VwXcqxopSqyDO4hQpJF0BzAGyDW9nopvYNvuvPC.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-17 19:53:17', '2026-01-17 19:53:17'),
(174, '2026-01-03', 831, 6, 1.25000000, 117.80861110, 'Genangan', '10', 10, 18, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/y8vOBNAuGCxAnsWiw17mF5qSHQdiPKHq3oKGPKOR.jpg', 'monitoring/E88yKDg7vXmJ65Qe0zVJqIICBCtzjm55QsPiI8gR.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-17 19:54:51', '2026-01-17 19:54:51'),
(175, '2026-01-03', 831, 6, 1.25000000, 117.80861110, 'Genangan', '10', 5, 20, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/KmdRr0PJnauTjVUTjAcBqZUkCq3RuWrx88pGs8TK.jpg', 'monitoring/CfRdmwCVMbScsG9Zl2HV9vYeRUcS1iqK2AuQaKNy.jpg', 'Parit tertutup', 3, 2, 1, 0, 1, 1, 1.60, '2026-01-17 19:56:22', '2026-01-17 19:56:22'),
(176, '2026-01-03', 831, 6, 1.25166667, 117.80916670, 'Genangan', '15', 2, 2, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/QrkeZ9USjKcreHd4Fby6wRcSb67eLgeHvt5sXaB2.jpg', 'monitoring/EE2ljiVxvwZuN5CYnVCSz80KwEVQOtCZomt3CrjF.jpg', NULL, 3, 3, 2, 0, 1, 2, 2.20, '2026-01-17 19:59:44', '2026-01-17 19:59:44'),
(177, '2026-01-03', 831, 6, 1.25166667, 117.80944440, 'Genangan', '16', 7, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/L6ghCDFQgbWyhK2ZGOq59K2F0Dgm8N0Qdl268RG6.jpg', 'monitoring/GWp731cX7DLRqLLLVK1e7Dn6EgAOBSrGCmUg7qY9.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-17 20:01:11', '2026-01-17 20:01:11'),
(178, '2026-01-03', 831, 6, 1.25055556, 117.80944440, 'Genangan', '16', 7, 17, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ItZIYxlfI7SRZDuD8GyapTuaaM6ZOehqbf0qakQv.jpg', 'monitoring/ZZ6uQ3TsfPG9bViv7BfFQy6I7iRLjn3aGgSs4iF7.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-17 20:05:42', '2026-01-17 20:05:42'),
(179, '2026-01-03', 831, 6, 1.25055556, 117.80944440, 'Genangan', '17', 2, 18, '1-2 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/7AksItPBBuf8XdpLKZ44UCPdx5qt4BG0f3ApIGhq.jpg', 'monitoring/csJWA1YuIJlE7JDT6l2P7FrAb0kRCtIeHMXT0PaE.jpg', NULL, 3, 2, 2, 0, 2, 2, 2.20, '2026-01-17 20:07:47', '2026-01-17 20:07:47'),
(180, '2026-01-03', 830, 6, 1.25194444, 117.80972220, 'Genangan', '17', 14, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/q7YgtdomiY9GB1I1I88geTlW1k8fL2nH9PcAvgkn.jpg', 'monitoring/81G1i8qkzxXcKWZ70rkb6pHlH7X4ECKbka3CXPRK.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-17 20:10:50', '2026-01-17 20:10:50'),
(181, '2026-01-03', 831, 6, 1.24944444, 117.80861110, 'Genangan', '17', 30, 1, '<1 Hari', NULL, 'Tidak Ada', 'Tidak Perlu', 'monitoring/e6sjCILbdlxuqcvdOjJDOGo0xydBrHFoLIzjIokD.jpg', NULL, NULL, 1, 3, 3, 0, 3, 3, 2.60, '2026-01-17 20:12:22', '2026-01-17 20:12:22'),
(182, '2026-01-03', 830, 6, 1.24916667, 117.80944440, 'Parit', '8', 20, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/IfefC5VDB3lst3Z9cIOy7QX5BsiJOjaaMPpIma1K.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-01-17 21:07:43', '2026-01-17 21:07:43'),
(183, '2026-01-03', 830, 6, 1.25416667, 117.81027780, 'Genangan', '11', 3, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Cd9mMbgp3K1MXXo3dibBiisLh9w9emNWRhVJ75Nz.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-01-17 21:09:12', '2026-01-17 21:09:12'),
(184, '2026-01-03', 830, 6, 1.25194444, 117.81416670, 'Genangan', '6', 2, 3, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/nX8fTHldii9cQcv1sI8lYyIqbfRmjiXxu4IOkEUV.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-01-17 21:10:29', '2026-01-17 21:10:29'),
(185, '2026-01-03', 830, 6, 1.25305556, 117.81416670, 'Genangan', '4', 5, 13, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/eKhHWarenQVVY3wQAiGmzJWMVushxq7sqyOEE5FG.jpg', 'monitoring/FQD6hkIe6AJnWPH7Y1SYAXAlSnEcGt1tXUXdXGSz.jpg', NULL, 3, 2, 1, 0, 1, 1, 1.60, '2026-01-17 21:12:03', '2026-01-17 21:12:03'),
(186, '2026-01-03', 830, 6, 1.25277778, 117.81416670, 'Genangan', '4', 6, 18, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/qRErmHRFKjuOgYdqfYSeCkrZvaZMyGx2SGoqXayL.jpg', 'monitoring/fKofHqkE48WrVmQvmTldnav6bV1PR8ABagBSvSb2.jpg', NULL, 2, 2, 1, 0, 1, 1, 1.40, '2026-01-17 21:13:45', '2026-01-17 21:13:45'),
(187, '2026-01-03', 830, 6, 1.25166667, 117.81444440, 'Parit', '1', 15, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/WUnXAc8oig8dgKNsQIDDypvM1atxPyRu1h61WxZ9.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-01-17 21:15:01', '2026-01-17 21:15:01'),
(188, '2026-01-05', 829, 6, 1.25666667, 117.81222220, 'Parit', '18', 20, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/c1WZbue7aY24NzxbWDkKEyc3E3x75JZQKh4j6bOi.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-01-17 21:21:09', '2026-01-17 21:21:09'),
(189, '2026-01-05', 829, 6, 1.25638889, 117.81194440, 'Parit', '20', 20, NULL, NULL, 'Tidak Mengalir', 'Penuh', 'Eskalasi', 'monitoring/iCEablXWnvjrRMhPxqeH5cPsZagrtB0cIqxIEibh.jpg', 'monitoring/6CVTpiT11tjKlPxaqyDTtfc8Oqq6fvz7MGtPnwme.jpg', 'Parit tertutup', 1, 0, 0, 1, 1, 1, 1.00, '2026-01-17 21:22:47', '2026-01-17 21:22:47'),
(190, '2026-01-05', 829, 6, 1.25555556, 117.81138890, 'Genangan', '23', 15, 11, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Z20DkwRy1ogxinY2ZtysSHNHxGuwcHLHUibxB6w4.jpg', 'monitoring/9T98ZYI7HTZjCgPQHJsWLAgGmGMw2GsrvEvGIsPo.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-17 21:24:03', '2026-01-17 21:24:03'),
(191, '2026-01-05', 829, 6, 1.25555556, 117.81138890, 'Genangan', '23', 20, 13, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/M5sP7C5va8D3O3xypehcKurSeXuuZuvl1cyfNjCY.jpg', 'monitoring/gQHJFJMRaqKFeFMm4cT9WxmOTnnlu6MlqnkiOD5F.jpg', NULL, 1, 2, 1, 0, 1, 2, 1.40, '2026-01-18 00:56:42', '2026-01-18 00:56:42'),
(192, '2026-01-05', 829, 6, 1.25583333, 117.81138890, 'Genangan', '23', 10, 16, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/HxISvIdxpoHdjwuR9pMqidDIhNbzXt7ApN2ApT88.jpg', 'monitoring/d7A8k6kFrS7Jukoh1XKuMnSoSoO4d2ixMReKEQ28.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-18 00:58:53', '2026-01-18 00:58:53'),
(193, '2026-01-05', 829, 6, 1.25638889, 117.81111110, 'Genangan', '23', 30, 1, '<1 Hari', NULL, 'Parit Tersumbat', 'Eskalasi', 'monitoring/4YdBwfRx772mtwwRMLXUdHjTPuxzNiTfRqUSQ2VX.jpg', 'monitoring/5p6F0WW6zrP51jSYFJjFmMTYroJFOoAhtaPs4maq.jpg', 'Parit tidak ada pembuangan', 1, 3, 3, 0, 1, 1, 1.80, '2026-01-18 01:01:20', '2026-01-18 01:01:20'),
(194, '2026-01-05', 829, 6, 1.25611111, 117.81111110, 'Parit', '26', 10, NULL, NULL, 'Tidak Mengalir', 'Penuh', 'Eskalasi', 'monitoring/f8XuqLY6mU2HokgKBD5jPaBHqu2K2eoruCqeWhC1.jpg', 'monitoring/JCTjzjhX3t51AdG5PS0dkL7dNqfwb6IiyWO6qbio.jpg', NULL, 1, 0, 0, 1, 1, 1, 1.00, '2026-01-18 01:04:17', '2026-01-18 01:04:17'),
(195, '2026-01-05', 829, 6, 1.25472222, 117.81083330, 'Genangan', '27', 20, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/hDEW425Dd7WarNwkPbCdDgFq0wtclZ8AzaFe2L0X.jpg', 'monitoring/WWDOMB5zO3MNbUmqPvZmnXZR2eKgHX75M5Jgrc0D.jpg', NULL, 1, 3, 2, 0, 2, 2, 2.00, '2026-01-18 01:06:04', '2026-01-18 01:06:04'),
(196, '2026-01-05', 828, 6, 1.25611111, 117.81111110, 'Genangan', '13', 4, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/mqSNIfOYLBpa5sne0t2ATosS3GiX0JMw5IlvmMXZ.jpg', 'monitoring/Lr99yI8iCI6AwXyFHcaDvv42zgxW7qdDNzWmb3OG.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-01-18 01:10:52', '2026-01-18 01:10:52'),
(197, '2026-01-05', 828, 6, 1.25666667, 117.81222220, 'Genangan', '15', 7, 3, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/O1RYRgy2iqnzKWXemdkLQes56qGwselmvPsPDXty.jpg', 'monitoring/UYlGJaOLRRCI50Q5gtCXdDeNHxNqlFt5AEgmy7Po.jpg', NULL, 2, 3, 2, 0, 1, 2, 2.00, '2026-01-18 01:12:15', '2026-01-18 01:12:15'),
(198, '2026-01-05', 828, 6, 1.25666667, 117.81250000, 'Genangan', '15', 9, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/rN4p4sDVLjIoSzEP9enMP4L7FUKQ5WGZx718z71O.jpg', 'monitoring/5YYa8ryFVX1d4ltE9ODn0fOTpSE51fN595tKHc7A.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-18 01:13:52', '2026-01-18 01:13:52'),
(199, '2026-01-06', 840, 6, 1.25166667, 11.81472222, 'Parit', '1', 17, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/32WOjdmeQvzFc6lqEuMSIts1ecyplZuh3kIznLN0.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-01-18 02:26:47', '2026-01-18 02:26:47'),
(200, '2026-01-06', 840, 6, 1.25166667, 117.80916670, 'Genangan', '1', 4, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/98TNmsot2M7yvtDRsha6EOqSpzYPZDU6ZYFcXPFv.jpg', 'monitoring/62RPNWt5kDTc6dDtrYGcgXkrCGvBDGgsnBdkDUHg.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-01-18 02:28:19', '2026-01-18 02:28:19'),
(201, '2026-01-06', 840, 6, 1.25138889, 117.81194440, 'Genangan', '1', 5, 6, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/LqoHAZNEpHK99YgtD15VKLVyqxvTkJ91a6i1traa.jpg', 'monitoring/yoAg2tKp1xgFfBTxMcHCkv1YKKXiJdg0h0Tnu6iV.jpg', NULL, 3, 2, 1, 0, 1, 2, 1.80, '2026-01-18 02:37:16', '2026-01-18 02:37:16'),
(202, '2026-01-06', 840, 6, 1.25111111, 117.81472220, 'Genangan', '1', 6, 10, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/sW2Cmzsawy8TdwJ6yB2xRuqyvvl6uvI7A7QvAprv.jpg', 'monitoring/2HNM6UgxSUgVngseBBUYgPMObXNOyISlKIrzdyKP.jpg', NULL, 2, 2, 2, 0, 1, 2, 1.80, '2026-01-18 03:13:57', '2026-01-18 03:13:57'),
(203, '2026-01-06', 840, 6, 1.25000000, 117.81472220, 'Genangan', '1', 7, 20, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Mqi7wn0hwTQ2P1BQzicX4eT57537BSQorPUWALpt.jpg', 'monitoring/Q1hCOqLWPqvXDvnzDG4tCTVJhk5ODqUAg3toRcsU.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-18 03:16:10', '2026-01-18 03:16:10'),
(204, '2026-01-06', 840, 6, 1.24972222, 117.81472220, 'Genangan', '2', 11, 24, '>3 Hari', NULL, 'Parit Tersumbat', 'Eskalasi', 'monitoring/Rgf9CODii1bcYw7e17bYuzlgR9fnYZnBKjTHZGvE.jpg', 'monitoring/mL1apVTpygfGrZgQI5ZTDQD5DVtm4tgaePhlwXGA.jpg', 'Perlu alat berat untuk keluarnya air karena parit tertutup', 2, 1, 1, 0, 1, 1, 1.20, '2026-01-19 01:03:32', '2026-01-19 01:03:32'),
(205, '2026-01-06', 840, 6, 1.25083333, 117.81472220, 'Genangan', '2', 10, 10, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/nILCTetKDBAuq054cNMIuwUFU8uokiznZQ30EEkv.jpg', 'monitoring/6oI69wGTKD5DF9G3rLnBwpkLriJJDMENnWxdAUqG.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-01-19 01:05:38', '2026-01-19 01:05:38'),
(206, '2026-01-06', 840, 6, 1.25111111, 117.81500000, 'Genangan', '2', 4, 7, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/jMT0U4bGdulgjbsTTRrHhMAKrDg3v26xKJf4lYhZ.jpg', 'monitoring/LdXJTMKc5csbrYSA3FawAnJSfFoRfW2H3Gx0eUwG.jpg', NULL, 3, 2, 1, 0, 1, 2, 1.80, '2026-01-19 01:08:31', '2026-01-19 01:08:31'),
(207, '2026-01-06', 840, 6, 1.25138889, 117.81500000, 'Genangan', '2', 4, 4, '>3 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/7mjdkSHmjPNrH47tXJ4Zgh3CjYYkRaG6GBlFdo81.jpg', 'monitoring/uAZdwFAg6r0motOtpS0DH1U7s5JxrCYJPzH9N2sv.jpg', NULL, 3, 3, 1, 0, 2, 2, 2.20, '2026-01-19 01:13:32', '2026-01-19 01:13:32'),
(208, '2026-01-06', 840, 6, 1.25138889, 117.81527780, 'Genangan', '6', 2, 4, '1-2 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/luYeB3TSTOBshiDGCOyU4AzLe8HVXrtXBb715f6A.jpg', 'monitoring/9tOB6aeTOQyQRaZGJXCjA8mxIv17ODZ8B0UTfl8x.jpg', NULL, 3, 3, 2, 0, 2, 2, 2.40, '2026-01-19 01:16:39', '2026-01-19 01:16:39'),
(209, '2026-01-06', 840, 6, 1.25138889, 117.81555560, 'Genangan', '7', 5, 3, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/IhunjroEY48fUciiHPKTlhFoZDp6HXKKgx64bi8i.jpg', 'monitoring/gSZPulc65KzqTmD1HyEso1ccJ6qwGB2JjiGI7EsH.jpg', NULL, 3, 3, 2, 0, 1, 2, 2.20, '2026-01-19 01:23:13', '2026-01-19 01:23:13'),
(210, '2026-01-06', 840, 6, 1.25138889, 117.81722220, 'Genangan', '22', 6, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/JxJczSxOzH95wCauokr0PcfJ1GKRB7wFFOgwWddS.jpg', 'monitoring/0JrtrVlKixpXX93dNzLpqDqUUyCMI7yXD9AFIypy.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-19 01:26:08', '2026-01-19 01:26:08');
INSERT INTO `monitoring_harian` (`id`, `tanggal`, `id_lokasi`, `id_karyawan`, `lat_aktual`, `long_aktual`, `tipe_objek`, `nomor_jalur`, `kedalaman_cm`, `jumlah_pokok`, `durasi_genangan`, `kondisi_aliran`, `penyebab`, `tindakan`, `foto_path`, `foto_after`, `keterangan`, `skor_kedalaman`, `skor_jumlah_pokok`, `skor_durasi`, `skor_aliran`, `skor_penyebab`, `skor_tindakan`, `rata_rata_skor`, `created_at`, `updated_at`) VALUES
(211, '2026-01-06', 840, 6, 1.25138889, 117.81750000, 'Genangan', '26', 11, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/I2jcItelS90BnoDhW68FZ6D6iaQ7LVAzYkDoTUyB.jpg', 'monitoring/x27oPwLZXLTPGprVd7ynahaDRE0tlRMl6jo37wAp.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-01-19 01:33:22', '2026-01-19 01:33:22'),
(212, '2026-01-07', 840, 6, 1.25111111, 117.83083330, 'Genangan', '28', 17, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/NcCZ4zoLbvskQOJZDBN5whm2NiLoYX9XjYoAFrqt.jpg', 'monitoring/iLPbC8aOfqoU5k29C6vQyU5LxcHQS5a55nxTNX8N.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-01-19 01:54:53', '2026-01-19 01:54:53'),
(213, '2026-01-07', 840, 6, 1.25138889, 117.81805560, 'Genangan', '29', 17, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/v2i1celzAI3vTghVGMx2QFSXm8qZlZQ8WixYj1k1.jpg', 'monitoring/XzLZQCRu2GKUGaCZZxOhdtbavIccgAiMjELnb44u.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-01-19 01:56:51', '2026-01-19 01:56:51'),
(214, '2026-01-07', 840, 6, 1.25138889, 117.81833330, 'Genangan', '30', 5, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/sMw3IgadFG13bMNhD2CP5VQl19U37N5UdjAqjJGW.jpg', 'monitoring/7KMUXVxgFgNWuaiT1xEQcHtUXDXHvUj0qEuMdyLN.jpg', NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-01-19 01:59:55', '2026-01-19 01:59:55'),
(215, '2026-01-07', 839, 6, 1.25250000, 117.82111110, 'Genangan', '12', 4, 22, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/iSB7yAlM0c54y7znjGqcf4puejSuLzPVLbOpgxJn.jpg', 'monitoring/kemElJ56mivPazWanaE9raJKsYiU1aYWlfChDTon.jpg', NULL, 3, 1, 1, 0, 1, 2, 1.60, '2026-01-19 02:04:28', '2026-01-19 02:04:28'),
(216, '2026-01-07', 839, 6, 1.25305556, 117.82111110, 'Genangan', '12', 4, 22, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/pYKyqZ8Pb4wWuVHfc2DuFNjwhdFMvfrTeeKxRDvu.jpg', 'monitoring/Sz5coBRfN7askMx52HJJLa02sux5mBv5kZZJD3zX.jpg', NULL, 3, 1, 1, 0, 1, 2, 1.60, '2026-01-19 02:08:27', '2026-01-19 02:08:27'),
(217, '2026-01-07', 839, 6, 1.25166667, 117.82000000, 'Genangan', '20', 4, 3, '>3 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/305wJGkC7TkxaaE3gLHYxlyCdRK9BGOLWz28HKCB.jpg', 'monitoring/3ZW0wje1dWne5Bh5QWcp2tZB0z9id1ZkwRMKPFt2.jpg', NULL, 3, 3, 1, 0, 2, 2, 2.20, '2026-01-19 02:14:23', '2026-01-19 02:14:23'),
(218, '2026-01-08', 838, 6, 1.25416667, 117.81500000, 'Genangan', '2', 4, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/1F6PnFVUAAz2TxTsGIJS2RaI2LAnJqFnIS73ssPv.jpg', 'monitoring/JIOFicQb2qtNrCmvm01AzyG39iDBCUQMRneyzG2t.jpg', NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-01-19 02:17:48', '2026-01-19 02:17:48'),
(223, '2026-02-02', 889, 4, 1.23944444, 117.84472220, 'Genangan', '0', 7, 1, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/9TSdda3NuyU1CUnKGUPKhtOhknvIJxz3fxKfAdcl.jpg', 'monitoring/BNM5A1md3EW5ex08q21Gwh7mm3VIkmoYBrZrbCyv.jpg', NULL, 2, 3, 2, 0, 1, 2, 2.00, '2026-02-02 06:11:55', '2026-02-02 06:11:55'),
(224, '2026-02-02', 889, 4, 1.23916667, 117.84611110, 'Genangan', '15', 10, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/gKLsooFRmgtm39Kn4JYBwchFc8PH6uhOM6NHPqCY.jpg', 'monitoring/wnRH8dpDynHNICoKhzbZ8EYwBfQyLgNoCEuCOzAw.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-02 06:13:22', '2026-02-02 06:13:22'),
(225, '2026-02-02', 889, 4, 1.23916667, 117.84611110, 'Parit', '14', 4, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/xRQHj17ZP1VBXmE0Ca53huFE3ofY0BFAPtZr335J.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-02 06:14:48', '2026-02-02 06:14:48'),
(226, '2026-02-02', 889, 4, 1.23805556, 117.84611110, 'Parit', '16', 30, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/VjvBllJ74ilCCBSTIZojQalfMrNDikY92iIPAwls.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-02 06:16:49', '2026-02-02 06:16:49'),
(227, '2026-02-02', 889, 4, 1.23777778, 117.84583330, 'Parit', '19', 40, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/fcux7pIfd7K2C3D9Y8qR4QsS5ewT5TKVhFdEaXoF.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-02 06:18:49', '2026-02-02 06:18:49'),
(228, '2026-02-02', 889, 4, 1.23750000, 117.84555560, 'Genangan', '23', 6, 19, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Qnx1OVCzDbVzzgVSKl3E6l4VWOGZbquSJEeSepEA.jpg', 'monitoring/BQ63iT1HWDUUhpXKpH07AKRInzQRb9KnoYcsw9ab.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-02-02 06:21:31', '2026-02-02 06:21:31'),
(229, '2026-02-02', 889, 4, 1.23805556, 117.84527780, 'Genangan', '24', 14, 19, NULL, NULL, 'Areal Rendahan', NULL, 'monitoring/T60wn3AYFuDLmvNPYZ1nm57v182AVyJ8A4DsgDJY.jpg', NULL, NULL, 2, 2, 0, 0, 1, 0, 1.67, '2026-02-02 06:23:11', '2026-02-02 06:23:11'),
(230, '2026-02-02', 889, 4, 1.23805556, 117.84527780, 'Genangan', '24', 15, 12, '>3 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/ZHSCT6bdib24lbJModDxj2dstPss4zAFqhEiVvUf.jpg', NULL, NULL, 2, 2, 1, 0, 1, 3, 1.80, '2026-02-02 06:25:17', '2026-02-02 06:25:17'),
(231, '2026-02-02', 889, 4, NULL, NULL, 'Genangan', '23', 12, 23, '1-2 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/ca5IXm71iBM5s0AiFdrGGtqljXuu4e8WS3i3ny0J.jpg', NULL, NULL, 2, 1, 2, 0, 1, 3, 1.80, '2026-02-02 06:27:40', '2026-02-02 06:27:40'),
(232, '2026-02-02', 889, 4, 1.23833333, 117.84555560, 'Genangan', '24', 12, 10, '>3 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/LqXZZcsEenec8gEsCX1eepPWemmjAAzbtWTP23Vw.jpg', 'monitoring/pIPqny9Xn9Hu05IBE42ttTywZIgop4COlzJrSd7Y.jpg', NULL, 2, 2, 1, 0, 2, 2, 1.80, '2026-02-02 06:32:05', '2026-02-02 06:32:05'),
(233, '2026-02-02', 889, 4, 1.23861111, 117.84527780, 'Genangan', '23', 5, 12, '>3 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/vNFkVSz1KYlsulShGXW6fXDBnhEPfAvbCOFckiA1.jpg', NULL, NULL, 3, 2, 1, 0, 1, 3, 2.00, '2026-02-02 06:33:29', '2026-02-02 06:33:29'),
(234, '2026-02-03', 889, 6, 1.23916667, 117.84361110, 'Parit', '30', 30, NULL, NULL, 'Tidak Mengalir', 'Daun/Sampah', 'Tidak Perlu', 'monitoring/GFXdkIiBmKUrSHNr3czmyRVgDuXKmoLNMjXbPs7W.jpg', NULL, NULL, 1, 0, 0, 1, 2, 3, 1.75, '2026-02-03 06:04:00', '2026-02-03 06:04:00'),
(235, '2026-02-03', 889, 6, 1.23750000, 117.84361110, 'Parit', '30', 20, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/zdotLeyfggeF4Ds6VNyN9lh5vOxMa7bPQwxjIs0e.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-03 06:05:29', '2026-02-03 06:05:29'),
(236, '2026-02-03', 889, 6, 1.23722222, 117.84361110, 'Genangan', '30', 2, 2, '1-2 Hari', NULL, 'Areal Rendahan', 'Tidak Perlu', 'monitoring/NYbxIHvLFcvxZRuiCQUomfYhTh6O2pycAvlQfPZD.jpg', NULL, NULL, 3, 3, 2, 0, 1, 3, 2.40, '2026-02-03 06:10:13', '2026-02-03 06:10:13'),
(237, '2026-02-03', 889, 6, 1.23694444, 117.84388890, 'Genangan', '29', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/c77eA15ZEnLVtijzYdRUNp1VsbvcNe52ZkzFVOGV.jpg', 'monitoring/COaMnsTTHxVfhAUopX3ENdOYwYXF91pbWOgtNFGU.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-03 06:12:16', '2026-02-03 06:12:16'),
(238, '2026-02-03', 889, 6, 1.23694444, 117.84416670, 'Genangan', '26', 6, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fyN55ONouQJPE6EwUKBlQQ7HboH4wgn2pLx1Tt5h.jpg', 'monitoring/dDAp7HW9E8oUY8U9BiTWhmvp0ML1K9HFCYnWWRDr.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-03 06:14:02', '2026-02-03 06:14:02'),
(239, '2026-02-03', 889, 6, 1.23694444, 117.84416670, 'Parit', '26', 40, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/tFDzFJHFMnphZ9FgymiP7DZsa7VncSQPBi0dQSyX.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-03 06:18:02', '2026-02-03 06:18:02'),
(240, '2026-02-03', 889, 6, 1.20750000, 117.86222220, 'Genangan', '1', 4, 8, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/z6ovgQ6oXrmbI5CJCYe05VQO5gC8hCmd9dzpkqix.jpg', 'monitoring/3RuIspuHeC86llWXr3lA4PxHaWMw0QWOi8Nw7T1V.jpg', NULL, 3, 2, 1, 0, 1, 2, 1.80, '2026-02-03 06:19:29', '2026-02-03 06:19:29'),
(241, '2026-02-03', 889, 6, 1.23833333, 117.84055560, 'Genangan', '1', 6, 11, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/IxNibjjrHoPPAoulGIbHYq0x46QqAiIopmSltjyF.jpg', 'monitoring/aqNSHEcRXp1EyxajWWnL5B6uYDqKJAnJR3k8Nbk4.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-02-03 06:21:06', '2026-02-03 06:21:06'),
(244, '2026-02-04', 888, 6, 1.24111111, 117.84388890, 'Genangan', NULL, 6, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/M7qJsvtQHtyiI07cEisn5PSe0Oey7qk7pQ2sZdHZ.jpg', 'monitoring/2cso0uWM64Di29jDzNUEKWgYW8hP10Lz97LfP22z.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-04 04:44:53', '2026-02-04 04:44:53'),
(245, '2026-02-04', 888, 6, 1.24055556, 117.84361110, 'Genangan', NULL, 5, 9, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Rbsj6EU7YvfHZeuCiFw5gh9Jd0ABRMCG8IcBM3ez.jpg', 'monitoring/5eCeTzYqz256X1wyLuYGU4ZNUqjsSz2JOUpdBQQ1.jpg', NULL, 3, 2, 1, 0, 1, 2, 1.80, '2026-02-04 04:46:18', '2026-02-04 04:46:18'),
(246, '2026-02-04', 888, 6, 1.24027778, 117.84333330, 'Genangan', NULL, 1, 9, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/daaC9wc3QQKC9yXK2dM8oR0BgksB9klyxA1trLWF.jpg', NULL, NULL, 3, 2, 2, 0, 2, 3, 2.40, '2026-02-04 04:47:22', '2026-02-04 04:47:22'),
(247, '2026-02-04', 888, 6, 1.24000000, 117.84305560, 'Genangan', NULL, 2, 13, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/IJ7NO7ver4suZRp57W9WI8Xka0yvrL6lTD4PgZyM.jpg', NULL, NULL, 3, 2, 2, 0, 2, 3, 2.40, '2026-02-04 04:49:00', '2026-02-04 04:49:00'),
(248, '2026-02-04', 888, 6, 1.24000000, 117.84277780, 'Genangan', NULL, 2, 16, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/SCTJCTV828PS0SegMR6jafBpHSkzfHfen0hIq0qb.jpg', NULL, NULL, 3, 2, 2, 0, 2, 3, 2.40, '2026-02-04 04:50:44', '2026-02-04 04:50:44'),
(249, '2026-02-04', 888, 6, 1.23972222, 117.84250000, 'Genangan', NULL, 3, 19, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/YEaPiMSvFRktvElotAPpnjJNcepVQbXBqqfyZnRn.jpg', NULL, NULL, 3, 2, 2, 0, 2, 3, 2.40, '2026-02-04 04:51:55', '2026-02-04 04:51:55'),
(250, '2026-02-04', 888, 6, 1.24083333, 117.84277780, 'Genangan', NULL, 2, 7, '1-2 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Sd5ZhctiMHtMzQ8W6fVl5CbKloYtDuPPejeZapLa.jpg', 'monitoring/prPBhlpLRi8D8aG8Ne5Fsvrz4gLuG2c3ScxlqntV.jpg', NULL, 3, 2, 2, 0, 1, 2, 2.00, '2026-02-04 04:53:16', '2026-02-04 04:53:16'),
(251, '2026-02-04', 889, 6, 1.24083333, 117.84277780, 'Genangan', NULL, 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/VNCmHlaGx40RJkNftqi0vHzKhbWIvXe5uyoV9Gkw.jpg', 'monitoring/rCcVvqK0qMKERRLnMH0qW6war1j8rMutLSTL8Xbb.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-04 04:54:24', '2026-02-04 04:54:24'),
(252, '2026-02-04', 888, 6, 1.24083333, 117.84027780, 'Genangan', NULL, 10, 5, '>3 Hari', NULL, 'Hujan Tinggi', 'Eksekusi Rutin', 'monitoring/aUFaFU5upvnIg38CyNHIKN0Ljn0gXWO9FLZ4cmCm.jpg', 'monitoring/EGsuuv18P4RaeV4pEFP1ZZrQezVtVgdZ4rrx3kaO.jpg', NULL, 2, 3, 1, 0, 2, 2, 2.00, '2026-02-04 04:55:47', '2026-02-04 04:55:47'),
(253, '2026-02-04', 888, 6, 1.24083333, 117.84027780, 'Genangan', NULL, 14, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/vRrGdie4UGIYhmR1KclWKZt4Eqwmsx08VTLrXuPh.jpg', 'monitoring/oUM8tqafrFOphpADF3MWbqth19g5S4I9By7HNRPC.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-04 04:57:11', '2026-02-04 04:57:11'),
(254, '2026-02-05', 888, 6, 1.24108450, 117.84560600, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/WrrXLHjklHmcI1zxgZ4RBE65HUfUz8ywc6vcLH04.jpg', 'monitoring/mat8xMzFQWGlN4RSqDDLgJ8owtZ3C0fbQVu5J7mO.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-04 19:13:23', '2026-02-04 19:13:23'),
(255, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/AnCacotO6fX6O9rjPipX7DojYpNTT3oKszXysMN6.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:19:39', '2026-02-05 01:19:39'),
(256, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 25, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/V8FXaTObHmf1OjviQ9spu6VLhUZIldzNVnI8rfW4.jpg', 'monitoring/pusyIZ4Fm6eJ8KiibgSr4RziogqzY4m5q16kragS.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-05 01:19:49', '2026-02-05 01:19:49'),
(257, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/W86mImp6TfHdLppdgpsSSMyOu5bv0plMMKCSOdtw.jpg', 'monitoring/sfygNi9YvgLUFn5ocHqyyW0wDPQruahrRovEM6cn.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-05 01:19:59', '2026-02-05 01:19:59'),
(258, '2026-02-05', 888, 6, 1.21687670, 117.80934460, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/AKp1FTkqWT0d3WMJ74Xtvs0p7su5MaaPJJvcAvqr.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:20:03', '2026-02-05 01:20:03'),
(259, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/WKgCF7EyFVlEu34Rx28fILcHn10ngtKK9g6JHXN2.jpg', 'monitoring/fvU7drJxPvU9Ga8SDaP1aEq0G2rLjfvqWa3AqEWM.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:20:12', '2026-02-05 01:20:12'),
(260, '2026-02-05', 888, 6, 1.24118000, 117.84739330, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ME66Z8LKJBLFAAlh1Ozv1SRjal6ixMX86RqTA7gU.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:20:41', '2026-02-05 01:20:41'),
(261, '2026-02-05', 888, 6, 1.24122170, 117.84685670, 'Genangan', '0', 7, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/4Iu19h45VaS69uyRjOWRdW4lWizFnuY5iXwWAOxy.jpg', 'monitoring/2SVqCZe5FvUFq8Y2JyF4wFL1AOn1DinpdiI2ZTVr.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:21:41', '2026-02-05 01:21:41'),
(262, '2026-02-05', 888, 6, 1.17259150, 117.71296200, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/7ZZYRvCRe4qZbqJz8HJAq06MJ13TteBSFoRYWzvO.jpg', 'monitoring/8ASurkpUnMuHSkU7RKF0OEMAw39hWICFt6zJDgBj.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-05 01:22:36', '2026-02-05 01:22:36'),
(263, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 5, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/qNhaALkzwJLtS9jzVUO8pDtKIzsEDEkbKWGpTzcf.jpg', 'monitoring/Cf3PsdU0KcKFeoczSfBrtfaiVsN6KhGzfmFfVlqq.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-05 01:22:49', '2026-02-05 01:22:49'),
(264, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 1, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/KlnSDdM2MSjsIxv4RDsorVosRetGGUwMLSOZH8BV.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:22:54', '2026-02-05 01:22:54'),
(265, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 1, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/xGNfgiGg9QVISLtoMPjjy2jVmV5TqHOCa4aJmwLf.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:22:58', '2026-02-05 01:22:58'),
(266, '2026-02-05', 888, 6, NULL, NULL, 'Genangan', '0', NULL, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/gYnKOCg8cJNOgqxDZSwJeDFqqlsrdVePQTYFJ3qF.jpg', NULL, NULL, 0, 3, 2, 0, 2, 3, 2.50, '2026-02-05 01:23:03', '2026-02-05 01:23:03'),
(267, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 7, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ZHNmNXaKg7NkkwTP9o88wVYLrsX484hCGPYU3RBn.jpg', 'monitoring/e9ACgNbJBCYpOyTGbZozSHUyeU5lgN4bXUWOwSuq.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:23:13', '2026-02-05 01:23:13'),
(268, '2026-02-05', 888, 6, 1.24063520, 117.84932190, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/oTyfNE7UcIRba9AbjVPCRD87nvFw0IqY8Wf8htFB.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:26:01', '2026-02-05 01:26:01'),
(269, '2026-02-05', 888, 6, 1.24074900, 117.84947810, 'Genangan', '0', 25, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/uzgxsibkG28PfGLYtk0y5jLQxznZvtLHbhpUafbc.jpg', 'monitoring/xTezfwDiaacArzocgeW1OhZHFhV2b8AEZcjS2I8q.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-05 01:26:06', '2026-02-05 01:26:06'),
(270, '2026-02-05', 888, 6, 1.19126520, 117.83462290, 'Genangan', NULL, 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/QubVCYlcKeTnnP3zGNapu1qxDdmf64RDRMbliEa6.jpg', 'monitoring/5NIgBz4SNwsdAFtFvPHYFTszEImbPI7M52wa2DUN.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-05 01:26:10', '2026-02-05 01:26:10'),
(271, '2026-02-05', 888, 6, NULL, NULL, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/7S9Ag7xHIGRStxrXO74EAAKyytl5ddnGZz3JY3a2.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:26:13', '2026-02-05 01:26:13'),
(272, '2026-02-05', 888, 6, 1.20395640, 117.81996920, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Y7pr6paplBEvvtUGaFBA1Ef13AGpCylzAjaYHAQd.jpg', 'monitoring/DDuInKlHGkmguGErIWVRm4i9XsB1HhrcN60JyvMQ.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:26:17', '2026-02-05 01:26:17'),
(273, '2026-02-05', 888, 6, NULL, NULL, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ei0AWxQyTzJ6WT9FUymD5KH1esyxfHeGEuVetc3W.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:26:19', '2026-02-05 01:26:19'),
(274, '2026-02-05', 888, 6, NULL, NULL, 'Genangan', '9', 7, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/wcLh2ZQikhD6GmEMhh8vY41Ft5GA09aqxZfE2zC3.jpg', 'monitoring/pX2dpNdVt1BngX9VNV4zL1sienvVsFTr6ke92CYC.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:26:24', '2026-02-05 01:26:24'),
(275, '2026-02-05', 888, 6, 1.24123760, 117.84524540, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fAeUlk1EQeOxetTxISUaUppAQpGcQTXWIDW0iSUe.jpg', 'monitoring/J9arJINAdYcM5WTSgXkRWRqcASs5Y3FfCd9LqmeG.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-05 01:26:29', '2026-02-05 01:26:29'),
(276, '2026-02-05', 888, 6, 1.24134340, 117.84492710, 'Genangan', NULL, 1, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/RLRV4d5pOtbdD3BxtbN6ifpK2sGHQevG47HUaNiA.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-05 01:26:31', '2026-02-05 01:26:31'),
(277, '2026-02-05', 888, 6, 1.17158780, 117.70709680, 'Genangan', NULL, 7, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Uht0WE3BFbXM2GCIJLcc76Xp8WUU3t5utIeHHh2h.jpg', 'monitoring/Ju6BC1wpgHgPaHxJ0DGVRQmOHevNowTCUfc5BtXj.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-05 01:26:37', '2026-02-05 01:26:37'),
(278, '2026-02-07', 888, 6, 1.24114280, 117.84898140, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/9ZW1PQgYEeqCXILBWuTcpJSkr2QJg5Gh4jD5QWoV.jpg', 'monitoring/eQeK0I5I1519QxvljAsYYC22kY6kBIXpYJSyWBEe.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-07 01:55:40', '2026-02-07 01:55:40'),
(279, '2026-02-07', 888, 6, 1.24037520, 117.84914540, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/fCTetZEWQTgM7xMdgCdVrrVkJKUtv4bD05IrVdb6.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 01:55:49', '2026-02-07 01:55:49'),
(280, '2026-02-07', 888, 6, 1.24120280, 117.84835320, 'Genangan', '0', 11, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/MNkOcNCziwAgA7oQZmYQx9N9Q4wk2RhNdzFgO4WZ.jpg', 'monitoring/5QPV9a0O1ne5FXEdLXKQsyQ0h40dNUgy0UK1cA5p.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 01:56:04', '2026-02-07 01:56:04'),
(281, '2026-02-07', 888, 6, 1.24146420, 117.84792120, 'Parit', '0', 5, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/0bIa3nqf9wkJS5tvy0PTkVdRbMQEENT0mNOFdGZD.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-07 01:56:11', '2026-02-07 01:56:11'),
(282, '2026-02-07', 888, 6, 1.24127650, 117.84780040, 'Genangan', '0', 17, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/4BZebjNQ4WxdY23ocg79D4Z6h3BwVUDIdTmXwVmh.jpg', 'monitoring/Qqf6Ksi2YUYKr86eWNoZ7V9PASz8BUTTRVeZkSU9.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-07 01:56:30', '2026-02-07 01:56:30'),
(283, '2026-02-07', 888, 6, 1.24143970, 117.84744910, 'Genangan', '0', 1, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ZvuM0YT6tOi0UKm5vVqaHWsreneH91QbMqaPQTcA.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 01:56:36', '2026-02-07 01:56:36'),
(284, '2026-02-07', 888, 6, 1.24150380, 117.84742100, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/3dNS2jLKjdwfrANrlWjoSrcUDDEsy5byCRA8eax7.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 01:56:40', '2026-02-07 01:56:40'),
(285, '2026-02-07', 888, 6, 1.24152150, 117.84736980, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Vo7uxFqtDLvpLwgKzXG5l8Y6dZOcfG0hsBR0nng6.jpg', 'monitoring/4M1bPYy4ObhEbsMBo1JGKqFyrMGcPslBKeYSR7Kq.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 01:56:54', '2026-02-07 01:56:54'),
(286, '2026-02-07', 888, 6, 1.24154130, 117.84751690, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ELYM2ogg5d2cKj3wXRZhWuSVL9Wo3IVOIapSv51e.jpg', 'monitoring/RLfCmMgMn01iZChICxS0cuMoHiY0DFOOyGZt2xId.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 01:57:07', '2026-02-07 01:57:07'),
(287, '2026-02-07', 888, 6, 1.24177040, 117.84758840, 'Genangan', '0', 5, 1, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/lRyg0aKOEkl95ebwBgihRll5pctaxta4nFfGtEc6.jpg', 'monitoring/oz3iff7RcMCWqnlCWmMn6PXiAyGSiDKOyArkXX6v.jpg', NULL, 3, 3, 1, 0, 0, 2, 2.25, '2026-02-07 01:57:18', '2026-02-07 01:57:18'),
(288, '2026-02-07', 888, 6, 1.24168680, 117.84606870, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Gk34QGHUHD0xoU19Cd0pf4V3OPXEcw7SQyhI0AqS.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 01:57:27', '2026-02-07 01:57:27'),
(289, '2026-02-07', 888, 6, 1.21739650, 117.88187300, 'Genangan', '0', 12, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Xt0z6nNq4A6tqjbQmBZ7dq1kjDfPiFRa6iWIR3Bf.jpg', 'monitoring/vAjxxe1hDkzGH0gewGFww8pUPTSvupSMVZEzkMLl.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 01:57:39', '2026-02-07 01:57:39'),
(290, '2026-02-07', 888, 6, 1.19126920, 117.83425660, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/nDysT8e27Gl44zBHcKLvxBKmGQ6tkHZXvUMuFL9H.jpg', 'monitoring/518U60FYp6NgBgxkp0j6fcNGjQ9rzX5HS8Mxp3Ov.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-07 03:43:30', '2026-02-07 03:43:30'),
(291, '2026-02-07', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/o2tc9GHqPcgCk3Ve9xdcVvyY3MhnlkATGeFYBDKg.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 03:43:32', '2026-02-07 03:43:32'),
(292, '2026-02-07', 888, 6, 1.19126520, 117.83462290, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/733Q2ZF1ndieeUsingIcL5VFXw43vlcUOOzMXr3F.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 03:47:37', '2026-02-07 03:47:37'),
(293, '2026-02-07', 888, 6, 1.24128830, 117.84781830, 'Genangan', '0', 11, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/TGKj9xDEd9fhP1Z5OeLsmPA51uNHbq6AXrJQqCi4.jpg', 'monitoring/mmPzqi5rwUILXIdgChqtbHwV3AxUzzIJkdQimJ3g.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 03:47:40', '2026-02-07 03:47:40'),
(294, '2026-02-07', 888, 6, 1.24128830, 117.84781830, 'Parit', '0', 5, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/DH39UkNJ5eXURN6UExItmXcwrdZBdkoDjh3BZhhd.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-07 03:47:42', '2026-02-07 03:47:42'),
(295, '2026-02-07', 888, 6, 1.24135670, 117.84759170, 'Genangan', '0', 17, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/RjfOZcyOIB2zReaXNAVKicGOIgZyxI8M4s2Jrd6Q.jpg', 'monitoring/x4jyaG8gTyIDtx8cTLKuMWcVao2j97mwTXSxH8c2.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-07 03:47:46', '2026-02-07 03:47:46'),
(296, '2026-02-07', 888, 6, 1.24150830, 117.84760000, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Cy1N1CBXdnWjHI74rOTRpK9tbkZ19VELmEeNcZF9.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 03:47:47', '2026-02-07 03:47:47'),
(297, '2026-02-07', 888, 6, 1.24150830, 117.84760000, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/vtJk1RKAHv7rXuFrt11h0cjRX5pQyMTr11Eo9eFP.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 03:49:13', '2026-02-07 03:49:13'),
(298, '2026-02-07', 888, 6, 1.24150830, 117.84760000, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Z4awhX3RATVaF3cxk2BdcnJR06pWxbI4vrd4vAQh.jpg', 'monitoring/FZB3WJey6T2k8ooE82hJsdqhf8YtXGkKHOuyBka4.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 03:49:29', '2026-02-07 03:49:29'),
(299, '2026-02-07', 888, 6, 1.24150830, 117.84760000, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/461LWdAXXycvvNvQrrfihtht2RfP8DrrcymZAxkR.jpg', 'monitoring/LNbzcuyvHxRqhNLHY1W5VyeVWXl5ly6M39y5P0So.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 03:50:19', '2026-02-07 03:50:19'),
(300, '2026-02-07', 888, 6, 1.24159670, 117.84591500, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/xb3EXUNcCMU7mU6t8czRRorVujcdUaufIoL9nYWC.jpg', 'monitoring/OLgxpTYU5IOwpl0qMmeAr37nXtPuP6vEvZaOelPo.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-07 03:50:21', '2026-02-07 03:50:21'),
(301, '2026-02-07', 888, 6, 1.24159670, 117.84591500, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Xzk8lGOUq4MOWlLFvA6qfwUDXrDl6R1QdwBc8yrk.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-07 03:50:22', '2026-02-07 03:50:22'),
(302, '2026-02-07', 888, 6, 1.24159670, 117.84591500, 'Genangan', '0', 12, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/YsZ6haJjZjvdCx9x9VYTbCuSHV4je7ELvh6ZkS4V.jpg', 'monitoring/RQSRUCaZklZbyuJ0Bi5VIgTM2P5mGGSv4y0XAwCv.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-07 03:50:23', '2026-02-07 03:50:23'),
(304, '2026-02-09', 887, 6, 1.24216830, 117.84769330, 'Genangan', '0', 9, 1, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/rHZjTjtkX2TxzNX8lRlwc7jr4RYoUkOpedh2GIYj.jpg', 'monitoring/sFgNmQxmE6whEzr81Hy1683xBtmVI3MipB8NY5GP.jpg', NULL, 2, 3, 1, 0, 0, 2, 2.00, '2026-02-09 02:21:14', '2026-02-09 02:21:14'),
(305, '2026-02-09', 887, 6, 1.24246830, 117.84817670, 'Parit', '0', 6, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/jKQzYdNc3pM2rkGIRZeqITKmnScGeoViHAdFA37x.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 02:21:24', '2026-02-09 02:21:24'),
(306, '2026-02-09', 887, 6, 1.24361830, 117.84908830, 'Parit', '0', 10, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/di06A4zHmCiYA1QzAMbdNJPjeW85rovatnJbC68y.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 02:21:37', '2026-02-09 02:21:37'),
(307, '2026-02-09', 887, 6, 1.24398830, 117.84928170, 'Genangan', '0', 20, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/FdAoZslp9tgGQkHbQjjiupxo0gs1TzSZJhIVw4M7.jpg', 'monitoring/MeNhDqnehpRx6uE42YuGWSe7aAPaFk3bFJxd1vWn.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-09 02:22:42', '2026-02-09 02:22:42'),
(308, '2026-02-09', 887, 6, 1.24328500, 117.84758000, 'Genangan', '0', 8, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/cUoXufSakH9iger45UWO5NegszIP8OQ2WFzRpS9N.jpg', 'monitoring/ehYapnr6X98QcMhH2nfl4LinqcSY7dBThv4CEekR.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 02:23:34', '2026-02-09 02:23:34'),
(309, '2026-02-09', 887, 6, 1.24374000, 117.84647170, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/jXOlR14pyb7O2JhPnMOCu7AJYQRelhJdicDsg9Dv.jpg', 'monitoring/ZzP6JO9XkLgPjGMZFgAk9GVNZZPvJF4aWenCVrwc.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-09 02:24:13', '2026-02-09 02:24:13'),
(310, '2026-02-09', 887, 6, 1.24366830, 117.84546000, 'Genangan', '0', 9, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/EYlap4CpqUsieyxt5eBvI6dPEFEDdK1usb9Z1ny7.jpg', 'monitoring/lyaLJi3EUXGOz0rSxp7iTtVg90KB4EsV7xjN99bv.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 02:24:59', '2026-02-09 02:24:59'),
(311, '2026-02-09', 887, 6, 1.24370500, 117.84520170, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/vdi3ymj1vLUwVSSMAAmUeJDumKxBt5qPP7s8hWLo.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-09 02:25:17', '2026-02-09 02:25:17'),
(312, '2026-02-09', 887, 6, 1.24252170, 117.84139830, 'Parit', '0', 4, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/HECz0WhthvJBbJ0lhgPjmoV4M0EOfyV6uRCKuGjE.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 02:25:32', '2026-02-09 02:25:32'),
(313, '2026-02-09', 887, 6, 1.24251670, 117.84126000, 'Genangan', '0', 13, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/spgNI19dBmXdH9fRFy2DFZqA8f8MRobUDSh7qLjS.jpg', 'monitoring/UmZf9DNy8nvQWF5tDtDyrxbcBZ1QXNUPBQ18pEkP.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 02:26:13', '2026-02-09 02:26:13'),
(314, '2026-02-09', 887, 6, 1.24254000, 117.84110830, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/b6m55PEfELtMHbjFR8weyibQtp9Umn27OCoknc1z.jpg', 'monitoring/EMWJ4sQQhasMxf8MMbGpgXzlnpYFH9ybK3E8joWY.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 02:26:49', '2026-02-09 02:26:49'),
(315, '2026-02-09', 887, 6, 1.24314670, 117.84074830, 'Parit', '0', 5, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/2ORoFjVan8ossIw11kUuvWVOUHZx5aVFOOm0WoD3.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 02:28:46', '2026-02-09 02:28:46'),
(316, '2026-02-09', 887, 6, 1.24209210, 117.84776810, 'Genangan', '0', 9, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/YJa9h3abwlp8qBjBNlWUFht83hQD6xlZDrimJiui.jpg', 'monitoring/dgd9fk3qOAgo1d1REuaLLIUlxghJSTC5pYBN9y2T.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 16:27:50', '2026-02-09 16:27:50'),
(317, '2026-02-09', 887, 6, 1.20388570, 117.85037430, 'Parit', '0', 6, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/crnjgBcl0kuJFpzfBgK9CKTmpgGDjN8a4HNVwuAD.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 16:27:51', '2026-02-09 16:27:51'),
(318, '2026-02-09', 887, 6, 1.24367700, 117.84917390, 'Parit', '0', 10, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/vZncKU0C2v2O8ja2dQxoWjFobn71oZWvN20ckTzl.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 16:27:52', '2026-02-09 16:27:52'),
(319, '2026-02-09', 887, 6, 1.24418300, 117.84420030, 'Genangan', '0', 20, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/GS8hBzqS9jBd7qnlQ9QjBQ2G29jzAtEVmUE1ceii.jpg', 'monitoring/c4S84i1oXZMR2a1AyuTtl6uap6Qu9sw2mgcuWH3N.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-09 16:27:53', '2026-02-09 16:27:53'),
(320, '2026-02-09', 887, 6, 1.24360560, 117.84552980, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/32LtQyRbowNf7dxHAsLVdkhsCHjzDRNPjJ9qTG2P.jpg', 'monitoring/3mlr4xTOSlJmMkZDZMjxxTmvKaH8jHkLaM5lp6v5.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-09 16:27:54', '2026-02-09 16:27:54'),
(321, '2026-02-09', 887, 6, 1.24370600, 117.84516760, 'Genangan', '0', 9, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/umZJMqe4TbMNh9XKZn5r4Jt1StvPGH1RhsIdVGA3.jpg', 'monitoring/mg0QJARMzvODWXcRYzU3QyROg3TUw5OqECojMpTz.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 16:27:56', '2026-02-09 16:27:56'),
(322, '2026-02-09', 887, 6, 1.24364660, 117.84380230, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/VEd9H51RSG22CaPrWwGbtaCjr5wreA1law0w4GSW.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-09 16:27:58', '2026-02-09 16:27:58'),
(323, '2026-02-09', 887, 6, 1.24258010, 117.84139230, 'Parit', '0', 4, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/m0UprB5edQvP5bvZ7WBvAFWvhTmYfAo7QSdXJihl.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 16:27:59', '2026-02-09 16:27:59'),
(324, '2026-02-09', 887, 6, 1.24252110, 117.84111570, 'Genangan', '0', 13, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/jmVIxYEV0Ydq39h0yiBMVGdg8KQN8iALQMklN8L6.jpg', 'monitoring/akIbSEuu8he6OC8oTKyh9t4VHZo1AaXAZU3hxZ8T.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 16:28:00', '2026-02-09 16:28:00'),
(325, '2026-02-09', 887, 6, 1.23059450, 117.84671130, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/GcLGASuGUUhkozFZ6Hp9HXUgrCSpECAySjqy7joT.jpg', 'monitoring/SkCR4vtdgmyqeMyyfNNXjAF0HFSrvCIk3wueoU17.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-09 16:28:01', '2026-02-09 16:28:01'),
(326, '2026-02-09', 887, 6, 1.23059450, 117.84671130, 'Parit', '0', 5, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/phiaVMDSD1hCMDVLOj5UVQFG1L3FrEfEgFUQczd8.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-09 16:28:02', '2026-02-09 16:28:02'),
(327, '2026-02-10', 886, 6, 1.24680690, 117.85031230, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/f9ovuZIrnIuIfxFfHOTKDvGvzMBFe1TXE4ZFHIIK.jpg', 'monitoring/L4rwzJDvZyX8pj54HBJGVC7e0q8TnFztMINr9S4k.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-10 02:11:56', '2026-02-10 02:11:56'),
(328, '2026-02-10', 886, 6, 1.24680690, 117.85031230, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/bM70U9P0x3zU6uU9z3SRbbWHHU6WPX3Q8hB4SK48.jpg', 'monitoring/dzu8j5003KuHQ5gYjY3sToXj9v1fr5N0pbpuh9vY.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-10 02:14:23', '2026-02-10 02:14:23'),
(329, '2026-02-10', 886, 6, 1.24426670, 117.84238830, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/6mAZIwjPdy0MvMX9Mxx471CFN7xQo7arJchRfp6r.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:14:43', '2026-02-10 02:14:43'),
(330, '2026-02-10', 886, 6, 1.24426670, 117.84238830, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/mEWmXZhoLREHPGVzJMJluLSmidpqsLkowwH2xURR.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:14:49', '2026-02-10 02:14:49'),
(331, '2026-02-10', 886, 6, 1.24426670, 117.84238830, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/TKlyps0mq6vcclmEOHzuc2GllvHf6FC0TbPzYWHO.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:15:07', '2026-02-10 02:15:07'),
(332, '2026-02-10', 886, 6, 1.24426670, 117.84238830, 'Parit', '0', 17, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/ofW5TlrvDKHPkK3OiEFll06iTCuYb4rhDubV9yeI.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-10 02:15:27', '2026-02-10 02:15:27'),
(333, '2026-02-10', 887, 6, 1.24321170, 117.84570670, 'Parit', '0', 4, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/WpbqzZNgTWfxdymHBXGph2bVgzERg8mzU0g1lGHg.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-10 02:15:42', '2026-02-10 02:15:42'),
(334, '2026-02-10', 887, 6, 1.24325000, 117.84579670, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/kxIrJ7RlrYh4ukKFZMelujBNgrhb2FBlVHzXlFVv.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:16:02', '2026-02-10 02:16:02'),
(335, '2026-02-10', 887, 6, 1.24325000, 117.84579670, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/5PbrikcqGzWEitWLSovIfmlmvci25KnWT2JObuwC.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:16:21', '2026-02-10 02:16:21'),
(336, '2026-02-10', 887, 6, 1.24210500, 117.84490500, 'Genangan', '0', 6, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/2OJqmcC58PMXsI3RldknX90Ia673oZAVSp6SA9H8.jpg', 'monitoring/LASMFRFR5HuPstfRXl52nooGyWMskOO6iaGexDbN.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-10 02:17:00', '2026-02-10 02:17:00'),
(337, '2026-02-10', 887, 6, 1.24262500, 117.84546170, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/drs5hrhg3UVQ2uDYsxMbxdwp7zTo9FklAZ9yiu1n.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:17:28', '2026-02-10 02:17:28'),
(338, '2026-02-10', 887, 6, 1.24262500, 117.84546170, 'Genangan', '0', 57, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ArMlVMPS1FL5KWimg9LAZmzdEW0u5OG6sPgg6txL.jpg', 'monitoring/OyGriqbRpWDqr3cLgk5WQOE6aDsfZQrfHhexKXC8.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-10 02:25:18', '2026-02-10 02:25:18'),
(339, '2026-02-10', 887, 6, 1.23650530, 117.86649060, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/3UI8F73wksmh7Ck4I8J2vlXfIVo3tdnBWScdfXaO.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 02:25:24', '2026-02-10 02:25:24'),
(340, '2026-02-10', 887, 6, 1.24243500, 117.84571830, 'Genangan', '0', 8, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/U1nLI3lXGgoxqntx3ozJFKEBgafXyO866lHZOBe0.jpg', 'monitoring/bYCZxGXpKjHI2hwxBuuT8fvBT6K2xCaMaMqD91ac.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-10 02:25:45', '2026-02-10 02:25:45'),
(341, '2026-02-10', 886, 6, 1.24676930, 117.85027720, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/qbFuomTZZWLfjl9wv2IIaVhGECcPxuCAddtD1fis.jpg', 'monitoring/BbaqGDqrMA7Koi0MoF44SL0mSEexzDwauzQaykmd.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-10 03:39:46', '2026-02-10 03:39:46'),
(342, '2026-02-10', 886, 6, 1.24444240, 117.84255350, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/icuxh3cAoeMnV21edOhKZ11ljVOwnqbSoKYOWS4c.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 03:39:50', '2026-02-10 03:39:50'),
(343, '2026-02-10', 886, 6, 1.24443140, 117.84241970, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/a9rbpJyRwC6BHyVVVU8Yq24J01OU7mk7KPZL0Ibs.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 03:39:53', '2026-02-10 03:39:53'),
(344, '2026-02-10', 886, 6, 1.24425110, 117.84237510, 'Parit', '0', 17, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/Crn1PGHAIvcNM6OKhfisAePh4fe4cC2NQV6rQRbr.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-10 03:39:56', '2026-02-10 03:39:56'),
(345, '2026-02-10', 887, 6, 1.24314740, 117.84577610, 'Parit', '0', 4, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/vPXanSzSQFOQZozWZAMFWpULvnAdRROIJl5T9Gxu.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-10 03:40:12', '2026-02-10 03:40:12'),
(346, '2026-02-10', 887, 6, 1.23753550, 117.84634500, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/OWHTOGqkpcAMkLwFGNpTeWAEE5G7ZiSUKfnaFgTK.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-10 03:40:52', '2026-02-10 03:40:52'),
(347, '2026-02-11', 899, 6, 1.23128780, 117.78552850, 'Genangan', '0', 5, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Qt3oS4YjvhHSIkmnm9G8Znk00Rw0Acd2z8nmjK4V.jpg', 'monitoring/yfdXe6G0K8B4W6ONUzgolrNu2QLCx8RTJmF4v3TC.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-11 00:31:43', '2026-02-11 00:31:43'),
(348, '2026-02-11', 899, 6, 1.23269330, 117.85709420, 'Genangan', '0', 11, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/xZe5wy2ahUZxkIoTqjMIzzSCoSV8sfydA05PDJlB.jpg', 'monitoring/8tGmMfxTuGjqaxQvxkpU2ZsYlBZDydpIsypqn1A6.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 00:32:00', '2026-02-11 00:32:00'),
(349, '2026-02-11', 899, 6, 1.23254360, 117.85742330, 'Genangan', '0', 2, 3, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/QBpoXrXqLCLX1Gq8NPxjwOhOaA31HizF2pjBbUbk.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-11 00:32:08', '2026-02-11 00:32:08'),
(350, '2026-02-11', 899, 6, 1.23128780, 117.78552850, 'Genangan', '0', 6, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ndUSl5WCrjsZI4tPv5j4rD3AFELMr9SWy0Qrhlbl.jpg', 'monitoring/PGam5hqwmhS4FwKrSscu8cJ1pxbFK1Y5thdXjzEf.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 00:41:54', '2026-02-11 00:41:54'),
(351, '2026-02-11', 899, 6, 1.23247930, 117.85754760, 'Genangan', '0', 15, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/0i4B1Ut8gnxAx1Z7gkWvGHWyfRwuJb4SRH7I0AXw.jpg', 'monitoring/xjrdreh3ziEn7tKMocL2JiHudIRvNjJlyFPOIoic.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 00:42:35', '2026-02-11 00:42:35'),
(352, '2026-02-11', 899, 6, 1.23128780, 117.78552850, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/NSs4nyjyWbK6d6D3ECjS4yZZGJftJF2MZnhekaiv.jpg', 'monitoring/C1SQ4fKsqgXIPi9xjV88lYPBD01gbGKooAUNagXQ.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 00:46:33', '2026-02-11 00:46:33'),
(353, '2026-02-11', 886, 6, 1.24620160, 117.84554050, 'Parit', '0', 23, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/8HOhdMBXDgzE9GPuHysqDN0h7x31FEf0bOlgH13k.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 00:46:37', '2026-02-11 00:46:37'),
(354, '2026-02-11', 886, 6, 1.23105540, 117.80604710, 'Genangan', '0', 10, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/wNxmfyuAy448BCkvYXXS2uSDDzFfNkPwdSsDgBjC.jpg', 'monitoring/9pWaT714TDajGDOt4yIzGZwpGoe0XVbOax3bVcVQ.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 00:46:45', '2026-02-11 00:46:45'),
(355, '2026-02-11', 886, 6, 1.24537150, 117.84427290, 'Parit', '0', 25, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/2eoAcOwqdnK6zBNFJeaZs9zE12gNn6o7RVSzVX9w.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 00:46:49', '2026-02-11 00:46:49'),
(356, '2026-02-11', 886, 6, 1.24639650, 117.84391720, 'Parit', '0', 20, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/K3yiqKKITg8C2T83zMcTzbOXltr2r6jN8DXxjXpb.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-11 00:46:52', '2026-02-11 00:46:52'),
(357, '2026-02-11', 886, 6, 1.22436180, 117.87894310, 'Parit', '0', 40, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/VJBBpR68fgcDxXy27Ggl3DAh5sPTI8Lwqk6kG178.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 00:46:56', '2026-02-11 00:46:56'),
(358, '2026-02-11', 886, 6, 1.21872950, 117.88187300, 'Parit', '0', 35, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/NUEgDMIWQZOML86DgorKh1HavO444Tnkta7HUSDq.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 00:46:58', '2026-02-11 00:46:58'),
(359, '2026-02-11', 886, 6, 1.23139540, 117.87015320, 'Parit', '0', 40, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/rPXY8qaRIizyxW1PrLDPKNBWTgyi43wlLZqYpUQp.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 00:47:01', '2026-02-11 00:47:01'),
(360, '2026-02-11', 886, 6, 1.21661410, 117.80897820, 'Parit', '0', 8, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/myNdiEiaMvTIzSbkZIqId7FQ124gUxNG6AynwuQO.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 00:47:04', '2026-02-11 00:47:04'),
(361, '2026-02-11', 886, 6, 1.24619640, 117.84072210, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/s6WjXD6PmxEbCWNPYeNrmVjicv8HsJE02WIw53Nd.jpg', 'monitoring/47VKgcdbptQLSC8j5Y9hbvGKZteh9VOfN5uc8vBm.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-11 00:47:11', '2026-02-11 00:47:11'),
(362, '2026-02-11', 886, 6, 1.24649110, 117.84078660, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/iAY9Bg1N9kVYWa3vUNH208AFK16EWUTmTC8oBmYm.jpg', 'monitoring/BEzRgtMZ85iSkzRfGCSZEjKwS8FG71jD9NWlRr6M.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-11 00:47:18', '2026-02-11 00:47:18'),
(363, '2026-02-11', 886, 6, 1.24665310, 117.84065840, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/SNlFXEMuh7SGoLqZzbp7waLDlM1iDIMQhhFSVaC7.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-11 00:47:22', '2026-02-11 00:47:22'),
(364, '2026-02-11', 886, 6, 1.21661410, 117.80897820, 'Parit', '0', 20, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/vd1Q3lpwbM2h4QH1cnWK8YyLnF6b3qZqeziIixvn.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 00:47:25', '2026-02-11 00:47:25'),
(365, '2026-02-11', 899, 6, 1.23279330, 117.85660330, 'Genangan', '0', 5, 2, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/araIP6cWeHGJ5P5jzG17GVXLnaefkytWXS0ueJFq.jpg', 'monitoring/FRPf0gNYXwDXtmZ78OF6e0OCeKzVhzlJGmCjsNb7.jpg', NULL, 3, 3, 1, 0, 0, 2, 2.25, '2026-02-11 05:47:40', '2026-02-11 05:47:40'),
(366, '2026-02-11', 899, 6, 1.23284670, 117.85671500, 'Genangan', '0', 11, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/3OokWbbSorXAfdugPuMWnObHN6avqlOB54qqTE6T.jpg', 'monitoring/WOD5EfVgv4J18n9ho5Fje4aoW5Y87AFMyl9n39bN.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 05:48:22', '2026-02-11 05:48:22'),
(367, '2026-02-11', 899, 6, 1.23270000, 117.85713500, 'Genangan', '0', 2, 3, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/VTo803VgY7acBPZx6ZqHGwx0bWU7MrRUXWOgnGeQ.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-11 05:48:45', '2026-02-11 05:48:45'),
(368, '2026-02-11', 899, 6, 1.23253500, 117.85743330, 'Genangan', '0', 7, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/wq535y3ODrCHWc0razb1M4PHCEw09lIbtwdUzSDk.jpg', 'monitoring/mxSYWJpFVjGmcNZ4fJV6QvO0mqjQ89LNjePCBWy3.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 05:49:32', '2026-02-11 05:49:32'),
(369, '2026-02-11', 899, 6, 1.23238000, 117.85741500, 'Genangan', '0', 15, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/DrfI5kvtiVj95CoPID5Jxzf0AFbbqpbkRJWEfIq0.jpg', 'monitoring/ffu6hHounmLtzumI9x3cZYTAB1cixVnBMhHtE6qA.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 05:50:08', '2026-02-11 05:50:08'),
(370, '2026-02-11', 899, 6, 1.23234330, 117.85773000, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/jMFx0wY9f1FpJg9oztIgx033U0pz88BbbNYHDyaR.jpg', 'monitoring/nVD3OCSraLRWOepjwwuYs0EFEzrq53uwCLVEHlMu.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-11 05:50:45', '2026-02-11 05:50:45'),
(371, '2026-02-11', 886, 6, 1.24607830, 117.84552000, 'Parit', '0', 23, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/SsRWTyC87sPyzPicM6pfGaPYvfWlnsKF8wJuxJiY.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 05:51:05', '2026-02-11 05:51:05'),
(372, '2026-02-11', 886, 6, 1.24655500, 117.84494500, 'Genangan', '0', 10, 0, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/QfMGokBjufWONaoJEFpjpFNCHXmDcAntv3ScGYJe.jpg', 'monitoring/YGix9NdL2lykdOEapXHaSJ9spyZI7xURoLQpHZOI.jpg', NULL, 2, 3, 1, 0, 0, 2, 2.00, '2026-02-11 05:51:45', '2026-02-11 05:51:45'),
(373, '2026-02-11', 886, 6, 1.24542330, 117.84431500, 'Parit', '0', 25, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/nuvCo2gp2v9bUgzLNQpRyvT1fmaES5cRZEnmdjag.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 05:52:06', '2026-02-11 05:52:06'),
(374, '2026-02-11', 886, 6, 1.24649670, 117.84387170, 'Parit', '0', 20, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/e2J2dfCwbyrnCB8YteycIG2sryvfvdHYq3LMqn0x.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-11 05:52:26', '2026-02-11 05:52:26'),
(375, '2026-02-11', 886, 6, 1.24616670, 117.84308500, 'Parit', '0', 40, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/wn9F6v0fJi9C2LiUct4NZi386Yf8fQ0XFSDH2Og0.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 05:52:52', '2026-02-11 05:52:52'),
(376, '2026-02-11', 886, 6, 1.24657830, 117.84190330, 'Parit', '0', 35, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/VN6pbOkvKBKngMpoBUVxsB90KruL5lihBAQIGbOI.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 05:53:05', '2026-02-11 05:53:05'),
(377, '2026-02-11', 886, 6, 1.24555830, 117.84136670, 'Parit', '0', 40, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/FTgN5pZ0MHIRAlZHsb5PnqJScC9NaRDu0XZfRukB.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-11 05:53:21', '2026-02-11 05:53:21'),
(378, '2026-02-11', 886, 6, 1.24610170, 117.84103000, 'Parit', '0', 8, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/NCp2HmsrB1IrfWcXkUQrZKFp3HF495HTc0ZTzoVF.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 05:53:40', '2026-02-11 05:53:40'),
(379, '2026-02-11', 886, 6, 1.24614670, 117.84069830, 'Genangan', '0', 5, 1, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/Gh6MaXfpspa3C5nZ6FTnOFGmzfviWmq044J7mC9H.jpg', 'monitoring/WBTWwskFrIgToo4DE4edfvVmLDOSAey2a14HaFSt.jpg', NULL, 3, 3, 1, 0, 0, 2, 2.25, '2026-02-11 05:54:07', '2026-02-11 05:54:07'),
(380, '2026-02-11', 886, 6, 1.24612500, 117.84068330, 'Parit', '0', 5, NULL, NULL, 'Tidak Mengalir', 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/sz58LF7uvvCMnKhn3TuoCrELAFzVPSidD0KDernR.jpg', 'monitoring/2sGkaKE59A0egCRPEB2LSfd1fdh19ssP4oVFFx3r.jpg', NULL, 1, 0, 0, 1, 1, 2, 1.25, '2026-02-11 05:54:48', '2026-02-11 05:54:48'),
(381, '2026-02-11', 886, 6, 1.24651830, 117.84075670, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/MnH0l1xlX9PsTcZu3UJIQ6BmKWCTaeBInoQDJl33.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-11 05:55:13', '2026-02-11 05:55:13'),
(382, '2026-02-11', 886, 6, 1.24663170, 117.84062330, 'Parit', '0', 20, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/7lbxiHiJdOfzvmYzgvT2OeKPHBkiJtrPKBoVq7HA.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-11 05:55:34', '2026-02-11 05:55:34'),
(383, '2026-02-12', 899, 6, 1.23341550, 117.85610140, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/aKsC0BkzhpZbOJygkEeUPcgzlt5NITWu2g2GP7Gi.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 02:12:06', '2026-02-12 02:12:06'),
(384, '2026-02-12', 899, 6, 1.23059870, 117.84634500, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/lKn7WgloICiSdt3dPjidgJuCgiX9cvxw5VeBMo4N.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 02:13:03', '2026-02-12 02:13:03'),
(385, '2026-02-12', 899, 6, 1.23400210, 117.85462670, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/BMhI3PFmrsyyUI6XWTQaElCADMdKLOrd1HtXyqwa.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 02:13:47', '2026-02-12 02:13:47');
INSERT INTO `monitoring_harian` (`id`, `tanggal`, `id_lokasi`, `id_karyawan`, `lat_aktual`, `long_aktual`, `tipe_objek`, `nomor_jalur`, `kedalaman_cm`, `jumlah_pokok`, `durasi_genangan`, `kondisi_aliran`, `penyebab`, `tindakan`, `foto_path`, `foto_after`, `keterangan`, `skor_kedalaman`, `skor_jumlah_pokok`, `skor_durasi`, `skor_aliran`, `skor_penyebab`, `skor_tindakan`, `rata_rata_skor`, `created_at`, `updated_at`) VALUES
(386, '2026-02-12', 899, 6, 1.23390180, 117.85425000, 'Genangan', '0', 7, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/JVLlqOc4ioFSfvfwB49isxAJC608Uc2QBarIu5s1.jpg', 'monitoring/glwGrYc63zcJsi2wTwOCn6qj3jjosX5eWr317GFw.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:20:24', '2026-02-12 02:20:24'),
(387, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/Aeg54jS1Lq3JKqPpHJY27a8SMbeRhMSkFLoiP02W.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 02:21:42', '2026-02-12 02:21:42'),
(388, '2026-02-12', 899, 6, 1.23343750, 117.85337630, 'Genangan', '0', 18, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/WdDdzoYRJokDsRHHiu2aP8QG6YMDEWndDU5VbKUi.jpg', 'monitoring/5dc7C4dBVEiJjZCUq2ZCjDNtnmxtawLZuv2bZWhX.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-12 02:25:12', '2026-02-12 02:25:12'),
(389, '2026-02-12', 899, 6, 1.23304720, 117.85402040, 'Parit', '0', 10, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/vQmBWwOLY9yg0SUpy2w5Vus6esegNOFRIaq0Areh.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-12 02:26:42', '2026-02-12 02:26:42'),
(390, '2026-02-12', 899, 6, 1.23300670, 117.85508080, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/c2yr559GpoSMUDcQkx3E3aCs1KplnzYOEgoEt6ov.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 02:28:09', '2026-02-12 02:28:09'),
(391, '2026-02-12', 899, 6, 1.23268140, 117.85469910, 'Genangan', '0', 9, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/GV5NZbYTJxzd2W6iTvDwszQlfIM2o6bn7uB6wHN8.jpg', 'monitoring/MJackxAbF9aNFm1TFLnPsUy5Q6fjKSk4kMSc1Z2o.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:31:09', '2026-02-12 02:31:09'),
(392, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/ZwAOMKxIPmEMKEsZs1wVSpGkZOQ8WI1sjF4919ez.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 02:38:03', '2026-02-12 02:38:03'),
(393, '2026-02-12', 899, 6, 1.23271980, 117.85496500, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/yNOTa25bHOlcvRPIg5qfHsFfPfeYYzzSuBNMtMqL.jpg', 'monitoring/qGM68YN22kErZ36kCKtEGz1UK6sCg3OI7wAlWP4r.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:40:39', '2026-02-12 02:40:39'),
(394, '2026-02-12', 899, 6, 1.23240100, 117.85557390, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/NZjuFzF7S5FRBqA9tp9qpFYlPHOixI8oTdT5I31X.jpg', 'monitoring/rdJPsmqZpyynIb0MJ4v55dwfwiG1HXpMpRLcNvO7.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:43:33', '2026-02-12 02:43:33'),
(395, '2026-02-12', 899, 6, 1.23230420, 117.85631140, 'Parit', '0', 6, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/dIgQdMJdhH3jIwEeQC701xkglvlnP0rVtq9EuLoU.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 02:45:00', '2026-02-12 02:45:00'),
(396, '2026-02-12', 899, 6, 1.19126520, 117.83462290, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/pMMyBviuJqttuE4SyndRaDngaMLwuN5OKXeaw7iY.jpg', 'monitoring/VfD34TtO9GAMHZ0ZdKyGbt0h3Hia4367at3DK66V.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:47:35', '2026-02-12 02:47:35'),
(397, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/eqigbkUY8dt9pDKa90O7On283OMYBeSEkfDDHEoJ.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 02:49:22', '2026-02-12 02:49:22'),
(398, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/twIgv8Oxz2R3Fiii4xQHiCDijKFhOsboYOu9YNFl.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 02:56:47', '2026-02-12 02:56:47'),
(399, '2026-02-12', 899, 6, 1.23271980, 117.85496500, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/gc9bhe1LvfMUjjLCsTiew5iV9ZqnP8Evu7Lf0Gtx.jpg', 'monitoring/g0Is4BMvAj5McdtOVIdqwBjYkALBdKFNa6gSlJBl.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 02:59:46', '2026-02-12 02:59:46'),
(400, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/20vl8gwD71asZdGjYZljPe6TCMdfwkz53dIySUlc.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 03:06:01', '2026-02-12 03:06:01'),
(401, '2026-02-12', 899, 6, 1.23271980, 117.85496500, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/OAlgNwb5RbnzhusYKSl5t0tP1m3yDWTcZ0TwJSEB.jpg', 'monitoring/yobBqPTPwZzyj9JjbnVZM20gieBLPEWKwa3a6iyf.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:10:14', '2026-02-12 03:10:14'),
(402, '2026-02-12', 899, 6, 1.23240100, 117.85557390, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/06IuKMdYgTLCtG9mtwyMjjYajo5GHlwlxENMCOTX.jpg', 'monitoring/yP3x8D3urfs3CyCrOQ7TBXGtHN7VPdzE7CzFWyng.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:13:02', '2026-02-12 03:13:02'),
(403, '2026-02-12', 899, 6, 1.23230420, 117.85631140, 'Parit', '0', 6, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/LST3CFL4nEg9z9ra0f7HK2ajMT2paxq5u8OS1M6g.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 03:14:19', '2026-02-12 03:14:19'),
(404, '2026-02-12', 899, 6, 1.19126520, 117.83462290, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/cgupiGJchkhWG8R20eKvsM0twmBUWHIpmFgxwtwB.jpg', 'monitoring/iGIn8Cn9L8pgtyUgwrteJcwBvTjcyPk5Ts2tpSzI.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:17:00', '2026-02-12 03:17:00'),
(405, '2026-02-12', 899, 6, 1.23398090, 117.85361930, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/1jMaFAVmPZM7152HbLbn2hDdHNqsDbZdjyggOxw2.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 03:22:28', '2026-02-12 03:22:28'),
(406, '2026-02-12', 899, 6, 1.23271980, 117.85496500, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/rUaNaMsdMpA7XPE94iUXWqP5zq9awUQEAYRVCZ1U.jpg', 'monitoring/E2obuQuosqCcgc4uXrpczvJEwvcPqqi7tfTw6Esl.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:31:36', '2026-02-12 03:31:36'),
(407, '2026-02-12', 899, 6, 1.23240100, 117.85557390, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Z9m2yNpyGL2ufep7wgwM1l70sU45OmxmcwNTavoA.jpg', 'monitoring/VTUK8N7msmkokbmeKtoJuYzwTtu0YMJp8MgEGgkq.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:33:13', '2026-02-12 03:33:13'),
(408, '2026-02-12', 899, 6, 1.23230420, 117.85631140, 'Parit', '0', 6, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/fH8LqEeC4qylFa153okPfWRQfKGbpAAPsf7TY50x.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 03:34:00', '2026-02-12 03:34:00'),
(409, '2026-02-12', 899, 6, 1.19126520, 117.83462290, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/KGNrJVBDJMfep93fkjThk9vTkNMA5jhNudURKLI5.jpg', 'monitoring/RKxSY7veMgNEP1KKESFpurWgVqRFJ3gZuU0Js86B.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 03:35:19', '2026-02-12 03:35:19'),
(410, '2026-02-12', 899, 6, 1.23359500, 117.85577330, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/dlW4v7vNy53jxkd1doOWt8hArMzsUB3Odrh2VrG6.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 06:30:47', '2026-02-12 06:30:47'),
(411, '2026-02-12', 899, 6, 1.22875670, 117.86151670, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/r38zIbMWH8Ispa5UyPnazKbG8WrrN08G19l01XTa.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 06:31:00', '2026-02-12 06:31:00'),
(412, '2026-02-12', 899, 6, 1.23059450, 117.84671130, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ceOvvn2ElnrwshwO4d1xZSPzjZ8ICxIAADVPhX9W.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 06:31:05', '2026-02-12 06:31:05'),
(413, '2026-02-12', 899, 6, 1.24528690, 117.84524610, 'Genangan', '0', 7, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/BGqz79rQpHs8jpPxOjdeua3VVmn1g8pgcFAIvKbo.jpg', 'monitoring/2J0zPJnitVTnnKwIJIc3N7Ryy802YQZNvyiQKIM4.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 06:31:22', '2026-02-12 06:31:22'),
(414, '2026-02-12', 899, 6, NULL, NULL, 'Genangan', '0', 18, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Glzej5ZYbObDUyYtjo8d8x4dsTrSYri6Ldg6QjZA.jpg', 'monitoring/SqRzd91wsQFRaeZHkUuwSlj1EwmtJiB4Po0CsnWX.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-12 06:32:08', '2026-02-12 06:32:08'),
(415, '2026-02-12', 899, 6, 1.23059450, 117.84671130, 'Parit', '0', 10, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/30j8NxtduboWo8FrSJi4DDY6jjG5j4ywVV8cEnTC.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-12 06:32:18', '2026-02-12 06:32:18'),
(416, '2026-02-12', 899, 6, 1.23288500, 117.85481830, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/LHkkgGIHNcHoiweOMKgnO0lgJGfw8SeItzpQc8N3.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-12 06:32:29', '2026-02-12 06:32:29'),
(417, '2026-02-12', 899, 6, 1.23266670, 117.85495170, 'Genangan', '0', 9, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/oWEKCRaCWp4n1LSieOMxwKw8e1aDzkcoog8ZCDgf.jpg', 'monitoring/3yxvCahzwCOXAVy3PKwHnIHPdgeTrDt172OfydLj.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 06:32:43', '2026-02-12 06:32:43'),
(418, '2026-02-12', 899, 6, 1.23266170, 117.85501170, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/1xOhYMmg4FdaODj9pLO9YGaPrXZrZmhl0Cw9ADuM.jpg', 'monitoring/gHAKacWdWWfyK7LdrdAKS56MJmDgK11RC5lBjAkA.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 06:32:53', '2026-02-12 06:32:53'),
(419, '2026-02-12', 899, 6, 1.23059450, 117.84671130, 'Genangan', '0', 8, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/GRemKzX6uGdc3X49G1zeD2DQxgbB7KsxZ07zgB8l.jpg', 'monitoring/IcVOE8P9pV7fubsZsDMJKtbrjBpW2SUdniSL4R1r.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-12 06:33:09', '2026-02-12 06:33:09'),
(420, '2026-02-12', 899, 6, 1.21792970, 117.88187300, 'Parit', '0', 6, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/CiFJfJVT6EX4n9KvyvKkLxZMBTL6TuWDqXfwA9wi.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 06:33:16', '2026-02-12 06:33:16'),
(421, '2026-02-12', 899, 6, 1.23221000, 117.85704830, 'Genangan', '0', 12, 3, NULL, NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/gH6G2Xq8E9zpVZ2wAWeJIYAJejdGDDaNVNFu0egO.jpg', 'monitoring/l91KEQh5wyf7egcd8CAip4XTuuMt8G8Cx740Bvht.jpg', NULL, 2, 3, 0, 0, 1, 2, 2.00, '2026-02-12 06:33:30', '2026-02-12 06:33:30'),
(422, '2026-02-12', 899, 6, 1.23411330, 117.85295670, 'Parit', '0', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/FcX3rVhXzGeX3HXqkYnlYvZb4ZSD7nzak6TBvx7x.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-12 06:33:46', '2026-02-12 06:33:46'),
(423, '2026-02-14', 898, 6, 1.23463840, 117.85059450, 'Genangan', '0', 33, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/C1dp6CRpjFLCr5zN7aEzvJqbPZek1Ibfh1tErYOx.jpg', 'monitoring/VtSDHfywgQBTDZ0JuQSIpiCiyTK2o5AMQSF9ALNR.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 02:44:09', '2026-02-14 02:44:09'),
(424, '2026-02-14', 898, 6, 1.23495610, 117.85056210, 'Genangan', '0', 40, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/WPS9Qijp83JQJQh3qBhGnPk6l1N9rkZyiLBbmVlV.jpg', 'monitoring/82EI8HidNPDP5CExb6OiZILUO6zNjbXFebdhGVUg.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 02:44:36', '2026-02-14 02:44:36'),
(425, '2026-02-14', 898, 6, 1.23469580, 117.85016850, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/sSpspG6npJUblj7c6AFCB2HhL8KPGN644dcEgPLJ.jpg', 'monitoring/1bKEDstqCSSTbOR14kMwYrrnQe0ijndHrfMjmPkm.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-14 02:45:11', '2026-02-14 02:45:11'),
(426, '2026-02-14', 898, 6, 1.23465240, 117.84962180, 'Genangan', '0', 10, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/sxSBbviDeIeAn9oVwWMDbUnlI3Btws5RqQF4UyVl.jpg', 'monitoring/Afl64TnXGHqrgpmQGrq55B1PKzr1OypoB5DkRB4Z.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 02:45:25', '2026-02-14 02:45:25'),
(427, '2026-02-14', 899, 6, 1.23248740, 117.85058770, 'Genangan', '0', 34, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/scIxXFx6DCjZeC9ZejPCWFa4M988DoXS7ivhy6wk.jpg', 'monitoring/CTXlzwdxoCMHnX5IHLzLjKPCDnXRslqldFfcw6Nt.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 02:45:38', '2026-02-14 02:45:38'),
(428, '2026-02-14', 899, 6, 1.23251790, 117.85207870, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ucYI8P0PvGDiazFU378yV6Y7DSVVs94lLIllKJAS.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-14 02:45:47', '2026-02-14 02:45:47'),
(429, '2026-02-14', 899, 6, 1.23283420, 117.85236760, 'Genangan', '0', 20, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/w6q9PXsodgSfK8KmOWXztI6hMhBIE73idTuS3jYA.jpg', 'monitoring/k7exkm9JJPZ39ItrUWMeLDbN4jiFyAB8TFV0QZad.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 02:46:07', '2026-02-14 02:46:07'),
(430, '2026-02-14', 899, 6, 1.23289590, 117.85294030, 'Genangan', '0', 18, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/mnG6ha5F018lV2HAsuBGanghoM3BqiHggYfrbsey.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-14 02:46:15', '2026-02-14 02:46:15'),
(431, '2026-02-14', 899, 6, 1.23436900, 117.85168730, 'Parit', '0', 5, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/KIu4Sg5sMALiYlUuUgRy2k6Mc4roEelJLhWGJy8j.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-14 02:46:24', '2026-02-14 02:46:24'),
(432, '2026-02-14', 899, 6, 1.23445510, 117.85160300, 'Parit', '0', 3, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/0FMB15dm1WlLkpBjgzy1pdSJTo0EjX5d42Xm1FnO.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-14 02:46:41', '2026-02-14 02:46:41'),
(433, '2026-02-14', 899, 6, 1.23421530, 117.85107540, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/wjgoEoMA34WDqMWyUNWqW6jKJ8YDFg0rkpaTDlIO.jpg', 'monitoring/rMMrtQ1Az9mtPY2zqZrjVq4oQAhcrxAgPeRV5CWy.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 02:46:53', '2026-02-14 02:46:53'),
(434, '2026-02-14', 899, 6, 1.23414190, 117.85050380, 'Genangan', '0', 21, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/k1JjpRPnN9gtdEQRtXFS7OSwgGkooAy8sErexWVe.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-14 02:46:58', '2026-02-14 02:46:58'),
(435, '2026-02-14', 899, 6, 1.23425010, 117.85049120, 'Genangan', '0', 20, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/5J20GZEqoIA747PV4mXAEBp7VjkC0mE4Wms0nnIE.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-14 02:47:05', '2026-02-14 02:47:05'),
(436, '2026-02-14', 899, 6, 1.23410860, 117.85034080, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/jqDct9AcFSRPFO45I8ubDkKZOsEQWfLdycfi3ARc.jpg', 'monitoring/u7GMw0Kus7Zl3j07398yAywan54oXNbBWbE7CHfX.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 02:47:25', '2026-02-14 02:47:25'),
(437, '2026-02-14', 899, 6, 1.23437190, 117.84982350, 'Genangan', '0', 9, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/UKH2jq0obJgCmdV9uGLlwBjrJBqWliOlO5ooaJKN.jpg', 'monitoring/VQqAShFr3ssSslZzHrCifa7B49vYy0AVGn9uVR3W.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 02:47:41', '2026-02-14 02:47:41'),
(438, '2026-02-14', 899, 6, 1.23458310, 117.84996010, 'Genangan', '0', 21, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/VLNVeBAwNp1lL9ClHjBMxgYwu3kADR8sNXlQb2v3.jpg', 'monitoring/UHh6EdJgi1hv4HX97bwkjfUDmyY1L9hRsSo9ijor.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 02:47:54', '2026-02-14 02:47:54'),
(439, '2026-02-14', 899, 6, 1.23456980, 117.84971930, 'Parit', '0', 50, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/Zh1C95pI7mzFdjQO0g5vHYZW06PBCKUZvVKFYxr9.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-14 02:47:57', '2026-02-14 02:47:57'),
(440, '2026-02-14', 899, 6, 1.23416000, 117.84955470, 'Parit', '0', 31, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/E6Fczz6MQ6dSWwqT4IOaC3eBQNsjQCaxCM9NP4zq.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-14 02:48:01', '2026-02-14 02:48:01'),
(441, '2026-02-14', 898, 6, 1.23414500, 117.85026500, 'Genangan', '0', 33, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/vxnLaeQc0ehDsCgdk971mRiiQ4SsHxEHE9TCZKnd.jpg', 'monitoring/B7pKpRtPzdF98UCnWSfk82kBrk5NANhzJvHXWf2C.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 04:07:58', '2026-02-14 04:07:58'),
(442, '2026-02-14', 898, 6, 1.23414500, 117.85026500, 'Genangan', '0', 40, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/6ZHVozw3CdBlwxzvWxGi5g6AVE93VB9HT0vzpWrY.jpg', 'monitoring/YFrnhHpPOTir7H6UYZGMByn76SruMXUK1xrLuLkH.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 04:08:19', '2026-02-14 04:08:19'),
(443, '2026-02-14', 898, 6, 1.23414500, 117.85026500, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ErDw9uJU40FxTCThapqsJBiLfdK8znHhWMWxhEPG.jpg', 'monitoring/My12fsihieq0esriaLmqY4pZQMaG56JmvQd54rgt.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-14 04:08:43', '2026-02-14 04:08:43'),
(444, '2026-02-14', 898, 6, 1.23414500, 117.85026500, 'Genangan', '0', 10, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/3ZMGSJANu7ipGPX4DTOiyggboaMWqYLMqlfx3J24.jpg', 'monitoring/EBHoHdZFJvlSg7wL1WytyG7WZxZwj71tCMIFOqE4.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 04:09:03', '2026-02-14 04:09:03'),
(445, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 34, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/CJ3CnZVNKskeLMkY5jLfbh4xDCx4KM7TL7i8PmSd.jpg', 'monitoring/ULt83UrR9CzSgih5WzsSDZYAEx9MWAWZRU8q0HBP.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 04:09:22', '2026-02-14 04:09:22'),
(446, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/XNjdU2Y2j2xi3yomMqGkuMw5cZWM202hNprnNLeC.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-14 04:09:38', '2026-02-14 04:09:38'),
(447, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 20, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/lf3AvT6iaIwKSs0efoMJgZ3UrxTYqw3w0ArCdxxN.jpg', 'monitoring/9YIf9ttY9ki6pUDPZj8fff1hrh22uYyqAN0V5qK9.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-14 04:10:04', '2026-02-14 04:10:04'),
(448, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 18, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/UB2oleBP2eIK7SUCMYfdtW95lHE8UbJrLZcGrR8D.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-14 04:10:29', '2026-02-14 04:10:29'),
(449, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Parit', '0', 5, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/Kb3X15sczcLQ623QN8pXbAA07KaYJCgiF2UM5Jrg.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-14 04:11:50', '2026-02-14 04:11:50'),
(450, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Parit', '0', 3, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/ni3Vz0bqsaIiKXbIjL6MeoB4q8ie0MKteh2ZaPbR.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-14 04:12:05', '2026-02-14 04:12:05'),
(451, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/UWvcYfGingF3Ne5IpqjX1OyxREsJMBfzyfupXAP7.jpg', 'monitoring/rbOTR6shVKLJqopX8BZkRMegOZzjdbSalZjigEYI.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 04:12:28', '2026-02-14 04:12:28'),
(452, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 21, 4, '>3 Hari', NULL, NULL, 'Eskalasi', 'monitoring/GvtjGi83UFsxmNugpQSSMv2YRwa2omeeMjIfEaI7.jpg', NULL, NULL, 1, 3, 1, 0, 0, 1, 1.50, '2026-02-14 04:12:38', '2026-02-14 04:12:38'),
(453, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 20, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/ZeuCqxzh7FOL3TI7GRopDqbwvw8p30eKPNkmCD67.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-14 04:12:50', '2026-02-14 04:12:50'),
(454, '2026-02-14', 899, 6, 1.23414500, 117.85026500, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/c03Z4GGx2dai36j6kYunk7L0dzfGVlfij3Wy4FQL.jpg', 'monitoring/QASnuMsQVm3ABmBYhVomEET3uLsiWZmxsDwIiOC4.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 04:13:17', '2026-02-14 04:13:17'),
(455, '2026-02-14', 899, 6, 1.23430500, 117.84982670, 'Genangan', '0', 9, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/ZHuceVo2ZKlIeCXiesdDelKn9HJdevrB5aFXXeYL.jpg', 'monitoring/CuAIlQDiCk18xA5sT5pM9CI5HT9rq3ozax4INQpS.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-14 04:13:37', '2026-02-14 04:13:37'),
(456, '2026-02-14', 899, 6, 1.23462670, 117.84961000, 'Parit', '0', 50, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/iAifNQaSh3QkMXTkE8YikTC1uYFtqtYxjrwVnyUh.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-14 04:13:43', '2026-02-14 04:13:43'),
(457, '2026-02-14', 899, 6, 1.23416330, 117.84947170, 'Parit', '0', 33, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/VqFVezjtMav0Z4MljhpvsG2hc8zdXEepveZ1KRt2.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-02-14 04:13:49', '2026-02-14 04:13:49'),
(458, '2026-02-16', 890, 6, 1.23633810, 117.85332330, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/TuoX4YuIR6NCkFSxEFy6z0xDYBhdPTqnvTBFaW7O.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 02:45:39', '2026-02-16 02:45:39'),
(459, '2026-02-16', 890, 6, 1.23633810, 117.85332330, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/IYxbiE166Nf78DjZ9xlFjwqO6T9wWkFklo5JVQnS.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 02:45:47', '2026-02-16 02:45:47'),
(460, '2026-02-16', 890, 6, 1.23566960, 117.85342360, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/UQIlSucimGCPuzqcd41lb99J4I7UlgjZFOsCt0AZ.jpg', 'monitoring/xwcC2fpkYeqoREE25Jdg9kbek92jxAKvwdyx7AOF.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 02:46:51', '2026-02-16 02:46:51'),
(461, '2026-02-16', 890, 6, 1.23639250, 117.85513250, 'Genangan', '0', 18, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/DwNwKU0TB7K3WqqtYTS85yot8RLBXoh1laH75UcF.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 02:46:57', '2026-02-16 02:46:57'),
(462, '2026-02-16', 890, 6, 1.23639250, 117.85513250, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/O78dpjiXgk593Rp2wpJ1vgbsx4874VmTD4okNqSR.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-16 02:47:02', '2026-02-16 02:47:02'),
(463, '2026-02-16', 890, 6, 1.23639250, 117.85513250, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/fODn4rKDWHJ0VUWX1EVTwivjx5RUvbpqD4Wy7cQU.jpg', NULL, NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-02-16 02:47:08', '2026-02-16 02:47:08'),
(464, '2026-02-16', 890, 6, 1.23578740, 117.85541990, 'Genangan', '0', 5, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fwg1Bn7Sk0iNk3X7qTSvDuwaHC15VWLvyWKndo4X.jpg', 'monitoring/w1qlFOPUG5zN6IoVqpBVz2kY4mSyIFzgW3c7TxyS.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-16 02:47:20', '2026-02-16 02:47:20'),
(465, '2026-02-16', 890, 6, 1.23578740, 117.85541990, 'Genangan', '0', 30, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/2pIA78DCmPgdehPA1fMz5NZYf8R5GQPEEcmmGf1W.jpg', 'monitoring/ymSdk8BEsi5YBW9cYP3DiKGJ5YfBRS3gxbsgK4Qs.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-16 02:47:30', '2026-02-16 02:47:30'),
(466, '2026-02-16', 890, 6, 1.23576040, 117.85495090, 'Genangan', '0', 13, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/3aCqoqPbd0Mf8hX3TWOVc0072b81fnjTBTj8nEep.jpg', 'monitoring/mLo0Zaou6wUnwE31FNC3RyEUAYTN3lL6o6yTwwDR.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 02:47:53', '2026-02-16 02:47:53'),
(467, '2026-02-16', 890, 6, 1.23584620, 117.85437100, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/C8qlkaDJ8dYep4qls80oGcslx8Vj7eiBchBgcoAx.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 02:48:06', '2026-02-16 02:48:06'),
(468, '2026-02-16', 890, 6, 1.23591110, 117.85396840, 'Genangan', '0', 10, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/pyLF58128c98bboJxOBpLebJSyLaHN5gBoeHHdxu.jpg', 'monitoring/9jN31AwENwuJmfDWqEzovjpIdpxySM1vmhijLUS4.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 02:48:32', '2026-02-16 02:48:32'),
(469, '2026-02-16', 890, 6, 1.23570930, 117.85317820, 'Genangan', '0', 20, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/o0jlK7brCPiLKgCrpeF09FhYH2MafFWfNe2nvBMm.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 02:48:40', '2026-02-16 02:48:40'),
(470, '2026-02-16', 890, 6, 1.23660770, 117.85363680, 'Genangan', '0', 17, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/YNmF2Sn1ZVc5bI6g8vyfOiZTjqoBLkLkrKIRMNgb.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 02:48:45', '2026-02-16 02:48:45'),
(471, '2026-02-16', 890, 6, 1.23660520, 117.85344800, 'Genangan', '0', 6, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/mF4xcJNJu0cDRB8UTFoosft5FxFjtwNf210nWxKj.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 02:48:55', '2026-02-16 02:48:55'),
(472, '2026-02-16', 890, 6, 1.23561780, 117.85271120, 'Genangan', '0', 15, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/my0h0QZW1g5c0MrYrfPvK1MvRqPAerVm0vgN20yf.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 02:49:02', '2026-02-16 02:49:02'),
(473, '2026-02-16', 890, 6, 1.18940360, 117.83425660, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/igpAGY4Zvq6jGQCNVsrBAqnXWyACNtNqjGP0CK7K.jpg', 'monitoring/KCw0uidJosUQBkejtbz1YX6Egrau7qzRetIYmC60.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 02:49:34', '2026-02-16 02:49:34'),
(474, '2026-02-16', 890, 6, 1.23515850, 117.85235680, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fYy1YxFZ8T4ZTw70DemDd5TVYd5mrZWeKowyA0Sv.jpg', 'monitoring/YW5hMpY4KV7plpPkVwU8FJx9tZ75SqeUqT148SeW.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 02:49:46', '2026-02-16 02:49:46'),
(475, '2026-02-16', 890, 6, 1.21872950, 117.88187300, 'Parit', '0', 30, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/UCBu0E6pkU9mlHQFts2ChjwxFcWHIbYEYWtYKqPC.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-16 02:49:52', '2026-02-16 02:49:52'),
(476, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/9D5GOXoXIDG8rOW7eJOIMFkkjkBayaSrw1tn0lmR.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:02:19', '2026-02-16 05:02:19'),
(477, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/AzRRKVzGZkZGllR7zqZt8Cl1sTqWw6kcT6hALXjV.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:04:30', '2026-02-16 05:04:30'),
(478, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 12, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/eOKoWIRP3CFq5IKYABQFKEVIzdZaXfUP6zrrQyqu.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:04:54', '2026-02-16 05:04:54'),
(479, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 18, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/0IFUINU0gPHLGOL3dzcNc8A5owxGgYrdA4NR44rk.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 05:09:06', '2026-02-16 05:09:06'),
(480, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/LnzB9KUoy3C1LX46M6edUuj88uCac2rPkc8yvjUS.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-16 05:09:44', '2026-02-16 05:09:44'),
(481, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/cajMBCSlZbdd5pvyC4LniS4Tke62qA4dYnpgtpF1.jpg', NULL, NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-02-16 05:10:28', '2026-02-16 05:10:28'),
(482, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 5, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/CEgb1siGujVxtaeuYJ8WJQBz9rgnDTKf4mqegwlq.jpg', 'monitoring/uL5OAL08DjWZmrFhv1DC7zy4D5ISRw8vWGcHv3aa.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-16 05:11:29', '2026-02-16 05:11:29'),
(483, '2026-02-16', 898, 6, 1.23588500, 117.85390330, 'Genangan', '0', 30, 1, NULL, NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Sz0QC0OpQIzPtcIyCHw0GfsKsr94fbLn7NcjdcYI.jpg', 'monitoring/JFBfhEPRorAXAiCK59x3LEVHZjzm2HgDW0hYH0Sw.jpg', NULL, 1, 3, 0, 0, 1, 2, 1.75, '2026-02-16 05:12:32', '2026-02-16 05:12:32'),
(484, '2026-02-16', 898, 6, 1.23588500, 117.85390330, 'Genangan', '0', 13, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/BxJZdQLgYZuLldyXilUh9gyUg4A4frFSoL2w9Ihj.jpg', 'monitoring/JEmElZm0560T0ihwUupRGYnAlfAWtpe7idvcBqIp.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 05:13:40', '2026-02-16 05:13:40'),
(485, '2026-02-16', 898, 6, 1.23588500, 117.85390330, 'Genangan', '0', 10, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/rW8fQ3jBxHg0CRQpX3dEQfRPp5x6b5rRj3uR7LXm.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:14:43', '2026-02-16 05:14:43'),
(486, '2026-02-16', 898, 6, 1.23588500, 117.85390330, 'Genangan', '0', 10, 3, '>3 Hari', NULL, NULL, 'Eksekusi Rutin', 'monitoring/BUQ7bTOyE0Qb9wsYhUuMIP4JIws7n8AksD3EnGRL.jpg', 'monitoring/IMJDHt0IL7alQMeyjsBmWkjFd4GHufReTljEf5Vj.jpg', NULL, 2, 3, 1, 0, 0, 2, 2.00, '2026-02-16 05:15:23', '2026-02-16 05:15:23'),
(487, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 20, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/hVEHmjh8nlf5FqMOSfoh54aKz8em0GEX8wKuaHKC.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 05:15:36', '2026-02-16 05:15:36'),
(488, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 17, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/xmeLBcbFPUwAGvA8BZ0sFjyKx3heKMBI3kiLNaYu.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-16 05:15:48', '2026-02-16 05:15:48'),
(489, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 6, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/rPWEs9Rm8o797g9HBC3JMhzu6sh7VDWgNiWJ95lV.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:16:02', '2026-02-16 05:16:02'),
(490, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 15, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/t6X6lNK4O0Mat8mpfWxq4ftZoKxQF4ISXfJyNpJJ.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-16 05:16:20', '2026-02-16 05:16:20'),
(491, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/1rkiu6WfRQHErGHZfza9GroIzxtqJCMa1AlrjwXl.jpg', 'monitoring/eNslrU4wmVtk4azTrWh6NAmypMOnrwjem0ciUVux.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 05:17:03', '2026-02-16 05:17:03'),
(492, '2026-02-16', 898, 6, 1.23531000, 117.85242830, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/QxMolSHOetLR4lMiAaHp4ztoQk7fOR2hS7eXVRVs.jpg', 'monitoring/xFNUIaBuccs4wMmLMegF3ivN8vr5Py5W2opzQgrP.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 05:18:01', '2026-02-16 05:18:01'),
(493, '2026-02-16', 898, 6, 1.23476000, 117.85227170, 'Parit', '0', 30, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/IPiNL0TZsZvgJIF19upJzrBLDVFVuCZBlzwSCaTh.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-02-16 05:18:27', '2026-02-16 05:18:27'),
(494, '2026-02-16', 898, 6, 1.23601500, 117.85565500, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/JTG91g4gSBz9gyJQD8OYEd43C6eiK6NIpvcjULm3.jpg', 'monitoring/YjuS36ey0PsQEzNSyJHKUY1CB5Ek4251eo3V5nRM.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-16 05:19:31', '2026-02-16 05:19:31'),
(495, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Genangan', '0', 17, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/JaHOcjtYKvZ8q0RCDKpfJZhVTgkc2D9vKRB3G7T8.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-18 01:47:00', '2026-02-18 01:47:00'),
(496, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Parit', '0', 7, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/ZvxbnZsTBrBFTQkJUJ4uQ47LLLUJlrG7o1TC0nOy.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-18 01:47:03', '2026-02-18 01:47:03'),
(497, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Genangan', '0', 9, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/vjwlU95vOxYkWD6HevLTLhrzyaVP1thxiBwJEAKc.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-18 01:47:06', '2026-02-18 01:47:06'),
(498, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/WeP9SmgsVNhWiIRcoBPY5Q2IHdpNrIxRTIvhvoNY.jpg', 'monitoring/Enwu57tqed80tj7tY1EzqjNaMfTy7kDfjDojBSnH.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-18 01:47:12', '2026-02-18 01:47:12'),
(499, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Genangan', '0', 3, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Qlvk2DNXhaMMJcAZRNE13NNLMKTnRZT1eznkR4Hl.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:18', '2026-02-18 01:47:18'),
(500, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Parit', '0', 5, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/YqiskZlpSnNgjUBARyXHZaqOZx8btRr3iCqWZgr8.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-18 01:47:22', '2026-02-18 01:47:22'),
(501, '2026-02-18', 897, 6, 1.23815110, 117.85116330, 'Genangan', '0', 2, 3, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/VmIqCPqPHBS2g11Y54WPVpmhpP2FzI3txuzq5m0L.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:27', '2026-02-18 01:47:27'),
(502, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Parit', '0', 4, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/O0f8poy6Nq34RjIDHlz9v0WTuJ1eWRsn6zF2yPMi.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-18 01:47:31', '2026-02-18 01:47:31'),
(503, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/VB1elizztnE3mltwE2mA9pLGB7Ba2Nl3a5FgEdTu.jpg', NULL, NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-02-18 01:47:33', '2026-02-18 01:47:33'),
(504, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/6UOgEhaMo6bBAHm2dt6LdyJLSh1Hun7YfuyCKmkT.jpg', NULL, NULL, 3, 3, 1, 0, 1, 1, 1.80, '2026-02-18 01:47:36', '2026-02-18 01:47:36'),
(505, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/5G1Sc4Uo2FhiZlpXhlZQuM375yz5rxPwQzCHu4fg.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:38', '2026-02-18 01:47:38'),
(506, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Genangan', '0', 6, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/0bOQG9Xc437TxjHoZ6NgERPy8X2d3B54oTnBz2OI.jpg', 'monitoring/XJOjiFgzVLrfoTzt0AqgLMRLeFWEjWTH9PLfkjtE.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-18 01:47:43', '2026-02-18 01:47:43'),
(507, '2026-02-18', 897, 6, 1.23901770, 117.85319930, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/N5gJhY4XPKNiymaThdKxpZn2UqvtfjF9W2vtVIpX.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:47', '2026-02-18 01:47:47'),
(508, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 8, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/wiXqWoGUZfxzWpfwIWLGSNMHTABTWe4J8eFvKOlF.jpg', 'monitoring/EcuvcHGPz4h6OYpGib2GLerXmbu25q8EaWezt5mT.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-18 01:47:52', '2026-02-18 01:47:52'),
(509, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 3, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/tUC9HAPuo0XhY9ZI0Xy9bSmue4tXP7BqaxQDoxRe.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:54', '2026-02-18 01:47:54'),
(510, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 14, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/vpNxkGqVsw73wazAbPQ0SESEcuwC1mBEeoZpmglB.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-18 01:47:56', '2026-02-18 01:47:56'),
(511, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/Se2Eex2yzhGUwWp4NHZ61RduV5kh560s5NeuBEBO.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:47:59', '2026-02-18 01:47:59'),
(512, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/azN7RqmuQfQbzQWEdS7EsOxHOqfhQr8XLUnuOlfW.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:48:00', '2026-02-18 01:48:00'),
(513, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/NNovnkPQY7KE0jujMzmGkwKBfBAJKOF5dqzAq0os.jpg', 'monitoring/7vpcITjmEoPMLxRRthmn92mqPDeIpXYHnYg6xX9k.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-18 01:48:04', '2026-02-18 01:48:04'),
(514, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 2, 0, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/SGaNF4YeSmvCiRQpf5cAEjIFw0waIJDU2FpeDdjg.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:48:06', '2026-02-18 01:48:06'),
(515, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 11, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/AaMftcWgNSecWN5qONoRsBD7zI4YUvBtcyR91665.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-18 01:48:08', '2026-02-18 01:48:08'),
(516, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 13, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/OgMnxZ5Uc1jubofO4tRorgg6M09jtYCCMi2HvIDK.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-18 01:48:10', '2026-02-18 01:48:10'),
(517, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 3, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/ho8gZL3EocsyvYaBsRMqlBkbz4QOp5Ay1YLBGjsH.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-18 01:48:13', '2026-02-18 01:48:13'),
(518, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/RTTVvd3AON0h5w5rNumo2le4q0hJ4S9rWRcPzK9i.jpg', 'monitoring/NMRKi5e3nM0Eez6OsMTjSJf1yvF3FeNJ1QuluXHU.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-18 01:48:17', '2026-02-18 01:48:17'),
(519, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 7, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Tkj2QDOVDRfti5tiy28KBqQYUk1tLDrDA2tnV3Mt.jpg', 'monitoring/8b6MJ3zJjwOHO8a3vDeRJPDQrLtiRAvGgLvKerdH.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-18 01:48:24', '2026-02-18 01:48:24'),
(520, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 9, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Eahrp2XNM7olavn2BHkpDK7PQfCo8eKfI8cCwjFF.jpg', 'monitoring/e4VrYO3CIZMTLMNTF8jPRjzEgYSV8YSCbKekaPEj.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-18 01:48:29', '2026-02-18 01:48:29'),
(521, '2026-02-18', 897, 6, 1.23021180, 117.78626130, 'Genangan', '0', 16, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Xfyqigedd1UO2kUCuxmiIRPnaQiTZrt4BHaz5Mfk.jpg', 'monitoring/PRIlc3zrzLt7RtOn6bCeNtoQaXzzyla5wuUUXWK8.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-18 01:48:33', '2026-02-18 01:48:33'),
(522, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', '0', 16, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/A7DmJmNcSohgg18v4wVe9m4WzkrcKc75ufAhJE7u.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:39', '2026-02-23 00:37:39'),
(523, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/BTj38AgkXSGwKXhRn5JeLT3v6UYLvZJfwboAIe4T.jpg', 'monitoring/YXwvdVubrRWd8eIuW4CdNazIcA00gzaaRYqhTGpr.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-23 00:37:44', '2026-02-23 00:37:44'),
(524, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', '0', 24, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/qUUlPJbu5cuFgI7z3MhIuOewBPLcDMMyXQkCIk92.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:46', '2026-02-23 00:37:46'),
(525, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', '0', 27, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/YTPZiuo5DZySlpJ7XPnSg8ywJ3Fa9RN2svDGyckw.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:47', '2026-02-23 00:37:47'),
(526, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', '0', 19, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/2IO0fjgOGhDNZ9zRz9m6Sg4HUx0hkUheU7bvUWv2.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:49', '2026-02-23 00:37:49'),
(527, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', NULL, 24, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/sVduSjLn23tOsFpF1KZV5PO3sU6Gh8Pp2RTZFqYN.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:51', '2026-02-23 00:37:51'),
(528, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', NULL, 21, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/JGiFUmyEY7tUMQ6hNMfcLU3qnHFERzk2ISGVG0Yb.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:37:53', '2026-02-23 00:37:53'),
(529, '2026-02-23', 895, 6, 1.24657200, 117.84998170, 'Genangan', NULL, 14, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/Uqj5NvvkoXjyew7Jj1drdtDsDNTt6AEYW9y1fFxK.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:37:54', '2026-02-23 00:37:54'),
(530, '2026-02-23', 895, 6, 1.24398890, 117.84984350, 'Genangan', '0', 15, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/MmPmp7TTBGSUJnq7aXkgYNrT7tL4ORpuG5Gilr7o.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:37:55', '2026-02-23 00:37:55'),
(531, '2026-02-23', 895, 6, 1.24398890, 117.84984350, 'Genangan', '0', 16, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Q9K4ReIa2ciB9SO3AxBkFeo7MSjqnwGmZBwiGuvN.jpg', 'monitoring/tjoC4CJF6ZQqy4yJ3oLGr2QRE27Bs3gviVjTeACp.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-23 00:37:59', '2026-02-23 00:37:59'),
(532, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 26, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/2zXfLoXVm7mSiYf1SknTN0HENckCB5CKWiujxQsw.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:38:00', '2026-02-23 00:38:00'),
(533, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Parit', '0', NULL, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/nkt5pU3LYa2j4ZCFWUcyoTVtYtroG17JujOnzCXn.jpg', NULL, NULL, 0, 0, 0, 2, 3, 3, 2.67, '2026-02-23 00:38:02', '2026-02-23 00:38:02'),
(534, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/m7IeVEBpzK4MszcbYPBj56TpEtst7CkXvNBm4XXN.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:04', '2026-02-23 00:38:04'),
(535, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/0OhprAsozJt2txZ6TecTyStrPWGDsjGzrcI2IZUP.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:05', '2026-02-23 00:38:05'),
(536, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 24, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/fXBtXtpBm7qy3gcSJCRYzNpFvpEysxVgiFPtRB9D.jpg', 'monitoring/Lk4ANPf5s9KAhMVIqJRIjViRqmCrdvdGfnlvB5hV.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-02-23 00:38:09', '2026-02-23 00:38:09'),
(537, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 19, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/6tk3hgMQEedaZ1RsKqoYiS2p1EKJPSi7NYbu88L9.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:38:10', '2026-02-23 00:38:10'),
(538, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/n6kn5ZBGO6myzfY0V08uMR3G8tWrEfpoXoI0fjhO.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-23 00:38:12', '2026-02-23 00:38:12'),
(539, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Parit', '0', 6, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/Lt0K1OQsnnMqK2DLh3tkwlG6FBtqYyCH21jdwn0j.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-23 00:38:14', '2026-02-23 00:38:14'),
(540, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 18, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/iMQh7ak5IhWeUY4vYB1tiZL2M4tM5Lno82ccmN2w.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:38:16', '2026-02-23 00:38:16'),
(541, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Parit', '0', 4, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/osZbbA6e5XpQOJWPu5RQh9VnI6OVypkFfLjRm0rg.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-02-23 00:38:18', '2026-02-23 00:38:18'),
(542, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 23, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/01pd8IgOAOYJ3QiCP1XAzvIwBPMDAUz4TGwCy2bE.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:38:20', '2026-02-23 00:38:20'),
(543, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 13, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/ohK3DEoI5H9vy1GdLRmDOaXn7LbBLxCJoRlf5Xj9.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:21', '2026-02-23 00:38:21'),
(544, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 17, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/MqdtUd0P6hqAE3cdDIWxv36gtjO6LAuVT1gttmuk.jpg', NULL, NULL, 1, 3, 1, 0, 1, 1, 1.40, '2026-02-23 00:38:22', '2026-02-23 00:38:22'),
(545, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 5, 1, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/nxvQ40O1nLTFErNd8aIT8vddDGxGARszfNmic4sb.jpg', 'monitoring/SMswE7OJJy8sgJgWTdGclY3v8Me2Rcveiu2zBsNY.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-02-23 00:38:25', '2026-02-23 00:38:25'),
(546, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 11, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/QwLtKSvOdrup7iYpvQFS1t32ImnwGLbEbNfEIq40.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:26', '2026-02-23 00:38:26'),
(547, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 9, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/1d8Nsaf9jFHj47WALTLXDmolMurO293J4EQzVcOv.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:30', '2026-02-23 00:38:30'),
(548, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 14, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/SZhVIB5uVbjlPlwFGAzSG9mkJAZUbIIiiYhG5kzZ.jpg', 'monitoring/OZuilEpA61c3f6nmuSxKaeCgiF8uXWd4biey1Csq.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-23 00:38:33', '2026-02-23 00:38:33'),
(549, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 15, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/HtJu48toZFtSnk3gt6MZDl6PrWpYx6lyCmP80Xe8.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-02-23 00:38:34', '2026-02-23 00:38:34'),
(550, '2026-02-23', 894, 6, 1.24482750, 117.85232810, 'Genangan', '0', 9, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/rGQOIWf7tDf33kYSrkZx5yecyEuED4nDIrYzQs4V.jpg', 'monitoring/uQJWXCXJDyrMy68kXhhdsZ6zFmka9JddIwUXz0gW.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-23 00:38:38', '2026-02-23 00:38:38'),
(551, '2026-02-23', 894, 6, 1.24440110, 117.85198620, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/l365VInyZ8m6cFC92BE7tyhLZanBYYY4Gcq1hAkI.jpg', 'monitoring/wsiOao5PjTfHxdhpAsnBPpZFo4LLpUssY7aOXWiT.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-02-23 00:38:40', '2026-02-23 00:38:40'),
(552, '2026-02-23', 894, 6, 1.24440110, 117.85198620, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/bMGrmeHm7WFsMhip2GLRbK2uf7vA5UrDM7oiYBX7.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-02-23 00:38:41', '2026-02-23 00:38:41'),
(553, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Parit', '0', 7, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/ujcH84FX3N8oCS6fIH7KoqCIo0VYgFw3Dp2SGU5Y.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:22', '2026-03-02 02:11:22'),
(554, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/nrXqHReyIw3uDSiTie5UOQGLfOA76uvsOjyX59go.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-02 02:11:24', '2026-03-02 02:11:24'),
(555, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Parit', '0', 12, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/XDpXx8ubRBhZwNUUG38DeqTiJy9iE07w0qTguIyY.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-02 02:11:26', '2026-03-02 02:11:26'),
(556, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Parit', '0', 26, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/LWBBVNqk3kCQ8mZddZ9a5IipU0sZo6LF75Q1bS4y.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:29', '2026-03-02 02:11:29'),
(557, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Parit', '0', 20, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/bbI4mgQTCNxkPrlpI479s8TehpwBlP9BqfY0rYFb.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:31', '2026-03-02 02:11:31');
INSERT INTO `monitoring_harian` (`id`, `tanggal`, `id_lokasi`, `id_karyawan`, `lat_aktual`, `long_aktual`, `tipe_objek`, `nomor_jalur`, `kedalaman_cm`, `jumlah_pokok`, `durasi_genangan`, `kondisi_aliran`, `penyebab`, `tindakan`, `foto_path`, `foto_after`, `keterangan`, `skor_kedalaman`, `skor_jumlah_pokok`, `skor_durasi`, `skor_aliran`, `skor_penyebab`, `skor_tindakan`, `rata_rata_skor`, `created_at`, `updated_at`) VALUES
(558, '2026-03-02', 830, 6, 1.25201040, 117.81064460, 'Parit', '0', 8, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/EHXirhBdFx3W9raMsbQHZVpxJa8c3rXETK6ayNt1.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-02 02:11:34', '2026-03-02 02:11:34'),
(559, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/dQ6LByUhu96crWqHApiZfojIbeQSR39ryiA2gQGZ.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-02 02:11:38', '2026-03-02 02:11:38'),
(560, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Parit', '0', 30, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/nuR8qeq0GNFLmrZcs5eia8QCktnCZCngpZIoKpes.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:40', '2026-03-02 02:11:40'),
(561, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Genangan', '10', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/AwKqnofCNg25LcqOoMtm7YKdcg4a1qdsBehAkBNP.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-02 02:11:42', '2026-03-02 02:11:42'),
(562, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Parit', '8', 13, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/VE3OYcRnI7gyGN6M1jUG6hmeRd3HYOCqALDScOUs.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:44', '2026-03-02 02:11:44'),
(563, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Parit', '3', 28, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/7zVMCzTOyYUqK3NeS0m7VbGR0ISKNuFxbmsvbuP2.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:46', '2026-03-02 02:11:46'),
(564, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Parit', '1', 30, NULL, NULL, 'Mengalir Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring/E384KkU2WzO2sJoISgCHAXM619jzEvAfNGaYiwiN.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-02 02:11:49', '2026-03-02 02:11:49'),
(565, '2026-03-02', 831, 6, 1.25195870, 117.81442500, 'Parit', '3', 10, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/PW8oRFCvbtpFt1YMOopvopJOeHTGNkphzyZgNdrq.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-02 02:11:51', '2026-03-02 02:11:51'),
(566, '2026-03-03', 828, 6, 1.25600580, 117.81098230, 'Parit', '0', 40, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/U0nb4FouRXtNkK0JSjn82mZsHeqyl7BIwuK7qFzx.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:34:46', '2026-03-03 01:34:46'),
(567, '2026-03-03', 828, 6, 1.25600580, 117.81098230, 'Parit', '0', 37, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/CPRNu4HIWOgvVUSvUSSglH60Jqew8bFoHjKZ5lwc.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:34:49', '2026-03-03 01:34:49'),
(568, '2026-03-03', 828, 6, 1.25600580, 117.81098230, 'Genangan', '0', 12, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/rb4SbFRos2uEbqYdn12u71Lz8B6RrqtHrfp4HIls.jpg', 'monitoring/zZHCfl5rD5XqdCUz40jvkucAKPgiKIM5P8EsFPwV.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-03 01:34:59', '2026-03-03 01:34:59'),
(569, '2026-03-03', 828, 6, 1.25600580, 117.81098230, 'Parit', '0', 46, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/21g737oRTq22S7IxSAaf35nkX49DZpqyiUJL5ww4.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:35:02', '2026-03-03 01:35:02'),
(570, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 16, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/0PRdmRdQcEWZn2UeS55JiD48w0wtdXJPcXVkxv1i.jpg', 'monitoring/yp98RvKUuUgJkiIfUIABbwe3KDPfL547E7Qgerck.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-03-03 01:35:09', '2026-03-03 01:35:09'),
(571, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 30, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/xJj3p8ysSl77myTP9lAjxwCJQ0GlELNPvc78AhQu.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:35:12', '2026-03-03 01:35:12'),
(572, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 5, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/9NJG3EF2WvuDEd7D8mbaQ93StU22z1VIXotOJQfj.jpg', 'monitoring/RobmxipSpATTx01R2nI6jWKkSA9fBAMvGNCudmne.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-03-03 01:35:18', '2026-03-03 01:35:18'),
(573, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 60, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/3AMXgkhxVMDwqB3tVxPwBRRMNYk0ZzQSQ3RQZi7p.jpg', NULL, NULL, 2, 0, 0, 2, 3, 3, 2.50, '2026-03-03 01:35:21', '2026-03-03 01:35:21'),
(574, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 37, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/zo99ujv7l3rVrBQpPs3znsfgkQ9amqFlLRR6rVzE.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:35:23', '2026-03-03 01:35:23'),
(575, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 17, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/lfC0oQTR6vS8VxWEraYzVeIULXffmC5yZ03JXXXK.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-03 01:35:26', '2026-03-03 01:35:26'),
(576, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 15, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/PVwiyE82HfmqXI3BQ2k7RPhmPJQG2Z3QH2YX1E8Z.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-03 01:35:29', '2026-03-03 01:35:29'),
(577, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 12, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/QdFZChSgYrvUZudcdqhv5N0ZYTXdM3ruFla1UUtH.jpg', 'monitoring/VTZRXRINO6oZFwIjy0DXlX7zY7VCeNLTrzZ9tipE.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-03 01:35:35', '2026-03-03 01:35:35'),
(578, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 14, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/GgGhVSSksyJ3Bfqh8kCbDpcDniKO9dfhSEG6P0pX.jpg', 'monitoring/jEWZyf2T876bcI5hJ5jMOK9R2lDDlx0e7IktWRTQ.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-03 01:35:41', '2026-03-03 01:35:41'),
(579, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 9, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/N14PkXjIGHFR6SgEUasUoBlMtTriNjPlFM05qz9s.jpg', 'monitoring/YzoQA1iTi2Ayl7s71Zpq4jRJEOw5eftke7odMk0d.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-03 01:35:47', '2026-03-03 01:35:47'),
(580, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Genangan', '0', 14, 0, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/4c7lha885xYoIwjCEqY5WdnMO8iyr3SH2eLFtKwi.jpg', 'monitoring/ftmo3UmeU6IzxTHkmncn9pmOdvKhOVp4Qz6SQ4ID.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-03 01:35:53', '2026-03-03 01:35:53'),
(581, '2026-03-03', 829, 6, 1.25679900, 117.81220220, 'Parit', '0', 18, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/CZspmMf5nyXLINdtHkrfgZT9ltyzHZISx7fwbmwS.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-03 01:35:55', '2026-03-03 01:35:55'),
(582, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Genangan', '0', 17, 4, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/Pb91Hd7EcXkaKPSnAeNv5wQGRuSoPFh6azNV9Ytn.jpg', 'monitoring/bZi8Moc2rpYz5Ak21yfWFukr4rWrCKSpwCXnridD.jpg', NULL, 1, 3, 1, 0, 1, 2, 1.60, '2026-03-04 01:18:00', '2026-03-04 01:18:00'),
(583, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/9du1bMSi9uNueS3oyhuDaDOVG8wJtydTTRn8vQKd.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-04 01:18:03', '2026-03-04 01:18:03'),
(584, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Parit', '0', 26, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/umgibGCDaiwzQzoTkAVgpaaxHrVF5uj6fgzVN1L7.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-04 01:18:06', '2026-03-04 01:18:06'),
(585, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Genangan', '0', 14, 11, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/EclfrP2dX8lD8VmAQ85xNN6KVwcgm0aJoCrKrkFL.jpg', 'monitoring/OuAwKGLAgWrdzs8RiWh46sXE1J3SWTAHfmYoYOVM.jpg', NULL, 2, 2, 1, 0, 1, 2, 1.60, '2026-03-04 01:18:11', '2026-03-04 01:18:11'),
(586, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Genangan', '0', 10, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/SkmglWyW1lPhzFvBwjC6Yx0R9gkFLqJ7TvkOlhLL.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-03-04 01:18:15', '2026-03-04 01:18:15'),
(587, '2026-03-04', 840, 6, 1.25157100, 117.81732360, 'Genangan', '0', 8, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eskalasi', 'monitoring/zh8NLoUof4Y6ts0qXJorRg735kyyydwln1mk8g9H.jpg', NULL, NULL, 2, 3, 1, 0, 1, 1, 1.60, '2026-03-04 01:18:17', '2026-03-04 01:18:17'),
(588, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 8, 5, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/RQu30kxTqdQF5SvNd0XTDeGfWfENoatRpy8tBgwU.jpg', 'monitoring/uAbLLx8r6iXZ7pFrp2gy9XVXhq0N6kO4wPMbfQlB.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-04 01:18:25', '2026-03-04 01:18:25'),
(589, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 80, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/6aXgJ0eh3aoOqxxgM61SmSxJKXP4IYcltWRIZIyO.jpg', NULL, NULL, 3, 0, 0, 3, 3, 3, 3.00, '2026-03-04 01:18:27', '2026-03-04 01:18:27'),
(590, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 3, 4, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/FRjcHPjrvB2UGgKezMVcha7PDFPFdYstHza8RYyl.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-04 01:18:30', '2026-03-04 01:18:30'),
(591, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 2, 2, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/96fCvWlZDALwPlHK2FcRC3X71OlVWaoINfMnhpiE.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-04 01:18:33', '2026-03-04 01:18:33'),
(592, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 60, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/86HjITNhrFkNPl8LZzldYBAzGldeoZ4D67XUi1QT.jpg', NULL, NULL, 2, 0, 0, 2, 3, 3, 2.50, '2026-03-04 01:18:36', '2026-03-04 01:18:36'),
(593, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 2, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/oIIompnMqArqvu7ueCeUuPxkJ6PwACkUKHJLZxC0.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-04 01:18:38', '2026-03-04 01:18:38'),
(594, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 7, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/OJU4XfwN0PwHMfCf604gR6zpAawC6NEOfwzHZEYi.jpg', 'monitoring/41QduHmc9h6vZX2LzDXzQm6rtHUm3lji7lh4WsuG.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-04 01:18:43', '2026-03-04 01:18:43'),
(595, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 55, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/IXYvYkzF9cBz4V9sBN1HXVyOsc3IBJvS2ipKrt8J.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-04 01:18:46', '2026-03-04 01:18:46'),
(596, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 2, 4, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/fA6UEyyXOrPakMgKzOGF84kIhiFfie25t5pJu1HW.jpg', NULL, NULL, 3, 3, 2, 0, 2, 3, 2.60, '2026-03-04 01:18:49', '2026-03-04 01:18:49'),
(597, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 53, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/NeULKlluOeJ8m9Be0q96XXDj6qpcx0UwPuGdHHiT.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-04 01:18:51', '2026-03-04 01:18:51'),
(598, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 50, NULL, NULL, 'Sedang', 'Bersih', 'Tidak Perlu', 'monitoring/of1gxzVw6aNLcm3lR9NNrgJYuXdBi3tBuoDnm8MC.jpg', NULL, NULL, 1, 0, 0, 2, 3, 3, 2.25, '2026-03-04 01:18:55', '2026-03-04 01:18:55'),
(599, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 6, 3, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/BHVZK5ZLbV20jTTggK4a0VXjjjhhxWUuUb5EtBtU.jpg', 'monitoring/O28hYoxFytpZAEyteAaJPrZ753sFZ39stq0B6mwh.jpg', NULL, 2, 3, 1, 0, 1, 2, 1.80, '2026-03-04 01:19:00', '2026-03-04 01:19:00'),
(600, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', NULL, 1, '1-2 Hari', NULL, 'Hujan Tinggi', 'Tidak Perlu', 'monitoring/SHPk6Cl7ESzBIbTSvbQ7vDEfPIAbnIibDibrwwwJ.jpg', NULL, NULL, 0, 3, 2, 0, 2, 3, 2.50, '2026-03-04 01:19:03', '2026-03-04 01:19:03'),
(601, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Genangan', '0', 4, 2, '>3 Hari', NULL, 'Areal Rendahan', 'Eksekusi Rutin', 'monitoring/vmKUtrmZjDiHDYtQXhQLiNrbAe1HjXsXmEcEyasV.jpg', 'monitoring/jhpMQttzGgii4TWkhnzvQnX3XAAbLFN8yX3grSli.jpg', NULL, 3, 3, 1, 0, 1, 2, 2.00, '2026-03-04 01:19:08', '2026-03-04 01:19:08'),
(602, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 40, NULL, NULL, 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring/8SvqEIJcTR7JU84ADfg0rUmAVmvRUv8asAFccNc2.jpg', NULL, NULL, 1, 0, 0, 1, 3, 3, 2.00, '2026-03-04 01:19:11', '2026-03-04 01:19:11'),
(603, '2026-03-04', 840, 6, 1.25185070, 117.81481940, 'Parit', '0', 15, NULL, NULL, 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring/nh2jdUOmg1MjFGxzbzybs7qRG0z9dMAKFG5Wh6yi.jpg', NULL, NULL, 1, 0, 0, 3, 3, 3, 2.50, '2026-03-04 01:19:13', '2026-03-04 01:19:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_mingguan`
--

CREATE TABLE `monitoring_mingguan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `id_objek` varchar(255) NOT NULL,
  `id_karyawan` bigint(20) UNSIGNED DEFAULT NULL,
  `lat_aktual` decimal(10,8) DEFAULT NULL COMMENT 'Lokasi GPS HP Petugas',
  `long_aktual` decimal(11,8) DEFAULT NULL,
  `jenis_infrastruktur` varchar(50) NOT NULL,
  `kondisi_aliran` varchar(50) DEFAULT NULL,
  `penyebab` varchar(50) DEFAULT NULL,
  `tindakan` varchar(255) DEFAULT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `foto_after` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Good Condition','Need Maintenance','Urgent Condition') DEFAULT NULL,
  `skor_aliran` int(11) DEFAULT 0,
  `skor_penyebab` int(11) DEFAULT 0,
  `skor_tindakan` int(11) DEFAULT 0,
  `rata_rata_skor` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `monitoring_mingguan`
--

INSERT INTO `monitoring_mingguan` (`id`, `tanggal`, `id_lokasi`, `id_objek`, `id_karyawan`, `lat_aktual`, `long_aktual`, `jenis_infrastruktur`, `kondisi_aliran`, `penyebab`, `tindakan`, `foto_path`, `foto_after`, `keterangan`, `created_at`, `updated_at`, `status`, `skor_aliran`, `skor_penyebab`, `skor_tindakan`, `rata_rata_skor`) VALUES
(2, '2025-12-12', 866, '', 4, NULL, NULL, 'Jembatan', 'Mengalir Sedikit', 'Sampah', NULL, 'monitoring_mingguan/bAWaQweu1gpzR4NbdzFysshtzg1zNIU6EycMRaqY.jpg', 'monitoring_mingguan/44N1D3kuievkxsX7lI1G55cXIUPbOgpPqLcRuOhU.jpg', NULL, '2025-12-12 20:04:20', '2025-12-12 20:04:20', NULL, 2, 2, 0, 0.00),
(4, '2025-12-12', 866, '', 4, NULL, NULL, 'Jembatan', 'Mengalir Sedang', 'Sampah', NULL, 'monitoring_mingguan/PHjxx9OOdLvD3vhzImUcOfnQtYZT0v9osaCD6GQk.jpg', 'monitoring_mingguan/T8rB48ehQcwDZRZJTXmgC44cqAaCPLYih89g8Z0Y.jpg', NULL, '2025-12-12 20:07:38', '2025-12-12 20:07:38', NULL, 2, 2, 0, 0.00),
(5, '2025-12-12', 867, '', 4, NULL, NULL, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/hp446zopOPTmjVQgR3CU2BJYd6V5F9nCJish0bDV.jpg', 'monitoring_mingguan/S6GeGJ7tErvHg8K2ROSPMzSqL95TvABstw0Leds3.jpg', NULL, '2025-12-12 20:11:39', '2025-12-12 20:11:39', NULL, 2, 2, 0, 0.00),
(6, '2025-12-12', 867, '', 4, NULL, NULL, 'Jembatan', 'Mengalir Sedikit', 'Sampah', NULL, 'monitoring_mingguan/RUy57H739FLdj8iTndD84kDTsPzz7PiOyLxGbG24.jpg', 'monitoring_mingguan/EjEQ5besBp0t86AV0fqrcrwFMsZdAohFNW0Mvn9O.jpg', NULL, '2025-12-12 20:12:40', '2025-12-12 20:12:40', NULL, 2, 2, 0, 0.00),
(7, '2025-12-12', 868, '', 4, NULL, NULL, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Sampah', NULL, 'monitoring_mingguan/CqgAprvlpT0Le6sUtYcWpQMRBmAPurY2PcBGx94U.jpg', 'monitoring_mingguan/LFJoJdeXbO6rkWHiYHD6SGUme0kO1pkES8uHdxjo.jpg', NULL, '2025-12-12 20:14:13', '2025-12-12 20:14:13', NULL, 3, 2, 0, 0.00),
(8, '2025-12-12', 868, '', 4, NULL, NULL, 'Jembatan', 'Lancar', 'Sampah', NULL, 'monitoring_mingguan/udHW2FcSEVRxnrilQ6b6vjZq2N5Ac7RYXpDXVdzi.jpg', 'monitoring_mingguan/zi8wsYczVXWx5zNawjIlEFWQE7fRSTyYyeo5iE5L.jpg', NULL, '2025-12-12 20:16:25', '2025-12-12 20:16:25', NULL, 3, 2, 0, 0.00),
(9, '2025-12-12', 867, '', 4, NULL, NULL, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Sampah', NULL, 'monitoring_mingguan/kKZ1uCBU2rFnaZCzdI2OP31UbM1ZCItaV1QDP58q.jpg', 'monitoring_mingguan/eTQEIT2y6sZBxQ2jwuLBz4B9glmjI7TlXW5R6xUR.jpg', NULL, '2025-12-12 20:18:02', '2025-12-12 20:18:02', NULL, 2, 2, 0, 0.00),
(15, '2025-12-19', 864, '', 6, 1.15228000, 117.50029400, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', NULL, 'monitoring_mingguan/PMogGfcj47c16XBJfAgj1uSiklDIDTC5m1uHIMX8.jpg', NULL, NULL, '2025-12-21 02:20:31', '2025-12-21 02:20:31', 'Good Condition', 2, 3, 0, 0.00),
(16, '2025-12-19', 864, '', 6, 1.15229020, 117.50845400, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/pp3hkYnBS7GDilz6YvVdoYCs5zzeKTFCkPKFlpBJ.jpg', 'monitoring_mingguan/2JZbyhdOPftJEJMBYvNnqeAht1szO7HLwvWDYiQ7.jpg', NULL, '2025-12-21 02:21:34', '2025-12-21 02:21:34', 'Good Condition', 2, 2, 0, 0.00),
(17, '2025-12-19', 864, '', 6, 1.15225000, 117.50107520, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Daun', NULL, 'monitoring_mingguan/UsVYbjEaF5ujsDeESHyo5ZYIvjFordP181Z17kFh.jpg', 'monitoring_mingguan/6l81pDCWFujtq7b3EdaAh67wgWr8QUHSrg1j6Ycm.jpg', NULL, '2025-12-21 02:23:03', '2025-12-21 02:23:03', 'Good Condition', 2, 2, 0, 0.00),
(18, '2025-12-19', 871, '', 6, 1.15187140, 117.50260220, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/9AuzGXPpyzy3jkI6r13fbXgPENP5gP2pApYgSy7R.jpg', 'monitoring_mingguan/g9e1gTC3UhBfCgBF2Dljr2qJ6ZF1Ib8ioUbenCWw.jpg', NULL, '2025-12-21 02:24:27', '2025-12-21 02:24:27', 'Good Condition', 2, 2, 0, 0.00),
(19, '2025-12-19', 871, '', 6, 1.15167580, 117.50268140, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/dznpWGyCBAZf0zjszsv2QZ79BfcvisB6D3a7S73F.jpg', 'monitoring_mingguan/rlHRLa9zBECNBte04yJXvT5yxuylYCZqttY06SK8.jpg', NULL, '2025-12-21 02:25:33', '2025-12-21 02:25:33', 'Good Condition', 2, 2, 0, 0.00),
(20, '2025-12-19', 865, '946', 6, 1.25361111, 117.84027780, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/Arfpy8HoViIfgfhumYCLncOevozK4YaIhJBZEidg.jpg', 'monitoring_mingguan/bWuzqXEs20xM24MhbgFJrhvAB7Qsw69xd91vctTh.jpg', NULL, '2025-12-23 01:04:08', '2025-12-23 01:04:08', 'Good Condition', 2, 2, 0, 0.00),
(21, '2025-12-19', 865, '948', 6, 1.25388889, 117.83472220, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/symBFysD2vo1WAqEywuXvS7lUxu09Rgkr0FLsX5B.jpg', 'monitoring_mingguan/3g1934b363ZLAY8UFh0zjrCLJGTC8J92vS3Lui2J.jpg', NULL, '2025-12-23 01:10:12', '2025-12-23 01:10:12', 'Good Condition', 2, 2, 0, 0.00),
(22, '2025-12-19', 865, '945', 6, 1.25388889, 117.83361110, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', NULL, 'monitoring_mingguan/bj3yJ68lrPNzxb2WytaSFzhnXVVZ6bnKH5wDNXwy.jpg', NULL, NULL, '2025-12-23 01:13:26', '2025-12-23 01:13:26', 'Good Condition', 2, 3, 0, 0.00),
(23, '2025-12-19', 865, '944', 6, 1.25388889, 125.35027780, 'Jembatan', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/SgauJfvl1q85oMmf8H1GfG84dZyxskhTpP2JAmSp.jpg', 'monitoring_mingguan/2uMC8hzZ15YVmwCwsLfZA2FnETiOCnVLjBU3CB03.jpg', NULL, '2025-12-23 01:16:15', '2025-12-23 01:16:15', 'Good Condition', 2, 2, 0, 0.00),
(24, '2025-12-19', 864, '1080', 6, 1.25611111, 117.83333330, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', NULL, 'monitoring_mingguan/BIShwux0CvOhPmzBoITorGGgHyPR6ppixaMNxhqv.jpg', NULL, NULL, '2025-12-23 01:37:54', '2025-12-23 01:37:54', 'Good Condition', 2, 3, 0, 0.00),
(25, '2025-12-19', 865, '945', 6, 1.25611111, 117.83555560, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedikit', 'Daun', NULL, 'monitoring_mingguan/Ft89SDcj5qqMLhANUQYXugMxqTmUDv8wxBE5qJPz.jpg', 'monitoring_mingguan/kuBBrtsE5EyzAOmJXMjRh8Z2Pb6OwlhlBfYlEqbO.jpg', NULL, '2025-12-23 01:50:56', '2025-12-23 01:50:56', 'Good Condition', 2, 2, 0, 0.00),
(26, '2025-12-26', 832, '1426', 3, 1.26805556, 117.82277780, 'Gorong-Gorong Baja (NF)', 'Tidak Mengalir', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/dfXw2B2VnAoNukTtjG0mxC86BqO3X82Q9d9OqooQ.jpg', 'monitoring_mingguan/LBnD9FX5djpk7tJ8ygMNQtvLELT9RYi0jpvgW73p.jpg', NULL, '2025-12-29 21:03:47', '2025-12-29 21:03:47', NULL, 1, 2, 2, 1.67),
(27, '2025-12-26', 832, '1509', 3, 1.26944444, 117.82277780, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/HCD5hUQCb2ebItXOGSa1rdah5JaNX0ZLWHMUheay.jpg', NULL, NULL, '2025-12-29 21:12:48', '2025-12-29 21:12:48', NULL, 2, 3, 3, 2.67),
(28, '2025-12-26', 832, '1426', 3, 1.26805556, 117.82166670, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/eCZSP1K52R51z1TTibQ09OyjyxPATDmkJUxLs3B1.jpg', NULL, NULL, '2025-12-29 23:10:39', '2025-12-29 23:10:39', NULL, 2, 3, 3, 2.67),
(29, '2025-12-26', 832, '1475', 3, 1.26805556, 117.82111110, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/MuLICh2ZmoESgcmGyB5l9rz1f3xN57zdys0Xd5PA.jpg', NULL, NULL, '2025-12-29 23:12:57', '2025-12-29 23:12:57', NULL, 2, 3, 3, 2.67),
(30, '2025-12-26', 833, '1466', 3, 1.26805556, 117.82027780, 'Pipa (PVC)', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/3K6cdLCpc2tQ9w6PaNRYT4mWEK9F6ziJmHNMtCtV.jpg', NULL, NULL, '2025-12-29 23:15:03', '2025-12-29 23:15:03', NULL, 2, 3, 3, 2.67),
(31, '2025-12-26', 833, '1476', 3, 1.26805556, 117.81972220, 'Jembatan', 'Sangat Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/MKtaoqY4dWnGGQEQ6G3zYcD44A16TatNxrVFKC1h.jpg', NULL, NULL, '2025-12-29 23:17:47', '2025-12-29 23:17:47', NULL, 3, 3, 3, 3.00),
(32, '2025-12-26', 832, '1446', 3, 1.26722222, 117.81805560, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/DDJTZgedZUjwsD9aJEOqM3IV676S9wJWJqTwIhN3.jpg', NULL, NULL, '2025-12-29 23:19:50', '2025-12-29 23:19:50', NULL, 2, 3, 3, 2.67),
(33, '2025-12-26', 833, '1413', 3, 1.26666667, 117.81777780, 'Jembatan', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/eonUWgiOozkA9IPA94fdLGftT7980q7660EbO5RF.jpg', 'monitoring_mingguan/gqwgBQ3rFw7fuOcW9o7ITAW8OLgOGh14uDy5f64i.jpg', NULL, '2025-12-30 18:49:16', '2025-12-30 18:49:16', NULL, 2, 2, 2, 2.00),
(34, '2025-12-26', 833, '1408', 3, 1.26638889, 117.81750000, 'Jembatan', 'Sedikit', 'Daun/Sampah Ringan', 'Tidak Perlu', 'monitoring_mingguan/U7YFATy52z6yOf2puk37omtq3MzwzGiMapDbGvSi.jpg', NULL, NULL, '2025-12-30 18:52:20', '2025-12-30 18:52:20', NULL, 2, 2, 3, 2.33),
(35, '2025-12-26', 834, '1396', 3, 1.26583333, 117.81972220, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/9ONBDrrSj6PqETM8AKoBPBDIi0eWLJK7aTWanfol.jpg', NULL, NULL, '2025-12-30 18:54:08', '2025-12-30 18:54:08', NULL, 2, 3, 3, 2.67),
(36, '2025-12-26', 834, '1393', 3, 1.26583333, 117.82027780, 'Pipa (PVC)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/zu1pnR5plDsl93mj7sqtpjCbIqz3VKYK3TohX5iv.jpg', NULL, NULL, '2025-12-30 19:00:09', '2025-12-30 19:00:09', NULL, 2, 3, 3, 2.67),
(37, '2025-12-26', 834, '1374', 3, 1.26583333, 117.82000000, 'Pipa (PVC)', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/628QOLWmUqU67BfWDeq7DOvhTSzEL745K5kg4GGn.jpg', 'monitoring_mingguan/LTNEjO3cWLNdIBKDJwACQA64SBfBvVVPrIKuaTCv.jpg', NULL, '2025-12-30 19:03:13', '2025-12-30 19:03:13', NULL, 2, 2, 2, 2.00),
(38, '2025-12-26', 833, '1573', 3, 1.26583333, 117.82111110, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/kZvHoQNhsPEDfHpsqBqVN81BT0FEQ2k8F7MhmjlZ.jpg', NULL, NULL, '2025-12-30 19:06:50', '2025-12-30 19:06:50', NULL, 2, 3, 3, 2.67),
(39, '2025-12-26', 833, '1394', 3, 1.26583333, 117.82250000, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/ypnjoUNeSreStJ1UtDqrGFCVwjKVMeb7OQh99wXD.jpg', NULL, NULL, '2025-12-30 19:11:07', '2025-12-30 19:11:07', NULL, 2, 3, 3, 2.67),
(40, '2025-12-26', 834, '1745', 3, 1.26555556, 117.82250000, 'Pipa (PVC)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/l0PltgaSqjmYbubo0yHM1ZmDsy8rmCcu054d4mJh.jpg', NULL, NULL, '2025-12-30 19:13:40', '2025-12-30 19:13:40', NULL, 2, 3, 3, 2.67),
(43, '2026-01-02', 831, '1752', 3, 1.24972222, 117.81472220, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/8rSVF7tkZMOU1h2vVkjrCSAfb6eaTE5Ujv67JfMo.jpg', NULL, NULL, '2026-01-03 02:38:33', '2026-01-03 02:38:33', NULL, 2, 3, 3, 2.67),
(44, '2026-01-02', 831, '879', 3, 1.25000000, 117.81472220, 'Pipa (PVC)', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/D5ZbKwVpNYofWcUNqTNsUz95PYsfM9Wux4rZM2N0.jpg', 'monitoring_mingguan/Jwiu4RPa19n2L8gv3rZNKmv8kN6UKYmyW0zdnqmJ.jpg', NULL, '2026-01-03 03:32:41', '2026-01-03 03:32:41', NULL, 2, 2, 2, 2.00),
(45, '2026-01-02', 831, '877', 3, 1.25166667, 117.81472220, 'Pipa (PVC)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/iOEmUpCmAZui3IGvc57Ooq3jrDzkJCtQ6eDxzuxe.jpg', NULL, NULL, '2026-01-03 03:38:10', '2026-01-03 03:38:10', NULL, 2, 3, 3, 2.67),
(46, '2026-01-02', 831, '877', 3, 1.25166667, 117.81472220, 'Pipa (PVC)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/0ukOUNRnOkjHE0xKbtNwogmYGfNdUiyhznkQs3lb.jpg', NULL, NULL, '2026-01-03 03:41:51', '2026-01-03 03:41:51', NULL, 2, 3, 3, 2.67),
(47, '2026-01-02', 831, '1750', 3, 1.25000000, 117.80750000, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/gjDqhkTm0gnbwKLtLMdgD0RgwnUUOTKnW3exlAil.jpg', NULL, NULL, '2026-01-03 18:02:44', '2026-01-03 18:02:44', NULL, 3, 3, 3, 3.00),
(48, '2026-01-02', 831, '889', 3, 1.25416667, 117.80972220, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/2fFwz5cPHoSZQmrSag3Ur7jqiJBGUP5oDq7oluvu.jpg', NULL, NULL, '2026-01-03 18:05:51', '2026-01-03 18:05:51', NULL, 3, 3, 3, 3.00),
(49, '2026-01-02', 831, '976', 3, 1.25444444, 117.81083330, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/q66AueflvokVztSwFP6QMwMzC5BuakmF0ysMwmCC.jpg', NULL, NULL, '2026-01-03 18:09:05', '2026-01-03 18:09:05', NULL, 3, 3, 3, 3.00),
(50, '2026-01-02', 880, '733', 4, 1.24694444, 117.84944440, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/NdtFBv80Uf18M3tCSC92hJLcXwIrulVuhHTy9ZAP.jpg', NULL, NULL, '2026-01-03 18:15:57', '2026-01-03 18:15:57', NULL, 3, 3, 3, 3.00),
(51, '2026-01-02', 874, '722', 4, 1.24638889, 117.84805560, 'Jembatan', 'Lancar', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/a48RxoDJZLt1duTtQGumSzOkSYQ7ORcBuSuMpmLH.jpg', 'monitoring_mingguan/PIX15WEePPIfvRbA1jhM0jgF4pmVBrmdV68JFe9o.jpg', NULL, '2026-01-03 18:18:13', '2026-01-03 18:18:13', NULL, 3, 2, 2, 2.33),
(52, '2026-01-02', 874, '725', 4, 1.24638889, 117.84333330, 'Jembatan', 'Lancar', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/4BDM7P3K3gZtCvPVVr2mAwJbMaeHoI7a2V1OMcvu.jpg', 'monitoring_mingguan/LNo20dGqlXmPjURTudhEmwoS25PwZSV4KEWhb1re.jpg', NULL, '2026-01-03 18:19:56', '2026-01-03 18:19:56', NULL, 3, 2, 2, 2.33),
(53, '2026-01-02', 868, '741', 4, 1.24666667, 117.00722220, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/PS5CayHxlFjK7tFtIZZLStZm59FeQCNS2D6TX4Zg.jpg', 'monitoring_mingguan/Cx2dReao2Zh5g1tcWyGIeyHkx6yY99gXf5evWamK.jpg', NULL, '2026-01-03 18:24:56', '2026-01-03 18:24:56', NULL, 2, 2, 2, 2.00),
(54, '2026-01-02', 868, '747', 4, 1.24888889, 117.84055560, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/iyWLZqxzorHFHbwi4FYF7ovCDCFlVQw6EsBxBbhs.jpg', NULL, NULL, '2026-01-03 18:32:32', '2026-01-03 18:32:32', NULL, 2, 3, 3, 2.67),
(55, '2026-01-02', 874, '788', 4, 1.24888889, 117.84083330, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/4MkVdUExLlOy52BZiOgyhL3VFVQYOiRZcGyaMUIi.jpg', 'monitoring_mingguan/dttQ4WdXwUgAG4Yz3eRKswVyeGQYTqP2b1Wo1pSG.jpg', NULL, '2026-01-03 18:34:13', '2026-01-03 18:34:13', NULL, 2, 2, 2, 2.00),
(56, '2026-01-02', 874, '789', 4, 1.24888889, 117.84250000, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/WAVX1ZzW2qjI8qTqpidgvKkIRuf2FXQzShgeQP5v.jpg', NULL, NULL, '2026-01-03 18:35:48', '2026-01-03 18:35:48', NULL, 3, 3, 3, 3.00),
(59, '2026-01-02', 887, '655', 4, 1.24250000, 117.84194440, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/Oj4seUukH0VgGAJES4B1IwSCsF9YRVxgW3GJt8AG.jpg', NULL, NULL, '2026-01-03 18:52:16', '2026-01-03 18:52:16', NULL, 2, 3, 3, 2.67),
(63, '2026-01-02', 881, '682', 5, 1.24527778, 117.84055560, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/tB0w2JNwikiT8sAlngsU0FKAb8RaXmaGtlF7DQIK.jpg', NULL, NULL, '2026-01-03 19:58:02', '2026-01-03 19:58:02', NULL, 3, 3, 3, 3.00),
(64, '2026-01-02', 887, '680', 5, 1.24500000, 117.84055560, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/933S585UWHgcrWD6OwZ72ZhpVriayHtCV4ScS9G3.jpg', NULL, NULL, '2026-01-03 20:01:13', '2026-01-03 20:01:13', NULL, 3, 3, 3, 3.00),
(65, '2026-01-02', 887, '655', 5, 1.24416667, 117.84111110, 'Jembatan', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/hN8OTODSHntweSIVR6lrQVB8pniNIaV3FSJgzAAt.jpg', NULL, NULL, '2026-01-03 20:03:55', '2026-01-03 20:03:55', NULL, 2, 3, 3, 2.67),
(66, '2026-01-02', 887, '640', 5, 1.24250000, 117.84194440, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Penuh', 'Eksekusi Segera + Lapor', 'monitoring_mingguan/xHbfNbql4WLkm8x9onsICaAxnvkJvkIzGJpDGP7Y.jpg', 'monitoring_mingguan/FhknG87bV7yyJdSAuw451IHqzokQip6Ij3ZPGs0K.jpg', 'Butuh alat berat karena Gorong-gorong NF longsor', '2026-01-03 20:06:21', '2026-01-03 20:06:21', NULL, 2, 1, 1, 1.33),
(67, '2026-01-02', 888, '506', 5, 1.23944444, 117.84333330, 'Pipa (PVC)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/posC3UC5OCyyZYAtzPDmWkxCEI2dr1ooXxoKudko.jpg', NULL, NULL, '2026-01-03 20:08:28', '2026-01-03 20:08:28', NULL, 3, 3, 3, 3.00),
(68, '2026-01-02', 888, '570', 5, 1.23944444, 117.84388890, 'Pipa (PVC)', 'Sedikit', 'Penuh', 'Eksekusi Segera + Lapor', 'monitoring_mingguan/CZoB9bFTfQ1FgdFKM080VVujkiwGPhs5I0cdIlMS.jpg', 'monitoring_mingguan/Q8dLHjDN4Fplr5WQsVc0SpJtkpThcnwEyILuofnq.jpg', 'Butuh alat berat karena pipa sudah tertimbun oleh tanah', '2026-01-03 20:10:31', '2026-01-03 20:10:31', NULL, 2, 1, 1, 1.33),
(69, '2026-01-02', 888, '572', 5, 1.23944444, 117.84500000, 'Pipa (PVC)', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/tfIjUmtQorNE4QIbpN86bMmKLdwN3J5URLQuLgK6.jpg', NULL, NULL, '2026-01-03 20:12:33', '2026-01-03 20:12:33', NULL, 2, 3, 3, 2.67),
(70, '2026-01-02', 889, '483', 5, 1.23944444, 117.84611110, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/NBhwjpovo5zVdoVJMxo80zUiXqUJAm2q11XkYxur.jpg', 'monitoring_mingguan/bPAXJvfaYYerKMfAvS2MiXXfG97EK3cpckdVoTpG.jpg', NULL, '2026-01-03 20:14:37', '2026-01-03 20:14:37', NULL, 2, 2, 2, 2.00),
(71, '2026-01-02', 889, '484', 5, 1.23944444, 117.84694440, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/eEU5H1frKMKVWJNUSqScV1DozZXIKTZKgV8dJlMb.jpg', NULL, NULL, '2026-01-03 20:16:42', '2026-01-03 20:16:42', NULL, 3, 3, 3, 3.00),
(72, '2026-01-02', 889, '463', 5, 1.23833333, 117.84944440, 'Jembatan', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/PuGOXqSGL8uFwvus1sYw347RvDaIqhINrcejc0za.jpg', NULL, NULL, '2026-01-03 20:18:39', '2026-01-03 20:18:39', NULL, 2, 3, 3, 2.67),
(73, '2026-01-02', 891, '348', 5, 1.23694444, 117.84333330, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/fjoxEreM6pWF7YsAgdktZimCIH0bE4C3MI7UElTZ.jpg', NULL, NULL, '2026-01-03 20:20:54', '2026-01-03 20:20:54', NULL, 3, 3, 3, 3.00),
(74, '2026-01-02', 890, '385', 5, 1.23472222, 117.84472220, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/K3ttYUJKVJHWdW5rohpCeku5zRSpAaxHANNuPGEs.jpg', NULL, NULL, '2026-01-03 22:00:09', '2026-01-03 22:00:09', NULL, 2, 3, 3, 2.67),
(75, '2026-01-02', 892, '343', 5, 1.23222222, 117.84055560, 'Gorong-Gorong Baja (NF)', 'Tidak Mengalir', 'Penuh', 'Eksekusi Segera + Lapor', 'monitoring_mingguan/hTsjYjbtZzhr6b7aNaJVn1e9zX1STmZdinPt3hQJ.jpg', 'monitoring_mingguan/yZTgVj5Elh26Ie8jNp2xEmV7DOPga0rhH7ohEDkc.jpg', 'Butuh alat berat karena sudah tertimbun tanah', '2026-01-03 22:04:45', '2026-01-03 22:04:45', NULL, 1, 1, 1, 1.00),
(76, '2026-01-02', 885, '410', 5, 1.23638889, 117.84027780, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/7VD0dmqbOuB38pbhXpOSafh3MQcEv2WRQAdXaGCZ.jpg', NULL, NULL, '2026-01-03 22:06:46', '2026-01-03 22:06:46', NULL, 3, 3, 3, 3.00),
(77, '2026-01-02', 885, '345', 5, 1.23222222, 117.84027780, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/lPjbuak8W8iZJQdtwwz8jTIwIPp7doP8WTyD81tK.jpg', NULL, NULL, '2026-01-03 22:08:56', '2026-01-03 22:08:56', NULL, 3, 3, 3, 3.00),
(78, '2026-01-02', 891, '348', 5, 1.23388889, 117.84916670, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/Vt5afV58zwEymS0GIDv4VZVMwwLL8SzrFYvA6U4y.jpg', NULL, NULL, '2026-01-03 22:11:21', '2026-01-03 22:11:21', NULL, 3, 3, 3, 3.00),
(79, '2026-01-02', 892, '323', 5, 1.23111111, 117.84916670, 'Jembatan', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/rjdqY49RIFIMBmLEpyPFK9xWpV4vyZC4R2w4QYlM.jpg', NULL, NULL, '2026-01-03 22:13:17', '2026-01-03 22:13:17', NULL, 3, 3, 3, 3.00),
(80, '2026-01-09', 868, '793', 6, 1.24666667, 117.84055560, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/SGM5nlYRaC9HIjMWgtV3VeaoSyQnVwlecaQ5pZhA.jpg', NULL, NULL, '2026-01-23 03:39:14', '2026-01-23 03:39:14', NULL, 3, 3, 3, 3.00),
(82, '2026-01-09', 868, '797', 6, 1.24666667, 117.83833330, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/rbCo47vuJg4RLdmpnmjZpruPukUUttuFslt2HAhH.jpg', NULL, NULL, '2026-01-23 15:56:31', '2026-01-23 15:56:31', NULL, 3, 3, 3, 3.00),
(83, '2026-01-09', 868, '798', 6, 1.24666667, 117.83694440, 'Jembatan', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/XlHk2G7LL1e7WjBN1zYLcCbUaNr2z8pZGMZT2qBu.jpg', NULL, NULL, '2026-01-23 15:58:24', '2026-01-23 15:58:24', NULL, 2, 3, 3, 2.67),
(84, '2026-01-09', 850, '731', 6, 1.24666667, 117.83138890, 'Pipa (PVC)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/TSceaglApxn4AwdXICMhbXRE4Ug3aYiBKFLIM8FZ.jpg', NULL, NULL, '2026-01-23 16:02:41', '2026-01-23 16:02:41', NULL, 3, 3, 3, 3.00),
(85, '2026-01-09', 868, '741', 6, 1.24722222, 117.84055560, 'Jembatan', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/M3f11glHWO4Xu3oFeJlX4oxJszeJKV9SfG1gCUuz.jpg', 'monitoring_mingguan/U58B76seaDeW7ZuETyfYsHPpZzW4dPQKmpKE0xer.jpg', NULL, '2026-01-23 16:08:01', '2026-01-23 16:08:01', NULL, 2, 2, 2, 2.00),
(86, '2026-01-09', 850, '786', 6, 1.24916667, 117.83138890, 'Gorong-Gorong Baja (NF)', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/2oaUjpIq0z8JxVSrdgDGTlNeKPA6jrFaIgyVx7Ew.jpg', 'monitoring_mingguan/dydZynFi0WFNEyneUVcMKe4yOxMCzdpiJ5l7P6ey.jpg', NULL, '2026-01-23 16:10:46', '2026-01-23 16:10:46', NULL, 2, 2, 2, 2.00),
(87, '2026-01-09', 868, '798', 6, NULL, NULL, 'Gorong-Gorong Baja (NF)', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/aF9ncquJEAJK3OqBPKcAdGYcorwoA2BFIZy3zcor.jpg', 'monitoring_mingguan/CURsX3VBvNnjONAbtQqjkdS85WIxjACYhhxQJZUW.jpg', NULL, '2026-01-23 16:19:58', '2026-01-23 16:19:58', NULL, 2, 2, 2, 2.00),
(88, '2026-01-09', 868, '797', 6, 1.24916667, 117.83916670, 'Pipa (PVC)', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/Tc8iaNO9X6spjvbM3Qjx1GQiwFYcMVatiS0Ot7Og.jpg', NULL, NULL, '2026-01-23 16:21:53', '2026-01-23 16:21:53', NULL, 1, 3, 3, 2.33),
(89, '2026-01-09', 874, '793', 6, 1.24888889, 117.84055560, 'Gorong-Gorong Baja (NF)', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/aq0oNoq5aSbjx4Nqb1Jev0qQ2rBATmOdGq9fg41P.jpg', NULL, NULL, '2026-01-23 16:24:13', '2026-01-23 16:24:13', NULL, 3, 3, 3, 3.00),
(90, '2026-01-09', 866, '944', 6, 1.25138889, 117.84000000, 'Jembatan', 'Lancar', 'Daun/Sampah Ringan', 'Tidak Perlu', 'monitoring_mingguan/O2JGMhEgNpwuaLIMwLPaH2gJoMDb10WtS9m7LDFe.jpg', NULL, NULL, '2026-01-23 16:28:13', '2026-01-23 16:28:13', NULL, 3, 2, 3, 2.67),
(97, '2026-02-13', 866, '952', 6, 1.25154390, 117.83197520, 'PVC', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/TnDNgzA94HFH0CJItzL4LoCmp1AnYjoX47R8PI0x.jpg', 'monitoring_mingguan/KOiM7z1ZHQfOJx4QBUEFRWxFAhnAqqZScFwzMm5D.jpg', NULL, '2026-02-13 01:07:35', '2026-02-13 01:07:35', NULL, 2, 2, 2, 2.00),
(98, '2026-02-13', 866, '948', 6, 1.25393860, 117.83388200, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/E0vgTI8aA0m85YUKBvzowz0pSEbZEulRvnBZe28J.jpg', NULL, NULL, '2026-02-13 01:15:09', '2026-02-13 01:15:09', NULL, 2, 3, 3, 2.67),
(99, '2026-02-13', 866, '948', 6, 1.25389240, 117.83369560, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/7Uj9NeImhVXVMJxprR6jeoJpDZjiAJf5A6rBzODP.jpg', NULL, NULL, '2026-02-13 01:15:38', '2026-02-13 01:15:38', NULL, 2, 3, 3, 2.67),
(100, '2026-02-13', 866, '952', 6, 1.25396030, 117.83169820, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/Mp62vivGOYlN7cjYq8PT6TjKdn5fSSZWvamkWJAM.jpg', NULL, NULL, '2026-02-13 01:15:46', '2026-02-13 01:15:46', NULL, 1, 3, 3, 2.33),
(101, '2026-02-13', 865, '1015', 6, 1.25395460, 117.83170880, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/fiTCj6OgKBiTZA3cmbnFmK76I6L6t7RjKjRVfeFw.jpg', NULL, NULL, '2026-02-13 01:15:54', '2026-02-13 01:15:54', NULL, 1, 3, 3, 2.33),
(102, '2026-02-13', 865, '1015', 6, 1.25515020, 117.83163460, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/IAUh5XqZNFD5X2rnDl0u6gyxPGipQl80aE2XBRtl.jpg', NULL, NULL, '2026-02-13 01:16:00', '2026-02-13 01:16:00', NULL, 1, 3, 3, 2.33),
(103, '2026-02-13', 864, '1080', 6, 1.25637000, 117.83348310, 'NF', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/85DyEtZp8T5rj96muBF3qcvrEowsFKmQyuNPoXF4.jpg', NULL, NULL, '2026-02-13 01:16:07', '2026-02-13 01:16:07', NULL, 3, 3, 3, 3.00),
(104, '2026-02-13', 864, '1080', 6, 1.25634860, 117.83564260, 'NF', 'Lancar', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/LcdXLE8LemBYm4Hu30ohOVRA76vZJebvL5OoSG68.jpg', 'monitoring_mingguan/aaIRzcYktys2MdsRmaex2Bl5spDdtkwIelVFtLKK.jpg', NULL, '2026-02-13 01:16:23', '2026-02-13 01:16:23', NULL, 3, 2, 2, 2.33),
(105, '2026-02-13', 865, '1012', 6, 1.25621270, 117.83624770, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/gJnnD9QlhzhI9dBFZOQt4qr2oM69PmHHWWanqEQW.jpg', 'monitoring_mingguan/8SguYWpPyxgy3IAWinkOZZ1gBMgA3xVgboKr5d0N.jpg', NULL, '2026-02-13 01:16:36', '2026-02-13 01:16:36', NULL, 2, 2, 2, 2.00),
(106, '2026-02-13', 864, '1080', 6, 1.25858490, 117.83593660, 'NF', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/6DRrUTqm1xcuMBtCWlAa0Ka6gbMzjIHxGhExYpkZ.jpg', 'monitoring_mingguan/1zCPc7vELG9MUU7d5ffw8fn785CGTNy7fcjRs5Td.jpg', NULL, '2026-02-13 01:16:49', '2026-02-13 01:16:49', NULL, 2, 2, 2, 2.00),
(107, '2026-02-13', 863, '1183', 6, 1.25858490, 117.83593660, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/tUXFaynmv5mEkiSqUxvjLnEzp6TnhcrTaoAnnosW.jpg', NULL, NULL, '2026-02-13 01:16:54', '2026-02-13 01:16:54', NULL, 2, 3, 3, 2.67),
(108, '2026-02-13', 863, '1183', 6, 1.25858490, 117.83593660, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/lpm18ejBilKoiTB7ba5pJz2mDaZBemLS12Cu6xPX.jpg', NULL, NULL, '2026-02-13 01:17:01', '2026-02-13 01:17:01', NULL, 2, 3, 3, 2.67),
(109, '2026-02-13', 863, '1183', 6, 1.25859200, 117.83592240, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/AYklz9ctcPfxlcV0PwemI7YcsQV1jEbwcFU2MFPi.jpg', 'monitoring_mingguan/8mC2NlhL91aDh5hgfTBq1oDVtHrCLZZ2x9fm3IFj.jpg', NULL, '2026-02-13 01:17:13', '2026-02-13 01:17:13', NULL, 2, 2, 2, 2.00),
(110, '2026-02-13', 863, '1183', 6, 1.25865310, 117.83374270, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/7D2ywfOElL0HjN6rbsy92Lun1tyFPfO5BsRCm5sm.jpg', NULL, NULL, '2026-02-13 01:17:20', '2026-02-13 01:17:20', NULL, 2, 3, 3, 2.67),
(111, '2026-02-13', 862, '1285', 6, 1.26102260, 117.83603420, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/xTgkYdXaRfnd0CVnd9GMl5AUCpTqiSNCU18QCxFb.jpg', NULL, NULL, '2026-02-13 01:17:25', '2026-02-13 01:17:25', NULL, 3, 3, 3, 3.00),
(112, '2026-02-13', 862, '1214', 6, 1.26103650, 117.83931590, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/YCoJdZDjpc4t6tJmynDRktUBK8jsEWSmmcnMzbnw.jpg', NULL, NULL, '2026-02-13 01:17:31', '2026-02-13 01:17:31', NULL, 2, 3, 3, 2.67),
(113, '2026-02-13', 870, '1137', 6, 1.25965600, 117.84084960, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/tZ7GEDmYQHx9THbBfzQehAW9WuWoR3FmkeqVWfZP.jpg', NULL, NULL, '2026-02-13 01:17:40', '2026-02-13 01:17:40', NULL, 1, 3, 3, 2.33),
(114, '2026-02-13', 869, '1177', 6, 1.25983680, 117.84086250, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/kJekWi2Wgqz1iXiDMNXf4je2iiIQ5M5MQqwZiXOa.jpg', NULL, NULL, '2026-02-13 01:17:47', '2026-02-13 01:17:47', NULL, 1, 3, 3, 2.33),
(115, '2026-02-13', 869, '1177', 6, 1.26049200, 117.84090630, 'PVC', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/5gmmjCurk0Dxg0URT4hNo2HPucRHiFDNsGeNpSLy.jpg', NULL, NULL, '2026-02-13 01:17:50', '2026-02-13 01:17:50', NULL, 2, 3, 3, 2.67),
(116, '2026-02-13', 869, '1177', 6, 1.26099010, 117.84089520, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/CNuQOyhCPrNFiEgodOmbl8AFhOuBhWP1xIm5vXWt.jpg', NULL, NULL, '2026-02-13 01:18:01', '2026-02-13 01:18:01', NULL, 1, 3, 3, 2.33),
(117, '2026-02-13', 862, '1214', 6, 1.26154680, 117.84082570, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/OT9r5l0rg1rz1he8R71dvqLYJzVHtfG2YFbFNdZJ.jpg', NULL, NULL, '2026-02-13 01:18:07', '2026-02-13 01:18:07', NULL, 2, 3, 3, 2.67),
(118, '2026-02-13', 862, '1286', 6, 1.26322490, 117.84032840, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/TOj9FE106YnSJNUxIJXAvOtI8Q589ntN85X6IIWY.jpg', NULL, NULL, '2026-02-13 01:18:18', '2026-02-13 01:18:18', NULL, 1, 3, 3, 2.33),
(119, '2026-02-13', 862, '1284', 6, 1.26338620, 117.83744810, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/qb17tbOdJuZEX52qEUc7AbhVigVlWBJsCZv4Kbte.jpg', NULL, NULL, '2026-02-13 01:18:26', '2026-02-13 01:18:26', NULL, 3, 3, 3, 3.00),
(120, '2026-02-13', 862, '1285', 6, 1.26339770, 117.83685460, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/pzmgsvp918bTr1M6mKiO9ChEy6HSrszExEVzKHaa.jpg', NULL, NULL, '2026-02-13 01:18:36', '2026-02-13 01:18:36', NULL, 3, 3, 3, 3.00),
(121, '2026-02-13', 862, '1291', 6, 1.26400000, 117.83188420, 'PVC', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/D1dxHoPgTXdhWLWzXoApdsgIhSrs9YvqWxl9EdyD.jpg', 'monitoring_mingguan/hJNwRDajj6gI4cKjzXqpzaC4T4RvnzEc6Vbx5gJR.jpg', NULL, '2026-02-13 01:18:50', '2026-02-13 01:18:50', NULL, 2, 2, 2, 2.00),
(122, '2026-02-13', 862, '1747', 6, 1.26268040, 117.83176820, 'NF', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/B4yLiMYZJhtU60qGvUAy8RpBwrPXeOj7D0KBsexm.jpg', NULL, NULL, '2026-02-13 01:18:59', '2026-02-13 01:18:59', NULL, 2, 3, 3, 2.67),
(123, '2026-02-13', 862, '1291', 6, 1.26391960, 117.83180750, 'PVC', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/DDCUQSkRE2CGnB41K2YDidAzGsuLNJf90a3qod1Q.jpg', 'monitoring_mingguan/4dU1lb80Y0bX0XQP3dE21JQnE20Ss5lMSkIMKvwR.jpg', NULL, '2026-02-13 01:19:13', '2026-02-13 01:19:13', NULL, 2, 2, 2, 2.00),
(124, '2026-02-13', 866, '952', 6, 1.25160170, 117.83176170, 'PVC', 'Mengalir Sedang', 'Bersih', 'Eksekusi Rutin', 'monitoring_mingguan/k9VdIuaiVrpI1093ui6vsLjbn9uWjIvvrs16meZO.jpg', 'monitoring_mingguan/EDsrWaMAGx28vxt4YvKSc2ivbtC0DJaTUgSLLiMV.jpg', NULL, '2026-02-13 01:53:51', '2026-02-13 01:53:51', NULL, 2, 3, 2, 2.33),
(125, '2026-02-13', 866, '948', 6, 1.25371170, 117.83405330, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/rZ0LwTY1T6L24ZW5rDICZ0uF8fl5PrvPu6xCwDxm.jpg', NULL, NULL, '2026-02-13 01:53:54', '2026-02-13 01:53:54', NULL, 2, 3, 3, 2.67),
(126, '2026-02-13', 866, '948', 6, 1.25425330, 117.83364650, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/AEvfVj2Nh5XoIzcgTQA4nARFP7zal7ipDlEVgZ0p.jpg', NULL, NULL, '2026-02-13 01:53:57', '2026-02-13 01:53:57', NULL, 2, 3, 3, 2.67),
(127, '2026-02-13', 866, '952', 6, 1.25399000, 117.83253500, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/UfRzKGw1omPuISwDm5qhtOzt7Ai59iRB7kTvXRLI.jpg', NULL, NULL, '2026-02-13 01:54:02', '2026-02-13 01:54:02', NULL, 1, 3, 3, 2.33),
(128, '2026-02-13', 865, '1015', 6, 1.25386830, 117.83160170, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/qabyzrLKF8g5HLXEULBmGd5ePux9sM6DKA4nJGxd.jpg', NULL, NULL, '2026-02-13 01:54:07', '2026-02-13 01:54:07', NULL, 1, 3, 3, 2.33),
(129, '2026-02-13', 865, '1015', 6, 1.25507000, 117.83172330, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/XA0P4Vas8CgnF3uA9UbBARsvwut8SqHNHAZGrV6g.jpg', NULL, NULL, '2026-02-13 01:56:32', '2026-02-13 01:56:32', NULL, 1, 3, 3, 2.33),
(130, '2026-02-13', 864, '1083', 6, 1.25634330, 117.83340670, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/8fEzvXNVA066KLWo3MDYf5ZUXj1TbiSdkGj7gugU.jpg', NULL, NULL, '2026-02-13 01:56:34', '2026-02-13 01:56:34', NULL, 3, 3, 3, 3.00),
(131, '2026-02-13', 864, '1080', 6, 1.25622500, 117.83564330, 'NF', 'Lancar', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/lAc3VEPWu5UGEhY3OquZHnf0oV7GfQEcDmaOsm53.jpg', 'monitoring_mingguan/t6W7N3yP5C6Lu4jFUe7y0Xj8fb0QQ3mR4OlV18IG.jpg', NULL, '2026-02-13 01:56:55', '2026-02-13 01:56:55', NULL, 3, 2, 2, 2.33),
(132, '2026-02-13', 865, '1012', 6, 1.25620830, 117.83619000, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/VkY9EF7RiaL9OHF3uj4BqP6sm0ocoGpvUTdU5KgD.jpg', 'monitoring_mingguan/pj0lUpOwcWLe4gBCFY1hILJ0lNPrT4uZc0QI0lQn.jpg', NULL, '2026-02-13 01:57:04', '2026-02-13 01:57:04', NULL, 2, 2, 2, 2.00),
(133, '2026-02-13', 864, '1063', 6, 1.25703170, 117.84053830, 'JEMBATAN KAYU', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/0GK0AF66iDaVsBN6hfpuPRrq9BR9VpECdk5Yr9A2.jpg', 'monitoring_mingguan/ZDGIMuRFhaXeCrzUO0edYa2m5wkk7fCF40j6Nmga.jpg', NULL, '2026-02-13 01:57:12', '2026-02-13 01:57:12', NULL, 2, 2, 2, 2.00),
(134, '2026-02-13', 863, '1181', 6, 1.25842670, 117.83818000, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/UjFw6Dv5XSk6UqahUbXdN3CJ6oQ8eJi7EDRGHMc8.jpg', NULL, NULL, '2026-02-13 01:57:16', '2026-02-13 01:57:16', NULL, 2, 3, 3, 2.67),
(135, '2026-02-13', 863, '1182', 6, 1.25852670, 117.83692670, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/aK1mVu8tXZY0JefRplTb3TP3LDBrxtUCGlBXG2eS.jpg', NULL, NULL, '2026-02-13 01:57:21', '2026-02-13 01:57:21', NULL, 2, 3, 3, 2.67),
(136, '2026-02-13', 863, '1183', 6, 1.25864170, 117.83594330, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/ispwkLlhR5wmcrULpj2kLkIVyP82IsHJCQaaLPRx.jpg', 'monitoring_mingguan/AexJaY4Jzm2eAkfnDDcm0KEn3UsxcHEFihug8EFh.jpg', NULL, '2026-02-13 01:57:29', '2026-02-13 01:57:29', NULL, 2, 2, 2, 2.00),
(137, '2026-02-13', 863, '1183', 6, 1.25872670, 117.83362000, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/cTnl4hO1wS220su8apZaSYylPk1efAgyKYujqux5.jpg', NULL, NULL, '2026-02-13 01:57:34', '2026-02-13 01:57:34', NULL, 2, 3, 3, 2.67),
(138, '2026-02-13', 862, '1285', 6, 1.26105330, 117.83601500, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/0m30zqQuqJN1fPdyKd2aVSNzcORrEEBebJAzmgCy.jpg', NULL, NULL, '2026-02-13 01:57:38', '2026-02-13 01:57:38', NULL, 3, 3, 3, 3.00),
(139, '2026-02-13', 862, '1214', 6, 1.26101330, 117.83937170, 'JEMBATAN KAYU', 'Mengalir Sedang', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/M5bBrBex3cXaZ05xFSQ6qQSWuKwJMqZjLCFtODMT.jpg', NULL, NULL, '2026-02-13 01:57:41', '2026-02-13 01:57:41', NULL, 2, 3, 3, 2.67),
(140, '2026-02-13', 870, '1137', 6, 1.26044170, 117.84081830, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/kw5PJ2pjit2SXiTxl9LwdhFkVAqFc7r1yicpPRdm.jpg', NULL, NULL, '2026-02-13 01:57:45', '2026-02-13 01:57:45', NULL, 2, 3, 3, 2.67),
(141, '2026-02-13', 870, '1137', 6, 1.25958830, 117.84065170, 'JEMBATAN KAYU', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/hEW7c65is8dPJjW1duAsLzNhEbPO85OTMQV9hwss.jpg', NULL, NULL, '2026-02-13 01:57:50', '2026-02-13 01:57:50', NULL, 1, 3, 3, 2.33),
(142, '2026-02-13', 869, '1177', 6, 1.25987340, 117.84092670, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/5ko5MWQqtrRAH32dNEzMFSs4jaETGAgfPWzvr4a3.jpg', NULL, NULL, '2026-02-13 01:57:56', '2026-02-13 01:57:56', NULL, 1, 3, 3, 2.33),
(143, '2026-02-13', 869, '1177', 6, 1.26078170, 117.84070830, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/yQORbZUycLcDQEWuPH0kSWM34N0LYa1AGuHNwcK2.jpg', NULL, NULL, '2026-02-13 01:58:01', '2026-02-13 01:58:01', NULL, 1, 3, 3, 2.33),
(144, '2026-02-13', 862, '1214', 6, 1.26165170, 117.84086500, 'JEMBATAN KAYU', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/Y3aZZGwlfYvi6j1HcU0EuBkfAdhhfSmjfaSJjALM.jpg', NULL, NULL, '2026-02-13 01:58:06', '2026-02-13 01:58:06', NULL, 2, 3, 3, 2.67),
(145, '2026-02-13', 862, '1286', 6, 1.26309670, 117.84033000, 'PVC', 'Tidak Mengalir', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/jnYrWFRtj2EBMynhZ5UViAd1iOkNkf8hMmUsXn7a.jpg', NULL, NULL, '2026-02-13 01:58:11', '2026-02-13 01:58:11', NULL, 1, 3, 3, 2.33),
(146, '2026-02-13', 862, '1284', 6, 1.26321500, 117.83744000, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/6lfYZEo8kPStj879FSmCPwsmzbzzWuZkk7tootIW.jpg', NULL, NULL, '2026-02-13 01:58:15', '2026-02-13 01:58:15', NULL, 3, 3, 3, 3.00),
(147, '2026-02-13', 862, '1285', 6, 1.26321830, 117.83699330, 'JEMBATAN KAYU', 'Lancar', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/XnNsxFJ6dwzp7rw9ZKqgRjMdgjS82lg0A8GVr4YV.jpg', NULL, NULL, '2026-02-13 01:58:21', '2026-02-13 01:58:21', NULL, 3, 3, 3, 3.00),
(148, '2026-02-13', 862, '1291', 6, 1.26340990, 117.83288330, 'PVC', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/KRZSZuiKv1saaaGkavWwoCsRLKnhWhMZ24GAGpxX.jpg', 'monitoring_mingguan/r2pwCHktTFywCbd660RekIWhqHaABBjMrYy653ME.jpg', NULL, '2026-02-13 01:58:30', '2026-02-13 01:58:30', NULL, 2, 2, 2, 2.00),
(149, '2026-02-13', 862, '1747', 6, 1.26263330, 117.83176170, 'NF', 'Sedikit', 'Bersih', 'Tidak Perlu', 'monitoring_mingguan/i6oHcGTcPhFnfsbe4E5ZDtHW8fH6GYBnIbeRTJfw.jpg', NULL, NULL, '2026-02-13 01:58:35', '2026-02-13 01:58:35', NULL, 2, 3, 3, 2.67),
(150, '2026-02-13', 862, '1291', 6, 1.26343830, 117.83179000, 'PVC', 'Sedikit', 'Daun/Sampah Ringan', 'Eksekusi Rutin', 'monitoring_mingguan/KuotWdldVML9IAx9XRNPbOxmgmh0qRqxlEKSdWIl.jpg', 'monitoring_mingguan/0AGNOKpohRnroPjtarsrmxvRgGZ3YCJRA9LRP1xN.jpg', NULL, '2026-02-13 01:58:45', '2026-02-13 01:58:45', NULL, 2, 2, 2, 2.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3JhFizjQkvO1l3G3bsaN04IlnucCvskEQESx6vgh', NULL, '36.73.34.35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1dyTTM2WVBLTWFETTc1R2g5cFd5QW0zZGdVQmtLRkdHalo3Umo4MSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vYXBpLnBhbG13YXRlcm9zLXRhcC5jb20vc3lzdGVtL2Rvd24vMDMwNjA5IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772690709),
('AqgktQ3WKfusrjWI0KR4BaSy3Lrgbso78XkSG90d', NULL, '205.210.31.84', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXdYYUdIbzljcktZOWhQaHJVQkdrNTJsRG1kUjlUdUVoR1VkVml6VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3LmFwaS5wYWxtd2F0ZXJvcy10YXAuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772663002),
('CoTliuPiSXOUX3BhxaC9aFoDjJriqAlgEhP8ztgl', NULL, '34.19.0.174', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmVkbE1BNEh0eFlrVnJteDZJV1YwR3hFaVpSa0djcVRrcWx0R25rMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9hcGkucGFsbXdhdGVyb3MtdGFwLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772632071),
('l8ldMjwScfSmCs1mf0Z5k4Nv6cmSgRtXqIaPnjx0', NULL, '34.72.127.132', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmliNngyaWR5NXdQd1ZxbGlGSlQ1bkFBczZ5OUtnb1VleXM1UHVxMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly93d3cuYXBpLnBhbG13YXRlcm9zLXRhcC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772640132),
('nR17YohCVm3hJ7jRUnLkJzdP1nBJpauMTrhPvAqN', NULL, '195.178.110.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2dDR0RRbEphUFpZT2hDQmdFTW8wWmJuN0xFVldObjhoYWNrVTR6MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3LmFwaS5wYWxtd2F0ZXJvcy10YXAuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772672142),
('nWrRh6YnLMCm7qzqBchHB19vmrUchCMG7iPmEnI5', NULL, '34.59.183.19', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVlHRGRETTZVWmEwaHh5NTA5RDdTRVRnaUI5TW9HNUZlUlhtY0Y2aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9hcGkucGFsbXdhdGVyb3MtdGFwLmNvbSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1772641401),
('wQVXBgdAAz6jqAtq2LgvYUWogXpmEFxkzOfUOwfB', NULL, '45.148.10.23', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2V4aDIzcEpLTVNhdVQzTkNWdExiT0RoT2loOXJKN2R3dll1VDBDRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vd3d3LmFwaS5wYWxtd2F0ZXJvcy10YXAuY29tIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1772645846),
('YjOGzMhFQ3puQpbUW4K7kekttDUu2rPJHXE64ySp', NULL, '195.178.110.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmxmemh3NG83ejBaaFI1YXVBMXZIVU1JQTdKZG1qUUF5SzRJNGJ3RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpLnBhbG13YXRlcm9zLXRhcC5jb20iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1772672132);

-- --------------------------------------------------------

--
-- Struktur dari tabel `skoring`
--

CREATE TABLE `skoring` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` enum('Genangan','Parit','Infrastruktur','Water Level') NOT NULL,
  `kategori_parameter` varchar(50) NOT NULL,
  `label_kondisi` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `min_value` decimal(10,2) DEFAULT NULL,
  `max_value` decimal(10,2) DEFAULT NULL,
  `skor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `skoring`
--

INSERT INTO `skoring` (`id`, `unit`, `kategori_parameter`, `label_kondisi`, `keterangan`, `min_value`, `max_value`, `skor`, `created_at`, `updated_at`) VALUES
(28, 'Parit', 'Kedalaman', NULL, NULL, 80.00, 120.00, 3, '2025-12-27 21:42:51', '2025-12-27 21:42:51'),
(29, 'Parit', 'Aliran', 'Lancar', NULL, NULL, NULL, 3, '2025-12-27 21:42:51', '2025-12-27 21:42:51'),
(31, 'Parit', 'Penyebab', 'Bersih', NULL, NULL, NULL, 3, '2025-12-27 21:43:46', '2025-12-27 21:43:46'),
(32, 'Parit', 'Tindakan', 'Tidak Perlu', NULL, NULL, NULL, 3, '2025-12-27 21:43:47', '2025-12-27 21:43:47'),
(33, 'Parit', 'Kedalaman', NULL, NULL, 60.00, 79.00, 2, '2025-12-27 21:50:51', '2025-12-27 21:50:51'),
(34, 'Parit', 'Kedalaman', NULL, NULL, 121.00, 150.00, 2, '2025-12-27 21:50:51', '2025-12-27 21:50:51'),
(35, 'Parit', 'Aliran', 'Sedang', NULL, NULL, NULL, 2, '2025-12-27 21:50:51', '2025-12-27 21:50:51'),
(36, 'Parit', 'Aliran', 'Mengalir Sedikit', NULL, NULL, NULL, 2, '2025-12-27 21:50:51', '2025-12-27 21:50:51'),
(37, 'Parit', 'Penyebab', 'Daun/Sampah', NULL, NULL, NULL, 2, '2025-12-27 21:50:51', '2025-12-27 21:50:51'),
(38, 'Parit', 'Kedalaman', NULL, NULL, NULL, 60.00, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(39, 'Parit', 'Kedalaman', NULL, NULL, 150.00, NULL, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(40, 'Parit', 'Aliran', 'Tidak Mengalir', NULL, NULL, NULL, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(41, 'Parit', 'Penyebab', 'Penuh', NULL, NULL, NULL, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(42, 'Parit', 'Penyebab', 'Areal Rendahan', NULL, NULL, NULL, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(43, 'Parit', 'Penyebab', 'Masalah Struktural', NULL, NULL, NULL, 1, '2025-12-27 21:53:09', '2025-12-27 21:53:09'),
(44, 'Genangan', 'Durasi', '<1 Hari', NULL, NULL, NULL, 3, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(45, 'Genangan', 'Jumlah Pokok Terdampak', NULL, NULL, NULL, 5.00, 3, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(46, 'Genangan', 'Jumlah Pokok Terdampak', NULL, NULL, 5.00, 20.00, 2, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(47, 'Genangan', 'Jumlah Pokok Terdampak', NULL, NULL, 20.00, NULL, 1, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(50, 'Genangan', 'Kedalaman', NULL, NULL, NULL, 5.00, 3, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(51, 'Genangan', 'Kedalaman', NULL, NULL, 5.00, 15.00, 2, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(52, 'Genangan', 'Kedalaman', NULL, NULL, 15.00, NULL, 1, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(53, 'Genangan', 'Penyebab', 'Tidak Ada', NULL, NULL, NULL, 3, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(54, 'Genangan', 'Penyebab', 'Hujan Tinggi', NULL, NULL, NULL, 2, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(55, 'Genangan', 'Penyebab', 'Parit Tersumbat', NULL, NULL, NULL, 1, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(56, 'Genangan', 'Penyebab', 'Areal Rendahan', NULL, NULL, NULL, 1, '2025-12-27 21:59:56', '2025-12-27 21:59:56'),
(57, 'Genangan', 'Tindakan', 'Tidak Perlu', NULL, NULL, NULL, 3, '2025-12-27 22:03:10', '2025-12-27 22:03:10'),
(58, 'Genangan', 'Tindakan', 'Eksekusi Rutin', NULL, NULL, NULL, 2, '2025-12-27 22:03:10', '2025-12-27 22:03:10'),
(59, 'Genangan', 'Tindakan', 'Eskalasi', NULL, NULL, NULL, 1, '2025-12-27 22:03:10', '2025-12-27 22:03:10'),
(61, 'Parit', 'Tindakan', 'Eksekusi Rutin', NULL, NULL, NULL, 2, '2025-12-27 22:03:10', '2025-12-27 22:03:10'),
(62, 'Parit', 'Tindakan', 'Eskalasi', NULL, NULL, NULL, 1, '2025-12-27 22:03:10', '2025-12-27 22:03:10'),
(66, 'Infrastruktur', 'Aliran', 'Sangat Lancar', NULL, NULL, NULL, 3, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(67, 'Infrastruktur', 'Aliran', 'Lancar', NULL, NULL, NULL, 3, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(68, 'Infrastruktur', 'Aliran', 'Mengalir Sedang', NULL, NULL, NULL, 2, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(69, 'Infrastruktur', 'Aliran', 'Sedikit', NULL, NULL, NULL, 2, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(70, 'Infrastruktur', 'Aliran', 'Tidak Mengalir', NULL, NULL, NULL, 1, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(71, 'Infrastruktur', 'Penyebab', 'Bersih', NULL, NULL, NULL, 3, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(72, 'Infrastruktur', 'Penyebab', 'Daun/Sampah Ringan', NULL, NULL, NULL, 2, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(73, 'Infrastruktur', 'Penyebab', 'Penuh', NULL, NULL, NULL, 1, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(74, 'Infrastruktur', 'Penyebab', 'Areal Rendahan', NULL, NULL, NULL, 1, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(75, 'Infrastruktur', 'Tindakan', 'Tidak Perlu', NULL, NULL, NULL, 3, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(76, 'Infrastruktur', 'Tindakan', 'Eksekusi Rutin', NULL, NULL, NULL, 2, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(77, 'Infrastruktur', 'Tindakan', 'Eskalasi', NULL, NULL, NULL, 1, '2025-12-27 22:37:53', '2025-12-27 22:37:53'),
(78, 'Water Level', 'Ketinggian Air', NULL, NULL, 50.00, 70.00, 3, '2025-12-27 22:44:34', '2025-12-27 22:44:34'),
(79, 'Water Level', 'Ketinggian Air', NULL, NULL, 30.00, 49.00, 2, '2025-12-27 22:44:34', '2025-12-27 22:44:34'),
(80, 'Water Level', 'Ketinggian Air', NULL, NULL, 71.00, 85.00, 2, '2025-12-27 22:44:34', '2025-12-27 22:44:34'),
(81, 'Water Level', 'Ketinggian Air', NULL, NULL, NULL, 30.00, 1, '2025-12-27 22:44:34', '2025-12-27 22:44:34'),
(83, 'Water Level', 'Jarak ke Bibir', NULL, NULL, 150.00, NULL, 3, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(84, 'Water Level', 'Jarak ke Bibir', NULL, NULL, 80.00, 150.00, 2, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(85, 'Water Level', 'Jarak ke Bibir', NULL, NULL, NULL, 80.00, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(86, 'Water Level', 'Kondisi Aliran', 'Lancar dan Stabil', NULL, NULL, NULL, 3, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(87, 'Water Level', 'Kondisi Aliran', 'Tidak Optimal', NULL, NULL, NULL, 2, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(88, 'Water Level', 'Kondisi Aliran', 'Sangat Lambat', NULL, NULL, NULL, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(89, 'Water Level', 'Kondisi Aliran', 'Sangat Deras', NULL, NULL, NULL, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(90, 'Water Level', 'Risiko', 'Tidak Ada', NULL, NULL, NULL, 3, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(91, 'Water Level', 'Risiko', 'Potensi Backwater', NULL, NULL, NULL, 2, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(92, 'Water Level', 'Risiko', 'Lambat', NULL, NULL, NULL, 2, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(93, 'Water Level', 'Risiko', 'Banjir', NULL, NULL, NULL, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(94, 'Water Level', 'Risiko', 'Kekeringan', NULL, NULL, NULL, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(95, 'Water Level', 'Kapasitas Drainase', 'Optimal', NULL, NULL, NULL, 3, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(96, 'Water Level', 'Kapasitas Drainase', 'Terbatas', NULL, NULL, NULL, 2, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(97, 'Water Level', 'Kapasitas Drainase', 'Terganggu/Tidak Berfungsi', NULL, NULL, NULL, 1, '2025-12-27 22:44:35', '2025-12-27 22:44:35'),
(98, 'Water Level', 'Ketinggian Air', NULL, NULL, 85.00, NULL, 1, '2025-12-27 22:45:29', '2025-12-27 22:45:29'),
(99, 'Genangan', 'Durasi', '1-2 Hari', NULL, NULL, NULL, 2, '2025-12-29 19:37:21', '2025-12-29 19:37:21'),
(100, 'Genangan', 'Durasi', '>3 Hari', NULL, NULL, NULL, 1, '2025-12-29 19:37:21', '2025-12-29 19:37:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skoring_harians`
--

CREATE TABLE `skoring_harians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_monitoring_harian` bigint(20) UNSIGNED NOT NULL,
  `skor_kedalaman` int(11) NOT NULL DEFAULT 0,
  `skor_jumlah_pokok` int(11) NOT NULL DEFAULT 0,
  `skor_durasi` int(11) NOT NULL DEFAULT 0,
  `skor_aliran` int(11) NOT NULL DEFAULT 0,
  `skor_penyebab` int(11) NOT NULL DEFAULT 0,
  `total_skor` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `skoring_harians`
--

INSERT INTO `skoring_harians` (`id`, `id_monitoring_harian`, `skor_kedalaman`, `skor_jumlah_pokok`, `skor_durasi`, `skor_aliran`, `skor_penyebab`, `total_skor`, `created_at`, `updated_at`) VALUES
(10, 17, 10, 4, 3, 7, 9, 33, '2025-12-11 23:31:09', '2025-12-11 23:31:09'),
(11, 18, 7, 2, 3, 2, 6, 20, '2025-12-12 01:32:45', '2025-12-12 01:32:45'),
(12, 19, 4, 2, 3, 2, 5, 16, '2025-12-12 01:33:45', '2025-12-12 01:33:45'),
(13, 20, 4, 2, 3, 4, 8, 21, '2025-12-12 02:27:38', '2025-12-12 02:27:38'),
(14, 21, 10, 2, 10, 10, 6, 38, '2025-12-12 16:06:33', '2025-12-12 16:06:33'),
(15, 22, 7, 2, 10, 10, 6, 35, '2025-12-13 19:48:44', '2025-12-13 19:48:44'),
(16, 23, 7, 2, 10, 10, 6, 35, '2025-12-13 19:49:57', '2025-12-13 19:49:57'),
(17, 24, 2, 2, 10, 10, 6, 30, '2025-12-13 19:51:38', '2025-12-13 19:51:38'),
(18, 25, 7, 2, 10, 10, 6, 35, '2025-12-13 19:52:37', '2025-12-13 19:52:37'),
(19, 26, 7, 2, 10, 10, 6, 35, '2025-12-13 20:19:52', '2025-12-13 20:19:52'),
(20, 27, 7, 2, 10, 10, 6, 35, '2025-12-13 20:21:15', '2025-12-13 20:21:15'),
(21, 28, 4, 2, 10, 10, 6, 32, '2025-12-13 20:22:29', '2025-12-13 20:22:29'),
(22, 29, 4, 2, 10, 10, 6, 32, '2025-12-13 20:23:05', '2025-12-13 20:23:05'),
(23, 30, 2, 2, 10, 10, 6, 30, '2025-12-13 20:24:14', '2025-12-13 20:24:14'),
(24, 31, 10, 2, 10, 7, 1, 30, '2025-12-13 20:24:54', '2025-12-13 20:24:54'),
(25, 32, 2, 2, 3, 7, 1, 15, '2025-12-13 20:25:39', '2025-12-13 20:25:39'),
(26, 33, 4, 2, 10, 2, 1, 19, '2025-12-13 21:46:37', '2025-12-13 21:46:37'),
(27, 34, 4, 2, 10, 10, 6, 32, '2025-12-13 21:49:44', '2025-12-13 21:49:44'),
(28, 35, 4, 4, 10, 10, 6, 34, '2025-12-13 21:51:17', '2025-12-13 21:51:17'),
(30, 37, 4, 2, 10, 10, 6, 32, '2025-12-13 21:57:50', '2025-12-13 21:57:50'),
(31, 38, 4, 2, 10, 10, 6, 32, '2025-12-13 21:59:34', '2025-12-13 21:59:34'),
(32, 39, 7, 2, 10, 10, 6, 35, '2025-12-13 22:01:01', '2025-12-13 22:01:01'),
(33, 40, 7, 4, 10, 10, 6, 37, '2025-12-13 22:03:19', '2025-12-13 22:03:19'),
(34, 41, 10, 4, 10, 10, 6, 40, '2025-12-13 22:32:55', '2025-12-13 22:32:55'),
(35, 42, 10, 2, 10, 4, 1, 27, '2025-12-13 22:34:36', '2025-12-13 22:34:36'),
(36, 43, 10, 2, 10, 10, 5, 37, '2025-12-13 22:35:55', '2025-12-13 22:35:55'),
(37, 44, 4, 2, 10, 10, 6, 32, '2025-12-13 22:46:14', '2025-12-13 22:46:14'),
(38, 45, 4, 2, 10, 7, 8, 31, '2025-12-14 17:49:11', '2025-12-14 17:49:11'),
(39, 46, 2, 2, 10, 10, 6, 30, '2025-12-15 07:55:07', '2025-12-15 07:55:07'),
(40, 47, 7, 2, 10, 10, 6, 35, '2025-12-15 07:55:50', '2025-12-15 07:55:50'),
(41, 48, 2, 2, 10, 10, 6, 30, '2025-12-15 07:57:17', '2025-12-15 07:57:17'),
(42, 49, 7, 2, 10, 10, 6, 35, '2025-12-15 07:58:28', '2025-12-15 07:58:28'),
(43, 50, 2, 2, 10, 10, 6, 30, '2025-12-15 07:59:25', '2025-12-15 07:59:25'),
(44, 51, 4, 2, 10, 10, 6, 32, '2025-12-15 08:00:09', '2025-12-15 08:00:09'),
(45, 52, 4, 2, 3, 7, 5, 21, '2025-12-15 08:05:05', '2025-12-15 08:05:05'),
(46, 53, 4, 2, 3, 7, 5, 21, '2025-12-15 08:05:43', '2025-12-15 08:05:43'),
(47, 54, 4, 2, 10, 10, 6, 32, '2025-12-15 08:06:54', '2025-12-15 08:06:54'),
(48, 55, 10, 2, 10, 10, 6, 38, '2025-12-16 06:44:17', '2025-12-16 06:44:17'),
(49, 56, 4, 2, 10, 10, 6, 32, '2025-12-16 06:47:06', '2025-12-16 06:47:06'),
(50, 57, 4, 2, 3, 4, 1, 14, '2025-12-16 06:49:39', '2025-12-16 06:49:39'),
(51, 58, 2, 2, 10, 10, 6, 30, '2025-12-16 06:50:47', '2025-12-16 06:50:47'),
(52, 59, 10, 2, 3, 4, 1, 20, '2025-12-16 06:52:39', '2025-12-16 06:52:39'),
(53, 60, 2, 2, 10, 10, 6, 30, '2025-12-16 06:53:51', '2025-12-16 06:53:51'),
(54, 61, 4, 2, 10, 10, 6, 32, '2025-12-16 06:55:18', '2025-12-16 06:55:18'),
(55, 62, 2, 2, 10, 7, 6, 27, '2025-12-16 06:56:52', '2025-12-16 06:56:52'),
(56, 63, 4, 2, 10, 10, 6, 32, '2025-12-18 03:59:10', '2025-12-18 03:59:10'),
(57, 64, 10, 2, 3, 1, 1, 17, '2025-12-18 04:01:27', '2025-12-18 04:01:27'),
(58, 65, 4, 4, 10, 10, 6, 34, '2025-12-18 04:04:10', '2025-12-18 04:04:10'),
(79, 86, 4, 2, 10, 7, 6, 29, '2025-12-22 23:28:05', '2025-12-22 23:28:05'),
(80, 87, 10, 2, 10, 7, 6, 35, '2025-12-22 23:34:55', '2025-12-22 23:34:55'),
(81, 88, 7, 2, 10, 10, 6, 35, '2025-12-22 23:37:57', '2025-12-22 23:37:57'),
(82, 89, 7, 2, 10, 10, 6, 35, '2025-12-22 23:41:30', '2025-12-22 23:41:30'),
(83, 90, 7, 2, 10, 10, 6, 35, '2025-12-22 23:46:02', '2025-12-22 23:46:02'),
(84, 91, 4, 2, 10, 10, 6, 32, '2025-12-22 23:49:53', '2025-12-22 23:49:53'),
(85, 92, 4, 2, 10, 10, 6, 32, '2025-12-22 23:53:40', '2025-12-22 23:53:40'),
(86, 93, 4, 2, 10, 10, 6, 32, '2025-12-22 23:58:58', '2025-12-22 23:58:58'),
(87, 94, 4, 2, 10, 10, 6, 32, '2025-12-23 00:04:23', '2025-12-23 00:04:23'),
(88, 95, 2, 2, 3, 10, 6, 23, '2025-12-23 00:06:30', '2025-12-23 00:06:30'),
(89, 96, 4, 2, 10, 10, 6, 32, '2025-12-23 00:08:33', '2025-12-23 00:08:33'),
(90, 97, 2, 2, 10, 7, 1, 22, '2025-12-23 00:10:20', '2025-12-23 00:10:20'),
(91, 98, 10, 2, 3, 7, 1, 23, '2025-12-23 00:12:27', '2025-12-23 00:12:27'),
(92, 99, 4, 2, 10, 10, 6, 32, '2025-12-23 00:14:49', '2025-12-23 00:14:49'),
(93, 100, 7, 2, 10, 10, 6, 35, '2025-12-23 00:16:21', '2025-12-23 00:16:21'),
(94, 101, 2, 2, 10, 4, 1, 19, '2025-12-23 07:29:00', '2025-12-23 07:29:00'),
(95, 102, 10, 2, 10, 4, 1, 27, '2025-12-23 07:30:52', '2025-12-23 07:30:52'),
(96, 103, 4, 2, 10, 10, 5, 31, '2025-12-23 07:32:57', '2025-12-23 07:32:57'),
(97, 104, 7, 2, 10, 10, 5, 34, '2025-12-23 07:35:46', '2025-12-23 07:35:46'),
(98, 105, 7, 2, 10, 10, 6, 35, '2025-12-23 07:39:52', '2025-12-23 07:39:52'),
(99, 106, 4, 2, 10, 10, 6, 32, '2025-12-23 07:41:44', '2025-12-23 07:41:44'),
(100, 107, 10, 2, 10, 10, 6, 38, '2025-12-23 07:43:58', '2025-12-23 07:43:58'),
(101, 108, 7, 4, 10, 10, 6, 37, '2025-12-23 07:50:34', '2025-12-23 07:50:34'),
(102, 109, 4, 2, 10, 10, 6, 32, '2025-12-23 07:53:03', '2025-12-23 07:53:03'),
(103, 110, 7, 4, 10, 10, 6, 37, '2025-12-23 09:03:01', '2025-12-23 09:03:01'),
(104, 111, 2, 2, 3, 7, 1, 15, '2025-12-23 09:05:30', '2025-12-23 09:05:30'),
(105, 112, 7, 2, 10, 10, 6, 35, '2025-12-23 09:07:05', '2025-12-23 09:07:05'),
(106, 113, 7, 2, 10, 10, 6, 35, '2025-12-23 09:10:51', '2025-12-23 09:10:51'),
(107, 114, 7, 2, 10, 7, 6, 32, '2025-12-23 09:12:28', '2025-12-23 09:12:28'),
(108, 115, 4, 0, 10, 10, 6, 30, '2025-12-23 18:48:48', '2025-12-23 18:48:48'),
(109, 116, 4, 0, 10, 10, 6, 30, '2025-12-23 18:50:47', '2025-12-23 18:50:47'),
(110, 117, 7, 0, 10, 10, 6, 33, '2025-12-23 18:52:51', '2025-12-23 18:52:51'),
(111, 118, 7, 0, 10, 10, 6, 33, '2025-12-23 18:54:47', '2025-12-23 18:54:47'),
(112, 119, 2, 0, 10, 10, 1, 23, '2025-12-23 18:57:25', '2025-12-23 18:57:25'),
(113, 120, 7, 0, 10, 10, 6, 33, '2025-12-23 19:02:36', '2025-12-23 19:02:36'),
(114, 121, 10, 0, 10, 10, 6, 36, '2025-12-23 19:04:21', '2025-12-23 19:04:21'),
(115, 122, 7, 0, 10, 10, 6, 33, '2025-12-23 19:07:55', '2025-12-23 19:07:55'),
(116, 123, 10, 2, 3, 1, 1, 17, '2025-12-25 03:21:58', '2025-12-25 03:21:58'),
(117, 124, 7, 2, 10, 10, 6, 35, '2025-12-25 03:23:59', '2025-12-25 03:23:59'),
(118, 125, 7, 2, 10, 10, 6, 35, '2025-12-25 03:26:46', '2025-12-25 03:26:46'),
(119, 126, 4, 2, 10, 10, 6, 32, '2025-12-25 03:28:50', '2025-12-25 03:28:50'),
(120, 127, 7, 2, 10, 10, 6, 35, '2025-12-25 03:31:39', '2025-12-25 03:31:39'),
(121, 128, 4, 2, 10, 10, 6, 32, '2025-12-25 03:33:06', '2025-12-25 03:33:06'),
(122, 129, 10, 2, 10, 10, 6, 38, '2025-12-25 03:39:56', '2025-12-25 03:39:56'),
(123, 130, 4, 2, 10, 10, 6, 32, '2025-12-25 03:41:57', '2025-12-25 03:41:57'),
(124, 131, 4, 2, 10, 10, 10, 36, '2025-12-25 05:31:44', '2025-12-25 05:31:44'),
(125, 132, 2, 2, 10, 10, 6, 30, '2025-12-25 05:33:37', '2025-12-25 05:33:37'),
(126, 133, 4, 2, 3, 7, 1, 17, '2025-12-25 05:35:07', '2025-12-25 05:35:07'),
(127, 134, 10, 2, 10, 7, 1, 30, '2025-12-25 05:37:21', '2025-12-25 05:37:21'),
(128, 135, 4, 2, 10, 10, 6, 32, '2025-12-25 05:39:20', '2025-12-25 05:39:20'),
(129, 136, 2, 2, 10, 10, 6, 30, '2025-12-25 05:40:53', '2025-12-25 05:40:53'),
(130, 137, 4, 4, 10, 10, 6, 34, '2025-12-25 05:45:37', '2025-12-25 05:45:37'),
(131, 138, 7, 4, 10, 10, 6, 37, '2025-12-25 05:46:58', '2025-12-25 05:46:58'),
(132, 139, 7, 4, 10, 10, 6, 37, '2025-12-25 05:48:08', '2025-12-25 05:48:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `water_levels`
--

CREATE TABLE `water_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `id_karyawan` bigint(20) UNSIGNED DEFAULT NULL,
  `lat_aktual` decimal(10,8) DEFAULT NULL COMMENT 'Lokasi GPS HP Petugas',
  `long_aktual` decimal(11,8) DEFAULT NULL,
  `no_water_level` varchar(255) DEFAULT NULL,
  `tinggi_level_air` int(11) NOT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('Good Condition','Need Maintenance','Urgent Condition') DEFAULT NULL,
  `jarak_ke_bibir` decimal(8,2) DEFAULT 0.00,
  `kondisi_aliran` varchar(255) DEFAULT NULL,
  `risiko` varchar(255) DEFAULT NULL,
  `kapasitas_drainase` varchar(255) DEFAULT NULL,
  `skor_ketinggian` int(11) DEFAULT 0,
  `skor_jarak` int(11) DEFAULT 0,
  `skor_aliran` int(11) DEFAULT 0,
  `skor_risiko` int(11) DEFAULT 0,
  `skor_drainase` int(11) DEFAULT 0,
  `rata_rata_skor` decimal(5,2) DEFAULT 0.00,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `water_level_masters`
--

CREATE TABLE `water_level_masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_wl` varchar(255) NOT NULL,
  `id_lokasi` bigint(20) UNSIGNED NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `water_level_masters`
--

INSERT INTO `water_level_masters` (`id`, `no_wl`, `id_lokasi`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(8, 'WL 03', 885, '1.23374624', '117.83538517', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(9, 'WL 04', 855, '1.23549668', '117.82835590', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(10, 'WL 05', 855, '1.23538940', '117.82848999', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(11, 'WL 06', 854, '1.23746914', '117.82806270', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(12, 'WL 07', 851, '1.24448320', '117.82825227', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(13, 'WL 01', 840, '1.24974314', '117.81482142', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(14, 'WL 02', 848, '1.25247422', '117.82326563', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(15, 'WL 08', 907, '1.23707605', '117.86715353', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(16, 'WL 09', 937, '1.22164878', '117.85836785', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(17, 'WL 10', 946, '1.22477505', '117.87594715', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(18, 'WL 11', 962, '1.24553367', '117.89396457', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(19, 'WL 12', 966, '1.23552962', '117.88811906', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(20, 'WL 13', 993, '1.26231410', '117.89023172', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(21, 'WL 14', 1024, '1.27315808', '117.89511779', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(22, 'WL 15', 1051, '1.27463675', '117.91970870', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(23, 'WL 17', 1043, '1.26315923', '117.91533445', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(24, 'WL 18', 1040, '1.25559969', '117.90503584', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(25, 'WL 19', 885, '1.23348941', '117.83228614', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(26, 'WL 20', 885, '1.23358816', '117.83223861', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(27, 'WL 21', 949, '1.21596897', '117.87127171', '2026-02-08 05:59:11', '2026-02-08 07:06:53'),
(28, 'WL 22', 874, '1.24696464', '117.84946488', '2026-02-08 05:59:12', '2026-02-08 07:06:53'),
(29, 'WL 23', 1221, '1.26182452', '117.86291272', '2026-02-08 05:59:12', '2026-02-08 07:06:53'),
(30, 'WL 24', 843, '1.26535942', '117.83171917', '2026-02-08 05:59:12', '2026-02-08 07:06:53'),
(31, 'WL 25', 896, '1.23933467', '117.85863764', '2026-02-08 05:59:12', '2026-02-08 07:06:53'),
(32, 'WL 26', 942, '1.23023888', '117.85871010', '2026-02-08 05:59:12', '2026-02-08 07:06:53'),
(33, 'TEST WL1', 827, '-7.42474374', '109.34062118', '2026-02-11 03:48:40', '2026-02-11 03:54:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `infrastructure_masters`
--
ALTER TABLE `infrastructure_masters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `infrastructure_masters_id_object_unique` (`id_object`),
  ADD KEY `infrastructure_masters_id_lokasi_foreign` (`id_lokasi`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lokasi_afdeling_blok_unique` (`afdeling`,`blok`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitoring_harian_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `monitoring_harian_id_karyawan_foreign` (`id_karyawan`),
  ADD KEY `monitoring_harian_lat_aktual_long_aktual_index` (`lat_aktual`,`long_aktual`);

--
-- Indeks untuk tabel `monitoring_mingguan`
--
ALTER TABLE `monitoring_mingguan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitoring_mingguan_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `monitoring_mingguan_id_karyawan_foreign` (`id_karyawan`),
  ADD KEY `monitoring_mingguan_lat_aktual_long_aktual_index` (`lat_aktual`,`long_aktual`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `skoring`
--
ALTER TABLE `skoring`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `skoring_harians`
--
ALTER TABLE `skoring_harians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skoring_harians_id_monitoring_harian_foreign` (`id_monitoring_harian`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `water_levels`
--
ALTER TABLE `water_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `water_levels_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `water_levels_id_karyawan_foreign` (`id_karyawan`);

--
-- Indeks untuk tabel `water_level_masters`
--
ALTER TABLE `water_level_masters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `water_level_masters_no_wl_unique` (`no_wl`),
  ADD KEY `water_level_masters_id_lokasi_foreign` (`id_lokasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `infrastructure_masters`
--
ALTER TABLE `infrastructure_masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=696;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT untuk tabel `monitoring_mingguan`
--
ALTER TABLE `monitoring_mingguan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `skoring`
--
ALTER TABLE `skoring`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `skoring_harians`
--
ALTER TABLE `skoring_harians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `water_levels`
--
ALTER TABLE `water_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `water_level_masters`
--
ALTER TABLE `water_level_masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `infrastructure_masters`
--
ALTER TABLE `infrastructure_masters`
  ADD CONSTRAINT `infrastructure_masters_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `monitoring_harian`
--
ALTER TABLE `monitoring_harian`
  ADD CONSTRAINT `monitoring_harian_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`),
  ADD CONSTRAINT `monitoring_harian_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `monitoring_mingguan`
--
ALTER TABLE `monitoring_mingguan`
  ADD CONSTRAINT `monitoring_mingguan_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`),
  ADD CONSTRAINT `monitoring_mingguan_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `skoring_harians`
--
ALTER TABLE `skoring_harians`
  ADD CONSTRAINT `skoring_harians_id_monitoring_harian_foreign` FOREIGN KEY (`id_monitoring_harian`) REFERENCES `monitoring_harian` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `water_levels`
--
ALTER TABLE `water_levels`
  ADD CONSTRAINT `water_levels_id_karyawan_foreign` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id`),
  ADD CONSTRAINT `water_levels_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `water_level_masters`
--
ALTER TABLE `water_level_masters`
  ADD CONSTRAINT `water_level_masters_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
