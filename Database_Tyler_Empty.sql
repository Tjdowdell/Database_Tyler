-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2016 at 01:01 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `database_tyler`
--
CREATE DATABASE IF NOT EXISTS `database_tyler` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database_tyler`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--
-- Creation: Feb 09, 2016 at 01:04 AM
--

CREATE TABLE IF NOT EXISTS `category` (
  `Category_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifying number of cars category',
  `Description` varchar(300) NOT NULL COMMENT 'Description of cars category',
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is the category table containing information about a cars category' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--
-- Creation: Feb 08, 2016 at 11:51 PM
--

CREATE TABLE IF NOT EXISTS `customers` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifying number of customer',
  `First_Name` varchar(50) NOT NULL COMMENT 'First name of customer',
  `Last_Name` varchar(100) NOT NULL COMMENT 'Last name of customer',
  `Address` varchar(50) NOT NULL COMMENT 'Address of customer',
  `City` varchar(100) NOT NULL COMMENT 'City customer lives in',
  `State` varchar(50) NOT NULL COMMENT 'State customer lives in',
  `Postcode` varchar(20) NOT NULL COMMENT 'Postcode of the customer',
  `Email_Address` varchar(100) NOT NULL COMMENT 'Email address of the customer',
  `Phone_Number` varchar(10) NOT NULL COMMENT 'Phone number of the customer',
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table is the customer table containing information about customers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--
-- Creation: Feb 09, 2016 at 01:03 AM
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `Manufacturer_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifying number of car manufacturer',
  `Name` varchar(100) NOT NULL COMMENT 'Name of car manufacturer',
  PRIMARY KEY (`Manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the table that contains info about the manufacturer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--
-- Creation: Feb 09, 2016 at 11:41 PM
--

CREATE TABLE IF NOT EXISTS `sale` (
  `Recipt_No` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique number for purchase of vehicle',
  `Staff_ID` int(11) NOT NULL COMMENT 'Unique identifier for staff',
  `Customer_ID` int(11) NOT NULL COMMENT 'Unique identifier for customer',
  `Date` date NOT NULL COMMENT 'Date and time of purchase',
  `Stock_No` int(11) NOT NULL COMMENT 'Unique number for number of cars in caryard',
  PRIMARY KEY (`Recipt_No`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Stock_No` (`Stock_No`),
  KEY `Stock_No_2` (`Stock_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the junction table' AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `sale`:
--   `Customer_ID`
--       `customers` -> `Customer_ID`
--   `Staff_ID`
--       `salesperson` -> `Staff_ID`
--   `Stock_No`
--       `vehicles` -> `Stock_No`
--

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--
-- Creation: Feb 09, 2016 at 01:04 AM
--

CREATE TABLE IF NOT EXISTS `salesperson` (
  `Staff_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifying number of staff',
  `First_Name` varchar(50) NOT NULL COMMENT 'First name of staff',
  `Last_Name` varchar(100) NOT NULL COMMENT 'Last name of staff',
  `Email_Address` varchar(100) NOT NULL COMMENT 'Email address of staff',
  `Phone_Number` varchar(10) NOT NULL COMMENT 'Phone number of staff',
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the table that contains info about the staff' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--
-- Creation: Feb 10, 2016 at 04:17 AM
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `VIN` int(11) NOT NULL COMMENT 'Vehicle identification number',
  `Stock_No` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique number for car in car yard',
  `Manufacturer_ID` int(11) NOT NULL COMMENT 'Unique identifying number of manufacturer',
  `Model` varchar(20) NOT NULL COMMENT 'Name of model of car',
  `Category_ID` int(11) NOT NULL COMMENT 'Unique identifying number of car category',
  `Year` varchar(4) NOT NULL COMMENT 'Year car was produced',
  `Price` varchar(10) NOT NULL COMMENT 'Price of car',
  `Kilometers` varchar(10) NOT NULL COMMENT 'Kilometers car has driven',
  `Colour` varchar(20) NOT NULL COMMENT 'Colour of car',
  `Registration` varchar(10) NOT NULL COMMENT 'Registration number of car',
  `Cylinders` varchar(3) NOT NULL COMMENT 'Number of Cylinders the car has',
  `Fuel` varchar(20) NOT NULL COMMENT 'Type of fuel the car uses',
  `Transmission` varchar(20) NOT NULL COMMENT 'Transmission of the car',
  `Specials` tinyint(1) NOT NULL COMMENT 'True/false statement for specials on cars',
  PRIMARY KEY (`Stock_No`),
  KEY `Manufacturer_ID` (`Manufacturer_ID`,`Category_ID`),
  KEY `Category_ID` (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is the table that contains information about the cars' AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `salesperson` (`Staff_ID`),
  ADD CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`Stock_No`) REFERENCES `vehicles` (`Stock_No`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
