-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2022 at 10:57 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_db_hotel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `simpan_f_hotel` (`id` INT(11), `nama_fasilitas` VARCHAR(255), `img` VARCHAR(255), `deks` VARCHAR(255))  BEGIN
	INSERT INTO f_hotel
	VALUE (id, nama_fasilitas, img, deks);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `simpan_f_kamar` (`id` INT(11), `id_tipekamar` INT(3), `nama_fasilitas` VARCHAR(255), `img` VARCHAR(255))  BEGIN
	INSERT INTO f_kamar
	VALUE (id, id_tipekamar, nama_fasilitas, img);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `simpan_pemesanan` (`id_pesanan` INT(11), `nama_pemesanan` VARCHAR(50), `email` VARCHAR(35), `no_hp` VARCHAR(35), `nama_tamu` VARCHAR(50), `id_kamar` INT(11), `tgl_cekin` DATE, `tgl_cekout` DATE, `jml_kamar` VARCHAR(35), `Harga` VARCHAR(35), `paybay` VARCHAR(255), `payend` VARCHAR(255), `no_kamar` VARCHAR(255), `refpb` VARCHAR(255))  BEGIN
	INSERT INTO pemesanan
	VALUE (id_pesanan, nama_pemesanan, email, no_hp, nama_tamu, id_kamar, tgl_cekin, tgl_cekout, jml_kamar, Harga, paybay, payend, no_kamar, refpb);
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `f_hotel`
--

CREATE TABLE `f_hotel` (
  `id` int(11) NOT NULL,
  `nama_fasilitas` text NOT NULL,
  `img` text NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_hotel`
--

INSERT INTO `f_hotel` (`id`, `nama_fasilitas`, `img`, `keterangan`) VALUES
(1, 'Kolam Renang', 'https://i.ibb.co/LNtZfzn/24109727-e1459403352177.jpg', 'Hotel'),
(2, 'Gym', 'https://i.ibb.co/Lr01Nx6/ibis-styles-jakarta-sunter.jpg', 'Hotel');

-- --------------------------------------------------------

--
-- Table structure for table `f_kamar`
--

CREATE TABLE `f_kamar` (
  `id` int(11) NOT NULL,
  `id_tipekamar` int(3) NOT NULL,
  `nama_fasilitas` text DEFAULT NULL,
  `kategory` varchar(255) DEFAULT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `f_kamar`
--

INSERT INTO `f_kamar` (`id`, `id_tipekamar`, `nama_fasilitas`, `kategory`, `img`) VALUES
(1, 1, 'TV LED 43 inch', 'Electronic', 'tv.jpg'),
(2, 1, 'Sofa Mewah', 'Aksesoris', 'sofa.jpg'),
(3, 1, '2 Kasur Besar', 'Aksesoris', '2 kasur besar.jpg'),
(4, 1, 'Meja makan', 'Aksesoris', 'Meja makan.jpg'),
(5, 2, 'TV LED 32 inch', 'Electronic', 'tv 32 inch.png'),
(6, 2, 'Sofa', 'Aksesoris', 'istockphoto-1300125969-170667a.jpg'),
(7, 2, '1 Kasur Besar', 'Aksesoris', 'Deluxe-King-Room-new.jpg'),
(8, 2, 'Meja Makan', 'Aksesoris', 'Ruang-Makan.jpg'),
(9, 3, '1 Kasur Sedang', 'Aksesoris', 'kasur sedang.jpg'),
(10, 3, 'TV LED 24 inch', 'Electronic', 'tv kamar standard.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesanan` int(11) NOT NULL,
  `nama_pemesan` varchar(50) NOT NULL,
  `email` varchar(35) NOT NULL,
  `no_telp` varchar(35) NOT NULL,
  `nama_tamu` varchar(50) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_cekin` date NOT NULL,
  `tgl_cekout` date NOT NULL,
  `jml_kamar` int(11) NOT NULL,
  `Harga` int(11) NOT NULL,
  `PayBay` varchar(244) NOT NULL,
  `PayEND` int(1) NOT NULL,
  `Status_Kamar` varchar(255) NOT NULL,
  `RefPB` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesanan`, `nama_pemesan`, `email`, `no_telp`, `nama_tamu`, `id_kamar`, `tgl_cekin`, `tgl_cekout`, `jml_kamar`, `Harga`, `PayBay`, `PayEND`, `Status_Kamar`, `RefPB`) VALUES
