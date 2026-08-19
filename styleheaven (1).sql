-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2026 at 01:26 AM
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
-- Database: `styleheaven (1)`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$Xo3z2asRsxm9r8DQ9kWG5OqpQcM8qEaIDWgXiRjFIqjIHG74gkG6u');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `size` varchar(10) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `looks`
--

CREATE TABLE `looks` (
  `id` int(11) NOT NULL,
  `look_name` varchar(255) DEFAULT NULL,
  `look_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `looks`
--

INSERT INTO `looks` (`id`, `look_name`, `look_image`) VALUES
(8, 'Brisket slice', 'brisket_slice.jpeg'),
(9, 'Shortplate us beef', 'dadu.jpeg'),
(10, 'MEALT SLICE', 'beef_slice.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `look_produk`
--

CREATE TABLE `look_produk` (
  `id` int(11) NOT NULL,
  `look_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `look_produk`
--

INSERT INTO `look_produk` (`id`, `look_id`, `produk_id`) VALUES
(11, 9, 96),
(12, 9, 97),
(13, 10, 96),
(14, 10, 97);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `status` enum('Pending','Diproses','Dikirim','Selesai','Dibatalkan') DEFAULT 'Pending',
  `tanggal_pesanan` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_penerima` varchar(255) NOT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `alamat_pengiriman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_harga`, `status`, `tanggal_pesanan`, `nama_penerima`, `bukti_transfer`, `alamat_pengiriman`) VALUES
(49, 7, 652000.00, 'Dikirim', '2026-08-19 20:45:32', 'admin', '1787172332_bca.jpg', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `harga_satuan` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `harga_satuan`, `quantity`, `size`) VALUES
(51, 49, 96, 276000.00, 2, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `waktutambah` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `kategori`, `harga`, `deskripsi`, `stok`, `gambar`, `waktutambah`) VALUES
(96, 'Brisket slice', 'Slice', 276000.00, 'Brisket slice Berkualitas', 0, '6a8609030bf5d_brisket_slice.jpeg', '2026-08-19 21:51:04'),
(97, 'Shortplate us beef', 'Slice', 276000.00, 'Shortplate us beef Slice Premium', 0, '6a860a6c9db97_beef_slice.jpeg', '2026-08-19 21:51:04'),
(98, 'Saikoro', 'Fillet', 96000.00, 'Saikoro Fillet Premium', 0, '6a860be3c7cbe_sirloin_fillet.jpeg', '2026-08-19 21:50:41'),
(99, 'Ribeye meltique', 'Dadu', 60000.00, 'Ribeye meltique Dadu Mealt Quality', 0, '6a860c2ed8d98_dadu.jpeg', '2026-08-19 21:50:24'),
(100, 'Iga Slice', 'Slice', 199000.00, 'Iga Slice', 0, '6a860c6cd3d74_iga_slice.jpeg', '2026-08-19 21:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `produk_ukuran`
--

CREATE TABLE `produk_ukuran` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `ukuran` varchar(10) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk_ukuran`
--

INSERT INTO `produk_ukuran` (`id`, `produk_id`, `ukuran`, `stok`) VALUES
(164, 97, 'M', 40),
(165, 96, 'L', 16),
(166, 98, 'XL', 50),
(167, 99, 'M', 60),
(168, 100, 'L', 45);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(7, 'admingue', '$2y$10$.WUvr9AU7Vxjn5xPW7Vni.k2QG7O4FFMiDAB2rufd7RTV6Tb4IbMO', '2026-08-17 19:42:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cart_ibfk_1` (`product_id`);

--
-- Indexes for table `looks`
--
ALTER TABLE `looks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `look_produk`
--
ALTER TABLE `look_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `look_id` (`look_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `looks`
--
ALTER TABLE `looks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `look_produk`
--
ALTER TABLE `look_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `look_produk`
--
ALTER TABLE `look_produk`
  ADD CONSTRAINT `look_produk_ibfk_1` FOREIGN KEY (`look_id`) REFERENCES `looks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `look_produk_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD CONSTRAINT `produk_ukuran_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
