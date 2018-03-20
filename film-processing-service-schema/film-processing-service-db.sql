-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2018 at 06:54 PM
-- Server version: 5.6.34-log
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `photoddb`
--
CREATE DATABASE IF NOT EXISTS `photoddb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `photoddb`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` int(20) NOT NULL,
  `surname` varchar(50) NOT NULL NULL,
  `first_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tier`
--

CREATE TABLE `tier` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client_tier`
--

CREATE TABLE `client_tier` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `tier_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client_account`
--

CREATE TABLE `client_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `work_order_result_id` int(10) UNSIGNED NOT NULL,
  `deposit` int(10) UNSIGNED NOT NULL
  `payment` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `amount` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paper_size`
--

CREATE TABLE `paper_size` (
  `id` int(11) UNSIGNED NOT NULL,
  `value_in_inches` varchar(30) NOT NULL,
  `value_in_cm` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paper_type`
--

CREATE TABLE `paper_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `payment_date` datetime NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_order`
--

CREATE TABLE `work_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `notes` varchar(254) DEFAULT NULL,
  `assignee_name` varchar(50) DEFAULT NULL,
  `roll_quantity` int(10) UNSIGNED NOT NULL,
  `paper_size_id` int(10) UNSIGNED NOT NULL,
  `quantity_each_print` int(10) UNSIGNED NOT NULL,
  `paper_type_id` int(10) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_result`
--

CREATE TABLE `work_order_result` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `negative_quantity` int(10) UNSIGNED NOT NULL,
  `print_number` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_status`
--

CREATE TABLE `work_order_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(254) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `work_order_tracking`
--

CREATE TABLE `work_order_tracking` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_order_id` int(10) UNSIGNED NOT NULL,
  `work_order_status_id` int(10) UNSIGNED NOT NULL,
  `date_state` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_index` (`email`);

--
-- Indexes for table `client_type`
--
ALTER TABLE `client_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_checkout_work_order_id` (`work_order_id`);

--
-- Indexes for table `paper_size`
--
ALTER TABLE `paper_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paper_type`
--
ALTER TABLE `paper_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work_order`
--
ALTER TABLE `work_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_work_order_paper_size_id` (`paper_size_id`),
  ADD KEY `fk_work_order_client_id` (`client_id`),
  ADD KEY `fk_work_order_paper_type_id` (`paper_type_id`);

--
-- Indexes for table `work_order_result`
--
ALTER TABLE `work_order_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_work_result_work_order_id` (`work_order_id`);

--
-- Indexes for table `work_order_status`
--
ALTER TABLE `work_order_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `work_order_tracking`
--
ALTER TABLE `work_order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_process_order_work_order_id` (`work_order_id`),
  ADD KEY `fk_work_order_tracking_work_order_status_id` (`work_order_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_type`
--
ALTER TABLE `client_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paper_size`
--
ALTER TABLE `paper_size`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paper_type`
--
ALTER TABLE `paper_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_order`
--
ALTER TABLE `work_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_order_result`
--
ALTER TABLE `work_order_result`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_order_status`
--
ALTER TABLE `work_order_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_order_tracking`
--
ALTER TABLE `work_order_tracking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_checkout_work_order_id` FOREIGN KEY (`work_order_id`) REFERENCES `work_order` (`id`);

--
-- Constraints for table `work_order`
--
ALTER TABLE `work_order`
  ADD CONSTRAINT `fk_work_order_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_work_order_paper_size_id` FOREIGN KEY (`paper_size_id`) REFERENCES `paper_size` (`id`),
  ADD CONSTRAINT `fk_work_order_paper_type_id` FOREIGN KEY (`paper_type_id`) REFERENCES `paper_type` (`id`);

--
-- Constraints for table `work_order_result`
--
ALTER TABLE `work_order_result`
  ADD CONSTRAINT `fk_work_result_work_order_id` FOREIGN KEY (`work_order_id`) REFERENCES `work_order` (`id`);

--
-- Constraints for table `work_order_tracking`
--
ALTER TABLE `work_order_tracking`
  ADD CONSTRAINT `fk_work_order_tracking_work_order_id` FOREIGN KEY (`work_order_id`) REFERENCES `work_order` (`id`),
  ADD CONSTRAINT `fk_work_order_tracking_work_order_status_id` FOREIGN KEY (`work_order_status_id`) REFERENCES `work_order_status` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
