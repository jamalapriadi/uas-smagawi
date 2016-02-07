-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 04, 2016 at 02:26 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `panturaweb_uas`
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
(1, 'Jamal Apriadi', 'jamal.apriadi@gmail.com', '$2y$10$luQOeq52HNf6egBNxTZl2ejOi0HKIioXnPA1Udav.VQzQpq7V1gsi', 'HrYP3Vd93PGjzUo2HTImjNLdLQdVbRZxfkgJWLrQC6DAFgVdIEst2JwFckfO', '2016-02-03 14:33:57', '2016-02-03 14:33:57');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `detail_jadwal`
--

INSERT INTO `detail_jadwal` (`id`, `id_jadwal`, `kd_kelas`, `jam_mulai`, `id_ruang`, `status`, `pengawas`) VALUES
(7, 5, 'x.ims.1', NULL, 1, '0', '123');

-- --------------------------------------------------------

--
-- Table structure for table `detail_soal`
--

DROP TABLE IF EXISTS `detail_soal`;
CREATE TABLE IF NOT EXISTS `detail_soal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_soal` int(10) unsigned NOT NULL,
  `gambar_besar` varchar(255) DEFAULT NULL,
  `gambar_kecil` varchar(255) NOT NULL,
  `kunci_jawaban` enum('a','b','c','d','e') DEFAULT NULL,
  PRIMARY KEY (`id`,`id_soal`),
  KEY `index2` (`id_soal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `detail_soal`
--

INSERT INTO `detail_soal` (`id`, `id_soal`, `gambar_besar`, `gambar_kecil`, `kunci_jawaban`) VALUES
(6, 4, 'h2CMW-Screenshot from 2016-02-02 15:12:59.png', 'h2CMW-Screenshot from 2016-02-02 15:12:59.png', 'a'),
(7, 4, 'tdcC5-2.png', 'tdcC5-2.png', 'b'),
(8, 4, '33NGr-Screenshot from 2016-02-02 15:15:02.png', '33NGr-Screenshot from 2016-02-02 15:15:02.png', 'e');

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
('123', 'Jamal Apriadi,S.Kom', '$2y$10$eFCgtxOsXBZkzpjBJ8HPX..V498T3pIUIOpcBrRlR8Y1CCtkjqlaO', 'MTK', 'z2Sus3m9bNsmG2GGYBRmjNsf7wb2iqEmxMM4gK0FIyUhH2eAauaMe9AHzoxT');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_jurusan` varchar(5) NOT NULL,
  `kd_mapel` varchar(10) DEFAULT NULL,
  `tgl_ujian` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `selesai` time NOT NULL,
  `waktu_ujian` int(11) NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `index2` (`kd_mapel`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `kode_jurusan`, `kd_mapel`, `tgl_ujian`, `jam`, `selesai`, `waktu_ujian`) VALUES
(5, 'ims', 'BI', '2016-02-03', '19:00:46', '23:32:00', 60),
(6, 'IS', 'BI', '2016-02-07', '07:00:13', '08:00:00', 60),
(7, 'ims', 'MTK', '2016-02-03', '14:00:02', '15:00:00', 60);

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
('123', 'Jamal Apriadi,S.Kom', NULL, '$2y$10$m.3sLrYSAxUFA0Hv6dqsCeyXlz.tWlIfZj/YykrA5KYM72jEOtaz.', '8OCnp7lSvYT129AqSooJjScTHu7WgMSfE9zTSroEGrTdHA4DEyUCrFdbrNhl');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_ujian`
--

DROP TABLE IF EXISTS `peserta_ujian`;
CREATE TABLE IF NOT EXISTS `peserta_ujian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nis` int(11) NOT NULL,
  `id_ruang` int(10) unsigned NOT NULL,
  `no_meja` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jadwal` (`nis`,`id_ruang`),
  KEY `nisn` (`nis`),
  KEY `id_ruang` (`id_ruang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `peserta_ujian`
--

INSERT INTO `peserta_ujian` (`id`, `nis`, `id_ruang`, `no_meja`) VALUES
(4, 7924, 1, 1),
(5, 7925, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ruang_ujian`
--

INSERT INTO `ruang_ujian` (`id_ruang`, `nama_ruang`, `kuota`) VALUES
(1, 'Lab Komputer', '80'),
(2, 'Lab Bahasa', '40'),
(3, 'Ruang PSB', '30');

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
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `index2` (`kd_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nisn`, `nama`, `kd_kelas`, `password`, `remember_token`, `status`) VALUES
(7923, '', 'Jamal Apriadi', 'x.ims.2', '$2y$10$rgyRI.MiL9Tpsp88KIt2TOSy.Bc4cDznh7vfAsxfVFKslprS6OSAW', 'kUmXYQ1T9qK1KaWWSCqN4kUhumsAaHUgjPsWB1eVMJIk9xuzKUJxp7sOhr9y', '0'),
(7924, '', 'Eko Kurniawan', 'x.ims.1', '$2y$10$7KAF6x1m.K.LRMh.w6SYhegFS6YftMrSNq4IfUCjfxZ0EkbPGaZzu', '', '0'),
(7925, '', 'Nazar Zulmi', 'x.ims.1', '$2y$10$bhql9seDh7SNXj44UUSaUOGYaMcdbZoOdc.wQ8EwaNh/7.F7as.RS', 'CBvZFYSeloLSN5VQlIIw1MNIOzQuZOU2iFhM6olCjClshtT8Hs1XwGzAdwsP', '0');

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
  `author` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`kd_mapel`),
  KEY `index3` (`kode_jurusan`),
  KEY `author` (`author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `kd_mapel`, `kode_jurusan`, `waktu_ujian`, `author`) VALUES
(4, 'MTK', 'IS', 0, '123');

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detail_jadwal`
--
DROP VIEW IF EXISTS `view_detail_jadwal`;
CREATE TABLE IF NOT EXISTS `view_detail_jadwal` (
`id` int(11) unsigned
,`id_jadwal` int(10) unsigned
,`kd_kelas` varchar(10)
,`jam_mulai` time
,`id_ruang` int(10) unsigned
,`status` enum('0','1','2')
,`pengawas` varchar(25)
,`kode_jurusan` varchar(5)
,`kd_mapel` varchar(10)
,`tgl_ujian` date
,`jam` time
,`selesai` time
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jadwal`
--
DROP VIEW IF EXISTS `view_jadwal`;
CREATE TABLE IF NOT EXISTS `view_jadwal` (
`id_jadwal` int(10) unsigned
,`kode_jurusan` varchar(5)
,`kd_mapel` varchar(10)
,`tgl_ujian` date
,`jam` time
,`selesai` time
,`waktu_ujian` int(11)
,`kd_kelas` varchar(10)
,`jam_mulai` time
,`id_ruang` int(10) unsigned
,`status` enum('0','1','2')
,`pengawas` varchar(25)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_peserta_ujian`
--
DROP VIEW IF EXISTS `view_peserta_ujian`;
CREATE TABLE IF NOT EXISTS `view_peserta_ujian` (
`nis` int(11)
,`kd_kelas` varchar(10)
,`id_ruang` int(10) unsigned
,`nama_ruang` varchar(45)
,`no_meja` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `view_detail_jadwal`
--
DROP TABLE IF EXISTS `view_detail_jadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_jadwal` AS select `a`.`id` AS `id`,`a`.`id_jadwal` AS `id_jadwal`,`a`.`kd_kelas` AS `kd_kelas`,`a`.`jam_mulai` AS `jam_mulai`,`a`.`id_ruang` AS `id_ruang`,`a`.`status` AS `status`,`a`.`pengawas` AS `pengawas`,`b`.`kode_jurusan` AS `kode_jurusan`,`b`.`kd_mapel` AS `kd_mapel`,`b`.`tgl_ujian` AS `tgl_ujian`,`b`.`jam` AS `jam`,`b`.`selesai` AS `selesai` from (`detail_jadwal` `a` join `jadwal` `b`) where (`a`.`id_jadwal` = `b`.`id_jadwal`);

-- --------------------------------------------------------

--
-- Structure for view `view_jadwal`
--
DROP TABLE IF EXISTS `view_jadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jadwal` AS select `a`.`id_jadwal` AS `id_jadwal`,`a`.`kode_jurusan` AS `kode_jurusan`,`a`.`kd_mapel` AS `kd_mapel`,`a`.`tgl_ujian` AS `tgl_ujian`,`a`.`jam` AS `jam`,`a`.`selesai` AS `selesai`,`a`.`waktu_ujian` AS `waktu_ujian`,`b`.`kd_kelas` AS `kd_kelas`,`b`.`jam_mulai` AS `jam_mulai`,`b`.`id_ruang` AS `id_ruang`,`b`.`status` AS `status`,`b`.`pengawas` AS `pengawas` from (`jadwal` `a` join `detail_jadwal` `b`) where (`a`.`id_jadwal` = `b`.`id_jadwal`);

-- --------------------------------------------------------

--
-- Structure for view `view_peserta_ujian`
--
DROP TABLE IF EXISTS `view_peserta_ujian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_peserta_ujian` AS select `a`.`nis` AS `nis`,`b`.`kd_kelas` AS `kd_kelas`,`a`.`id_ruang` AS `id_ruang`,`c`.`nama_ruang` AS `nama_ruang`,`a`.`no_meja` AS `no_meja` from ((`peserta_ujian` `a` join `siswa` `b`) join `ruang_ujian` `c`) where ((`a`.`nis` = `b`.`nis`) and (`a`.`id_ruang` = `c`.`id_ruang`));

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
  ADD CONSTRAINT `fk_jadwal_1` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kd_jurusan` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_kelas_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `peserta_ujian`
--
ALTER TABLE `peserta_ujian`
  ADD CONSTRAINT `fk_nis_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `fk_guru_soal` FOREIGN KEY (`author`) REFERENCES `guru` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_soal_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soal_2` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
