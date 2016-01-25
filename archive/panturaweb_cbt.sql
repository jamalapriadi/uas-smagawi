-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2016 at 06:54 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `panturaweb_cbt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jamal Apriadi', 'jamal.apriadi@gmail.com', '$2y$10$luQOeq52HNf6egBNxTZl2ejOi0HKIioXnPA1Udav.VQzQpq7V1gsi', 'Q9Cic1GptE4VxrIW77ejtLoMESi8kw0DeF6EZBqI7kF8EqNliN0J02tvaa5R', '2016-01-25 16:55:48', '2016-01-25 09:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `detail_jadwal`
--

DROP TABLE IF EXISTS `detail_jadwal`;
CREATE TABLE IF NOT EXISTS `detail_jadwal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_jadwal` int(10) unsigned DEFAULT NULL,
  `kd_kelas` varchar(10) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `id_ruang` int(10) unsigned DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL,
  `pengawas` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`kd_kelas`),
  KEY `index3` (`id_jadwal`),
  KEY `index4` (`id_ruang`),
  KEY `index5` (`pengawas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `detail_jadwal`
--

INSERT INTO `detail_jadwal` (`id`, `id_jadwal`, `kd_kelas`, `jam_mulai`, `id_ruang`, `status`, `pengawas`) VALUES
(4, 3, 'x.ims.1', NULL, 1, '0', '123');

-- --------------------------------------------------------

--
-- Table structure for table `detail_soal`
--

DROP TABLE IF EXISTS `detail_soal`;
CREATE TABLE IF NOT EXISTS `detail_soal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_soal` int(10) unsigned NOT NULL,
  `pertanyaan` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `jawaban_a` varchar(255) DEFAULT NULL,
  `jawaban_b` varchar(255) DEFAULT NULL,
  `jawaban_c` varchar(255) DEFAULT NULL,
  `jawaban_d` varchar(255) DEFAULT NULL,
  `jawaban_e` varchar(255) DEFAULT NULL,
  `jawaban_gambar_a` varchar(255) NOT NULL,
  `jawaban_gambar_b` varchar(255) NOT NULL,
  `jawaban_gambar_c` varchar(255) NOT NULL,
  `jawaban_gambar_d` varchar(255) NOT NULL,
  `jawaban_gambar_e` varchar(255) NOT NULL,
  `kunci_jawaban` enum('a','b','c','d','e') DEFAULT NULL,
  PRIMARY KEY (`id`,`id_soal`),
  KEY `index2` (`id_soal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `detail_soal`
--

INSERT INTO `detail_soal` (`id`, `id_soal`, `pertanyaan`, `gambar`, `jawaban_a`, `jawaban_b`, `jawaban_c`, `jawaban_d`, `jawaban_e`, `jawaban_gambar_a`, `jawaban_gambar_b`, `jawaban_gambar_c`, `jawaban_gambar_d`, `jawaban_gambar_e`, `kunci_jawaban`) VALUES
(3, 1, 'Pertanyaan Pertam', NULL, 'jawaban a', 'pil b', 'jawaban c', 'jawaban d', 'jawaban e', '', '', '', '', '', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
CREATE TABLE IF NOT EXISTS `guru` (
  `nip` varchar(25) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `kd_mapel` varchar(10) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  PRIMARY KEY (`nip`),
  KEY `index3` (`kd_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `nama`, `password`, `kd_mapel`, `remember_token`) VALUES
('123', 'Jamal Apriadi,S.Kom, M.Kom', '$2y$10$K0iE04SglvjTb0H0BWEa9OW/o4TEg8.qsM2F6IUHZ0iX/Kgx2UNr.', 'BI', 'n9LpluMiKW8sAxcpa2cO5MsnwotZQ0o1yqxPO0nZPyvDIMO0qg6sdFSExNqZ');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kd_mapel` varchar(10) DEFAULT NULL,
  `tgl_ujian` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `index2` (`kd_mapel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `kd_mapel`, `tgl_ujian`, `jam`) VALUES
(3, 'BI', '2016-01-26', '10:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE IF NOT EXISTS `jurusan` (
  `kode_jurusan` varchar(5) NOT NULL,
  `nama_jurusan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`) VALUES
('ims', 'Ilmu Pengetahuan Alam'),
('IS', 'Ilmu Pengetahuan Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `kd_kelas` varchar(10) NOT NULL,
  `kelas` varchar(5) DEFAULT NULL,
  `kode_jurusan` varchar(5) DEFAULT NULL,
  `sub_kelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`kd_kelas`),
  KEY `index2` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kd_kelas`, `kelas`, `kode_jurusan`, `sub_kelas`) VALUES
