-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 08:10 AM
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
-- Database: `universitas_winter`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dsn` int(11) NOT NULL,
  `nama_dsn` varchar(25) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `alamat_dsn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dsn`, `nama_dsn`, `jabatan`, `alamat_dsn`) VALUES
(1, 'Mikael', 'Ketua Jurusan Teknik Elektro', 'Tuguran'),
(2, 'Lu Bu', 'Dosen', 'Mertoyudan'),
(3, 'Ervira', 'Dosen', 'Kalinegoro'),
(4, 'Kaiju', 'Dosen', 'Karet');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id_mhs` int(11) DEFAULT NULL,
  `kode_mk` varchar(10) DEFAULT NULL,
  `semester` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id_mhs`, `kode_mk`, `semester`) VALUES
(1, 'MKT1001', '3'),
(1, 'MKT1002', '3'),
(1, 'MKTIF1001', '3'),
(1, 'MKTIF1002', '3'),
(2, 'MKTIF1001', '3'),
(2, 'MKTIF1002', '3'),
(2, 'MKU2001', '3'),
(2, 'MKU2002', '3'),
(3, 'MKU2001', '3'),
(3, 'MKU2002', '3'),
(3, 'MKT1001', '3'),
(3, 'MKT1002', '3');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nama_mhs` varchar(25) NOT NULL,
  `alamat_mhs` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama_mhs`, `alamat_mhs`) VALUES
(1, 'Azazel', 'Tuguran'),
(2, 'Guan Yu', 'Kawatan'),
(3, 'Cao Cao', 'Bandongan'),
(4, 'Ultraman', 'Borobudur');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` varchar(10) NOT NULL,
  `nama_mk` varchar(25) NOT NULL,
  `sks` char(2) NOT NULL,
  `id_dsn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`, `id_dsn`) VALUES
('MKDOK1001', 'Anatomi', '2', 4),
('MKDOK1002', 'Fisiologi', '3', 4),
('MKT1001', 'Kalkulus', '3', 1),
('MKT1002', 'Fisika', '3', 1),
('MKTIF1001', 'Basis Data', '3', 2),
('MKTIF1002', 'Struktur Data', '2', 2),
('MKU2001', 'Bahasa Inggris', '3', 3),
('MKU2002', 'Bahasa Indonesia', '2', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dsn`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD KEY `id_mhs` (`id_mhs`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`),
  ADD KEY `id_dsn` (`id_dsn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dsn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`),
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kode_mk`);

--
-- Constraints for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`id_dsn`) REFERENCES `dosen` (`id_dsn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
