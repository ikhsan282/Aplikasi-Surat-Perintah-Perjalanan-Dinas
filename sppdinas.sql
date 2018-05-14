-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2018 at 01:34 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppdinas`
--

-- --------------------------------------------------------

--
-- Table structure for table `bauk`
--

CREATE TABLE `bauk` (
  `no_bauk` varchar(8) NOT NULL,
  `tgl_bauk` datetime NOT NULL,
  `isi_acara` text NOT NULL,
  `tgl_acara` date NOT NULL,
  `jam_acara` time NOT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `kd_penyelenggara` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_biaya`
--

CREATE TABLE `detail_biaya` (
  `kd_jnspembiayaan` varchar(6) NOT NULL,
  `no_sd` varchar(6) NOT NULL,
  `biaya` double(6,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_surat_tugas`
--

CREATE TABLE `detail_surat_tugas` (
  `kd_detail_st` varchar(7) NOT NULL,
  `no_st` varchar(6) NOT NULL,
  `kd_pegawai` varchar(5) NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `kd_divisi` varchar(5) NOT NULL,
  `nm_divissi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `kd_golongan` varchar(5) NOT NULL,
  `nm_golongan` varchar(50) NOT NULL,
  `max_pembiayaan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `kd_jab` varchar(5) NOT NULL,
  `nm_jab` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pembiayaan`
--

CREATE TABLE `jenis_pembiayaan` (
  `kd_jnspembiayaan` varchar(6) NOT NULL,
  `nm_jnspembiayaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kwitansi`
--

CREATE TABLE `kwitansi` (
  `no_kwitansi` varchar(6) NOT NULL,
  `no_sd` varchar(6) NOT NULL,
  `tgl_kwitansi` datetime NOT NULL,
  `jumlah` double(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lpk`
--

CREATE TABLE `lpk` (
  `no_lpk` varchar(7) NOT NULL,
  `no_st` varchar(6) NOT NULL,
  `tgl_lpk` datetime NOT NULL,
  `keterangan_lpk` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kd_pegawai` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kd_golongan` varchar(5) NOT NULL,
  `kd_divisi` varchar(5) NOT NULL,
  `kd_jab` varchar(5) NOT NULL,
  `tlp` varchar(13) DEFAULT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penyelenggara`
--

CREATE TABLE `penyelenggara` (
  `kd_penyelenggara` varchar(6) NOT NULL,
  `nm_penyelenggara` varchar(50) NOT NULL,
  `alamat` text,
  `tlp` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `surat_dinas`
--

CREATE TABLE `surat_dinas` (
  `no_sd` varchar(6) NOT NULL,
  `tgl_sd` datetime NOT NULL,
  `kd_detail_st` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `surat_tugas`
--

CREATE TABLE `surat_tugas` (
  `no_st` varchar(6) NOT NULL,
  `tgl_st` datetime NOT NULL,
  `no_bauk` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bauk`
--
ALTER TABLE `bauk`
  ADD PRIMARY KEY (`no_bauk`),
  ADD KEY `fk_bauk_peny` (`kd_penyelenggara`);

--
-- Indexes for table `detail_biaya`
--
ALTER TABLE `detail_biaya`
  ADD PRIMARY KEY (`kd_jnspembiayaan`,`no_sd`),
  ADD KEY `fk_detail_biaya_sd` (`no_sd`);

--
-- Indexes for table `detail_surat_tugas`
--
ALTER TABLE `detail_surat_tugas`
  ADD PRIMARY KEY (`kd_detail_st`),
  ADD KEY `fk_detail_st_st` (`no_st`),
  ADD KEY `fk_detail_st_pegawai` (`kd_pegawai`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`kd_divisi`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`kd_golongan`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kd_jab`);

--
-- Indexes for table `jenis_pembiayaan`
--
ALTER TABLE `jenis_pembiayaan`
  ADD PRIMARY KEY (`kd_jnspembiayaan`);

--
-- Indexes for table `kwitansi`
--
ALTER TABLE `kwitansi`
  ADD PRIMARY KEY (`no_kwitansi`),
  ADD KEY `fk_kwitansi_sd` (`no_sd`);

--
-- Indexes for table `lpk`
--
ALTER TABLE `lpk`
  ADD PRIMARY KEY (`no_lpk`),
  ADD KEY `fk_lpk_st` (`no_st`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kd_pegawai`),
  ADD KEY `fk_pegawai_jab` (`kd_jab`),
  ADD KEY `fk_pegawai_divisi` (`kd_divisi`),
  ADD KEY `fk_pegawai_golongan` (`kd_golongan`);

--
-- Indexes for table `penyelenggara`
--
ALTER TABLE `penyelenggara`
  ADD PRIMARY KEY (`kd_penyelenggara`);

--
-- Indexes for table `surat_dinas`
--
ALTER TABLE `surat_dinas`
  ADD PRIMARY KEY (`no_sd`),
  ADD KEY `fk_no_sd_detail_st` (`kd_detail_st`);

--
-- Indexes for table `surat_tugas`
--
ALTER TABLE `surat_tugas`
  ADD PRIMARY KEY (`no_st`),
  ADD KEY `fk_st_bauk` (`no_bauk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bauk`
--
ALTER TABLE `bauk`
  ADD CONSTRAINT `fk_bauk_peny` FOREIGN KEY (`kd_penyelenggara`) REFERENCES `penyelenggara` (`kd_penyelenggara`);

--
-- Constraints for table `detail_biaya`
--
ALTER TABLE `detail_biaya`
  ADD CONSTRAINT `fk_detail_biaya_jnspembiayaan` FOREIGN KEY (`kd_jnspembiayaan`) REFERENCES `jenis_pembiayaan` (`kd_jnspembiayaan`),
  ADD CONSTRAINT `fk_detail_biaya_sd` FOREIGN KEY (`no_sd`) REFERENCES `surat_dinas` (`no_sd`);

--
-- Constraints for table `detail_surat_tugas`
--
ALTER TABLE `detail_surat_tugas`
  ADD CONSTRAINT `fk_detail_st_pegawai` FOREIGN KEY (`kd_pegawai`) REFERENCES `pegawai` (`kd_pegawai`),
  ADD CONSTRAINT `fk_detail_st_st` FOREIGN KEY (`no_st`) REFERENCES `surat_tugas` (`no_st`);

--
-- Constraints for table `kwitansi`
--
ALTER TABLE `kwitansi`
  ADD CONSTRAINT `fk_kwitansi_sd` FOREIGN KEY (`no_sd`) REFERENCES `surat_dinas` (`no_sd`);

--
-- Constraints for table `lpk`
--
ALTER TABLE `lpk`
  ADD CONSTRAINT `fk_lpk_st` FOREIGN KEY (`no_st`) REFERENCES `surat_tugas` (`no_st`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `fk_pegawai_divisi` FOREIGN KEY (`kd_divisi`) REFERENCES `divisi` (`kd_divisi`),
  ADD CONSTRAINT `fk_pegawai_golongan` FOREIGN KEY (`kd_golongan`) REFERENCES `golongan` (`kd_golongan`),
  ADD CONSTRAINT `fk_pegawai_jab` FOREIGN KEY (`kd_jab`) REFERENCES `jabatan` (`kd_jab`);

--
-- Constraints for table `surat_dinas`
--
ALTER TABLE `surat_dinas`
  ADD CONSTRAINT `fk_no_sd_detail_st` FOREIGN KEY (`kd_detail_st`) REFERENCES `detail_surat_tugas` (`kd_detail_st`);

--
-- Constraints for table `surat_tugas`
--
ALTER TABLE `surat_tugas`
  ADD CONSTRAINT `fk_st_bauk` FOREIGN KEY (`no_bauk`) REFERENCES `bauk` (`no_bauk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
