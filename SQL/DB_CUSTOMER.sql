-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 06, 2022 at 05:28 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB_CUSTOMER`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_branch`
--

CREATE TABLE `m_branch` (
  `BRANCH_ID` int(11) NOT NULL,
  `BRANCH_NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_branch`
--

INSERT INTO `m_branch` (`BRANCH_ID`, `BRANCH_NAME`) VALUES
(1, 'BALARAJA'),
(2, 'BALARAJA SYARIAH'),
(3, 'BEKASI'),
(4, 'BEKASI SYARIAH'),
(5, 'BSD'),
(6, 'BSD SYARIAH'),
(7, 'CIKANDE'),
(8, 'CIKANDE SYARIAH'),
(9, 'MAUK'),
(10, 'MAUK SYARIAH'),
(11, 'TANGERANG SELATAN 2'),
(12, 'TANGERANG 3'),
(13, 'RAWAMANGUN'),
(14, 'RAWAMANGUN SYARIAH'),
(15, 'ROXY');

-- --------------------------------------------------------

--
-- Table structure for table `m_product`
--

CREATE TABLE `m_product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_product`
--

INSERT INTO `m_product` (`PRODUCT_ID`, `PRODUCT_NAME`) VALUES
(1, 'BAJAJ'),
(2, 'HONDA'),
(3, 'KAWASAKI'),
(4, 'SUZUKI'),
(5, 'YAMAHA'),
(6, 'DATSUN'),
(7, 'HONDA'),
(8, 'ISUZU'),
(9, 'MAZDA'),
(10, 'TOYOTA');

-- --------------------------------------------------------

--
-- Table structure for table `t_data_customer`
--

CREATE TABLE `t_data_customer` (
  `CUST_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(30) NOT NULL,
  `LAST_NAME` varchar(30) NOT NULL,
  `PHONE_NO` varchar(13) NOT NULL,
  `BRANCH_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `TENOR_ID` int(11) NOT NULL,
  `AVATAR` varchar(100) NOT NULL,
  `DTM_CRT` datetime NOT NULL,
  `USR_CRT` varchar(30) NOT NULL,
  `DTM_UPD` datetime DEFAULT NULL,
  `USR_UPD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_log_apirequest`
--

CREATE TABLE `t_log_apirequest` (
  `REQ_ID` int(11) NOT NULL,
  `ENDPOINT` varchar(30) NOT NULL,
  `PARAMETER_IN` varchar(255) NOT NULL,
  `LOG_ID` varchar(255) NOT NULL,
  `REQUEST_DATE` datetime NOT NULL,
  `DTM_CRT` datetime NOT NULL,
  `USR_CRT` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_log_apiresponse`
--

CREATE TABLE `t_log_apiresponse` (
  `REQ_ID` int(11) NOT NULL,
  `ENDPOINT` varchar(30) NOT NULL,
  `PARAMETER_IN` varchar(255) NOT NULL,
  `LOG_ID` varchar(255) NOT NULL,
  `RESPONSE_CODE` varchar(255) NOT NULL,
  `RESPONSE_MESSAGE` varchar(255) NOT NULL,
  `RESPONSE_DATE` datetime NOT NULL,
  `DTM_CRT` datetime NOT NULL,
  `USR_CRT` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_branch`
--
ALTER TABLE `m_branch`
  ADD PRIMARY KEY (`BRANCH_ID`);

--
-- Indexes for table `m_product`
--
ALTER TABLE `m_product`
  ADD PRIMARY KEY (`PRODUCT_ID`);

--
-- Indexes for table `t_data_customer`
--
ALTER TABLE `t_data_customer`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `t_log_apirequest`
--
ALTER TABLE `t_log_apirequest`
  ADD PRIMARY KEY (`REQ_ID`);

--
-- Indexes for table `t_log_apiresponse`
--
ALTER TABLE `t_log_apiresponse`
  ADD PRIMARY KEY (`REQ_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_branch`
--
ALTER TABLE `m_branch`
  MODIFY `BRANCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `m_product`
--
ALTER TABLE `m_product`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_data_customer`
--
ALTER TABLE `t_data_customer`
  MODIFY `CUST_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_log_apirequest`
--
ALTER TABLE `t_log_apirequest`
  MODIFY `REQ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- AUTO_INCREMENT for table `t_log_apiresponse`
--
ALTER TABLE `t_log_apiresponse`
  MODIFY `REQ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=732;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