('x.ims.1', 'x', 'ims', 1),
('x.ims.2', 'x', 'ims', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

DROP TABLE IF EXISTS `mapel`;
CREATE TABLE IF NOT EXISTS `mapel` (
  `kd_mapel` varchar(10) NOT NULL,
  `nm_mapel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kd_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`kd_mapel`, `nm_mapel`) VALUES
('BI', 'Bahasa Indonesia'),
('MTK', 'Matematika');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_01_25_030653_create_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengawas`
--

DROP TABLE IF EXISTS `pengawas`;
CREATE TABLE IF NOT EXISTS `pengawas` (
  `nip` varchar(25) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengawas`
--

INSERT INTO `pengawas` (`nip`, `nama`, `username`, `password`, `remember_token`) VALUES
('123', 'Jamal Apriadi,S.Kom', NULL, '$2y$10$m.3sLrYSAxUFA0Hv6dqsCeyXlz.tWlIfZj/YykrA5KYM72jEOtaz.', 'tX2Ytn4Mk64DNKhAWLpACFY2W7eQdnQ3jpxKov9DLL3d8OcQOGdMv4o8pQWW');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_ujian`
--

DROP TABLE IF EXISTS `peserta_ujian`;
CREATE TABLE IF NOT EXISTS `peserta_ujian` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `id_jadwal` int(10) unsigned NOT NULL,
  `nisn` int(11) NOT NULL,
  `id_ruang` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jadwal` (`id_jadwal`,`nisn`,`id_ruang`),
  KEY `nisn` (`nisn`),
  KEY `id_ruang` (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `petunjuk_umum`
--

DROP TABLE IF EXISTS `petunjuk_umum`;
CREATE TABLE IF NOT EXISTS `petunjuk_umum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petunjuk` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ruang_ujian`
--

DROP TABLE IF EXISTS `ruang_ujian`;
CREATE TABLE IF NOT EXISTS `ruang_ujian` (
  `id_ruang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_ruang` varchar(45) DEFAULT NULL,
  `kuota` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ruang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ruang_ujian`
--

INSERT INTO `ruang_ujian` (`id_ruang`, `nama_ruang`, `kuota`) VALUES
(1, 'Lab A', '20');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE IF NOT EXISTS `siswa` (
  `nis` int(11) NOT NULL,
  `nisn` varchar(45) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `kd_kelas` varchar(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `index2` (`kd_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nisn`, `nama`, `kd_kelas`, `password`, `remember_token`) VALUES
(7923, '', 'Jamal Apriadi', 'x.ims.2', '$2y$10$rgyRI.MiL9Tpsp88KIt2TOSy.Bc4cDznh7vfAsxfVFKslprS6OSAW', 'wDf9DQSJHPcRZRTSOyBEvd0YpT7SeLfXU54UjPJHxVNmYIHUdKiBl4barBTH'),
(7924, '', 'Eko Kurniawan', 'x.ims.1', '$2y$10$7KAF6x1m.K.LRMh.w6SYhegFS6YftMrSNq4IfUCjfxZ0EkbPGaZzu', '');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

DROP TABLE IF EXISTS `soal`;
CREATE TABLE IF NOT EXISTS `soal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kd_mapel` varchar(10) DEFAULT NULL,
  `kode_jurusan` varchar(5) DEFAULT NULL,
  `waktu_ujian` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`kd_mapel`),
  KEY `index3` (`kode_jurusan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `kd_mapel`, `kode_jurusan`, `waktu_ujian`) VALUES
(1, 'BI', 'ims', 60),
(3, 'MTK', 'ims', 120);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jamal Apriadi', 'jamal.apriadi@gmail.com', '$2y$10$RO215JIgzaLoYOOpo8h9TeDjd6Cr.AnT5p6xXjVN2E.gnn4MNwI0G', NULL, '2016-01-25 16:03:29', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_jadwal`
--
ALTER TABLE `detail_jadwal`
  ADD CONSTRAINT `fk_detail_jadwal_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_jadwal_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_jadwal_3` FOREIGN KEY (`id_ruang`) REFERENCES `ruang_ujian` (`id_ruang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_jadwal_4` FOREIGN KEY (`pengawas`) REFERENCES `pengawas` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detail_soal`
--
ALTER TABLE `detail_soal`
  ADD CONSTRAINT `fk_detail_soal_1` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `fk_guru_1` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_jadwal_1` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_kelas_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `peserta_ujian`
--
ALTER TABLE `peserta_ujian`
  ADD CONSTRAINT `fk_id_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nis_siswa` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ruang_ujian` FOREIGN KEY (`id_ruang`) REFERENCES `ruang_ujian` (`id_ruang`) ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `fk_soal_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soal_2` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
