-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2025 at 10:53 AM
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
-- Database: `rcc_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `quantity`) VALUES
(1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `AvailableStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `AvailableStock`) VALUES
(1, 'hotdog', 28),
(2, 'beef', 45);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'testing@email.com', 'testing 123'),
(2, 'backend@multisyscorp.com', '$2b$10$XyVPdPxjEIFPygn7yl8qju196iJC1DW0GvdwsyII6oqJH5kbJxrpi'),
(3, 'backend@multisyscorp.com', '$2b$10$1gkSMe8JZxrVGI3DayR15ev8lSeZdWmageKXTJiU./3ncCVwpaqeW'),
(4, 'testing@email.com', '$2b$10$WUuuNN44ze2dIvgCdn94M.nQfBs4b4apsF9AjWkLG11pBsMpVheT2'),
(5, 'testing12563@email.com', '$2b$10$Z2cPisKxdw.RQS2B0Ty9W.koyebd/Kre10o6nKVAowmTPcjH.aSbO'),
(6, 'testing@email.com', '$2b$10$FYbErnrvNXJWIR8evaeULesoj5T3eDgiS.a/MGb28yOxPEOxeckRO'),
(7, 'testing@email.com', '$2b$10$AsCoPynHsETujEk30ObSIelNfFHjD1BtTScE80Xp5m3wy4O2v0vdG'),
(8, 'testing@email.com', '$2b$10$ScE5uDpZbIqVXLCcSGyhguC6YYlPPmPhoJtFdQmlvZeWPXJtdH3cO'),
(9, 'testing@email.com', '$2b$10$V.TF3xJZTiNhPCt8M7g0zuhMFqnTKxNSV4Lzv08RzJte7O1AqYyKe'),
(10, 'micorilan@gmail.com', '$2b$10$yBmHGsDjCCrGMP3OwWnlPe5.8SFrkwEfiQd0xI8ghshXzGlgrTrry'),
(11, 'rcc@email.com', '$2b$10$gJIcW2pa7AAoDFDf3xLHOO.Z.IgPjkSQxdfFDbPD3zoFDdasWu.Ua');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
