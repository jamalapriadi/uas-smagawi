-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 23, 2016 at 08:36 
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
(1, 'Sugiono Pamungkas', 'jamal.apriadi@gmail.com', '$2y$10$luQOeq52HNf6egBNxTZl2ejOi0HKIioXnPA1Udav.VQzQpq7V1gsi', 'PQehWUALHr5Nz1qrM9TJ42VoAdF3bvykWavPqe1MvCt4NvjwzyGG5OTHjn4w', '2016-02-23 04:46:18', '2016-02-23 04:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `detail_jadwal`
--

DROP TABLE IF EXISTS `detail_jadwal`;
CREATE TABLE IF NOT EXISTS `detail_jadwal` (
  `id` varchar(32) NOT NULL,
  `id_jadwal` varchar(32) DEFAULT NULL,
  `kd_kelas` varchar(10) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `id_ruang` int(10) unsigned DEFAULT NULL,
  `status` enum('0','1','2') DEFAULT NULL,
  `pengawas` varchar(25) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`kd_kelas`),
  KEY `index3` (`id_jadwal`),
  KEY `index4` (`id_ruang`),
  KEY `index5` (`pengawas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE IF NOT EXISTS `jadwal` (
  `id_jadwal` varchar(32) NOT NULL DEFAULT '',
  `kode_jurusan` varchar(5) NOT NULL,
  `kd_mapel` varchar(10) DEFAULT NULL,
  `tgl_ujian` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `selesai` time NOT NULL,
  `waktu_ujian` int(11) NOT NULL,
  `sesi` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `index2` (`kd_mapel`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `kode_jurusan`, `kd_mapel`, `tgl_ujian`, `jam`, `selesai`, `waktu_ujian`, `sesi`) VALUES
('37167105f0254a2f87b74cdfbf08b909', 'MS', 'MTK', '2016-02-25', '08:00:40', '10:00:51', 60, '1');

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
('IS', 'Ilmu Pengetahuan Sosial'),
('MS', 'Ilmu Pengetahuan Alam');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `kd_kelas` varchar(10) NOT NULL,
  `kelas` enum('X','XI','XII') DEFAULT NULL,
  `kode_jurusan` varchar(5) DEFAULT NULL,
  `sub_kelas` int(11) DEFAULT NULL,
  PRIMARY KEY (`kd_kelas`),
  KEY `index2` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kd_kelas`, `kelas`, `kode_jurusan`, `sub_kelas`) VALUES
('XII-IS-1', 'XII', 'IS', 1),
('XII-IS-2', 'XII', 'IS', 2),
('XII-IS-3', 'XII', 'IS', 3),
('XII-IS-4', 'XII', 'IS', 4),
('XII-IS-5', 'XII', 'IS', 5),
('XII-IS-6', 'XII', 'IS', 6),
('XII-MS-1', 'XII', 'MS', 1),
('XII-MS-2', 'XII', 'MS', 2),
('XII-MS-3', 'XII', 'MS', 3),
('XII-MS-4', 'XII', 'MS', 4),
('XII-MS-5', 'XII', 'MS', 5),
('XII-MS-6', 'XII', 'MS', 6);

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
-- Stand-in structure for view `nilai_siswa`
--
DROP VIEW IF EXISTS `nilai_siswa`;
CREATE TABLE IF NOT EXISTS `nilai_siswa` (
`nis` varchar(17)
,`no_peserta` varchar(20)
,`kd_kelas` varchar(10)
,`nama` varchar(45)
,`id_soal` int(10) unsigned
,`id_detail_soal` int(11) unsigned
,`id_jadwal` varchar(32)
,`id_detail_jadwal` varchar(32)
,`soal_ke` int(10)
,`jawaban` enum('a','b','c','d','e')
,`status` enum('0','1')
,`selesai` enum('N','Y')
,`benar` enum('T','N','Y')
,`kd_mapel` varchar(10)
);
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
('123', 'Jamal Apriadi,S.Kom', NULL, '$2y$10$e33bi7t5xsNBioGNH.7HneWOHJymNv1BK3b3WV0.FFroTuoMUKcry', '');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_ujian`
--

DROP TABLE IF EXISTS `peserta_ujian`;
CREATE TABLE IF NOT EXISTS `peserta_ujian` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `no_peserta` varchar(30) DEFAULT NULL,
  `nis` varchar(17) NOT NULL,
  `id_ruang` int(10) unsigned NOT NULL,
  `no_meja` int(11) NOT NULL,
  `sesi` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_peserta` (`no_peserta`),
  KEY `id_jadwal` (`nis`,`id_ruang`),
  KEY `nisn` (`nis`),
  KEY `id_ruang` (`id_ruang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `peserta_ujian`
--

INSERT INTO `peserta_ujian` (`id`, `no_peserta`, `nis`, `id_ruang`, `no_meja`, `sesi`) VALUES
(1, NULL, '9967953118', 1, 1, '1'),
(2, NULL, '9970348295', 1, 1, '1'),
(3, NULL, '9972098963', 1, 1, '1'),
(4, NULL, '9976753640', 1, 1, '1'),
(5, NULL, '9976757264', 1, 1, '1'),
(6, NULL, '9976791170', 1, 1, '1'),
(7, NULL, '9977159011', 1, 1, '1'),
(8, NULL, '9977450432', 1, 1, '1'),
(9, NULL, '9977593384', 1, 1, '1'),
(10, NULL, '9980777535', 1, 1, '1'),
(11, NULL, '9982772361', 1, 1, '1'),
(12, NULL, '9982772396', 1, 1, '1'),
(13, NULL, '9983111955', 1, 1, '1'),
(14, NULL, '9986616907', 1, 1, '1'),
(15, NULL, '9986617721', 1, 1, '1'),
(16, NULL, '9986617731', 1, 1, '1'),
(17, NULL, '9986773768', 1, 1, '1'),
(18, NULL, '9986976233', 1, 1, '1'),
(19, NULL, '9987033583', 1, 1, '1'),
(20, NULL, '9987256382', 1, 1, '1'),
(21, NULL, '9987295202', 1, 1, '1'),
(22, NULL, '9987312863', 1, 1, '1'),
(23, NULL, '9987358383', 1, 1, '1'),
(24, NULL, '9987475175', 1, 1, '1'),
(25, NULL, '9987512946', 1, 1, '1'),
(26, NULL, '9987839055', 1, 1, '1'),
(27, NULL, '9987895650', 1, 1, '1'),
(28, NULL, '9988755362', 1, 1, '1'),
(29, NULL, '9993166663', 1, 1, '1'),
(30, NULL, '9994972818', 1, 1, '1'),
(31, NULL, '9996910073', 1, 1, '1'),
(32, NULL, '9997631526', 1, 1, '1');

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
  `nis` varchar(17) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `agama` varchar(10) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `rt` varchar(15) NOT NULL,
  `rw` varchar(15) NOT NULL,
  `dusun` varchar(45) DEFAULT NULL,
  `kelurahan` varchar(45) DEFAULT NULL,
  `kecamatan` varchar(45) DEFAULT NULL,
  `kode_pos` varchar(7) DEFAULT NULL,
  `no_skhun` varchar(20) NOT NULL,
  `nm_ayah` varchar(45) DEFAULT NULL,
  `nm_ibu` varchar(45) DEFAULT NULL,
  `kd_kelas` varchar(10) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_asli` varchar(100) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `no_peserta` varchar(20) NOT NULL,
  PRIMARY KEY (`nis`),
  UNIQUE KEY `no_peserta` (`no_peserta`),
  KEY `index2` (`kd_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `nik`, `agama`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `no_skhun`, `nm_ayah`, `nm_ibu`, `kd_kelas`, `password`, `password_asli`, `remember_token`, `status`, `no_peserta`) VALUES
('9947233221', 'INDI FIKROTUN HANIFAH', 'L', 'Tegal', '1998-10-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$dU6tVjWUHhtV9jn6bFMKQ.UEMJ7mF1SJwQhCouGdhIlp3hdalSiz2', '1418105019@', '', '0', 'U03350090783'),
('9967953118', 'WINARTI', 'P', 'Tegal', '1998-03-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$Et.o.G4L9iZQfCjQvhHDuuVDS9WSmWLvEdU5mUOaPC9Y6F3kIimcy', '353064258@', '', '0', 'U03350090312'),
('9970348295', 'FAFA DWI YUNDIAR', 'L', 'Tegal', '1997-10-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$V30oZ3G1TlfdGQWSOPAgJeaBL6RMG8UO6ma9Tm0qfcG5bclq4giTq', '1150259366@', '', '0', 'U03350090107'),
('9972098963', 'KIKY AULIA RAKHMAWATI', 'P', 'Tegal', '1998-07-05', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$FDoUnkxHxrSjyhwmGaJtEO.ICe6qtXUO0AoEeu7NT3CmsW4/vAKWe', '88466861@', '', '0', 'U03350090169'),
('9973908604', 'NANDA RAFIKA PUTRI', 'P', 'Tegal', '1998-03-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$ksvqZHCO9D8CYceRRKMRK.A4ZbGo0U3sBg9poTZY6lrMI9yRqhL1i', '646269484@', '', '0', 'U03350090827'),
('9976753640', 'FAJAR SUHARJO', 'L', 'Tegal', '1999-04-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$t0RFOt0QEIempEqXfyRPCePXapM3ZNTAeFgb/fuCA7rO2vlCA68s.', '2084844941@', '', '0', 'U03350090116'),
('9976754296', 'OKIKSA MERSENDI', 'P', 'Tegal', '1998-04-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$H6Ew80.qDTzRa0IHsH41ROB1joQmNWiEOEbVXR2zzFisMq1xALfIC', '470969720@', '', '0', 'U03350091485'),
('9976757264', 'BARRU TRI PRAYOGO', 'L', 'Tegal', '1998-06-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$BOUm08WxgUZOkYH9r4YHDuj2MhOF6o8QH/7riVU3iPK1maWWA1uwe', '1421139331@', '', '0', 'U03350090063'),
('9976774656', 'IZATI DWI CAHYARINI', 'P', 'Tegal', '1998-08-31', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$fw9s1NJsw6zMUIEDjyI7zOjZA2DUptiq5TX6m5nJbL3e2A3zBbAaC', '716864713@', '', '0', 'U03350091432'),
('9976776412', 'ANISA CAHYANINDAR', 'P', 'Tegal', '1998-08-03', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$J4TU4vI3.dZ4PBQbQ7yXcukIcZfTx1QtH36qMmohUNLwMKc..EFa6', '1463615118@', '', '0', 'U03350091316'),
('9976776506', 'AHMAD ROISUL AMIN', 'L', 'Tegal', '1998-11-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$Ghe60I7azR6xxElQ3hNv8OTyLl7GdMOZCj/794atR9ZKkYDZcrWNu', '137315765@', '', '0', 'U03350090667'),
('9976776716', 'PIPIT AYUNING PRAMESTI', 'P', 'Tegal', '1999-02-25', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$WfKHiMjTg2TcWElCOERsYO.B5ROh3o8Ju.cJsedVjY2NrVxJF3nmK', '1936619456@', '', '0', 'U03350091147'),
('9976776732', 'AENUN INTAN MAULIYANAH', 'P', 'Tegal', '1999-07-07', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$XsdXpgx3OjEsBZ38vUQLU.E7KPpExph0yelAOiq8jaMas59u9kAMW', '641300026@', '', '0', 'U03350090658'),
('9976776977', 'CENDEKIA ISLAMI HAQ', 'L', 'Tegal', '1998-09-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$mxZdXD2crfZ93UHi8AUa5u/TOMkK68vCI/i/U2VEbIaf32txwwGBm', '1277567875@', '', '0', 'U03350091343'),
('9976791170', 'MONIKA PUTRI YULIASTANTI', 'P', 'Tegal', '1998-11-18', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$.N5x/t1BmAOHWGxHsuONk.NWSbd6vswxFg.9xgDS2o0HkYfkIUwnm', '1490590971@', '', '0', 'U03350090196'),
('9976814061', 'ADELLA RIZQI NURSEPTIANA', 'L', 'Tegal', '1998-09-30', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$g4/9.2pYBjxL02zUXpO/DeezIZhk5uzmDO/YtBx.0T60rTnlcj.gO', '392338889@', '', '0', 'U03350090338'),
('9976895937', 'ERO SISKA ZAIRANI', 'P', 'Tegal', '1998-05-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$eA/5AkP48KgqGYHY0FZdZeBqVgUIdXYPS11wkw7HBi55P03zkNBjq', '207644185@', '', '0', 'U03350090383'),
('9977159011', 'AULIA FAZA', 'P', 'Tegal', '1997-12-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$Vme6w6vju0IkiLI2M6vKIuaJrFJ/z1J4Srysu76fLv4IFZf7u0kcC', '715290577@', '', '0', 'U03350090054'),
('9977450432', 'ANGGUN RISANTI', 'P', 'Tegal', '1997-11-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$MuJ/RdahFOQAa.YUPHaq1OiT5QK2qNimaBfqhmnXFLgpgd5g23bdi', '1098846454@', '', '0', 'U03350090036'),
('9977593384', 'LARASATI', 'P', 'Tegal', '1998-06-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$0kXx8xAkRAI4tR7wpYnQtukEnHNYm95vtPE7sfLHQqJYwuplkhRnm', '962571829@', '', '0', 'U03350090187'),
('9977653969', 'SAHID ABDULLOH YUSRO', 'L', 'Tegal', '1998-05-10', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$j9OneaJjtg9PPr4VFlwEfuz3A2b7ukjxb1XLgDavv1A5eW0EIVGC2', '1467563255@', '', '0', 'U03350090578'),
('9977835469', 'MOH. RUDI GUNAWAN', 'L', 'Tegal', '1998-10-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$pGkAWv0BQyiG9phxKqtvYed6mBULWhzOEfxAzrdH4w6xkYcHDtYkG', '1930688013@', '', '0', 'U03350090472'),
('9980014494', 'NUR HIKMAH', 'L', 'Tegal', '1998-10-06', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$ztrgEsQYgvYVF2uZok0mnunnsRaiwSG0KXf/XYgfhG/RpRyESO8qy', '1025898934@', '', '0', 'U03350090525'),
('9980028666', 'EFTETA AULIA RAHIM', 'P', 'Tegal', '1998-07-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$E38hOQwEH3hbV.idujgbH.L7SvrMHP7HSHUGVKRWNi/1BdOExIL1O', '1787963917@', '', '0', 'U03350091032'),
('9980042084', 'UMI MAHFIYAH', 'P', 'Tegal', '1998-09-30', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$zfkn2rbWhGVOngrU1.awXu0RNKJ.23KUcaYbiZIXudLt8nambgSPS', '244496150@', '', '0', 'U03350090605'),
('9980228724', 'RAGA KESUMA ILLAHI', 'L', 'Tegal', '1998-05-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$jRB3BmyfADZL6eZBxv2F4ubX/AYJlDGTFYLhmeMX534IR/6Ezas.C', '1535377250@', '', '0', 'U03350090889'),
('9980777535', 'NELY LUSIANA', 'P', 'Tegal', '1999-04-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$Rs4q9oQD5YMCY3xOO3D/xex2C8LZ/M8hBDgPAAhHhHlw03I1TzeRa', '625774331@', '', '0', 'U03350090214'),
('9982363502', 'SIFA FAUZIAH', 'P', 'Tegal', '1998-08-23', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$IiHNvgTR1tygT9o6Yj3oDuR/.Z2.SlkGHfF1mAj89ACDQmsDiv7rq', '473217069@', '', '0', 'U03350090596'),
('9982488275', 'YENI LIZA SAFITRI', 'L', 'Tegal', '1998-01-18', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$3/9Nrx3ZKNJRveOLjX7oM.2jIKuOyU9SVlI7Wj2dZST.CQmon3QB.', '2486675@', '', '0', 'U03350090952'),
('9982489321', 'INDAH NUR AMALIA', 'L', 'Tegal', '1998-05-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$ZOqY8ddW6KrvXf9ga5MUkO9/S3Txw7OEtfg.fBNUslurFWvSf237C', '474794553@', '', '0', 'U03350090774'),
('9982502392', 'SISKA NUR SHOFANIA', 'P', 'Tegal', '1998-09-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$WGoln3PNKeQkIPzn2OK2IugJdNUPUml2nuql3qBClMVsnFuCrexeG', '1014565742@', '', '0', 'U03350090934'),
('9982542093', 'SYERIN ULFIATUL FAHIROH', 'L', 'Tegal', '1998-04-13', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$JVxXCg9.qyaxwUyqHtjWtelTwzrQiqyVU/lCqp11bll/DiJdaEHk.', '1328682305@', '', '0', 'U03350091245'),
('9982542107', 'DEA AYU INTA VINATIKA', 'P', 'Tegal', '1998-08-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$ba56pXKfyhiMcTFdIwZmtujcud7Fh91h1VaM5B6MKHfiUD9ebau3y', '937117690@', '', '0', 'U03350091352'),
('9982772361', 'FARAHDILA EKA YUNIASIH', 'P', 'Tegal', '1998-06-10', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$BUwyhpnqrSgkDrBygbi6D.P/MbgOAXhW9H8vS06yyr4EzJNeQ2u2G', '250648100@', '', '0', 'U03350090125'),
('9982772374', 'RIMA DIAN PRAMESTI', 'L', 'Tegal', '1998-01-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$iefjV24.pRWZKqWZ2z.O/en6nHfRUk8a0scRo8WYs0hzk/utRLPfm', '1084171053@', '', '0', 'U03350090569'),
('9982772396', 'REGITA INDRIA BUDIARTI', 'L', 'Tegal', '1998-04-03', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$NhgT6vaEDpKM6pPH0De/dOfWrSCawKr96qi4a2TYNIhkeXlKQh.NG', '663865813@', '', '0', 'U03350090249'),
('9982773322', 'DWI SITTAH OKTARIANTI', 'P', 'Tegal', '1997-10-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$bBGJNV2Jnk.XRM.7qwz2uuJY6SoG1YDl4VFDc93jHhhUnV/VicNIG', '812773440@', '', '0', 'U03350090756'),
('9982780177', 'ROSALINA FITRIYAH', 'P', 'Tegal', '1999-01-25', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$MZ.8PI.Ffz2yUG8GcIRJeO.I//i1ueYeogmI6wexhQo.fRRbhUCXy', '1291642869@', '', '0', 'U03350091529'),
('9982783965', 'NURHIKMAH FITRIANA', 'P', 'Tegal', '1999-04-06', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$st73xVWmDRJ2zQVbYfz/pefqNlOHe1.qDCLEyXy0XnkOqodz2SnZi', '662961752@', '', '0', 'U03350090845'),
('9982887322', 'SYIFAUN NADIYAH', 'L', 'Tegal', '1997-11-17', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$RmGxOm83z9RS2L.cIsnkDOb/MqXyibFAIuF/AkP7tMkHtkCointpO', '1136620964@', '', '0', 'U03350091565'),
('9983099171', 'FRANCISCUS FEBY ETDOLO', 'P', 'Tegal', '1998-02-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$wS2mih9o1uG6HQptSKRe6.kbgAAX5Tjle6fgKfWMKsiYgvPFsyLQi', '2098290709@', '', '0', 'U03350091067'),
('9983111955', 'VIRA AMELIA RIZKI', 'P', 'Brebes', '1998-09-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$a1R/vEz.lCw7/tFRcDNJvO4pdHqdYFOcCdqvyAgAUDRspiSY/PX/2', '1023404555@', '', '0', 'U03350090303'),
('9983114255', 'YOGA PRASETYA', 'P', 'Tegal', '1998-12-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$cpetyFuFohWlCGFe0TcAoOJrlhy.xPxEpw2trBbdOhiOJIIu3e/XC', '303795242@', '', '0', 'U03350090632'),
('9983177264', 'HAFIDZ NUR ILMI', 'L', 'Tegal', '1998-02-28', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$vYJiLsjgs954.8KioiJA/OtXxm.3SwTDbTExn88gP6yHdksclxvGm', '1668783293@', '', '0', 'U03350090436'),
('9983696560', 'DEWI ATIKOH', 'L', 'Tegal', '1997-05-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$6bqYNtwLDtlKPK.R8ZOPqeH2fnTRGu2Lew1FHY6dL0T3dEWtXcPxm', '1671020573@', '', '0', 'U03350091014'),
('9983721351', 'NURUL NOVANIA NABILAH', 'P', 'Tegal', '1997-11-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$34JExfKpJ9WTGYX8rx7uBe13Of53f/eYfrQ3tOzt49UKvFk3vvceG', '2027751701@', '', '0', 'U03350090543'),
('9983929252', 'KHANSA QONITA RAMADHANI', 'L', 'Semarang', '1998-12-30', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$bRCeNpdJzKfrDftYFSiKvOvhJyfcP7bjf3BI1A7g8JY44PR6f40WK', '1685920050@', '', '0', 'U03350091112'),
('9984237160', 'ADE FAIZAL', 'L', 'Tegal', '1998-03-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$vh5QTn0FB9juexQpPrVRv.hUHDyIBN2DCrx23.af41mZG0txWlNUa', '2113206069@', '', '0', 'U03350090978'),
('9984369479', 'FISKA MUTIARA HANI', 'P', 'Tegal', '1998-12-04', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$kb9ToOSAQpdjZhkyzc9ZOu6qVzJXlHVIoFsdKsCkMb31OdfpWir9m', '2017020834@', '', '0', 'U03350091058'),
('9984371190', 'VIVIN AVIANTI OKTAVIA', 'P', 'Tegal', '1997-10-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$U5EPU6FmSrfJpdPpoAhxqOlv0I67yKdGDQPCve7HWVvhk8aPeVgYa', '1954943290@', '', '0', 'U03350090623'),
('9984448530', 'YUDHA PRATAMA PURWANTO', 'P', 'Tegal', '1998-08-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$xBoN1SPgDB164cfdg/U5LeE9ku1lpe7YFz9wwTmch5bmqdpNOr042', '502383338@', '', '0', 'U03350090649'),
('9984604817', 'NISRINA GHINA LESTARI', 'P', 'Tegal', '1998-05-18', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$OUibqNb7GVxLluNL22Wv2udnGtPJWulnSi5/SNJ1j105pRN.ixEVC', '909945293@', '', '0', 'U03350090498'),
('9985591665', 'NAELUL KHUSNA', 'L', 'Tegal', '1998-07-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$m5yM7XZf9scru4Y.t4yhSupXxaepcDqljbguwZgYLpJynqds/qIPG', '1897703212@', '', '0', 'U03350091467'),
('9986616906', 'FITRI CAHYANI', 'P', 'Tegal', '1997-12-27', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$0Q4JB/VXGiZlgGFWXIfCteV79PfJcnY2UmUcwLS/fqU6qckWSwWcm', '351525782@', '', '0', 'U03350091396'),
('9986616907', 'ULFATUN KHASANAH', 'L', 'Tegal', '1997-10-11', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$MM.leh2sezvM8nyASZtDu.Zpn/FnVXclv/jojKiK8HIORhZBYmWRa', '653390766@', '', '0', 'U03350090294'),
('9986617184', 'GANANG YUDHA PRASOJO', 'P', 'Tegal', '1998-04-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$7Xd4kDB7WvSaHqIJZbVYAOjaLahSgvOZYWggljbtt76EWALGmxvui', '283721425@', '', '0', 'U03350090765'),
('9986617191', 'JAROT RUDI HARTATO', 'P', 'Tegal', '1998-04-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$HZKPj63v63h.FeGfl3DSbeuXJYmzuu59paBebOOLwPlAvVbGq1KA.', '38287166@', '', '0', 'U03350091449'),
('9986617721', 'NOVY KURNIAWATI', 'P', 'Tegal', '1997-11-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$Wr8P8Uf5qSzesPd247DxqeMm4pdnK2aZerEUDfiToDsGKM9MSLEwu', '255470722@', '', '0', 'U03350090232'),
('9986617731', 'INDAH TRI APRILIANI', 'P', 'Tegal', '1999-04-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$qsvk80ZKXtBOPbCeyZ0A8uHQA8QbQXtkeuG.4R/6wh/EkJ4qYrVtG', '496586199@', '', '0', 'U03350090152'),
('9986618845', 'AKHMAD SAEFULLOH', 'P', 'Tegal', '1998-06-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$1cRz1gzMarKN2uwScgkS2uCxSowdArjdu3e8yZWvJhUA7vDJblzti', '2077639459@', '', '0', 'U03350090676'),
('9986634765', 'PANJI IQBAL BARLIAN', 'P', 'Tegal', '1998-09-07', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$0ZRwGH8wXkNLrZ9XU6GrxekIHjzX6ZsEdHk6H2sYMNPPzwzB6AUGW', '631476550@', '', '0', 'U03350091494'),
('9986634824', 'DIAN RIZQIYANTI', 'P', 'Tegal', '1998-05-03', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$RfSkw8InE.ap7DuL3GnN/.As5KA0IjkXAN6ASSX6ht44Q7xE1IzwC', '76672295@', '', '0', 'U03350090365'),
('9986635936', 'TYAS AYU WIDYASTUTI', 'P', 'Blitar', '1998-09-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$N8hCZDk8Ygzs5S5luSmfI.ZgWtESI.sT1I.ntM5V4ClGu0owqZG5O', '1491194736@', '', '0', 'U03350090943'),
('9986650372', 'ZULFIANA RAHMAWATI', 'P', 'Tegal', '1998-05-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$ZG.jTxSD1PZQTwCr59n0yO48JPuxiA6aAjRbIpAkO6Tbe1tYcLN0y', '550124675@', '', '0', 'U03350090969'),
('9986650743', 'PRANA IRFAN MUQSIT', 'P', 'Tegal', '1998-07-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$uokU7BxoU8h4ErqkvjuvCug0VGgy0RpU70Q5bCtj2NHOKemuTLARu', '1407212928@', '', '0', 'U03350091503'),
('9986650801', 'RIZKI TRIOKTAVIAN SAPUTRA', 'P', 'Tegal', '1998-10-22', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$3S5.lixBumG/SshNylv35Ob9pv8nG9l0TLgzv.wViGxOqxXDACSea', '1929310192@', '', '0', 'U03350091218'),
('9986650810', 'ANGGUN DWI LARASATI', 'P', 'Tegal', '1998-04-28', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$WE9Z05D.ncyVN1H6zVTXy.Cde3oH665CEM0U1ys85hA.j2e6jVOcq', '103892152@', '', '0', 'U03350090996'),
('9986651878', 'GHANIY TRISTIANTI', 'P', 'Tegal', '1998-03-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$LOyaXaeCOIBmx8KfgG9poegofs/Focem8nkwJNrxOQhQwp4TmP9E6', '1715826668@', '', '0', 'U03350090427'),
('9986652197', 'ANGGUN DESY LARAS ATI W', 'P', 'Tegal', '1998-12-17', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$EpoNfPrglQ.Uu6fOrf9WwuG.XpWjUn3QeR.LNOUZTZP3nGmUgccmW', '1550335065@', '', '0', 'U03350090694'),
('9986652235', 'TRI YULI FATMAWATI', 'P', 'Tegal', '1998-07-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$0IOdVoI4BSTVohNGlS0vuu09RoHsgStSXX8bFd4jyJFoJgTsFMTWy', '655553118@', '', '0', 'U03350091574'),
('9986652265', 'UTAMI DEWI PANGESTI', 'P', 'Tegal', '1998-12-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$Oju.WtPgCXwI7bVqn3Q5p.8hw1Fs7z2P9qU7iSwMrSTqRTIeym8g2', '1502968775@', '', '0', 'U03350091263'),
('9986652440', 'IMAM BAGUS MULYANTO', 'P', 'Tegal', '1998-03-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$/sY9RMM4zycPgqDnvi9g6OAUJMSooXX0RKSFzEmO7WzShH3yYp9Oq', '20617606@', '', '0', 'U03350091414'),
('9986652716', 'MUKHAMAD MUFLIKHUN', 'P', 'Tegal', '1998-06-14', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$qyNpvW7KqCrHlStAuPT/6OsZC6Q8TCaVWi9e/GUBnchsX3pQq2TtS', '1171200445@', '', '0', 'U03350090818'),
('9986653634', 'DODY SETIAWAN', 'P', 'Tegal', '1998-06-17', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$wxrsfS7yXhKpwzq62XSnPe/2tuI62pOGj7JTMUIgjm8r1cKQ3uB0O', '970105627@', '', '0', 'U03350090374'),
('9986653863', 'GARNES MONA YULIETA', 'P', 'Tegal', '1998-07-04', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$j.zXOM9ATLAgbKKTmvL4Zulc2TAPeb/H.HR0kgrBWsm47W0jxeD/.', '1316447177@', '', '0', 'U03350091076'),
('9986653895', 'MEGA AGHNES RIZKYA', 'P', 'Tegal', '1998-09-03', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$YJXIFLskYF8olwoj7pHdeecFEMlSi0eiquSttnYP1zQW53o2GXdFe', '1282327341@', '', '0', 'U03350090454'),
('9986653903', 'ADJENG PERDANA PUTRI', 'P', 'Tegal', '1998-10-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$c4y6oC/Yfmr4k5Y7.2jnlOrE.8ZA67Li4DpITFNFuEYx9IOToJNwa', '1838265810@', '', '0', 'U03350091298'),
('9986658411', 'ISNATUL BAETI FARODISA', 'P', 'Tegal', '1998-05-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$d3ZhUOYmVznENCGrLvxExup.V1i/8hcCmrU.B.aitdASzmcQyFXzK', '1912989061@', '', '0', 'U03350091085'),
('9986658433', 'SAFINATUL LAELI', 'P', 'Brebes', '1998-05-28', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$ZQkBTB18o6FoFePaGWm3k.m4FYm83c/tObnKhLiYAy6VeYG66A0ky', '1107322516@', '', '0', 'U03350090916'),
('9986659798', 'RISKA AINUN NISSA', 'L', 'Tegal', '1998-07-13', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$zvMOKGm5nymTjQL3rmJSHOlwREKFOCOKNSlYqEk91I3YLIm54pWXq', '606938783@', '', '0', 'U03350091183'),
('9986659801', 'ATIQ FAUZIYAH', 'P', 'Tegal', '1998-10-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$NTQ4lf2.zqh/Aw947GtO0O9EQJw3o7hxGbOcR5vTjikxFpHe0zEXe', '348563052@', '', '0', 'U03350091334'),
('9986659805', 'NOVI LAELI HIDAYAH', 'L', 'Tegal', '1998-11-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$jvqYcpmRyZjSRoQL0luddeFhwuxVDtuksYrd0Dof0BNujaYaMs0d2', '203365221@', '', '0', 'U03350090507'),
('9986670195', 'IZULIA', 'P', 'Brebes', '1998-07-07', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$7RoO6WuYUd6oVzLr4safc.HxvZPqbZukZapcCuG/zfUi/Psy8SPHW', '286061250@', '', '0', 'U03350091094'),
('9986670208', 'NURAENI', 'P', 'Tegal', '1998-03-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$zIzAA1w1OgVHzeMnp/h9a.b7NDigeIC.XUkzdWc.Q5LCKYOX9K91G', '714115610@', '', '0', 'U03350091138'),
('9986670840', 'SYAHRA AGUSTINA MAULIDA', 'L', 'Tegal', '1998-08-17', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$XXjjQLvhS8ZDz2KapjMdQe6EFYGStEVQPvMRoN539KjaTldWK6H0q', '1344730218@', '', '0', 'U03350091236'),
('9986670869', 'MUHAMMAD SYAHRUL MUBAROK', 'P', 'Tegal', '1998-05-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$AWQ11i/Sh5E4v.Nc6itOm.FQhKaG.2yi4m/odp32ohZlgFCvcPaIK', '1149331022@', '', '0', 'U03350090489'),
('9986673202', 'KARISMA CAHYA', 'P', 'Tegal', '1998-08-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$Cc5qRE14HVowY1CShV/OF.mZNzbqfGm2RI9QhpXVDvpjGrQGQysMS', '41389982@', '', '0', 'U03350091103'),
('9986693136', 'INTAN JUSTITIA DEWI', 'L', 'Pekalongan', '1998-09-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$fg3l0iujOi6MBzFdMkMYr.j2O5xXHnaO7LSzPwJyc6ZioopMtVuae', '1976818389@', '', '0', 'U03350091423'),
('9986693298', 'RIZKI TRI MEI AMALIA', 'P', 'Tegal', '1998-05-13', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$9wrtk/lmkdfTs7OnEI7A1eAnrs0iP20DD6hwq8L2.06caUXA1vbq6', '1000625932@', '', '0', 'U03350090898'),
('9986693352', 'ANGGRINA NUR WULAN NINGSIH', 'L', 'Bandung', '1998-06-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$RYcIZUczKXw98arlFcHcleB2rjvLf/xeEOcOHYS9SHE6odRCA1bzi', '188732688@', '', '0', 'U03350090347'),
('9986693378', 'HIDAYATUL MUSTAFID', 'L', 'Tegal', '1998-09-04', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$GC7C1V08FtSw3Tk0iR1Hfu/ewYmsjuVbypOe0hti9vY2S4P/.BGVy', '1276057906@', '', '0', 'U03350091405'),
('9986695821', 'SOFIAN RAMA YANITRA', 'P', 'Tegal', '1998-05-27', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$XEUbjZno63ZrBvh8SNvn/.EbIhuWzKsqZppKjuyaG7Qd/7EPSe3Qm', '2052208670@', '', '0', 'U03350091227'),
('9986725703', 'PRISKA PRAMESTI', 'P', 'Tegal', '1998-11-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$Az.J0YslPrizRbLYqqMCZul01aDoXTRsOrKgWrFSvsmBcAFgZk2Ka', '28680797@', '', '0', 'U03350090854'),
('9986751782', 'RISQI DWI SETIA NINGRUM', 'L', 'Tegal', '1998-06-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$GCUg1zYJpenvJMtTboFL4e2LLdtt1OS/B1WTymMEPdVrs0mR7jjJK', '545328385@', '', '0', 'U03350091209'),
('9986756064', 'AMELIA KRISMIYANTI', 'P', 'Tegal', '1998-04-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$m0GOLDXFSqNUtniya/VY.uX5r5JuLEBgYFTD5awrMXESI5bcSxHd.', '2086982640@', '', '0', 'U03350090987'),
('9986772737', 'AMALIA SHIFA', 'P', 'Tegal', '1998-01-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$jck7u8HrEbPb16nc93LM5uHXk2qQPdxvvrZCkFo0ohzBhDiMQ6KKW', '133662959@', '', '0', 'U03350091307'),
('9986773768', 'SONI DWI WAMBUDI', 'L', 'Tegal', '1998-08-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$n3b/jXDEsgysM/.50yNieemEfwJ.ZO0lTTpR0Uc5RXJmfnc2ATJHK', '1879709706@', '', '0', 'U03350090276'),
('9986774426', 'PUTRI IMALA DEWI', 'P', 'Tegal', '1999-01-04', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$FF.5LzP5y3WScwvCxf7RCuZWUOCzzbPyFNi9/hGj.72EgbUiaotkG', '2016989531@', '', '0', 'U03350090872'),
('9986810972', 'MOCHAMAD AMRI SYARIFUDIN', 'P', 'Tegal', '1998-08-17', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$mvODSQyrOCZ/FEvSYzyvKO4o1sanaHOrt9ihodK09g1lBIavg/HGa', '1969068209@', '', '0', 'U03350091129'),
('9986976233', 'IMROATUL AZIZAH', 'P', 'Tegal', '1998-03-07', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$F2iwLMS.5GBNLcuw0O5DwOC4rivCvMUh7x8lK4Ntok1H8N1R6tOzu', '734755108@', '', '0', 'U03350090143'),
('9987030694', 'RISKY AYU SISIANA', 'P', 'Tegal', '1998-04-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$3yZ/g6vCbEiJt7SMtC98seWVCEKfIz6g83QLLOdF2pfqxmlqACs/K', '1673742857@', '', '0', 'U03350091192'),
('9987032018', 'YULIA RIZKI MAULIDA', 'P', 'Tegal', '1998-07-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$ZKFnvAPDtAdjml6Fho/BjuJouPeJNtXzNMa9HCbK.0TI19VyYVbAe', '247911299@', '', '0', 'U03350091592'),
('9987033324', 'KHOERUN NISA DYAH PRAMUDA MARDANI', 'P', 'Tegal', '1998-04-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$0xtmPH1TKoPh3FnuP6xNIeXmyS8TDmVw9UfD9aaeXITjVSmWiISwe', '120999272@', '', '0', 'U03350090809'),
('9987033479', 'DEVI MAYA SARI', 'P', 'Tegal', '1998-05-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$/B/WQ0bPXKtCUMJmhk5kFu/H.R57xXsHZW/kLKKHv4JxwhKQtj4Fm', '1013749701@', '', '0', 'U03350090356'),
('9987033583', 'SELVY AINUN NURSYAMSIYAH', 'P', 'Tegal', '1998-04-13', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$/LHY2HOjskT/g3YwDh0xyeHoLl2YYl4j.0E.tDzivUte4p.0ddDlG', '1730127866@', '', '0', 'U03350090267'),
('9987033620', 'ISMATUL LAELY', 'L', 'Tegal', '1998-03-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$EdbKFCqgSzS7NC3LTW22ze9k3o0EnI8GADU/w8vDL8GFW0slCfBJG', '1332361583@', '', '0', 'U03350090792'),
('9987033621', 'NISA LULU AMALUNA', 'P', 'Tegal', '1998-05-14', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$H/KmMN9k4j0F2fmjiaGItOP0MTjcwjueQpS60kRmIAFgRJNUY9Ibe', '1571588008@', '', '0', 'U03350090836'),
('9987092002', 'IRENE NUR AMALLIYAH', 'P', 'Jakarta', '1998-03-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$VX4jy1DrWXzwbK/0vwqDN.mdZUbrk2F6BU1wz1viu2LbgLxzMqqqi', '1566135941@', '', '0', 'U03350090445'),
('9987093718', 'GEMINTANG SEPTHI NAZIHA', 'P', 'Tegal', '1999-09-22', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$k8z3c8lYW8/5OSYpWUTCfOtioyCSp9pStHmjpJw6KBC4/0sI0OfAG', '1125078491@', '', '0', 'U03350090418'),
('9987094046', 'WARDAH ARUMSARI', 'P', 'Jakarta', '1998-08-22', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$lifr.sfSfhTH6jvYj9kXHeIuG457aH.3PPs9E4xfeqFArBri0O/x6', '1455723606@', '', '0', 'U03350091272'),
('9987256382', 'YUSSI MELINAWATI', 'L', 'Surakarta', '1998-05-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$3paS6kPVIXHTFIU92lqCluujr9qrxmzSLA7E9kM.g9DdoRMb0HzSu', '668982353@', '', '0', 'U03350090329'),
('9987295202', 'DERA LAPISKA', 'P', 'Surakarta', '1998-06-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$App8o81fqFR4XHqKx5soQeSSX7lGWaTYXe3xf5Fxy091s4o94x8M2', '262054163@', '', '0', 'U03350090072'),
('9987312863', 'IKA MEI LINDAWATI', 'P', 'Tegal', '1998-05-05', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$L/vENxB8b8fdcno9A3lxhuLE1gEdoloRSUhQu0E8x31H5knRnhsf.', '750678853@', '', '0', 'U03350090134'),
('9987313194', 'EVI IDA AMALIA', 'P', 'Tegal', '1997-07-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$cyWGh2c6V6U4FDylW1j99.I11xo.D5FXclg/mQOUeDuTmMKPVLbbu', '2143311869@', '', '0', 'U03350090392'),
('9987313215', 'NURUL AULIA', 'P', 'Tegal', '1998-04-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$KTy8eEGijs5Ny9n9hIdabe.9pxMKoCc7MUJaYUt3ezBxauuDdZMqK', '1318499729@', '', '0', 'U03350090534'),
('9987313310', 'RATNA NURMALITA', 'P', 'Tegal', '1998-05-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$KWUChvZO48mVaZhwtZMduups3OYKSK7MJnln3LRChcMAA4iGYhJZ6', '1122467091@', '', '0', 'U03350091165'),
('9987321584', 'NINDI DYAH AYU PERMATA S', 'L', 'Tegal', '1998-03-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$IEj87nKU7hl5lhxXAWlDuOaYYJa.O0PW92WoK/6uRwd9GGWlaPltW', '425529758@', '', '0', 'U03350091476'),
('9987338501', 'ALIYATUN MARZUKOH', 'P', 'Tegal', '1997-08-19', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$2Pf8hz4HmujxOU4LwgjMcughNdMsu5afxH4jORgSEw8sY.Puo7Hi6', '1168780971@', '', '0', 'U03350090685'),
('9987350499', 'REZA ADITYA MAULANA', 'P', 'Tegal', '1998-07-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$HZzw4br9k9/kj4vpGWld2OyFz/F7QyySjW4mPIZZ76lWTSIiKoaYe', '239740009@', '', '0', 'U03350091174'),
('9987358138', 'DENI PRATAMA', 'P', 'Tegal', '1998-09-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$Ua47hqa5b.s90ppWPT0y3.we6DlfpvVtyGBumReeyuueDnVxcfRBu', '563335516@', '', '0', 'U03350090738'),
('9987358369', 'DENDY KRISNANTO', 'L', 'Tegal', '1998-07-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$PlFbrQgQLRbqXWvwTnIATO3mlsdR77RH3yqXyzQKE076bMILbkNvm', '949845993@', '', '0', 'U03350090729'),
('9987358378', 'YENI RIZKI AMALIAH', 'P', 'Tegal', '1998-08-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$/7BpxWFMJggfsTV1IJkkTOVHvBKzsSv0w8V0z0UCii3XSWpq7.Msi', '64842357@', '', '0', 'U03350091583'),
('9987358383', 'NOVIDA FAIRUZ FALASTIN', 'P', 'Tegal', '1997-09-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$uF0DOY37YfPTr7QGnJF.8.dqqGHgmRRfEM/bzUj4Z2.DnhxdNonKu', '201484263@', '', '0', 'U03350090223'),
('9987372839', 'VIA OFTAMIA', 'P', 'Tegal', '1998-05-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$09A738i9/K8USjx3ioIenuu4jxY1s/.i25uMa3oaqDjvZdfFiHpgG', '942943869@', '', '0', 'U03350090614'),
('9987373011', 'SUKMA HIDAYAT', 'P', 'Tegal', '1998-08-18', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$rElsa1GjBM0/PLrBPFotvuxcQ.paCiU0WeHExTfuJqj1esN7f.4Ee', '573887530@', '', '0', 'U03350091556'),
('9987453337', 'APRILIA INTAN PRATIWI', 'L', 'Tegal', '1998-04-06', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$KARmiuzSJlrcVKRkbyC5QeLI3ixxmcIo.3GK.F1Ztvo4Fx47kt.w.', '2119684353@', '', '0', 'U03350091005'),
('9987453361', 'FIRMAN ARIF MARZUKI', 'P', 'Tegal', '1998-01-03', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$c/tHSRn1DcpAWGiHtrapjOewhy0YSyJS6jioZxklWvxgchcdSA1SW', '1663911566@', '', '0', 'U03350091049'),
('9987475175', 'RETNO FEBRIYANI PUTRI', 'P', 'Karanganyar', '1999-02-15', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$IKjHCnm3oNtDSMQ5S1ChNOtriDt8kczYIiEtkc66DRlqs4mSTkm1K', '1319571960@', '', '0', 'U03350090258'),
('9987512854', 'FARAH ADIBA', 'P', 'Tegal', '1997-11-12', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$3D9EjZ9Khm6s2TejUNj3KO3iyLFw1cltpXNIJsMJ1azcroF6tKmYO', '1181478524@', '', '0', 'U03350091387'),
('9987512946', 'AKHMAD PRASETYO NURFAOZAN', 'L', 'Tegal', '1998-12-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$vh3Sl9nFKqs7Q78UHyrFxeHJtJR3B2KRwrvz9MZYob67xv1d0kbkC', '1204133059@', '', '0', 'U03350090018'),
('9987516803', 'AULIA NURUL AZIZAH', 'P', 'Tegal', '1998-11-01', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$zpbtLx.EhZdQJgWRlJ1YLuDWCbrYnZTKx.3BOSO73YrZ/6kGtq5Yy', '401413282@', '', '0', 'U03350090703'),
('9987672071', 'DEA IRANIA FHANY', 'P', 'Tegal', '1999-09-28', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$dSq.uk1Ve4z1TtQvTzK4l.byWC0L5tpqvuHvOh1E9IyVlEOtQE006', '788372827@', '', '0', 'U03350090712'),
('9987672074', 'DONI OKTA ARIEFIYANTO', 'P', 'Tegal', '1998-10-04', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$7Mogozne/wtbddXhf/hm1.ZHIRsq37DwdTOoz5OV4ZzHeFDiMc19O', '2094860200@', '', '0', 'U03350091369'),
('9987674491', 'DYAH AYUNING SHABARKAH', 'P', 'Tegal', '1997-10-05', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$VOWiFQCByqguPYRLsll5f.GVC6/LcvjEuFihasWuEIp2kJTrl0OTa', '625235329@', '', '0', 'U03350091378'),
('9987674636', 'SHINTA PRADIAN SARI', 'L', 'Banda Aceh', '1999-05-06', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$obFU.Yivnbo/OnMk52/TFuBNM3c4N8.Gpuz4ci1QzY8oMXQD1Gm5e', '1732222545@', '', '0', 'U03350090925'),
('9987839055', 'DEWI TRIWI ANGGUN', 'P', 'Tegal', '1998-02-06', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$ki3Wn800zhMey8ryKmpSHO9El1aDF7UzHASiTmeZgJfxJ3TUmSxy2', '909371295@', '', '0', 'U03350090089'),
('9987895273', 'MOH ICHAM CHOMARULLOH', 'L', 'Tegal', '1998-06-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$F45YZQWpS..qRl4AZxQ.IO1I61BTrmrgJ3H39vGsrysu26CuVjAKO', '161085865@', '', '0', 'U03350091458'),
('9987895600', 'SELLY RAHMAWATI', 'P', 'Tegal', '1998-03-11', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$aFam0oktz7cD3Cgb2XMEsu/uhQ31zopuRsFGhCAU1GjI3DNfrWxuu', '2056620286@', '', '0', 'U03350091547'),
('9987895650', 'EFAL RESTU ARDIANSYAH', 'L', 'Banyumas', '1997-12-07', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$k/AQe1/JM2oHt5THUnl16.yt/zruaikdWdkIgfc8IFSSK3jm4Eebi', '423041028@', '', '0', 'U03350090098'),
('9987895680', 'NOVITA LAELA SUMBARA', 'P', 'Cirebon', '1998-10-28', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$zWrngUXMN/RQEFSPY2uXQ.QHuctLbsQ1vBBIKpLmy.Vp3C5.6OqqK', '1743289207@', '', '0', 'U03350090516'),
('9987896113', 'RESTI YULIANI WIJAYARTI', 'L', 'Sragen', '1998-07-08', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$rQS2PAZQay27XISG518GieDleFaeN6zh9jaEvROsEVTz1FqobFYqm', '304064633@', '', '0', 'U03350090552'),
('9987896169', 'SAVIRA CHAERUNISA', 'P', 'Pemalang', '1997-12-21', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$Dyw25VsYsP4U32ILlmwDsOnUGwisFEI5pZ7pUAakEU/zLJIfQOlEu', '1633505604@', '', '0', 'U03350091538'),
('9987896287', 'SETIA DEWI AYUNINGTIAS', 'P', 'Tegal', '1998-06-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$lvqgAOmk9co5.DLFc/sotO5NlGNgs/KyOCb1ZpahBU7bI7nkZx7I6', '524339404@', '', '0', 'U03350090587'),
('9988013505', 'YUSIA ANGGIAT GIGIH MANURUNG', 'P', 'Tegal', '1998-08-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$mSaPI7wX9A1femmGLADChOZT8XsAE57YtZ/hMuBXswdXZSiE7VFb2', '923687040@', '', '0', 'U03350091289'),
('9988031385', 'MOH. AJI RIYAN SAPUTRA', 'P', 'Tegal', '1998-05-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$UbTVuIM5rG43ZVWyZL/8VOYE4j5o6dPiaFdx2xxHkDDg2pzjPzeqC', '1625296171@', '', '0', 'U03350090463'),
('9988755362', 'MUKHAMAD FITROH ALDI', 'L', 'Tegal', '1998-01-24', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$giQEmD95r4cjH2FaxfA3KOCsXhuuK0uHXOpwaWXBrLotANt.XrmLO', '1551838142@', '', '0', 'U03350090205'),
('9988755795', 'RIZKA NOVITASARI', 'P', 'Tegal', '1998-11-16', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$V31Ptdpi7iWlb6IlZY7OduLOh.AKzWWL57ZEsFYVIj5daVcPmF9cG', '428837905@', '', '0', 'U03350091512'),
('9989638713', 'PRADITA INTAN RUTANTI', 'L', 'Brebes', '1998-07-05', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$neCpsRU/P3LUeDJ4z.ZH6.nRB.tHzuBnsAukHI/JJeVWQhbmyThOu', '252159993@', '', '0', 'U03350091156'),
('9989814601', 'ARKHAN IVANDIARSO', 'P', 'Tegal', '1998-08-02', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-5', '$2y$10$58141IM..nBSkvO9HIQ/o.WpOigdLeNYvF..BXcX6dYbMbg9EHKwW', '1559596864@', '', '0', 'U03350091325'),
('9992578205', 'SAEFUL AMIN', 'P', 'Tegal', '1997-09-20', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$aX1UjDrLBT9VqMI6HnB/e.ULc14D7SHJ3Lemd1J4.iXDW/QoPW0eC', '1389967635@', '', '0', 'U03350090907'),
('9993166663', 'LAILINA QADRIN', 'P', 'Tegal', '1999-01-10', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$kDGQbiaPDEkOMl0zhb9TPeBjxoiFoO8EEBNuNZNaZMtRGaG6Q.Gj2', '1497790246@', '', '0', 'U03350090178'),
('9993755357', 'PUPUNG CAHYA WULANDARI', 'P', 'Tegal', '1998-06-13', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$dxCw2NJhQ2yjRIXmvgaIuuw2NHw5CZ4xvi2uY23tgd5cWCehBVCoy', '1352601724@', '', '0', 'U03350090863'),
('9994972818', 'ARIF SETYANTO', 'L', 'Tegal', '1999-07-09', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$UNS7hc9THW45vM8a8XE3Xek/d8y6wrUMzOw/ECFyHQT1oKC/XmiKa', '492786409@', '', '0', 'U03350090045'),
('9996872318', 'DIAS FENI MELIANA', 'L', 'Tegal', '1998-05-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$DiHjtXshXfpRr0T.h9CZo.BnD6hv5PpIAnNnxzJkFVSLSU5dWRtvC', '724270002@', '', '0', 'U03350091023'),
('9996910073', 'SRI MULYANI', 'P', 'Tegal', '1998-07-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$LCiTwSveySM1ZLQfGlRhjeHkMKnpYZp9WlqcM.0BonDGRPMt8RWrG', '1141715491@', '', '0', 'U03350090285'),
('9997033558', 'FAUZIAH GIYANTI', 'P', 'Bekasi', '1998-11-29', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-2', '$2y$10$J3anw3QVIVnx647UebqM5eiI.9WA0RT6hr6hfeM.C.Rm1yPB5NuMS', '253041712@', '', '0', 'U03350090409'),
('9997343242', 'DWI PUTRI MELLY UMMAYA', 'L', 'Tegal', '1998-05-30', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-3', '$2y$10$1ZPCZRJA9Jlk8kxa4JYLbOWEM4Onfd1XoJDjiVwIag3N7TDAOB0Va', '1638862345@', '', '0', 'U03350090747'),
('9997631526', 'AMELIA MEGA ANDRIYANI', 'P', 'Magelang', '1997-02-26', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-1', '$2y$10$rvOeWUc6uviEmv40oUIfWue4D2nQ9wqCIzdS/qZjVdo7G.odPIwy2', '1096697977@', '', '0', 'U03350090027'),
('9998051661', 'SYIFA AMALIA', 'L', 'Tegal', '1998-01-31', '-', 'Islam', 'Tegal', '-', '-', '-', '-', '-', '-', '-', '-', '-', 'XII-MS-4', '$2y$10$V8QBzRkWL1chQhW03xvVx.MaFJtWkz97736Vv3PQbsc3vKT7BQV66', '223383615@', '', '0', 'U03350091254');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `soal_siswa`
--

DROP TABLE IF EXISTS `soal_siswa`;
CREATE TABLE IF NOT EXISTS `soal_siswa` (
  `id` varchar(32) NOT NULL,
  `id_soal` int(10) unsigned NOT NULL,
  `id_detail_soal` int(11) unsigned NOT NULL,
  `id_jadwal` varchar(32) DEFAULT NULL,
  `id_detail_jadwal` varchar(32) NOT NULL,
  `soal_ke` int(10) NOT NULL,
  `nis` varchar(17) NOT NULL,
  `jawaban` enum('a','b','c','d','e') NOT NULL,
  `status` enum('0','1') NOT NULL,
  `selesai` enum('N','Y') NOT NULL,
  `benar` enum('T','N','Y') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_soal` (`id_soal`,`id_detail_soal`,`id_jadwal`,`id_detail_jadwal`),
  KEY `id_jadwal` (`id_jadwal`),
  KEY `id_detail_soal` (`id_detail_soal`),
  KEY `id_detail_jadwal` (`id_detail_jadwal`),
  KEY `nis` (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
`id` varchar(32)
,`id_jadwal` varchar(32)
,`kd_kelas` varchar(10)
,`jam_mulai` time
,`id_ruang` int(10) unsigned
,`status` enum('0','1','2')
,`pengawas` varchar(25)
,`token` varchar(100)
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
`id_jadwal` varchar(32)
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
`nis` varchar(17)
,`kd_kelas` varchar(10)
,`id_ruang` int(10) unsigned
,`nama_ruang` varchar(45)
,`no_meja` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `nilai_siswa`
--
DROP TABLE IF EXISTS `nilai_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nilai_siswa` AS select `siswa`.`nis` AS `nis`,`siswa`.`no_peserta` AS `no_peserta`,`siswa`.`kd_kelas` AS `kd_kelas`,`siswa`.`nama` AS `nama`,`soal_siswa`.`id_soal` AS `id_soal`,`soal_siswa`.`id_detail_soal` AS `id_detail_soal`,`soal_siswa`.`id_jadwal` AS `id_jadwal`,`soal_siswa`.`id_detail_jadwal` AS `id_detail_jadwal`,`soal_siswa`.`soal_ke` AS `soal_ke`,`soal_siswa`.`jawaban` AS `jawaban`,`soal_siswa`.`status` AS `status`,`soal_siswa`.`selesai` AS `selesai`,`soal_siswa`.`benar` AS `benar`,`soal`.`kd_mapel` AS `kd_mapel` from ((`siswa` left join `soal_siswa` on((`soal_siswa`.`nis` = `siswa`.`nis`))) left join `soal` on((`soal_siswa`.`id_soal` = `soal`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_detail_jadwal`
--
DROP TABLE IF EXISTS `view_detail_jadwal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_jadwal` AS select `a`.`id` AS `id`,`a`.`id_jadwal` AS `id_jadwal`,`a`.`kd_kelas` AS `kd_kelas`,`a`.`jam_mulai` AS `jam_mulai`,`a`.`id_ruang` AS `id_ruang`,`a`.`status` AS `status`,`a`.`pengawas` AS `pengawas`,`a`.`token` AS `token`,`b`.`kode_jurusan` AS `kode_jurusan`,`b`.`kd_mapel` AS `kd_mapel`,`b`.`tgl_ujian` AS `tgl_ujian`,`b`.`jam` AS `jam`,`b`.`selesai` AS `selesai` from (`detail_jadwal` `a` join `jadwal` `b`) where (`a`.`id_jadwal` = `b`.`id_jadwal`);

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
  ADD CONSTRAINT `fk_detail_jadwal_3` FOREIGN KEY (`id_ruang`) REFERENCES `ruang_ujian` (`id_ruang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_jadwal_4` FOREIGN KEY (`pengawas`) REFERENCES `pengawas` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jadwal_soal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_nis_ujian` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ruang_ujian` FOREIGN KEY (`id_ruang`) REFERENCES `ruang_ujian` (`id_ruang`) ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`) ON UPDATE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `fk_guru_soal` FOREIGN KEY (`author`) REFERENCES `guru` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_soal_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soal_2` FOREIGN KEY (`kd_mapel`) REFERENCES `mapel` (`kd_mapel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `soal_siswa`
--
ALTER TABLE `soal_siswa`
  ADD CONSTRAINT `fk_detail_jadwal_id2` FOREIGN KEY (`id_detail_jadwal`) REFERENCES `detail_jadwal` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_soal_id` FOREIGN KEY (`id_detail_soal`) REFERENCES `detail_soal` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_jadwal_soal2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nis_soal` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_soal_id` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
