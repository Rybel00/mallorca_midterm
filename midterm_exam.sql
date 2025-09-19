-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2025 at 06:38 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `midterm_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentID` varchar(25) NOT NULL,
  `doctorID` varchar(25) NOT NULL,
  `patientID` varchar(25) NOT NULL,
  `date` varchar(25) NOT NULL,
  `time` varchar(25) NOT NULL,
  `room` varchar(25) NOT NULL,
  PRIMARY KEY (`appointmentID`),
  UNIQUE KEY `doctorID` (`doctorID`,`patientID`),
  KEY `patientID` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentID`, `doctorID`, `patientID`, `date`, `time`, `room`) VALUES
('345', 'JE 6586', '005675', 'Sep. 19 2025', '1:57pm', '13'),
('346', 'HU 2412', '002791', 'Sep. 19 2025', '1:58pm', '23');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `bilID` varchar(25) NOT NULL,
  `patientID` varchar(25) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `paymentStatus` varchar(25) NOT NULL,
  `paymentDate` varchar(25) NOT NULL,
  PRIMARY KEY (`bilID`),
  UNIQUE KEY `patientID` (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`bilID`, `patientID`, `amount`, `paymentStatus`, `paymentDate`) VALUES
('00331', '002791', '$100', 'Fully Payed', 'Sep. 19 2025'),
('00789', '005675', '$200', 'Partial', 'Sep. 19, 2025');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `doctorID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `specialization` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`doctorID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctorID`, `name`, `lastname`, `specialization`, `email`) VALUES
('HU 2412', 'Gabriel Lloyd', 'Ormas', 'Medicine', 'docgabriellloyd@gmail.com'),
('JE 6586', 'Dannhaya Rey', 'Ebro', 'Psychology', 'dannhayarey@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `patientID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `middle initial` varchar(25) NOT NULL,
  `age` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `dateofbirth` varchar(25) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `diagnosis` varchar(25) NOT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `name`, `lastname`, `middle initial`, `age`, `gender`, `address`, `dateofbirth`, `mobile`, `diagnosis`) VALUES
('002791', 'Cedric Klein', 'Arroyo', 'B.', '19', 'M', 'Lapaz, Iloilo', 'March 18, 2006', '09123456789', 'Osteoporosis'),
('005675', 'Justin Lorenz', 'Amorte', 'E.', '20', 'M', 'Pototan, Iloilo', 'June 18 2005', '09876543210', 'Addiction');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` varchar(25) NOT NULL,
  `fullname` varchar(25) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `fullname`, `mobile`, `email`, `password`) VALUES
('AK 1380', 'John Ivan Sydrie Elgario', '09318773278', 'blazeyyygaming@gmail.com', 'iloveurokudochannnn'),
('HN 1837', 'Lawrence Jay Gabionza', '09782467823', 'lawrencegabio@gmail.com', 'sakituloko');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`doctorID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients` (`patientID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