(14, 'Imelda Oktavia', 'imeldaoktavia0510@gmail.com', '0895414529229', 'imelda', 1, '2022-04-15', '2022-04-15', 1, 1000000, 'Onsite', 0, '0', '0414220eHxV051634'),
(15, 'Imelda Oktavia', 'imelda0510@gmail.com', '087823452922', 'imelda', 1, '2022-04-26', '2022-04-27', 2, 4000000, 'Onsite', 0, '0', '042622cuiEG085207'),
(16, 'Imelda Oktavia', 'imeldaoktavia0510@gmail.com', '0895414529229', 'waseda girls', 2, '2022-04-27', '2022-04-28', 3, 3000000, 'Bayar di Hotel', 0, '0', '042622Bayar di Hotel093346'),
(17, 'Imelda Oktavia', 'imel0510@gmail.com', '0895414529229', 'izka,vania,ruru', 3, '2022-04-29', '2022-04-29', 2, 1000000, 'Bayar di Hotel', 0, '0', '042822Bayar di Hotel105035'),
(18, 'Imelda Oktavia', 'imel0510@gmail.com', '0895414529229', 'imelda,azkia,annisa', 2, '2022-05-05', '2022-05-07', 1, 1500000, 'Transfer Bank', 1, '0', '042922Transfer Bank073515'),
(19, 'Imelda Oktavia', 'imeldaoktavia0510@gmail.com', '0895414529229', 'imel', 1, '2022-05-05', '2022-05-06', 1, 2000000, 'Bayar di Hotel', 1, '0', '050522Bayar di Hotel084906');

--
-- Triggers `pemesanan`
--
DELIMITER $$
CREATE TRIGGER `batal` AFTER DELETE ON `pemesanan` FOR EACH ROW BEGIN
UPDATE tipe_room
SET stok = stok + OLD.jml_kamar 
WHERE 
id = OLD.id_kamar;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stok` AFTER INSERT ON `pemesanan` FOR EACH ROW UPDATE
tipe_room SET stok = stok-NEW.jml_kamar

WHERE
id = NEW.id_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_room`
--

CREATE TABLE `tipe_room` (
  `id` int(11) NOT NULL,
  `Nama_room` varchar(244) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `Stok` int(11) NOT NULL,
  `onuse` int(11) NOT NULL,
  `onbook` int(11) NOT NULL,
  `img_room` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_room`
--

INSERT INTO `tipe_room` (`id`, `Nama_room`, `harga`, `Stok`, `onuse`, `onbook`, `img_room`) VALUES
(1, 'VIP', 2000000, 14, 0, 0, 'https://i.ibb.co/pKjYT2K/pnqrz-king-50668318.jpg'),
(2, 'Deluxe room', 1500000, 6, 0, 0, 'https://i.ibb.co/y86dfxm/Deluxe-King-Room-new.jpg'),
(3, 'Standard', 500000, 10, 0, 0, 'https://i.ibb.co/jgs881C/Group-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_login` int(11) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(35) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Jenis_Kelamin` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `level` enum('admin','resepsionis','tamu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_login`, `username`, `password`, `Nama`, `Jenis_Kelamin`, `tgllahir`, `no_telp`, `level`) VALUES
(1, 'imelda', '12345678', 'Imelda Oktavia', 'Perempuan', '2003-10-05', '0895414529229', 'tamu'),
(2, 'admin', '12345678', 'Oktavia', 'Perempuan', '2022-03-01', '081221823861', 'admin'),
(3, 'resepsionis', '12345678', 'Nichol', 'Laki-Laki', '2000-01-17', '081234567843', 'resepsionis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `f_hotel`
--
ALTER TABLE `f_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_kamar`
--
ALTER TABLE `f_kamar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `tipe_room`
--
ALTER TABLE `tipe_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `f_hotel`
--
ALTER TABLE `f_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `f_kamar`
--
ALTER TABLE `f_kamar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tipe_room`
--
ALTER TABLE `tipe_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
