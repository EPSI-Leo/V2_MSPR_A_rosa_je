-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 03, 2024 at 08:22 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arosaje`
--

-- --------------------------------------------------------

--
-- Table structure for table `advices`
--

USE arosaje;

DROP TABLE IF EXISTS `advices`;
CREATE TABLE IF NOT EXISTS `advices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int,
  `id_plant` int,
  `name` varchar(100) DEFAULT NULL,
  `advice` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_advices_users` FOREIGN KEY (`id_user`) REFERENCES `users`(`id`),
  CONSTRAINT `fk_advices_plants` FOREIGN KEY (`id_plant`) REFERENCES `plants`(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advices`
--
-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `beginAt` date NOT NULL,
  `endAt` date NOT NULL,
  `description` longtext NOT NULL,
  `picture` longblob NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_plants_users` FOREIGN KEY (`id_user`) REFERENCES `users`(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plants`
--
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cgu` int NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
