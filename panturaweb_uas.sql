-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2016 at 07:16 
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
(1, 'Jamal Apriadi', 'jamal.apriadi@gmail.com', '$2y$10$luQOeq52HNf6egBNxTZl2ejOi0HKIioXnPA1Udav.VQzQpq7V1gsi', 'sgKdjEayKwIC0fFHVUn3qPk5tjC7jvHec0gPbV2nSComkYrWFrwBUV0RAqHn', '2016-02-08 11:09:15', '2016-02-08 11:09:15');

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

--
-- Dumping data for table `detail_jadwal`
--

INSERT INTO `detail_jadwal` (`id`, `id_jadwal`, `kd_kelas`, `jam_mulai`, `id_ruang`, `status`, `pengawas`, `token`) VALUES
('cecba4b7069a456389ee5bd34e0e68e8', '15ae2c25dbe24ccf91868e5b8b7debac', 'LM 12 IA 3', '22:27:10', 1, '0', '123', 'UqW0ev');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `detail_soal`
--

INSERT INTO `detail_soal` (`id`, `id_soal`, `gambar_besar`, `gambar_kecil`, `kunci_jawaban`) VALUES
(10, 4, 'U9jYJ-1.png', 'U9jYJ-1.png', 'd'),
(11, 4, 'IQqNf-2.png', 'IQqNf-2.png', 'd'),
(12, 4, 'RqkYE-3.png', 'RqkYE-3.png', 'c'),
(13, 4, 'gybDR-4.png', 'gybDR-4.png', 'd'),
(14, 4, 'rAGca-5.png', 'rAGca-5.png', 'd'),
(15, 4, 'HUAxD-6.png', 'HUAxD-6.png', 'a'),
(16, 4, 'fkmhu-8.png', 'fkmhu-8.png', 'c'),
(17, 4, 'pjuvb-9.png', 'pjuvb-9.png', 'd'),
(18, 4, 'hWuYa-10.png', 'hWuYa-10.png', 'b'),
(19, 4, 'Prx7B-11.png', 'Prx7B-11.png', 'd'),
(20, 4, 'JZNw0-12.png', 'JZNw0-12.png', 'd'),
(21, 4, 'r6ZJA-13.png', 'r6ZJA-13.png', 'a'),
(22, 4, 'LrsGG-14.png', 'LrsGG-14.png', 'b'),
(23, 4, 'vMVke-15.png', 'vMVke-15.png', 'c'),
(24, 4, 'kB77T-16.png', 'kB77T-16.png', 'b'),
(25, 4, 'ew9or-17.png', 'ew9or-17.png', 'a'),
(26, 4, 'odz09-18.png', 'odz09-18.png', 'd'),
(27, 4, '3fp2W-19.png', '3fp2W-19.png', 'a'),
(28, 4, 'cyPgs-20.png', 'cyPgs-20.png', 'd');

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
('123', 'Jamal Apriadi,S.Kom', '$2y$10$eFCgtxOsXBZkzpjBJ8HPX..V498T3pIUIOpcBrRlR8Y1CCtkjqlaO', 'MTK', 'xtKZGTVw1JAvDV12TKrly7KSdT7Ik4n73ONDAeoXQmntflgWLPXXSlcbjili');

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
  PRIMARY KEY (`id_jadwal`),
  KEY `index2` (`kd_mapel`),
  KEY `kode_jurusan` (`kode_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `kode_jurusan`, `kd_mapel`, `tgl_ujian`, `jam`, `selesai`, `waktu_ujian`) VALUES
('15ae2c25dbe24ccf91868e5b8b7debac', 'ims', 'MTK', '2016-02-07', '08:00:16', '22:48:19', 60);

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
('LM 12 IA 1', 'x', 'ims', 1),
('LM 12 IA 2', 'x', 'ims', 2),
('LM 12 IA 3', 'x', 'ims', 3),
('LM 12 IA 4', 'x', 'ims', 4),
('LM 12 IA 5', 'x', 'ims', 5),
('LM 12 IS 1', 'x', 'IS', 1),
('LM 12 IS 2', 'x', 'IS', 2),
('LM 12 IS 3', 'x', 'IS', 3),
('LM 12 IS 4', 'x', 'IS', 4),
('XII MS 1', 'x', 'ims', 1),
('XII MS 2', 'x', 'ims', 2),
('XII MS 3', 'x', 'ims', 3),
('XII MS 4', 'x', 'ims', 4),
('XII MS 5', 'x', 'IS', 5),
('XII SOS 1', 'x', 'IS', 1),
('XII SOS 2', 'x', 'IS', 2),
('XII SOS 3', 'x', 'IS', 3),
('XII SOS 4', 'x', 'IS', 4);

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
('123', 'Jamal Apriadi,S.Kom', NULL, '$2y$10$m.3sLrYSAxUFA0Hv6dqsCeyXlz.tWlIfZj/YykrA5KYM72jEOtaz.', 'JN0Xd293hBfCJMU6jUqTJS0yCEE2kPJenTai7pAedAgY6XAkCGMxlSxNqH5P');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_peserta` (`no_peserta`),
  KEY `id_jadwal` (`nis`,`id_ruang`),
  KEY `nisn` (`nis`),
  KEY `id_ruang` (`id_ruang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `peserta_ujian`
--

INSERT INTO `peserta_ujian` (`id`, `no_peserta`, `nis`, `id_ruang`, `no_meja`) VALUES
(2, NULL, '9947233221', 1, 1);

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
('9947233221', 'NURHIKMAH FITRIANA', 'P', 'TEGAL', '0000-00-00', '3328144604990003', 'Islam ', 'DS.BREKAT RT.07/01 TARUB', '7', '1', '-', 'brekat', 'Kec. Tarub', '52184', 'DN-03 DI 1001269    ', 'Imam Nurochim', 'HJ.Sugimah', 'LM 12 IA 3', '$2y$10$5ANHw3YV.UlDmZ1bueQVa.QLsCDPg61rvCOA4Pt5byYsHA9CICGSK', 'W3dHKo', 'tUsHKBaHI80f5kHmnRk2VvLJwaL49hgM04A94Kw7ktpxnA96YkaSaxVknxvV', '0', 'U03350090845'),
('9966939301', 'ENGGI OKTAVIANI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JALAN ANTASENA RT. 17 RW. 06 GUMAYUN', '17', '6', '-', 'gumayun', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997289    ', 'Abdul Munip', 'Susi Astuti', 'LM 12 IS 3', '$2y$10$kVxDueNANnQlhmLTeANqbuwocJEGWMLiYTSsoIDZJLPrdQ00g23u6', 'qYFnsY', '', '0', 'U03350092338'),
('9967334404', 'ISNAENI AMALIYAH', 'P', 'TEGAL', '0000-00-00', '3328136412980002', 'Islam ', 'JALAN : H. HANAFI', '4', '4', '-', 'KUPU', 'Kec. Dukuhturi', '52192', 'DN-03 DI 0992599    ', 'NUROCHIM', 'DARYUNI', 'LM 12 IS 1', '$2y$10$zw.u7J/cVlgzqyPd3srOtug9OWPIv0Ap9EP.mffuCXK7/wmaoG9.W', 'xsiyKy', '', '0', 'U03350091716'),
('9967953118', 'SRI MULYANI', 'P', 'TEGAL', '0000-00-00', '3328116907980009', 'Islam ', 'JL.MBAH SANTRI', '13', '3', '-', 'DS. HARJOSARI KIDUL', 'Kec. Adiwerna', '52194', 'DN-03 DI 0279915    ', 'ROSIDIN', 'ROKHANI', 'LM 12 IA 1', '$2y$10$yH/zAWkVxzusuT63lKfd/ed.aynKzcdoYozEjv5wENdCfw27E1s2y', 'BIuSGV', '', '0', 'U03350090285'),
('9969916116', 'JUANAH', 'P', 'TEGAL', '0000-00-00', '3328045801960005', 'Islam ', 'KARANG JAMBU, RT 04 RW 07', '4', '5', 'KARANGJAMBU', 'KARANGJAMBU', 'Kec. Balapulang', '52464', 'DN-03 DI 1001393    ', 'KASUR', 'RODIYAH', 'LM 12 IS 4', '$2y$10$Z0jF7cu7Aoy7RyW/.976uuUwJ4CvRlSoqpcqqWXomKuEvoGVjZwbC', 'MHru0F', '', '0', 'U03350092774'),
('9970348295', 'FAFA DWI YUNDIAR', 'L', 'TEGAL', '0000-00-00', '3328181610970001', 'Islam ', 'PALM ASRI 1 DESA PEDAGANGAN KEC. DUKUHWARU RT', '3', '5', '-', 'Pedagangan', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993153    ', 'Sirom Endhi', 'Yuli Respitowanti', 'LM 12 IA 1', '$2y$10$DERPYeRrNiAth4FtgCX2putheIq8rIAbUVWhJ0SASvb15YA.tu4gy', '34l9F1', '', '0', 'U03350090107'),
('9972098963', 'AMELIA MEGA ANDRIYANI', 'P', 'MAGELANG', '0000-00-00', '3308146602970002', 'Islam ', 'JALAN SERAYU', '20', '7', '-', 'SLAWI WETAN', 'Kec. Slawi', NULL, 'DN-03 DI 0989566    ', 'ANDI SUDARTO', 'MUSYAROFAH', 'LM 12 IA 1', '$2y$10$76/SScvTA5jUxSPpmiRcqu0Ty5tX2qA2XS9TPIegeXa2u5MzsqjbW', 'JoLPtR', '', '0', 'U03350090027'),
('9972903887', 'DYAH AYUNING SHABARKAH', 'P', 'TEGAL', '0000-00-00', '3328084510970006', 'Islam ', 'DESA TONGGARA RT. 18/07 KAB. TEGAL', '18', '7', '-', 'DESA TONGGARA', 'Kec. Kedung Banteng', '52472', 'DN-03 DI 0996391    ', 'DAMIRI', 'WARNINGSIH', 'XII MS 5', '$2y$10$PZTyd8izUBuTAZjNqHlfXun86ImeVhkKBIcSdR/0zPxnecsGQ7j8W', 'XWoQGW', '', '0', 'U03350091378'),
('9973283108', 'SETYO ADI NUGROHO', 'L', 'TEGAL', '0000-00-00', '3328031510970003', 'Islam ', '-', '3', '1', '-', 'BOJONG', 'Kec. Bojong', '52465', 'DN-03 DI 0991726    ', 'RIWONDO', 'MUJIARTI', 'LM 12 IS 3', '$2y$10$iOF8fbv8gZ.zpyDefM/Uw..vakJNVft96xMXllDs8jBOvD7QUNMFa', 'XuDKF1', '', '0', 'U03350092507'),
('9973740655', 'SITI MARISAH', 'P', 'TEGAL', '0000-00-00', '3328076104970002', 'Islam ', '-', '6', '3', 'lebakwangi', 'lebakwangi', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993458    ', 'NARJA', 'DUSRI', 'LM 12 IS 3', '$2y$10$mxMlTe6ejVeIjwg5O9L.8u/BtHfkY0rzqA.fiRtBiIJp8kPJAZifG', 'QoVu2i', '', '0', 'U03350092516'),
('9973908604', 'SAEFUL AMIN', 'L', 'TEGAL', '0000-00-00', '3328092009970005', 'Islam ', 'DS.PENUSUPAN RT.03/08', '3', '8', '-', 'penusupan', 'Kec. Pangkah', '52471', 'DN-03 DI 0996947    ', 'Sutrisno', 'Muryati', 'LM 12 IA 3', '$2y$10$Kbh4w7ri3zPxDJLbsHqOIOBjf6ou5x0z/uL6NF7qzUAucfU4cc6KS', 'kpcyDz', '', '0', 'U03350090907'),
('9974086833', 'BINTA TSALASA', 'P', 'TEGAL', '0000-00-00', '3328112402085109', 'Islam ', 'UJUNGRUSI, JL.SEROJA RT.05/01 NO. 14 ADIWERNA', '5', '1', NULL, 'UJUNGRUSI', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989602    ', 'SOLIKHUN', 'SAROPAH', 'LM 12 IS 3', '$2y$10$BewToHlEIqlBT3j/OaFtj.oxDoHtOGLrCAa41co4vbxnY30DrQxAu', 'XCl0hZ', '', '0', 'U03350092303'),
('9974440678', 'FANDY AFIF SETIAWAN', 'L', 'SEMARANG', '0000-00-00', '-               ', 'Islam ', 'PERUM GRIYA PANDAWA ASRI BLOK A2/16', '4', '7', '-', 'PENDAWA', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994692    ', 'IWAN SETIAWAN', 'RYKO PINTA DEWI', 'LM 12 IS 2', '$2y$10$WyeSQus2BuMsSsoXaC7JVO5m..QXhylof/yvmN9BVtTS6bXKO3Hv6', 'TTU2a1', '', '0', 'U03350091983'),
('9976041462', 'MOHAMMAD ILHAM RIFALDI', 'L', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'TEMBOK BANJARAN RT 19/3', '19', '3', 'tembok banjaran', 'tembok banjaran', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989392    ', 'Edi Santoso', 'Farikha', 'LM 12 IS 4', '$2y$10$VO.owXQF1i4/7YcdzVmhCu41X4CYWaROk48bXH.uuUZ7vyKsCCY9G', 'vJHhS2', '', '0', 'U03350092809'),
('9976667979', 'LELY NUR INDAHSARI', 'P', 'TEGAL', '0000-00-00', '3328075111970004', 'Islam ', 'KECAMATAN JATINEGARA', '1', '5', '-', 'SITAIL', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993654    ', 'THOBIIN', 'SOLICHA', 'LM 12 IS 4', '$2y$10$b9cMDKfOocJn7xOFEKEEU.pIzaDP56qKo3kwZH143ji3WXKq2btqa', 'jnZ2v9', '', '0', 'U03350092783'),
('9976753640', 'INDAH TRI APRILIANI', 'P', 'TEGAL', '0000-00-00', '3328116104990007', 'Islam ', 'Jl. Perkutut ', '7', '1', '-', 'Desa Tembok Kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0889523    ', 'SYAEFUDIN', 'DANISAH', 'LM 12 IA 1', '$2y$10$vkmrDXizTQNXbzqgnIlze.zOF5jFc5vuZboNMK.MEb48P6YJMq6yu', 'JE8Gp4', '', '0', 'U03350090152'),
('9976754296', 'SAVIRA CHAERUNISA', 'P', 'PEMALANG', '0000-00-00', '3328096112970006', 'Islam ', 'GROBOG KULON RT 02/6', '2', '6', NULL, 'GROBOG KULON', 'Kec. Pangkah', '52471', 'DN-03 DI 0990818    ', 'CHAERUDIN ANDI WIBOWO', 'ENDANG SUYANTI', 'LM 12 IA 5', '$2y$10$hNX0YbQZoHuAtPOG7WC43ehs5bdOSU/IjwFBktXIq.Cc5fAzuofMO', 'iNJHf1', '', '0', 'U03350091538'),
('9976757264', 'NOVIDA FAIRUZ FALASTIN', 'P', 'TEGAL', '0000-00-00', '3328115609970001', 'Islam ', 'TEMBOK BANJARAN RT. 04/01 ADIWERNA TEGAL', '4', '1', '-', 'Tembok Banjaran', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989584    ', 'HASAN AL IDRUS', 'SITI MAEKHA', 'LM 12 IA 1', '$2y$10$oLmEy18Kp8QXei2Vg6ptLeMWL59PukmwwWHdGWqQMwYz.RHwmacQa', 'J950hj', '', '0', 'U03350090223'),
('9976759901', 'ILHAM AZIS WICAKSONO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Jalan wijaya 1', '4', '1', NULL, 'Cilongok', 'Indonesia                     ', NULL, 'DN-03 DI 0991739    ', 'Nuridin', 'Wurningsih', 'LM 12 IS 1', '$2y$10$cFlPIpXOUSWjj3oFW8q8fehHQ/lV/LNf3moC/mhRdsbeYN1GQsf9K', 'gfWgAK', '', '0', 'U03350091698'),
('9976772976', 'AZKY AFIDAH', 'P', 'TEGAL', '0000-00-00', '3328024509970002', 'Islam ', 'JEJEG-BUMIJAWA', '2', '4', 'LINGGAJAYA', 'JEJEG', 'Kec. Bumijawa', '52466', 'DN-03 DI 0283873    ', 'MUCHYIDIN', 'H. RICHANAH S.Pd.I', 'LM 12 IS 4', '$2y$10$sg23dORSd/wN64oNY7v8ge.F7jSm6nyJ4b1otR6.npYn6jB57Du62', 'ezTb5h', '', '0', 'U03350092632'),
('9976774050', 'MUHAMAD ABDUL HAFIDZ', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA CINTAMANIK RT 01/04 TEGAL', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 1001438    ', 'Syarifudin', '-', 'LM 12 IS 1', '$2y$10$yVdNLt8oBgkc6mTYjQ2zCuB4hb.UJpvIhXw/dXvI3mozb2fKI7mHq', 'JKFJYd', '', '0', 'U03350091752'),
('9976774656', 'FITRI CAHYANI', 'P', 'TEGAL', '0000-00-00', '3328186712970002', 'Islam ', 'JL. BANDENG', '5', '3', '-', 'KALISOKA', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993081    ', 'WASHARI', 'MARSAROH', 'LM 12 IA 5', '$2y$10$2pcDt2Wz3QaulLNV4ROZMOCR6KVJfAfmTXbXLUM.qeMoq2lr8Uxmy', 'noSwfn', '', '0', 'U03350091396'),
('9976774901', 'NOVY KURNIAWATI', 'P', 'TEGAL', '0000-00-00', '3328182002087513', 'Islam ', 'JL.GUNUNG SLAMET DESA BLUBUK RT 02/8 DUKUHWAR', '2', '8', '-', 'BLUBUK', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993069    ', 'MUTOHIRIN', 'SUNITAH', 'XII MS 1', '$2y$10$TEvaQA17ml5zfBRPEjUwD.a3tdO35XsOKV7NTQhE2CkEWG7qf2QJW', 'VDiaGn', '', '0', 'U03350090232'),
('9976776412', 'SYIFAUN NADIYAH', 'P', 'TEGAL', '0000-00-00', '3328045711970004', 'Islam ', 'BALAPULANG WETAN, JL. AGUS SALIM GG. GELATIK ', '5', '2', '-', 'BALAPULANG', 'Kec. Balapulang', '52464', 'DN-03 DI 0991272    ', 'M. DUKRI', 'FATICHA', 'LM 12 IA 5', '$2y$10$qMf2/xmQBfJYPj2pI5yr6O0.M8Kkhf3bI6VjXtKsgrGsICVx0MWRy', 'qImrR5', '', '0', 'U03350091565'),
('9976776506', 'DWI SITTAH OKTARIANTI', 'P', 'TEGAL', '0000-00-00', '3328046610970006', 'Islam ', 'JL. MANGGA NO.65  RT 01/ RW.II BALAPULANG WET', '1', '2', '-', 'BALAPULANG WETAN', 'Kec. Balapulang', '52464', 'DN-03 DI 0991198    ', 'SOBIRIN', 'NURYATI', 'LM 12 IA 3', '$2y$10$JrmwYMz8rBmSHJbGfivq..lOFPnS/kEm1.uw7.5gHJyJ.5PjKEQUm', 'nxBjMX', '', '0', 'U03350090756'),
('9976776716', 'DEWI ATIKOH', 'P', 'TEGAL', '0000-00-00', '3328045605970002', 'Islam ', 'KARANGJAMBU RT 03 / RW 05 NO. 14 KEC. BALAPUL', '3', '5', '-', 'KARANGJAMBU', 'Kec. Balapulang', '52464', 'DN-03 DI 0365300    ', 'KHERON', 'JUMROH', 'LM 12 IA 4', '$2y$10$cstgM6uHpK4gbg0QX811d.fUKAbIR/lc6FuleCW1mI6vRwHYRlfqS', 'GbQCDF', '', '0', 'U03350091014'),
('9976776732', 'ALIYATUN MARZUKOH', 'P', 'TEGAL', '0000-00-00', '3328045908970002', 'Islam ', 'DESA KARANGJAMBU KEC. BALAPULANG KAB. TEGAL J', '1', '4', '-', 'Desa Karangjambu', 'Kec. Balapulang', '52464', 'DN-03DI 0279288     ', 'Murtado', 'Malkhatin', 'LM 12 IA 3', '$2y$10$BoeyJAKh/aRsEKrltXAEqe0S4DAbpwOO7.GIQBvtpIx.6xfhKqyLW', 'CUGkWQ', '', '0', 'U03350090685'),
('9976776977', 'FARAH ADIBA', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'DANAWARIH RT. 04/01', '4', '1', 'DK.KASERAN', 'DANAWARIH', 'Kec. Balapulang', '52464', 'DN-03 DI 0994889    ', 'Moh. Mufti Mudzakir', 'ROSIDAH', 'LM 12 IA 5', '$2y$10$HPZjaDDUOVlwbli0jaHo1eP9HzW4bYAurxUHyLAMFntWKc/ckyjl.', 'K5l45O', '', '0', 'U03350091387'),
('9976791165', 'YUDHA WIRA PAMUNGKAS ', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.WIJAYA KUSUMA NO.24/3 BTN PEPABRI', '6', '5', 'Kudaile', 'Kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 0997372    ', 'Sugiarto', 'Tin Karyani', 'LM 12 IS 3', '$2y$10$5yDarKIuR3OJKtJSqMaRJOvAsSmG/5S.Mq85eZKvyOoQnWSeyvThK', 'LiCNzn', '', '0', 'U03350092552'),
('9976791170', 'ANGGUN RISANTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Jl Proh Moh Yamin, RT. 04 RW. 02', '4', '2', '-', 'Pakembaran', 'Kec. Slawi', '52415', 'DN-03 DI 0989372    ', 'Harnari', 'Harti', 'LM 12 IA 1', '$2y$10$Tro6OKtHXAZRihIHGYodAuCy.wgQX37RfqXOj9o52fGTqVZmeEMTi', 'xTl2Uz', '', '0', 'U03350090036'),
('9976791303', 'RADITYA BACHTIAR SAPUTRA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. RAMBUTAN GG.2 RT. 03 RW 01', '3', '0', '-procot', '-kelurahaan procot', 'Indonesia                     ', NULL, 'DN-03 DI 0989540    ', 'Riyanto', '-', 'LM 12 IS 3', '$2y$10$Dx.5skOA.dAiOFvKWcuqt.kYlz1axfPiklbXk/mNKkXCoxMsQ8iAm', 'B7iScJ', '', '0', 'U03350092454'),
('9976792943', 'BISMA ARYA LAKSANA', 'L', 'TEGAL', '0000-00-00', '3328060311970004', 'Islam ', 'JL. MAKMURI DS. TEGALANDONG KEC. LEBAKSIU', '1', '10', '-', 'TEGALLANDONG', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0997443    ', 'EDI IRIANTO, SE', 'NURHAYATI', 'LM 12 IS 4', '$2y$10$vwoTBry..gpxYhfPXyokcONKcM0nmUO1XQd4AgPjeS35JgK5g1OPC', 'ugVIEs', '', '0', 'U03350092649'),
('9976814061', 'VIVIN AVIANTI OKTAVIA', 'P', 'TEGAL', '0000-00-00', '3328126410970008', 'Islam ', 'jl.gede giri', '29', '7', '-', 'pegirikan', 'Kec. Talang', '52183', 'DN-03 DI 0989533    ', 'MAKMURI', 'fitriyah', 'LM 12 IA 2', '$2y$10$Of.ecetsGrwVUxQ3UDMoVe7ZUdYMLr4qkA12Ld71hY41Je.pl4V5S', 'xllpW3', '', '0', 'U03350090623'),
('9976818539', 'MUHAMAD NUR SHIDIQ', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. PROTOKOL DS. PEKIRINGAN RT. 10 RW. 03', '10', '3', '-', 'Pekiringan', 'Kec. Talang', '52193', 'DN-03 DI 0989435    ', 'Ariyanto', 'Kristiyanti', 'LM 12 IS 3', '$2y$10$nrSh5Xy13ABWIba3LwOHSOhGalIuNx156JCWYB6kk4ZqjN93GRnvO', 'cmucsy', '', '0', 'U03350092409'),
('9976894264', 'IKA RIZA YUNIAR', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'KAJEN RT O3/02', '3', '2', '-', 'Desa Kajen-Lebaksiu', 'Kec. Lebaksiu', NULL, 'DN-03 DI 0994819    ', 'SUGIMAN', 'SRI NARSIH', 'LM 12 IS 4', '$2y$10$EAkiGHbdBBiTZsPOqF/8fOEl9TgNYI0eH1G9vljRHgxoRf.V7fwhu', '7hCzz8', '', '0', 'U03350092738'),
('9976895461', 'RIZKA AZKIYA', 'P', 'TEGAL', '0000-00-00', '332806700597006 ', 'Islam ', 'JL. KAUMAN II RT. 01/02 NO.9 DS. LEBAKSIU LOR', '1', '2', 'lebaksiu lor', 'lebaksiu lor', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0269161    ', 'Fadoli', 'Anisa', 'LM 12 IS 2', '$2y$10$KH.5uuYBpvBrnePkXKjD2uGxdU3392PvCmqkMbFpfENrMO3uqgGhu', '0IN2M8', '', '0', 'U03350092196'),
('9976895937', 'EVI IDA AMALIA', 'P', 'TEGAL', '0000-00-00', '33280667970001  ', 'Islam ', 'LEBAKSIU KIDUL RT 02/01', '2', '1', 'Lebaksiu kidul', 'Lebaksiu kidul', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994722    ', 'Jalal', 'PRISTIWA NINGSIH', 'LM 12 IA 2', '$2y$10$Y1BnX0oYWW2mIiqI4iyRzOKFHVo2qQNSZAflYD2a9cJDNY.hsdRXC', 'aYi0oY', '', '0', 'U03350090392'),
('9976896620', 'MAULIDINA SYANIA', 'P', 'MADIUN', '0000-00-00', '3328066307980001', 'Islam ', 'PALM ASRI II RT.4/RW.6 PEDAGANGAN', '4', '6', '-', 'Pedagangan', 'Kec. Slawi', '52451', 'DN-03 DI 0997304    ', 'MUHAMAD AMIRUDIN', 'IKE MULATDRIYANINGSIH', 'LM 12 IS 4', '$2y$10$ccQiKJ6UHU.bg39aRZo9kuvrt.XPqFjJ0ctE0xDLerHzBBeNGW4Ru', 'F8nad5', '', '0', 'U03350092792'),
('9976898313', 'RIESKIE ARI ROFIQOH', 'P', 'TEGAL', '0000-00-00', '3328062400111001', 'Islam ', 'YAMANSARI', '4', '1', '-', 'yamansari', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994871    ', 'Wahyono', 'Ratna Wati', 'LM 12 IS 3', '$2y$10$IdDowZEiLfPGPoNl2szt6uZHvuIWEK/XePvB1gHyRLFARakKclprK', 'lOORzG', '', '0', 'U03350092498'),
('9977159011', 'EFAL RESTU ARDIANSYAH', 'L', 'BANYUMAS', '0000-00-00', '3328100712970003', 'Islam ', 'JL. YOS SUDARSO KEL. PAKEMBARAN RT. 01/RW. 08', '1', '8', '-', 'PAKEMBARAN', 'Kec. Slawi', NULL, 'DN-03 DI 0993158    ', 'LATIF', 'SUSY LIDYAWATI', 'LM 12 IA 1', '$2y$10$68v2p6azmAJrSr3iGBPmy.aj8VQqZ7Loi03VvhAnYmnvNNGiOfvF2', 'yHfcaE', '', '0', 'U03350090098'),
('9977217958', 'INDRA PRAKASA ADITIA ZAIN', 'L', 'TEGAL', '0000-00-00', '3328061204090663', 'Islam ', 'JL. SANTAKARYA', '5', '3', '-', 'DUKUHDAMU', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0997336    ', 'JAENUDIN', 'KURUTUL AENI', 'LM 12 IS 4', '$2y$10$.VNta51I1sDOCjtm6ippCeSu0JrRydFiOntEuToYvt5rQ/uqGQvVq', 'f5F26O', '', '0', 'U03350092756'),
('9977230579', 'TOFANI HEDIANTO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. LEBAKWANGI 03/01 KEC. JATINEGARA KAB. TEG', '3', '1', '-', 'Lebakwangi', 'Kec. Jatinegara', NULL, 'DN-03 DI 0993518    ', 'Suherman', '-', 'LM 12 IS 2', '$2y$10$SflobgBHU3TLRn8f7S6gR.symLi2uCSf90tHvdyUixMhY/h2mD8TC', 'jJALbP', '', '0', 'U03350092223'),
('9977382451', 'ALVIYAN NULVIKI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BUMIJAWA', '3', '5', '-', '-', 'Kec. Bumijawa', NULL, 'DN-03 DI 0281103    ', 'FATONI', 'RUKANAH', 'LM 12 IS 4', '$2y$10$O/1tDrlYwwN08OHofLIv..RXj7XK5XR4yi2.K/8ETf98vrhAgcS2S', '3kuUqS', '', '0', 'U03350092569'),
('9977450432', 'AULIA FAZA', 'P', 'TEGAL', '0000-00-00', '3328092302080916', 'Islam ', 'DS. KENDALSERUT RT. 03 RW. 02', '3', '2', '-', 'Kendalserut', 'Kec. Pangkah', '52471', 'DN-03 DI 0279687    ', 'Akhmad Nasukhi', 'Anis Widiarti', 'LM 12 IA 1', '$2y$10$tZ6hmMsn8ci5GAc2FygOTuxh5gIa8ry.dhS9pQedmcTqctXINK7yS', 'lmWjST', '', '0', 'U03350090054'),
('9977479006', 'PUTRI DIANA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'GROBOG KULON RT 03/03', '3', '3', '-', 'GROBOG KULON', 'Kec. Pangkah', '52471', 'DN-03 DI 0990710    ', 'SUMARDI', 'ALMH SAMINAH', 'XII SOS 2', '$2y$10$ik1CBVeJx1B9C6cSkDim8.kW26./.HFIaETDh/y09LlwY97fukjN2', 'fo19Xv', '', '0', 'U03350092143'),
('9977479266', 'SUCI ENDAH LESTARI', 'P', 'TEGAL', '0000-00-00', '3328092012003409', 'Islam ', 'Jln.Salak Utara', '3', '4', '-', 'GROBOG KULON', 'Kec. Pangkah', '52471', 'DN-03 DI 0997171    ', 'ARJA', 'PATIKHA', 'LM 12 IS 1', '$2y$10$di7BySdJYUTbD8FoH.fF..s4QMDIsoPkKO8YEE5W7k71WD1Q4JFuO', 'CThGHn', '', '0', 'U03350091858'),
('9977593384', 'ULFATUN KHASANAH', 'P', 'TEGAL', '0000-00-00', '3328055110970003', 'Islam ', 'JL. RANDUSARI', '8', '2', '-', 'RANDUSARI', 'Kec. Pagerbarang', '52462', 'DN-03 DI 0995859    ', 'MUCHIDIN', 'KHALIMAH', 'LM 12 IA 1', '$2y$10$knDbeLHeFmjn4b.TKw11de3N2Psks/ERC.e/Ry6/DT9lsoQj7ijAK', 'Ni2QmV', '', '0', 'U03350090294'),
('9977653969', 'NURUL NOVANIA NABILAH', 'P', 'TEGAL', '0000-00-00', '3328015911970002', 'Islam ', 'JL.RAYA PRUPUK UTARA RT.01/04 MARGASARI TEGAL', '1', '4', '-', 'Prupuk Utara', 'Kec. Margasari', '52461', 'DN-03 DI 0997381    ', 'Sudiarto', 'Nok Sri Riyatin', 'LM 12 IA 2', '$2y$10$kqTNHg2Eyg0fDEdy7RuKAubqZEYq/LanGcIvfgJCvFzFpi2HnRifC', 'nuo6CZ', '', '0', 'U03350090543'),
('9977835469', 'NOVI LAELI HIDAYAH', 'P', 'TEGAL', '0000-00-00', '3328095610970004', 'Islam ', 'DS. PURBAYASA PANGKAH RT.08 RW.02', '8', '2', 'Desa purbayasa', '-', 'Kec. Pangkah', '52471', 'DN-03 DI 0989425    ', 'Sujai', 'khosilah', 'LM 12 IA 2', '$2y$10$6jW7iSU502MhYJDj4XWZPOF1gPwNMmGIFZ6VySqxLUO5c2bxxQY6e', 'AztSZT', '', '0', 'U03350090507'),
('9977836333', 'MOH.AYIP PRASETIYO', 'L', 'TEGAL', '0000-00-00', '3328090802970003', 'Islam ', 'DUKUH, DS. PENUSUPAN RT.01/04', '1', '4', 'Dukuh', 'Penusupan', 'Kec. Pangkah', '52471', 'DN-03 DI 0285190    ', 'Supardi', 'Dayunah', 'LM 12 IS 3', '$2y$10$wo6T/gOZcNuLCFree3c.SensDi3lHeUCyZc3u.gEPzK4gpPYJEDmq', 'TeBx0a', '', '0', 'U03350092392'),
('9978039434', 'REYNALDY FADILLA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. Merpati', '2', '7', '-', 'Kabunan', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0992093    ', 'Supriyono', '-RFS. Kustakarini', 'LM 12 IS 2', '$2y$10$JbG5QowR3.75QM9LHa3M2OxVJHRkR8D.cbN7fvkPNbOpJgptWpQ/S', 'bZDHXh', '', '0', 'U03350092169'),
('9978039874', 'RISKI MAULANA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA BOGARES KIDUL RT 26/4 PANGKAH', '0', '0', '-', '-', 'Kec. Pangkah', NULL, 'DN-03 DI 0996751    ', 'SUDARNO', 'SUMIYAH', 'LM 12 IS 4', '$2y$10$1zfYxCuT/gsV5dBlGSAs5uLEqhl6wChf2F5SJBXK3A5X6lwEbmakG', 'FpQMwO', '', '0', 'U03350092836'),
('9978039987', 'MUKHAMAD  MUCHNI LAVIF', 'L', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'DS. KEDUNG SUKUN RT. 08/02 ADIWERNA', '8', '2', 'kedung sukun', 'kedung sukun', 'Kec. Adiwerna', '52195', 'DN-03 DI 0990465    ', 'ABDUL AZIZ', 'SITI ROKHANI', 'XII SOS 4', '$2y$10$3rU1okB5MmiKeYoVAj9FoefXdPQUTkFCdkmj.muhKO18353BN16DS', 'jXAxVP', '', '0', 'U03350092818'),
('9978264989', 'PUTRI RIZKY NUR AULIA ZAMAN', 'P', 'TEGAL', '0000-00-00', '3328065311970005', 'Islam ', 'Jl.Mbah daryuni', '4', '7', '-', 'Timbangreja', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994808    ', 'Zamani', 'Tuti Awaliyah', 'LM 12 IS 3', '$2y$10$jjSsJPYhMbbq5KSEjI2due13GR7Y721qys4RHw1NT7eKH5HqjTvCW', 'vjGB7d', '', '0', 'U03350092445'),
('9978877920', 'DEWI YULIANA', 'P', 'TEGAL', '0000-00-00', '3328095807970005', 'Islam ', 'JL.BANJARAN-BALAMOA', '2', '1', '-', 'PECABEAN', 'Kec. Pangkah', '52471', 'DN-03 DI 0989406    ', 'M. SOPAN', 'MUKHLISOH', 'LM 12 IS 1', '$2y$10$jn8BzVVDeXaToCspedWEOemsGSf2ioH6d6iGLAarsuhA7GH9Mi9l2', 'UQ6Rzj', '', '0', 'U03350091636'),
('9980014494', 'ANGGRINA NUR WULAN NINGSIH', 'P', 'BANDUNG', '0000-00-00', '3328016006980003', 'Islam ', 'jalan raya MARGASARI ', '5', '1', '-', 'karang jati', 'Kec. Margasari', '52465', 'DN-03 DI 0995223    ', 'AGUNG WAHYU UTOMO', 'RINA HERLIYANA', 'LM 12 IA 2', '$2y$10$0pMxAUOabJt1mHCEejbt/uenZMOiBoU7euLNLBACVLmvkN4Bx/8Fa', 'prn56e', '', '0', 'U03350090347'),
('9980028666', 'ISNATUL BAETI FARODISA', 'P', 'TEGAL', '0000-00-00', '3328140803081365', 'Islam ', 'jl. wanabhakti', '13', '2', NULL, 'margapadang timur', 'Kec. Tarub', '52184', 'DN-03 DI 0282896    ', 'M. Tholibin', 'Jumaroh', 'LM 12 IA 4', '$2y$10$zuHzNz9CNsUSDSBqn184a.YXDCJfsyPAURAFFsHcY17.c3zX3tAKm', 'rUWinH', '', '0', 'U03350091085'),
('9980042084', 'SIFA FAUZIAH', 'P', 'TEGAL', '0000-00-00', '3328114107090007', 'Islam ', 'JLN. KEDUNG SILAMI', '21', '6', NULL, 'DS. PAGIYANTEN ', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989832    ', 'MUHAEMIN', 'USWATUN KHASANAH', 'LM 12 IA 2', '$2y$10$QWsuUzy.ap4e7deu8QH6je03619o9mzjYEse9K/PHevF92o1.J9si', 'qmwbA2', '', '0', 'U03350090596'),
('9980228724', 'RAGA KESUMA ILLAHI', 'L', 'TEGAL', '0000-00-00', '0954031905988641', 'Islam ', 'DS. UJUNGRUSI, JL. TERATAI RT.13 RW.3', '11', '2', '-', 'ujungrusi', 'Kec. Slawi', '52194', 'DN-03 DI 0989616    ', 'muhamad taofik', 'istiqomah', 'LM 12 IA 3', '$2y$10$WeS2OV96LwXdnXC7/NV3T.6DKZhtp8GvLvaThw5YL63/2JyyeQeuC', 'XBcqcf', '', '0', 'U03350090889'),
('9980777535', 'IKA MEI LINDAWATI', 'P', 'TEGAL', '0000-00-00', '3328044505980004', 'Islam ', 'JL.BANJARANYAR RT 04/03', '4', '3', '-', 'BANJARANYAR', 'Kec. Balapulang', '52464', 'DN-03 DI 0991262    ', 'TACHRONI', 'SOLIKHA', 'LM 12 IA 1', '$2y$10$jCrvtxlbUBWhUUykCXFMxOnWNkhbAP17.DU7jn/XiWg4ppJRHrIS6', '9SSd4q', '', '0', 'U03350090134'),
('9981314104', 'SELA RIFDA AILATI', 'P', 'TEGAL', '0000-00-00', '3328116604970004', 'Islam ', 'TEMBOK LOR', '7', '2', NULL, 'Tembok Lor', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990239    ', 'Sahali', 'Jamilah', 'LM 12 IS 4', '$2y$10$ymDZn2nNvNHKns1.pwtkg.4qqjzzanIXBkNe.MWgbhslnNMbvXtO6', 'b7g2uR', '', '0', 'U03350092854'),
('9981376485', 'YUSRIL ANUGRAH MAULANA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. FLORES BARU NO.31 SLAWI', '0', '0', '-', 'langon', 'Kec. Slawi', '52413', 'DN-03 DI 0659003    ', 'Priyo Sarwono', 'asriati', 'LM 12 IS 1', '$2y$10$kpieXuFqgmLiix2TkKQ.d.yCB6hOpVUa4nNFjxQO.DtTFM/LRgLTi', 'vUycWb', '', '0', 'U03350091912'),
('9982363502', 'MEGA AGHNES RIZKYA', 'P', 'TEGAL', '0000-00-00', '3328094309980002', 'Islam ', 'DS. PECABEAN KEC. PANGKAH KAB. TEGAL', '13', '4', '-', 'Pecabean', 'Kec. Pangkah', '52471', 'DN-03 DI 0989549    ', 'M.Arif Abror', 'Khalisah', 'LM 12 IA 2', '$2y$10$5ZREKI8x9lP1DmS2xvpkvO4WNxIsunm6qKh6zSgplLLzWUsIkIexC', 'z5gk3A', '', '0', 'U03350090454'),
('9982488275', 'FISKA MUTIARA HANI', 'P', 'TEGAL', '0000-00-00', '3328054412980003', 'Islam ', 'JL.JALAK GANG KAKAKTUA NO.45 RT.04/03 PESAREA', '4', '3', NULL, 'pesarean', 'Kec. Pagerbarang', '52194', 'DN-03 DI 0952551    ', 'Agus Mustofahani', 'Ipah Khodijah Assegaf', 'LM 12 IA 4', '$2y$10$Z4j2QLJG94e812dCnCPjwOoqibcyvAAC4h0COeTUFGyoPw3hKIrJG', 'uxH6Qj', '', '0', 'U03350091058'),
('9982489321', 'DENI PRATAMA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'KEBANDINGAN RT. 15 RW. 4 KEDUNGBANTENG', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0993910    ', 'KATAMA', '-', 'LM 12 IA 3', '$2y$10$oq6l9c7OgdGMCdd3F5Qib.fkcuUa1CHJMVchjIx0QMenZHymEUuOW', '2vdcMY', '', '0', 'U03350090738'),
('9982502392', 'REZA ADITYA MAULANA', 'L', 'TEGAL', '0000-00-00', '332812150798005 ', 'Islam ', 'DESA TALANG GG MONAS RT. 11 RW. 02 NO. 421', '11', '2', '-', 'TALANG', 'Kec. Talang', '52193', 'DN-03 DI 0989465    ', 'KHATORI', 'SUSANTI AMALIA', 'LM 12 IA 4', '$2y$10$pshIhetZwX54f5MOT1jvsejnKbScEoBfxxXvdNneqFYloD0xavQ9O', '7m6fur', '', '0', 'U03350091174'),
('9982542093', 'IMAM BAGUS MULYANTO', 'L', 'TEGAL', '0000-00-00', '3328100803980004', 'Islam ', 'JL. GAJAH MADA RT. 05 RW.07 KALISAPU', '5', '7', '-', 'Kalisapu', 'Kec. Slawi', '52416', 'DN-03 DI 1003114    ', 'HARYANTO', 'SRI MULYANI', 'LM 12 IA 5', '$2y$10$g0Ajz/Vexcv2avW3GhdBPeJPqAZIuk51tT0pgL89/p4NYMLybDUYG', 'RmTeqX', '', '0', 'U03350091414'),
('9982542103', 'INTAN FITRAH ATI', 'P', 'BANDA NAIRA', '0000-00-00', NULL, 'Islam ', 'DS. PENER RT. 25 RW.05 PANGKAH', '25', '5', NULL, 'Pener', 'Kec. Pangkah', '52471', 'DN-03 DI 1003081    ', 'SUTANTO', 'Hj. HINDUN INDRAYANTI', 'LM 12 IS 4', '$2y$10$UESadlWpaAlQGlcnlsw4B.Z5MdOhlmptYxZ7nxvBYEQivguJ3SyIW', 'XqrlaN', '', '0', 'U03350092765'),
('9982542107', 'MOH ICHAM CHOMARULLOH', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. MENJANGAN', '3', '4', '-', 'Trayeman', 'Kec. Slawi', '52417', 'DN-03 DI 1003111    ', 'DUKRI IPANDI', 'SUGIARTI', 'LM 12 IA 5', '$2y$10$fK4rIbaonjqUOWr.w3FHUuXS8Hh3uEGN0Mxpm87xa/9glq8IW7mwG', 'rtjf5F', '', '0', 'U03350091458'),
('9982542113', 'GARNES MONA YULIETA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. KS TUBUN NO. 46 PAKEMBARAN SLAWI', '1', '4', '-', 'pakembaran', 'Kec. Slawi', '52416', 'DN-03 DI 0997363    ', 'Taton Sugihartono', 'Uti Andarsih', 'XII MS 4', '$2y$10$uoBOmlGvteCHrxUxmuSPSO5tcBiF1WqPCwBmSixkr/JgEqV.MpgPa', 'SMju2e', '', '0', 'U03350091076'),
('9982630112', 'SEPNI TRIAYU PRAKANTI', 'P', 'JAKARTA', '0000-00-00', '3328181607100115', 'Islam ', 'GRIYA MAWAR PUTIH ASRI BLOK A.7 NO.7 RT 03/06', '3', '6', '-', 'Ds Pedagangan', 'Kec. Slawi', '52412', 'DN-03 DI 0281707    ', 'NUR ZAINURI', 'KOMIAH', 'LM 12 IS 1', '$2y$10$1TbnhVudOuwVsuXELC6MOufYqWl90lbsXHWMC8o0o7YqurtthwOrC', 'DF8F6u', '', '0', 'U03350091832'),
('9982772361', 'YUSSI MELINAWATI', 'P', 'SURAKARTA', '0000-00-00', '3328016005980004', 'Islam ', 'MARGASARI', '5', '1', 'Karang Jati', 'Margasari', 'Kec. Margasari', '52463', 'DN-03 DI 0995108    ', 'YUS ARDI APRIYANTO', 'RINA MULATI', 'LM 12 IA 1', '$2y$10$xp3yFOryEOa8Ts6o8VufhundPVhTUghmqyZc7CWeXYoHI.b1Gxr.m', 'I1Skwa', '', '0', 'U03350090329'),
('9982772374', 'DIAN RIZQIYANTI', 'P', 'TEGAL', '0000-00-00', '3328014305980003', 'Islam ', 'MARGASARI RT 01/08', '1', '8', 'karang benda', 'margasari ', 'Kec. Margasari', '52463', 'DN-03 DI 0995337    ', 'ANDI FARKHADI', 'SRI RAHAYU', 'LM 12 IA 2', '$2y$10$5XcJRimGWGwhXwtHFIBoK.z59OD3fZBKX6uS8UTcTqr/SshxvgUzy', '1PgxMh', '', '0', 'U03350090365'),
('9982772396', 'REGITA INDRIA BUDIARTI', 'P', 'TEGAL', '0000-00-00', '3328014304980005', 'Islam ', 'JL.K.H ABDUL ROSUL', '3', '6', 'KARANG BENDA', 'MARGASARI', 'Kec. Margasari', '52463', 'DN 03 DI 0995201    ', 'SUDIARTO', 'SITI ULWIYAH', 'LM 12 IA 1', '$2y$10$cDs2HpxDo.MW2eluWZR7zeqtJqiZQcKcF/0USpDC4jwYl3EDbM9bm', 'spYrsU', '', '0', 'U03350090249'),
('9982773322', 'AULIA NURUL AZIZAH', 'P', 'TEGAL', '0000-00-00', '3328014111980003', 'Islam ', 'JL. GOTONG ROYONG RT 01/ RW 03 DESA DUKUH TEN', '1', '3', '-', 'DUKUH TENGAH', 'Kec. Margasari', '52463', 'DN-03 DI 0995144    ', 'TARYONO', 'SITI SOPIYAH', 'LM 12 IA 3', '$2y$10$K1ARhXP/e48oxjkYbCSyqukzo00HA5LzlitGFIZlsNNP8HHIXMrTO', '1v93Co', '', '0', 'U03350090703'),
('9982780177', 'TRI YULI FATMAWATI', 'P', 'TEGAL', '0000-00-00', '3328034907980002', 'Islam ', 'MASJID ANNUR', '2', '1', 'BOJONG', 'BOJONG', 'Kec. Bojong', '52465', 'DN-03 DI 0991609    ', 'SUDARTO', 'SAMSIYATI', 'LM 12 IA 5', '$2y$10$ifjA766JZ7MgzNNCsSJf/.qY2Du47V26v.TKSF48.RSnS0TudrIQ6', 'Rvnhjw', '', '0', 'U03350091574'),
('9982783965', 'AHMAD ROISUL AMIN', 'L', 'TEGAL', '0000-00-00', '3328030911980007', 'Islam ', 'LENGKONG RT. 02 RW. 03 KEC. BOJONG KAB. TEGAL', '2', '3', 'LENGKONG LELES', 'LENGKONG', 'Kec. Bojong', '52465', 'DN-03 DI 0991910    ', 'MULYONO, S.Ag', 'ISRO DIM YAO', 'LM 12 IA 3', '$2y$10$HkzN.nWQhmfWhdR56RVS9OvMMHMYopZ4iMsbvjoQhYa0/BQ5/pXhK', 'dqltSA', '', '0', 'U03350090667'),
('9982887322', 'FATIHMATUN ZAHRO', 'P', 'TEGAL', '0000-00-00', '           -    ', 'Islam ', 'PENUSUPAN,KEC.PANGKAH', '1', '8', NULL, 'PENUSUPAN', 'Kec. Pangkah', NULL, 'DN-03 DI 0996899    ', 'Saheri', 'Sri Pangarsih', 'LM 12 IS 1', '$2y$10$EjsdnFwZ.M/jMskwVlf2fejIS3kdbBL3EjKPYSsFoKerTjZWI4Nae', 'UeM7kc', '', '0', 'U03350091663'),
('9982887323', 'JUNA RIYANTO', 'L', 'TEGAL', '0000-00-00', '3328082006980001', 'Islam ', 'DESA PENUSUPAN RT 03/08', '3', '8', NULL, 'PANGKALAN', 'Kec. Pangkah', '52471', 'DN-03 DI 0996920    ', 'SASTRO MIHARJO', 'ERLIN SUSIANTI', 'LM 12 IS 2', '$2y$10$g9/T77fM8E.Yn8k0FT/jlOWFnv.zisvVYnmgttw.KryryugOsyGXK', 'JeTpbx', '', '0', 'U03350092063'),
('9982887332', 'INTAN PERMATA SARI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PENUSUPAN RT 01/05 PANGKAH', '1', '5', 'Dukuh', 'Penusupan', 'Kec. Pangkah', '52471', 'DN-03 DI 0996896    ', 'Wiryono', 'Endah nurdiani', 'LM 12 IS 2', '$2y$10$MWLCkyYa/RfplUWrioICD.40LnIl6XrgwCN/rm/rEPEaGN3EH7U1C', 'H3xy9G', '', '0', 'U03350092054'),
('9982887333', 'WINDIANA OKTIK', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', '-', '2', '5', NULL, 'penusupan', 'Kec. Pangkah', '52471', 'DN-03 DI 0996879    ', 'nasikhi', 'ety famungkasih', 'LM 12 IS 3', '$2y$10$CJ1egwcl27FIXUbwly1jI.zlzuuRjG2K0Uh/2XKmztJLVTM4NgdwS', 'VJde2S', '', '0', 'U03350092534'),
('9983099171', 'PRADITA INTAN RUTANTI', 'P', 'BREBES', '0000-00-00', '3329104507980008', 'Islam ', 'SONGGOM LOR', '5', '4', '-', 'SONGGOM LOR', 'Kec. Songgom', '52266', 'DN-03 DI 0952903    ', 'Sobirin', 'Uswatun Khasanah', 'LM 12 IA 4', '$2y$10$xBZHr7y/P7FyfHI.//cZnOT.WNemj5OwT1d0sBmNMFXdr6JHA/r0a', '2zg7BN', '', '0', 'U03350091156'),
('9983111955', 'VIRA AMELIA RIZKI', 'P', 'BREBES', '0000-00-00', '3329074909950003', 'Islam ', 'Jl. KH MUNADI', '1', '4', '-', 'JATIBARANG', 'Kec. Jatibarang', '52261', 'DN-03 DI 0952224    ', 'TEGUH ARYANTO', 'FITRIYAH', 'LM 12 IA 1', '$2y$10$FE.0EUMMlNMjolyznT3AeeiCwbbigzve4iDH0gpqc98KNV2wLvc9K', '4M5xUx', '', '0', 'U03350090303'),
('9983112004', 'FITRIATUS SAADIYAH', 'P', 'BREBES', '0000-00-00', '332907430298003 ', 'Islam ', 'KERTASINDUYASA NO.29', '1', '1', '-', 'KERTASINDUYASA', 'Kec. Jatibarang', '52261', 'DN-03 DI 0952315    ', 'WAKHID HASYIM', 'SUNAENI', 'LM 12 IS 4', '$2y$10$jsBRI5k88JpTnUz2MUl9BuoPQTdiKzPuhx8FyxPmnzNc5zbRniH0G', 'Nkqf5Z', '', '0', 'U03350092712'),
('9983112823', 'AMMAR MUHAMMAD', 'L', 'TEGAL', '0000-00-00', '3329072603980001', 'Islam ', 'JALAN RADEN PATAH', '3', '11', '-', 'JATIBARANG KIDUL', 'Kec. Jatibarang', '52221', 'DN-03 DI 0952400    ', 'JAMALUDIN', 'MULYANI', 'LM 12 IS 3', '$2y$10$Sh1br...1M.WkSqRR76UnuhesLH33NxDSqCxHznN2OTQh8bmdIhz6', 'Mz1N76', '', '0', 'U03350092267'),
('9983113829', 'CHRISTIN OCTAVIANI', 'P', 'BREBES', '0000-00-00', '3329076610980003', 'Kristen ', '-', '2', '1', '-', 'Karanglo', 'Kec. Jatibarang', '52261', 'DN-03 DI 0952674    ', 'Drajat', 'Retnowati', 'LM 12 IS 3', '$2y$10$0LncecX0YPV93Y39/7pcJOI9IGSCKQXzwBrR/C25offiIJ.C4Etz.', 'UhCO5N', '', '0', 'U03350092312'),
('9983113840', 'JOSHUA VINCENT OKTAVIADI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Kristen ', 'JL. KH ABDUL ROSUL NO. 56 JATIBARANG KIDUL', '4', '4', '-', 'Jatibarang Kidul', 'Kec. Jatibarang', '52261', 'DN-03 DI 0997362    ', 'Rudy Sutrisno', 'Hana Kuswanto', 'LM 12 IS 1', '$2y$10$xLmn6gzJ1UFIMQQQLA5azez676OgRbMj.KqtCAMTbajolgyLv.yMS', 'zOx5SK', '', '0', 'U03350091725'),
('9983113987', 'MUKHAMMAD MABRUR ALIFIAWAN', 'L', 'BREBES', '0000-00-00', '-               ', 'Islam ', 'Jl. Mujahidin JATIBARANG - BREBES', '1', '3', '-', 'JATIBARANG KIDUL', 'Kec. Jatibarang', '52261', 'DN-03 DI 0952306    ', 'WAWAN ERAWAN', 'MUALIFAH', 'LM 12 IS 1', '$2y$10$0Th9R6LNhgInAQ/veWm0u.Fa8nWPcI3hEItRcpIXCSNa7BDCZ1y5y', 'yS6ud0', '', '0', 'U03350091787'),
('9983114255', 'SAFINATUL LAELI', 'P', 'BREBES', '0000-00-00', '052002547070004 ', 'Islam ', 'JALAN RAYA TIMUR NO.56 ', '1', '7', '-', 'JATIBARANG', 'Kec. Jatibarang', '52261', 'DN-03 DI 0952778    ', 'ROSICHIN', 'SITI ALFIAH', 'LM 12 IA 3', '$2y$10$aHEwNHJVmHC8e/Igf92El.S.CDFvu9NcLcsSO1UKWEP2o196dFq.C', 'ew4Tl1', '', '0', 'U03350090916'),
('9983140099', 'RINI FAUZIAH NUR', 'P', 'JAKARTA', '0000-00-00', '-               ', 'Islam ', 'DS. LEBAKWANGI RT.02/RW.02 NO. 27 JATINEGARA', '2', '2', '-', 'Desa Lebakwangi', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993462    ', 'Masri Jaldi', 'Titi Winarni', 'LM 12 IS 2', '$2y$10$p6rqLhoZgkoL4OqutvX8P.MJxZnSaLai/83EPWVbbgyrMG9BA5ETa', 'fg7RP7', '', '0', 'U03350092178'),
('9983177264', 'IRENE NUR AMALLIYAH', 'P', 'JAKARTA', '0000-00-00', '3328092015001810', 'Islam ', 'GROBOG WETAN RT 03/05', '3', '5', 'kejaksan', 'grobog wetan', 'Kec. Pangkah', '52471', 'DN-03 DI 0996387    ', 'irpan', 'neni supartini', 'LM 12 IA 2', '$2y$10$gQLgqvleoqpxw2wLdzFXwumXCIXjznKtcus2O8sWqoOpPhgjRtqt6', 'PG45Cn', '', '0', 'U03350090445'),
('9983696560', 'RATNA NURMALITA', 'P', 'TEGAL', '0000-00-00', '3328066405980002', 'Islam ', 'DUKUHLO RT.05 RW.05 LEBAKSIU', '5', '5', 'DUKUHLO', 'DUKUHLO', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994807    ', 'ALIMI', 'NURYATI', 'LM 12 IA 4', '$2y$10$1qTTN6fKlOgjtP..HaEiRuRqf43H9IK45NMDR506YHzJGps8RCoT2', 'Vcua4A', '', '0', 'U03350091165'),
('9983721351', 'NUR HIKMAH', 'P', 'TEGAL', '0000-00-00', '3328114610980005', 'Islam ', 'DESA TEMBOK KIDUL', '10', '2', '-', 'tembok kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0283566    ', 'Sunaryo', 'HJ. latifah', 'LM 12 IA 2', '$2y$10$BHNe/mD0k9Fqsx1sbStjaOGh983XaM3Yb9VDt7Im9Y2mErL81N1kO', '0CGTuZ', '', '0', 'U03350090525'),
('9983868065', 'ADITYA EKO PRASETYO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BALAPULANG', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0991236    ', 'Mohamad Jaedi', '-', 'LM 12 IS 2', '$2y$10$q0V4nwi2eotCXdmRepoG4.1GtFAxLNawhVaXJzlxmIcW7CmhnJfDu', 'TiYkbR', '', '0', 'U03350091929'),
('9983929252', 'DIAS FENI MELIANA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. SERAYU DS. SELAPURA KEC. DKH WARU RT.04/0', '4', '6', '-', 'Ds.Selapura', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0992892    ', 'Dartopo', 'Ramlah', 'LM 12 IA 4', '$2y$10$qNKa1n7rIbLI6MHTo/N63.MSKCYRjTqSeWwGyzrpRv9f9BVo5Zp3G', 'Hs1T4r', '', '0', 'U03350091023'),
('9984197532', 'DHIKA ARFIANSYAH', 'L', 'Tegal', '0000-00-00', '137789          ', 'Islam ', 'Jl. Cemara Sewu', '7', '6', NULL, 'Tembok Luwung', 'Kec. Adiwerna', '52196', 'DN-03 DI 0364473    ', 'Aripin', 'SITI SOFIYANAH', 'LM 12 IS 4', '$2y$10$.3TKe9d9r8EKA3jcnASqjesYj0yV7pafqB8vrtZ3NZsc05Hz3Xe3a', 'hy46eb', '', '0', 'U03350092667'),
('9984237160', 'RISQI DWI SETIA NINGRUM', 'P', 'TEGAL', '0000-00-00', '3328182302081273', 'Islam ', 'JL. PRAMUKA  ', '1', '1', NULL, 'DUKUHWARU', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993064    ', 'ROSIKIN', 'SUMARNI', 'LM 12 IA 4', '$2y$10$PtCkoshVwMkrzaOD.e7MUuvwmXxDPHcuHzzOaNATB0q3tRwejd/CG', 'FlpLFq', '', '0', 'U03350091209'),
('9984369479', 'IZULIA', 'P', 'BREBES', '0000-00-00', '3329104707980001', 'Islam ', 'JALAN RAYA SONGGOM LOR', '1', '3', 'SINYURAN', 'SONGGOM LOR', 'Kec. Songgom', '52266', 'DN-03 DI 0952916    ', 'SUNEDI', 'MASRIPAH', 'LM 12 IA 4', '$2y$10$n1d.Fl4DlZFuCAgQZjSub.QoynNb5vgMLGNAxEQm6.IMwxn6fti4S', 'FkUEwT', '', '0', 'U03350091094'),
('9984371190', 'RESTI YULIANI WIJAYARTI', 'P', 'SRAGEN', '0000-00-00', '3328094807980003', 'Islam ', 'DS. KENDAL SERUT RT. 05 RW. 01 KEC. PANGKAH K', '5', '1', 'Kendal Serut', 'Kendal Serut', 'Kec. Pangkah', '52471', 'DN-03 DI 0989382    ', 'WACHIDUN', 'SUGIARTI', 'LM 12 IA 2', '$2y$10$lpJmt6GNGKGCinDyoAv3puzknI.kvkrA1F7uRhDouPG8hRgwQMkD6', 'V7OgWa', '', '0', 'U03350090552'),
('9984448530', 'TYAS AYU WIDYASTUTI', 'P', 'BLITAR', '0000-00-00', '3572016009980001', 'Islam ', 'JL.ANOA RT 01/04 TRAYEMAN SLAWI', '1', '4', '-', 'DESA TRAYEMAN', 'Kec. Slawi', '52414', 'DN-05 DI 1104947    ', 'RUDIN', 'SRI LESTARI', 'LM 12 IA 3', '$2y$10$ky0YNKuMWPsj.qwYcN.57uOV.hbw8.a69Y7CJP7AmJhZivnObPuUW', 'OACSwE', '', '0', 'U03350090943'),
('9984468732', 'UMI HANIFAH', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. LEBAKWANGI KARET-JATINEGARA', '4', '3', NULL, 'LEBAKWANGI', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993487    ', 'HARTOYO', 'TARIPAH', 'XII SOS 1', '$2y$10$Ugr6UwtK9xeS32JtGpDNReCGGydLXzMomrUvPjvfuD811u2jHwX1m', 'Wgf4kZ', '', '0', 'U03350091876'),
('9984604817', 'MOH. RUDI GUNAWAN', 'L', 'TEGAL', '0000-00-00', '3328181210960002', 'Islam ', 'KABUNAN RT 01/05 DUKUHWARU', '1', '5', '-', 'KABUNAN', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0279672    ', 'SAMADI', 'SURATNI', 'LM 12 IA 2', '$2y$10$V1Y9mgKGJkhgtzQULcBQeuljEzS0AtSkCAM9z0dIFbxv7dKhXsfkK', 'VgXmTr', '', '0', 'U03350090472'),
('9985107150', 'HAMIDAH ASRI AJI PANGESTU ', 'P', 'TEGAL', '0000-00-00', '332806140498000 ', 'Islam ', 'JL. KARANGANYAR RT. 05 RW. 03 BALAPULANG', '5', '3', 'Balapulang Kulon', 'Balapulang', 'Kec. Balapulang', '52464', 'DN-03 DI 0994851    ', 'Musiono Basuki', 'Titin Sumarni', 'LM 12 IS 2', '$2y$10$xOCk6jsFIzmVq2L66UEcNONBmaLJn3rtQIg3DLOELao8SsImei8n6', '8FYxCs', '', '0', 'U03350092027'),
('9985226109', 'WYNNA KHALIDA SEKARSARI', 'P', 'TEGAL', '0000-00-00', '3328184905980004', 'Islam ', 'JL. GUNUNG SLAMET NO. 15', '7', '1', '-', 'Blubuk', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997373    ', 'Drs. Akh. Khalimi', 'Ida Rosidah', 'LM 12 IS 1', '$2y$10$3l4pAwR0VQAgfUoycFPPnes77fBod.GXGwDstCyxFaa8GHuvxefGC', 'RX4g8g', '', '0', 'U03350091885'),
('9985591665', 'ANISA CAHYANINDAR', 'P', 'TEGAL', '0000-00-00', '3175094308980004', 'Islam ', 'DS. PAKETIBAN RT. 07/02 KEC. PANGKAH KAB. TEG', '7', '2', '-', 'Paketiban', 'Kec. Pangkah', '52471', 'DN-03 DI 0996434    ', 'Sunandar', 'Toipah', 'LM 12 IA 5', '$2y$10$6GvLxSESuDUhQ89Tl4oRwOo7aUYKXmhpHeH4DLUTtNIHosSZ9IKIu', '7J868n', '', '0', 'U03350091316'),
('9985820695', 'NOVIA APRILIANI', 'P', 'BANYUMAS', '0000-00-00', '-               ', 'Islam ', 'BOGARES LOR RT 04/01', '4', '1', 'bogares lor', 'bogares lor', 'Kec. Pangkah', '52471', 'DN-03 DI 0997260    ', 'Afip udin', 'wati ningsih', 'LM 12 IS 2', '$2y$10$IxS2DOzrHw0kNNIk0WBDmeGMvaCFwz2Zu28TE8JxpBvjzNaE3EhiW', '6joU6h', '', '0', 'U03350092125'),
('9986004987', 'FIRDA ROMORA ULINA M', 'P', 'TEGAL', '0000-00-00', '-               ', 'Kristen ', 'JL. WARINGIN 9 NO.178', '6', '7', '-', 'Pangkah', 'Kec. Pangkah', '52471', 'DN-03 DI 0996577    ', 'Burman Gabe Manalu', 'Erita Malau', 'LM 12 IS 4', '$2y$10$RtmUIX98BAMcce2.1Jb0FeDJaC4PY.Ec5HGRogGxalhGQy2kmov1m', 'Yc7eXu', '', '0', 'U03350092703'),
('9986012868', 'ERWIN SETIANTO', 'L', 'SERANG', '0000-00-00', '-               ', 'Islam ', 'PERUM PEBABRI, JL. WIJAYAKUSUMA 8 NO. 16', '8', '5', '-', 'kudaile', 'Kec. Slawi', '52412', 'DN-03 DI 1003064    ', 'Nuh Heri Susetyo', 'Sri Rejeki Rahayuningsih', 'LM 12 IS 4', '$2y$10$uzxZG9TYWtpz02g3e8U2AeNfpYZSKRYfItbE4G7jjsGPy8wpHQCMG', 'dfYtch', '', '0', 'U03350092685'),
('9986362524', 'SYELLA MONTI APRILIANA', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'JL. Supriyadi', '1', '3', 'Trayeman', 'Trayeman', 'Kec. Slawi', '52414', 'DN-03 DI 0998006    ', 'Ratmono', 'Kristiana', 'LM 12 IS 2', '$2y$10$TFX6U74badTRX9mfjW1huuqXVIN8XuEP6tqw9DKHXTp0cEQvc/O2i', 'Etcni2', '', '0', 'U03350092205'),
('9986616906', 'YULIA RIZKI MAULIDA', 'P', 'TEGAL', '0000-00-00', '3328114207980004', 'Islam ', 'JL. ANGGREK II NO. 16', '30', '3', '-', 'ujungrusi', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989532    ', 'MUDJIJONO', 'CHOZINAH DWI PURWANTY', 'LM 12 IA 5', '$2y$10$JWPqH..q.lbNF0B95VltFedBN8Lq/pIw102pdEqYyW.cZobf0LWri', 'uSNsYW', '', '0', 'U03350091592'),
('9986616907', 'ARIF SETYANTO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'jalan Rantensari Ds. Pagedangan Rt 09/01', '9', '1', '-', 'Pagedangan', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989606    ', 'Sulistiyanto', 'Arum Setiowati', 'LM 12 IA 1', '$2y$10$zyuYdxC.FOGPf1TM/xvcmO2aUgmV0jl81KkGfnl3.37T0J6PRvw86', 'yzxIP4', '', '0', 'U03350090045'),
('9986617184', 'PUPUNG CAHYA WULANDARI', 'P', 'TEGAL', '0000-00-00', '3328115306980004', 'Islam ', 'ADIWERNA JALAN SALAK NO.60 RT 18/06 KEC.ADIWE', '18', '6', '-', 'ADIWERNA', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989467    ', 'SUNARTO', 'MUSLIMAH', 'LM 12 IA 3', '$2y$10$vdn.0qttyniQoqdjX485TuBH0lx6XevEoJ8RbuNXGw9QGdFaXRHPi', 'DR5kQH', '', '0', 'U03350090863'),
('9986617191', 'NAELUL KHUSNA', 'P', 'TEGAL', '0000-00-00', '3328110810105859', 'Islam ', 'JL. SALAK', '36', '3', '-', 'ADIWERNA', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989431    ', 'SAMIUN', 'TASLICHA', 'LM 12 IA 5', '$2y$10$vRQSEJ.nU/Nts5le4SMCMeaTNB3w5MIYU9y3r7BsK9C4tpSnrVl02', 'IM5rhD', '', '0', 'U03350091467'),
('9986617721', 'KIKY AULIA RAKHMAWATI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA BERSOLE RT. 15 RW. 03 KEC. ADIWERNA KAB.', '15', '3', 'Bersole', 'Bersole', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989916    ', 'Rachmat', 'Suharti', 'LM 12 IA 1', '$2y$10$8RIweHvORpBI5yPlcO/U5eCzr3Augy034oBzDTb2VS24fYXZE5LRa', 'NBbVfl', '', '0', 'U03350090169'),
('9986617731', 'AKHMAD PRASETYO NURFAOZAN', 'L', 'TEGAL', '0000-00-00', '3328110812980064', 'Islam ', 'DS. BERSOLE RT.13/03 ADIWERNA', '13', '3', '-', 'BERSOLE', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989971    ', 'SLAMET', 'LUTFATUL LATIFAH', 'LM 12 IA 1', '$2y$10$FXRSjdC18BEwetOisPclburIFKDQTuDDqj3H2GoZRuikQK8Bffj5m', 'bUtNMc', '', '0', 'U03350090018'),
('9986618845', 'DWI PUTRI MELLY UMMAYA', 'P', 'TEGAL', '0000-00-00', '332811700598001 ', 'Islam ', 'HARJOSARI KIDUL RT 22/05', '22', '5', '-', 'Harjosari kidul', 'Kec. Adiwerna', '52419', 'DN-03 DI 0989596    ', 'Manan Mufti Aziz', 'Umi Naesih', 'LM 12 IA 3', '$2y$10$dTOdL3A/NFNRsmDGQw0VMeBqyeX5ljpZ6ss42AYelgy3XYNNE88oK', 'SUVRug', '', '0', 'U03350090747'),
('9986618977', 'ISNA AZZAH ARFIYANI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'HARJOSARI KIDUL RT.06 RW.02 ADIWERNA', '6', '2', '-', 'Harjosari Kidul', 'Kec. Adiwerna', NULL, 'DN-03 DI 0989661    ', 'KUSNADI', 'SITI KHORIDAH', 'LM 12 IS 3', '$2y$10$VHqX67b.eEkeGcPqE6gUEOE8qHIwridFdfK9aCdyRvDs/BeiTezG2', 'dNEGRb', '', '0', 'U03350092383'),
('9986618980', 'MUHAMMAD REZA NUR AMIHNUDIN', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Menganti Pura no.47', '28', '6', '-', 'Harjosari Lor', 'Kec. Adiwerna', NULL, 'DN-03 DI 0989433    ', 'Suparto', 'Siti Bunayah', 'LM 12 IS 1', '$2y$10$XavIEU6iK1kOH2S9uCFb0.Rz/XPiUg46B28jbT.lrg/t6XXum720u', 'nWwKKr', '', '0', 'U03350091778'),
('9986630093', 'ALLIFIYANI HIDAYATULLAH', 'P', 'TEGAL', '0000-00-00', '3328115206980003', 'Islam ', 'PENARUKAN RT 17 RW 04', '17', '4', '-', 'Penarukan', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990483    ', 'Moch. Ratono S.', 'Jumilah', 'LM 12 IS 2', '$2y$10$OF9jSSF6w5KJAtXWaXFttuK3xScHZrFuVM4sPJQJErE2y6kIuxBQC', 'aNSg7O', '', '0', 'U03350091938'),
('9986630203', 'RISMA DESILVIA APRILIANI', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'JL.SUTAMERTA VIII/06 RT.03 RW.07 DS.PEDAGANGA', '3', '7', '-', 'Pedagangan', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997251    ', 'MOH. EFENDI', 'DEWI PROBAWATI', 'LM 12 IS 1', '$2y$10$Am3D9J8hQ9Yd9IZmvDjvU.2XoOpDnSQJyI7HY2ulY7Pm1L.zzeuRS', 'P3AQAa', '', '0', 'U03350091814'),
('9986632161', 'ARUM SARI TRIWAHYUNI', 'P', 'TEGAL', '0000-00-00', '3328114705980006', 'Islam ', 'DS. UJUNGRUSI RT. 05 RW. 01', '5', '1', NULL, 'Ujungrusi', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990339    ', 'Muhadi', 'Kasanah', 'LM 12 IS 4', '$2y$10$TTwfMokQSvQutZynyLw1juT/lM1tlZS5uickdDSCBUcasM11VjPlG', '8QA2Nq', '', '0', 'U03350092605'),
('9986632764', 'AYU CAHYANINGTIYAS', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA TEMBOK BANJARAN RT. 19 RW. 03 KEC. ADIWE', '19', '3', '-', 'Tembok Banjaran', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989447    ', 'Jamaludin', 'Purwaningsih', 'LM 12 IS 4', '$2y$10$RtbDvwx19WGt3DXTXZyMhOIjMokEMAKMmA/cSSFdVBAjeKEGpbtqq', 'Ze24gU', '', '0', 'U03350092614'),
('9986634765', 'AMALIA SHIFA', 'P', 'TEGAL', '0000-00-00', '3328114101980007', 'Islam ', 'LUMINGSER RT 20/3 ', '20', '3', 'DESA LUMINGSER', 'DESA LUMINGSER', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989970    ', 'SADLANI', 'LATIFAH', 'LM 12 IA 5', '$2y$10$hiPvjaEDzE6uGjYDrQb5aulRdqg1kFlgQELnDXKIQo5t.pb95nfMO', 'UHFhNO', '', '0', 'U03350091307'),
('9986634824', 'UMI MAHFIYAH', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS.TB. BANJARAN RT.09 RW.02', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0989377    ', 'H. SUWARTO', 'HJ.LATIFAH', 'LM 12 IA 2', '$2y$10$j.PAXKr.WT78iCEPjw6XU..t20QUkxGvNMyQJvojkbvt551.aE2He', 'v4fnBw', '', '0', 'U03350090605'),
('9986635146', 'NIVEN FINANCA WIYATA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'jl. sundanala kaliwadas', '3', '1', 'kaliwadas', 'kaliwadas', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990317    ', 'sudarso', 'Sri hartati', 'LM 12 IS 2', '$2y$10$ShDNULXH3sEs/EYVjzz0OuMJwQV7Skf.2nzUfDapB1jKUGE0K60Yy', 'z8t9QS', '', '0', 'U03350092116'),
('9986635183', 'DEWI RIZQI NUR AZIZAH', 'P', 'TEGAL', '0000-00-00', '3328116107980003', 'Islam ', 'PAGIYANTEN ', '14', '4', 'PAGIYANTEN', 'PAGIYANTEN', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989967    ', 'SUDIARKO', 'ANI ERYAWATI', 'LM 12 IS 4', '$2y$10$Z9EMnei5VQeeAha1eOkhiOMt3d1Ek6vGtYizZF6JloCE3a8WRFdWC', 'FJmTB2', '', '0', 'U03350092658'),
('9986635306', 'TITI CAHYANINGRUM', 'P', 'TEGAL', '0000-00-00', '3328116506980010', 'Islam ', 'duren sawit 1', '4', '1', '-', 'PAGIYANTEN', 'Kec. Adiwerna', '52194', 'DN- 03 DI 0989678   ', 'ABDULLAH', 'DARYATI', 'LM 12 IS 3', '$2y$10$lKZwi1j0dXMPVaKVMaWjiewgXQw0s9CQ9b82HpWEruaEG4dog6Qb.', '8gBFJ6', '', '0', 'U03350092525'),
('9986635350', 'DIAN ISLAMIYATI', 'P', 'TEGAL', '0000-00-00', '332811691080003 ', 'Islam ', '-', '17', '5', '-', 'Pagiyanten Kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989774    ', 'jawawi', 'ropiah', 'LM 12 IS 3', '$2y$10$rViZaxSPi3UV/0dbpnttFuVhC/u6nUegaCFUUIPHFYIC8Wr1DlqyW', 'HKppaY', '', '0', 'U03350092329'),
('9986635936', 'SOFIAN RAMA YANITRA', 'L', 'TEGAL', '0000-00-00', '3328102705980006', 'Islam ', 'JL.IMAM BONJOL NO.19 RT 03/02 KUDAILE SLAWI', '3', '2', '-', 'Kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 0371331    ', 'Ratono', 'Istichomah', 'LM 12 IA 4', '$2y$10$FOxPYqbk5QLE2rUXLmQGcO1WQOzp68mUoRuSbT/YJUuXZ11z7R.Pq', 'YfOJ1l', '', '0', 'U03350091227'),
('9986637577', 'TEGAR BAGAS PERMANA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PENUSUPAN RT 04/04', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0996713    ', 'Suwakyo', '-', 'LM 12 IS 2', '$2y$10$LwMX1D1lD1QlmBV27LZ/CeR3vyjOm43BI4.AOnUqecHpOEjd9UEjq', '9FOdK6', '', '0', 'U03350092214'),
('9986637672', 'AN UMILAH FEBRIANI', 'P', 'TEGAL', '0000-00-00', '33280289529     ', 'Islam ', '-', '3', '1', '-', 'Ds.Bukateja', 'Kec. Balapulang', '52464', 'DN-03 DI 0991560    ', 'Muhamad Agus Zahrudin', 'Mis Waluyowati', 'LM 12 IS 4', '$2y$10$FfbBhILFwUdAwkT26wVot.TWXP3BSVu4401iV2sv8JrCfJ3qOQaea', 'zWGBro', '', '0', 'U03350092578'),
('9986650372', 'ADE FAIZAL', 'L', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'utara simpang tiga jejeg', '7', '1', 'krajan', 'jejeg', 'Kec. Bumijawa', '52466', 'DN-03 DI 0992195    ', 'maftukhi', 'nur janah', 'LM 12 IA 4', '$2y$10$QQ9giyoZAnDUkI.H4mz48unEOZkvTSHsqZSBygz.raVDbMsnnkGA6', 'qsytcG', '', '0', 'U03350090978'),
('9986650373', 'ISMATUL LAELY', 'P', 'TEGAL', '0000-00-00', '3328026904980002', 'Islam ', 'JEJEG RT. 06 RW. 01 BUMIJAWA', '6', '1', NULL, 'JEJEG', 'Kec. Bumijawa', '52466', 'DN-03 DI 0992135    ', 'H. SOLICHIN', 'HJ.NURCHATI', 'XII MS 3', '$2y$10$0P395owwn7UI4FzuuHDO3uM1mkr8xoCUPBJBwUs4urVuO0Vz.Twka', 'BuPFqF', '', '0', 'U03350090792'),
('9986650742', 'HERIN ILHAM NURBANI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BUMIJAWA RT 01/06', '0', '0', '-', 'Bumijawa', 'Kec. Bumijawa', NULL, 'DN-03 DI 0992145    ', 'Nuridin', '-', 'LM 12 IS 2', '$2y$10$HoHmJMj/znGptTUzyMOhGuCOI65WY5B.Jt.cI/UGhyZB3iR3Hxkzq', 'vfxoRT', '', '0', 'U03350092036'),
('9986650743', 'PANJI IQBAL BARLIAN', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'KARANGANYAR RT 01/06 BUMIJAWA', '1', '6', 'KARANG ANYAR', 'BUMIJAWA', 'Kec. Bumijawa', '52466', 'DN-03 DI 0365771    ', 'IWAN WIDYANTO', 'SETIYATI', 'LM 12 IA 5', '$2y$10$8iBIJYAmRIC8eSgsJgFTm.iB35RTOoADGnYm7uVDM4nY9TYNgsj4W', 'KrsHRs', '', '0', 'U03350091494'),
('9986650801', 'SYIFA AMALIA', 'P', 'TEGAL', '0000-00-00', '3328027101980001', 'Islam ', 'BUMIJAWA RT 05/02 TEGAL', '5', '2', 'BUMIJAWA', 'BUMIJAWA', 'Kec. Bumijawa', '52466', 'DN-03 DI 0992233    ', 'SAEFUL MUSLIMIN', 'HALIMAH', 'LM 12 IA 4', '$2y$10$BfAM2h8zjLmF9qo7Ri1qfeljst5oRDcInoZR7/mgvwSVI/vHTaHLi', 'hZMZKH', '', '0', 'U03350091254'),
('9986650802', 'RIZQINA WIDYA UTAMI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BUMIJAWA RT.05/02', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0992175    ', 'PRIYANA PARDANA', '-', 'LM 12 IS 4', '$2y$10$8QV9BVqc0hPGcGoCQz0nROAdHmum6pG/PydPVxZzMt..mcniO9ZAi', 'FzwUbe', '', '0', 'U03350092845'),
('9986650810', 'SYERIN ULFIATUL FAHIROH', 'P', 'TEGAL', '0000-00-00', '3328025304980002', 'Islam ', 'BUMIJAWA', '3', '2', '-', 'BUMIJAWA', 'Kec. Bumijawa', '52466', 'DN-03 DI 0992155    ', 'SUSDIYANTO', 'KHOTIMI', 'LM 12 IA 4', '$2y$10$fW4zY8V7yHPwD5IPX40vcOHu5B5.rT4pTGfukzzbO87XQdx5fsYx.', 'jRnMEk', '', '0', 'U03350091245'),
('9986650833', 'PATRIADIKA HANUNG PRI AZAKYAN', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'jl. Wredameta', '0', '0', NULL, 'BUMIJAWA', 'Kec. Bumijawa', NULL, 'DN-03 DI 0992147    ', 'AMIN SUPRIYANTO', 'RETNO PRAMININGSIH', 'LM 12 IS 4', '$2y$10$XQQuBOpTwQU.pLKr/wbUm.j5WjFxKcZfs.ONBVvQnREyleaGcS3pO', 'hnpIq1', '', '0', 'U03350092827'),
('9986651878', 'DEVI MAYA SARI', 'P', 'TEGAL', '0000-00-00', '3328182107094272', 'Islam ', 'JALAN KRESNA', '20', '7', NULL, 'GUMAYUN', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993086    ', 'KUSTANTO', 'RUMIYATI', 'LM 12 IA 2', '$2y$10$tnonAO7FuePZwMlxT2BMEu3oXWwGZyC700FOJvZv9JJ4NVnheOn2G', 'fUg6Hf', '', '0', 'U03350090356'),
('9986652197', 'KHOERUN NISA DYAH PRAMUDA MARDANI ', 'P', 'TEGAL', '0000-00-00', '3328184904980005', 'Islam ', 'DS. DUKUHWARU JL. HAYAMWURUK NO. 28 ', '5', '4', '-', 'DUKUHWARU', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993113    ', 'MARSUDI DARMA UNTORO', 'WIDI KURNIATI', 'LM 12 IA 3', '$2y$10$dE4gM0tVmqqAwTZohDgIEuRl/8.Ll4I9Xvvh7Bpv2CvMs6kkph7OO', 'FboW1x', '', '0', 'U03350090809'),
('9986652235', 'MUTMAINAH NURLITA DEWI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'GRIYA KABUNAN ASRI II BLOK C. NO. 1', '0', '0', '-', 'Kabunan', 'Kec. Dukuhwaru', NULL, 'DN-03 DI 0993144    ', 'SEMBODO', 'TRI BUDI ASTUTI', 'LM 12 IS 1', '$2y$10$CA.UP8.RHyGyJzGMC7opV.AiKJKh2/5XLmZ.mmsQtGjYahP118Dea', '6y1Rqu', '', '0', 'U03350091796'),
('9986652265', 'CENDEKIA ISLAMI HAQ', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'GRIYA KABUNAN ASRI', '2', '5', '-', 'KABUNAN', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997264    ', 'PANJI PRIPRAYOGA', '-', 'LM 12 IA 5', '$2y$10$6Et9xYmTqXCmYZo.1hez9enzSqarHppuPPxcQpffKxrO.ZlW7DUiq', 'SJOpTt', '', '0', 'U03350091343'),
('9986652440', 'PRANA IRFAN MUQSIT', 'L', 'TEGAL', '0000-00-00', '3328182407980002', 'Islam ', 'JL.PISANG PEDAGANGAN', '5', '3', '-', 'PEDAGANGAN', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0989507    ', 'SUNARTO', 'TUTI LESTARI', 'LM 12 IA 5', '$2y$10$3Spn.jRTvrRDHlFrQfnB/.YnCcTa5x1lrRX64bpgxA8E2umrr.gYG', 'D6MKfH', '', '0', 'U03350091503');
INSERT INTO `siswa` (`nis`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `nik`, `agama`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `no_skhun`, `nm_ayah`, `nm_ibu`, `kd_kelas`, `password`, `password_asli`, `remember_token`, `status`, `no_peserta`) VALUES
('9986652716', 'DENDY KRISNANTO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'KALISOKA RT. 04 RW. 01 KEC. DUKUHWARU', '4', '1', 'Kalisoka', 'Kalisoka', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0992893    ', 'SANURI', '-', 'LM 12 IA 3', '$2y$10$WBsODXMkxmdMlXwdrM15n.QK97WsRwY8j6KhY1TxYDa8OEBEh3Kj.', 'HMrbsn', '', '0', 'U03350090729'),
('9986653634', 'SETIA DEWI AYUNINGTIAS', 'P', 'TEGAL', '0000-00-00', '3328044206980001', 'Islam ', 'JL. RAYA UTARA NO. 1', '1', '7', '-', 'BALAPULANG WETAN', 'Kec. Balapulang', '52464', 'DN-03DI 0991111     ', 'ROKHIMI', 'DEWI TRESNAWATI', 'LM 12 IA 2', '$2y$10$LZIhN0AM0/HGvQARAkmjme2KgtkLzzOSaeoJHUBJfIb4Hthdu0OU6', 'eM9eHo', '', '0', 'U03350090587'),
('9986653734', 'MILADATUN NAFIAH', 'P', 'TEGAL', '0000-00-00', '3328041202118   ', 'Islam ', 'JL.MUHARI NO 1 BALAPULANG WETAN RT 02/2', '2', '2', '-', '-BALAPULANG WETAN', 'Kec. Balapulang', '52464', 'DN-03 DI 0991188    ', 'ZAENAL ASYIKIN', 'NASIROH', 'LM 12 IS 2', '$2y$10$he7sCrOKjSpvm556fq7yVOS6MNzOjOrtRj.6unZkYLWfxavKAkJb6', 'w0Tjfr', '', '0', 'U03350092089'),
('9986653846', 'OLLADIO MONATIKA YUSTI', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'Jalan Pramuka', '6', '1', '-', 'Balapulang Kulon', 'Kec. Balapulang', '52464', 'DN-03 DI 0991250    ', 'Eko Yusmanto', '-', 'LM 12 IS 2', '$2y$10$efrztqdUkI1pJBtQKkd4lOkWPC/PhvQoUYLPmVGbF9wd4rsLlXKkS', 'F669gz', '', '0', 'U03350092134'),
('9986653863', 'RIZKI TRIOKTAVIAN SAPUTRA', 'L', 'TEGAL', '0000-00-00', '3328042210980001', 'Islam ', 'GRIYA PALM ASRI 1 BLOK D4 NO. 21 ', '4', '5', '-', 'Pedagangan', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0991006    ', 'Bambang Suwitno', 'Sri Rahayu', 'LM 12 IA 4', '$2y$10$37Cc8xHf2gYoCCHox.tnFOyg9s8erws5ENTQUkPv1ROYmfRkZIQ4O', 'vSsJfy', '', '0', 'U03350091218'),
('9986653895', 'ERO SISKA ZAIRANI', 'P', 'TEGAL', '0000-00-00', '3328046105980002', 'Islam ', 'BALAPULANG KULON, JL. MANGGA RT. 03/01', '3', '1', 'BALAPULANG KULON', 'BALAPULANG KULON', 'Kec. Balapulang', '52464', 'DN-03 DI 0991096    ', 'NUROKHIM', 'SITI SOFA', 'LM 12 IA 2', '$2y$10$46jzvYqCGjjoVVxSNcwpNOqQ2bXYBaB1Kxapa0znnSn8gnBklfne6', 'muZECM', '', '0', 'U03350090383'),
('9986653903', 'ATIQ FAUZIYAH', 'P', 'TEGAL', '0000-00-00', '3328045102780001', 'Islam ', 'PAMIRITAN', '1', '7', 'KARANGANYAR', 'PAMIRITAN', 'Kec. Balapulang', '52464', 'DN-03 DI 0991028    ', 'KHAERONI', 'NUR SILAH', 'LM 12 IA 5', '$2y$10$f3mXmopz5GbPMd5S1zesK.LEK5ZxIgn0AgjYCbDpLVPYK6KaXpl0a', 'fMOSy8', '', '0', 'U03350091334'),
('9986655285', 'AYUNANDIA PUTMA AGLISTYA', 'P', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'JL.CUT NYAK DHIEN KALISAPU', '1', '5', '-', 'Kalisapu', 'Kec. Slawi', '52416', 'DN-03 DI 0997317    ', 'IMAN AGUS FATEKUROCHIM', 'SULISTYOWATI', 'LM 12 IS 4', '$2y$10$JJtqCP7wXlfjzn5JAMz43uxhWlnHjt9pkpjHqwrjozCB8Y6hBWbYG', 'om7SFu', '', '0', 'U03350092623'),
('9986658411', 'KHANSA'' QONITA RAMADHANI', 'P', 'SEMARANG', '0000-00-00', '3328102708091982', 'Islam ', 'BTN KUDAILE GG.10 C/87 RT.03 RW.05', '3', '5', '-', 'Kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 0997285    ', 'SYUAIBI ALI', 'LINA PURWANINGSIH', 'LM 12 IA 4', '$2y$10$XKKblG9lfSyY0TquvYE9YO8SBCcZ39mYpYnBSdGnxQZ.CAJomNwi2', 'XAxxEd', '', '0', 'U03350091112'),
('9986658433', 'AKHMAD SAEFULLOH', 'L', 'TEGAL', '0000-00-00', NULL, 'Islam ', 'JL.MELATI NO.60 RT 04/02 SLAWI', '4', '2', NULL, 'PAKEMBARAN', 'Kec. Slawi', NULL, 'DN-03 DI 0279725    ', 'WASHARY', 'PRAPTININGSIH', 'LM 12 IA 3', '$2y$10$Ti9/45YC6i3WC2MSBA9zZO9LEEHIKrDdzhgVfBBTb05/cV5MoD1s2', 'aivQ8V', '', '0', 'U03350090676'),
('9986658575', 'FRESA MUTIA SAHITA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PERUMAHAN KABUNAN ASRI BOK A. 7 DUKUHWARU', '5', '1', '-', '-', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997261    ', 'Drs. ROFIUDIN', 'NUNING HARYANTI', 'LM 12 IS 3', '$2y$10$mMKT4wPoKZNs26yYpOAYKeqJ.CLlBXOY80jjJOC7ZxRyQKOTPfj7y', 'd7jYkO', '', '0', 'U03350092356'),
('9986659787', 'YESICA YONA FANUELLA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Kristen ', 'JL.DR.SUTOMO L/14 SLAWI', '1', '6', 'Slawi Kulon', 'Slawi Kulon', 'Kec. Slawi', '52411', 'DN-03 DI 0997423    ', 'YOHANES RIYANTO', 'ANJAS LUHITO KIRANA', 'LM 12 IS 2', '$2y$10$C2x543XaInRyJXeJkZHWGur3sE.MF222m9BxlNzhSFAK/ngzulKTC', 'QdhtLh', '', '0', 'U03350092232'),
('9986659788', 'YOGI SURYA RAMADHAN', 'L', 'TEGAL', '0000-00-00', '3328101701980005', 'Islam ', 'SHAPIRE REGENCY KALISAPU A-5', '7', '3', '-', 'KALISAPU', 'Kec. Slawi', '52416', 'DN-03 DI 1003097    ', 'MUHYANI', 'YULI ASTUTI', 'LM 12 IS 4', '$2y$10$tVzjsQ6CwDHnGy2VXLvp/Ob7Xek8oPsDAMAecMfjnEFhE.ZjA92sO', 'HKfYcz', '', '0', 'U03350092863'),
('9986659798', 'APRILIA INTAN PRATIWI', 'P', 'TEGAL', '0000-00-00', '3328104604980005', 'Islam ', 'JALAN K.H. WAHID HASYIM SLAWI', '3', '8', '-', 'SLAWI KULON', 'Kec. Slawi', '52419', 'DN-03 DI 0997395    ', 'ACIK SUPARNO EKO SAPUTRO', 'SUMIARSIH', 'LM 12 IA 4', '$2y$10$8IEWSLS/Vpy6UWwSyvVeCe6T5gdR8c/KBWvXPqYu26JLjYRfMd/ya', 'U1cFj1', '', '0', 'U03350091005'),
('9986659801', 'OKIKSA MERSENDI', 'P', 'TEGAL', '0000-00-00', '3328105904980003', 'Islam ', 'Jl. Cucut', '3', '2', '-', 'Desa Kalisapu', 'Kec. Slawi', '52416', 'DN-03 DI 0997402    ', 'Ahmad Sugandi', 'Susmari', 'LM 12 IA 5', '$2y$10$EBiCJHrUW/Nz.MZ7p69EjeGNGA8SIIgmRhzhq6WNhwJ0y/8psYQxq', 'SxWAfD', '', '0', 'U03350091485'),
('9986659804', 'WYNNE KHALIDA SEKARWANGI', 'P', 'TEGAL', '0000-00-00', '3328184905980005', 'Islam ', 'JL. GUNUNG SLAMET NO.15', '7', '1', '-', 'BLUBUK', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997324    ', 'Drs. Akh. Khalimi', 'IDA ROSIDAH', 'LM 12 IS 1', '$2y$10$y49F8AJJ4xXxAsmHixHg4ug8WN8x3pvjMaPh9IAoICjvjtJpgeKQ2', 'KDJdI9', '', '0', 'U03350091894'),
('9986659805', 'NISRINA GHINA LESTARI', 'P', 'TEGAL', '0000-00-00', '3328105805980002', 'Islam ', 'JL.RA KARTINI GG.2 RT 06/08 SLAWI KULON', '6', '8', '-', 'Slawi Kulon', 'Kec. Slawi', '52400', 'DN-03 DI 0997404    ', 'Suswieto', 'Fatmawati', 'LM 12 IA 2', '$2y$10$fBIbAIX6T69TGLKqprWTSOJp93p2eOPW.vc3RSgvo/HrHYSKhtIHi', 'BU5Phi', '', '0', 'U03350090498'),
('9986659809', 'RAGIL SATRIA IDEANTORO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. PERKUTUT BLOK A NO. 38 RT.02/01', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0997302    ', 'Gigih Eko Ideantoro', '-', 'LM 12 IS 3', '$2y$10$MSl9HRoLkuznW30zjJHLG.MopsUKvVT/sym7Ad3V9AozYn6WZ8uJq', 'k7cY4f', '', '0', 'U03350092472'),
('9986659818', 'SURYAHANI AYUNINGTYAS', 'P', 'TEGAL', '0000-00-00', '3328106008980006', 'Islam ', 'PERUM. BINA GRIYA UTAMA B 11 KALISAPU', '1', '9', '-', 'Desa Kalisapu', 'Kec. Slawi', '52416', 'DN-03 DI 0997374    ', 'KABUL TJIPTONO', 'ENDANG SRI PURWANINGSIH', 'LM 12 IS 1', '$2y$10$Yp6zAYZOLDNMENanUM.XEOGQhppdhPjthW.rGM5ra0vgS5nKqes/u', 'fiNl8V', '', '0', 'U03350091867'),
('9986670195', 'FRANCISCUS FEBY ETDOLO', 'L', 'TEGAL', '0000-00-00', '3328101902980003', 'Kristen ', 'JL.SEMBOJA I NO.25 RT 2/03 PAKEMBARAN', '2', '3', NULL, 'Pakembaran', 'Kec. Slawi', '52416', 'DN-03 DI 0997364    ', 'Agung Tjatur Prijadi', 'Dorce', 'LM 12 IA 4', '$2y$10$mI4I7j4aZKr7eQPYwA038uJ67lVpio/o2zYtSD73demOdy0xjxrHe', 'VXHPZQ', '', '0', 'U03350091067'),
('9986670208', 'YUSIA ANGGIAT GIGIH MANURUNG', 'P', 'TEGAL', '0000-00-00', '3328102608980001', 'Kristen ', 'JL.SEMBOJA RT.04/RW.03 PAKEMBARAN', '4', '3', '-', 'kel. Pakembaran', 'Kec. Slawi', '52415', 'DN-07 DI 1608533    ', 'Binsar Robin Manurung', 'Risma Parulian Panjaitan', 'LM 12 IA 4', '$2y$10$S7RwJIVZWJxIvKR5fTSsMOMU/fPTHvyKXpdq1J3pMjHYoFT1kLJL6', 'JoX0ir', '', '0', 'U03350091289'),
('9986670840', 'JAROT RUDI HARTATO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'RUMDIN SDN TRAYEMAN 03', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0997334    ', 'Abdul Azis', '-', 'LM 12 IA 5', '$2y$10$qbBp0z3DKfT/P4EKQhT0E.dG2BlFUAHNlQ4Gxb.2lz5BH7rGf9iBa', 'jrhrXa', '', '0', 'U03350091449'),
('9986670869', 'NOVITA LAELA SUMBARA', 'P', 'CIREBON', '0000-00-00', '3328106710970007', 'Islam ', 'JL. IR. JUANDA, RT. 02/03 TRAYEMAN, KEC. SLAW', '2', '3', '-', 'DESA TRAYEMAN', 'Kec. Slawi', '52414', 'DN-03 DI 0989424    ', 'ZAID WAHYUDI', 'TASLIKHA', 'LM 12 IA 2', '$2y$10$G/wfWrX5YQXuTkT3BrkFGuovN7u8AiTbV2OVaWHisaYsTanzDOSaK', 'Mgimr9', '', '0', 'U03350090516'),
('9986673202', 'KARISMA CAHYA', 'P', 'TEGAL', '0000-00-00', '3328084208980001', 'Islam ', 'KEDUNGBANTENG RT 25/12', '25', '12', '-', 'DESA KEDUNGBANTENG', 'Kec. Kedung Banteng', '52472', 'DN-03 DI 0279679    ', 'TARUNO', 'SUHARTI', 'LM 12 IA 4', '$2y$10$TkxkHAzbVmj6hupYZJe8A.sHsJ2pxmDzkSogQXczCifQqqPHqW.FG', 'f9kIq7', '', '0', 'U03350091103'),
('9986693136', 'SELLY RAHMAWATI', 'P', 'TEGAL', '0000-00-00', '3328125103980004', 'Islam ', 'PASANGAN RT 10/ 03', '10', '3', '-', 'pasangan', 'Kec. Talang', '52193', 'DN-03 DI 0989579    ', 'NUR ALI', 'Endah Budi Utami Ningsih', 'LM 12 IA 5', '$2y$10$fOLolEFSzf87k0noQuEr6.Lu5xYRsI9Vou1HNN.yz1656IW0mzhmW', 'AOcpXQ', '', '0', 'U03350091547'),
('9986693298', 'INDAH NUR AMALIA', 'P', 'TEGAL', '0000-00-00', '3328125512070005', 'Islam ', 'Jl.raya banjaran-balamoa Ds.pegirikan Talang-', '8', '2', NULL, 'pegirikan', 'Kec. Talang', '52193', 'DN-03 DI 0279294    ', 'Sugeng Riyadi', 'Siti Masitoh', 'LM 12 IA 3', '$2y$10$6jCnoDKSezfd1CAwIDiPyOqDt6m17Nr5VeOuxKCim87hw1Px52nMu', '5Ay1kb', '', '0', 'U03350090774'),
('9986693352', 'HAFIDZ NUR ILMI', 'L', 'TEGAL', '0000-00-00', '3328092802980007', 'Islam ', 'JALAN RAYA BEDUG', '26', '6', '-', 'bedug', 'Kec. Pangkah', '52471', 'DN-03 DI 0989402    ', 'NURDIYANTO', 'SETIOWATI', 'LM 12 IA 2', '$2y$10$S4XRVE34.fl2MIrsNQvUOuyuvQzFe6R2.fjueA8REkBmOMDpNBtD6', '6Safgq', '', '0', 'U03350090436'),
('9986693378', 'NINDI DYAH AYU PERMATA SARI', 'P', 'TEGAL', '0000-00-00', '9986693378      ', 'Islam ', 'DS. TEMBOK LOR', '13', '3', '-', 'TEMBOK lOR', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989387    ', 'WILDAN', 'TAPRIKHA', 'LM 12 IA 5', '$2y$10$6EQK.ntdf9dRRDu1n/Y/neH0G/yGHsQMN2wSFJVVtCu3TjBYXnNSC', 'UO1UAz', '', '0', 'U03350091476'),
('9986693463', 'MOHAMAD NUR AULIA M.A', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA KALIMATI ADIWERNA', '0', '0', '-', 'Kalimati', 'Kec. Adiwerna', NULL, 'DN-03 DI 0989589    ', 'H. Toha', 'Siti Khodijah', 'XII SOS 1', '$2y$10$b1hFXd1I0.vZ6Dxf2prpsuWBjJxaa9SJC13ONhs.Lt2ag8TTYGP5C', 'tIum1k', '', '0', 'U03350091743'),
('9986695821', 'ANGGUN DWI LARASATI', 'P', 'TEGAL', '0000-00-00', '3328126804980006', 'Islam ', 'DESA PEKIRINGAN', '11', '3', NULL, 'Pekiringan', 'Kec. Talang', '52193', 'DN-03 DI 0363210    ', 'Kharis', 'Ambar Wati', 'LM 12 IA 4', '$2y$10$qwFC7YY53uml9CuawKh/4eK2MmV5FRc6tdpcxit9SN1WbhrgvH8xC', 'DX8dOT', '', '0', 'U03350090996'),
('9986725703', 'GANANG YUDHA PRASOJO', 'L', 'TEGAL', '0000-00-00', '3328080804980003', 'Islam ', 'JL. MELATI 1 BTN TONGGARA NO. 28 RT 09/03 KED', '9', '3', '-', 'Tonggara', 'Kec. Kedung Banteng', '52472', 'DN-03 DI 0997388    ', 'Prasetyo', 'Ely Agustina', 'LM 12 IA 3', '$2y$10$XWGPTnbUCkdtuAdJ5bzIGevTa2L8/1xqADchKdd2XQSQbg9jvo3k.', 'xg2BSm', '', '0', 'U03350090765'),
('9986751782', 'SYAHRA AGUSTINA MAULIDA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'LEBAKSIU RT. 01 RW 01', '1', '1', '-', 'Lebaksiu Lor', 'Kec. Lebaksiu', NULL, 'DN-03 DI 0279607    ', 'Aproni', 'Irawati', 'LM 12 IA 4', '$2y$10$JOLdmTatlieK6BFZkn6Em.CCnU4B.TFj6fYTEKPYAYcXwiqvWp.Pe', 'fgacZ0', '', '0', 'U03350091236'),
('9986756064', 'FIRMAN ARIF MARZUKI', 'L', 'TEGAL', '0000-00-00', '3328060605570001', 'Islam ', 'BABAKAN RT 05/05 DESA JATIMULYA KEC. LEBAKSIU', '5', '5', 'babakan', 'Jatimulya', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0279585    ', 'Syaefuddin', '-Sunaeni', 'LM 12 IA 4', '$2y$10$EvRXIMYZVYbBiWwQOrpwAud.5D0FKe9wQ6J4ykyO.ssbeXgD9Ana2', '3k9HN8', '', '0', 'U03350091049'),
('9986758123', 'MUFTI LAKSMI NUR SOLICHA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'LEBAKGOWAH LEBAKSIU TEGAL', '2', '1', '-', 'LEBAKGOWAH', 'Kec. Lebaksiu', NULL, 'DN-03 DI 0279365    ', 'ERWANTORO', 'NUR IZA SUSI TRIANA', 'LM 12 IS 2', '$2y$10$jigXda8MsE0YeAhrDSx6vuhqok6goZwWe/LESiUZVf0n9.WAODdZO', 'oDqSMK', '', '0', 'U03350092098'),
('9986771984', 'LAURA LUKY NOVELITA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. ANGGREK DS. LEBAKGOWAH KEC. LEBAKSIU KAB.', '3', '3', '-', 'Lebakgowah', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0279628    ', 'Turino Junaedi', 'YULI PURWANINGSIH', 'LM 12 IS 2', '$2y$10$i5yR5ib1Q70hj/SIemn6LeRr.GiePnkA8h6ABzYthJnE2Z.h3ODzK', 'Nb30eB', '', '0', 'U03350092072'),
('9986772270', 'ANA RISMA NANDA', 'P', 'TEGAL', '0000-00-00', '3328065703980002', 'Islam ', 'JL. SD NEGERI LEBAKSIU KIDUL 01', '2', '2', 'LEBAKSIU KIDUL', 'LEBAKSIU KIDUL', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994794    ', 'JOKO SUSENO', 'SITI SUPRAPTI', 'LM 12 IS 4', '$2y$10$CXiOc.fswDMw7F7H0pH34uuXUiPJLrNB1o4U.7IBXERzkF76XN1Ay', '6cmKQx', '', '0', 'U03350092587'),
('9986772728', 'MUKHAMMAD ILHAM BISTOMI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'LEBAKSIU KIDUL', '2', '4', 'dukuhwinong', 'lebaksiu kidul', 'Kec. Lebaksiu', '52459', 'DN-03 DI 0994772    ', 'Muchamad Umar', '-', 'LM 12 IS 2', '$2y$10$fNTk2kz1j3zJD4A9J3d//OWhTgYxbMntb8/t/bK/HIGnpQVsNSFsq', 'nRjUEB', '', '0', 'U03350092107'),
('9986772737', 'SUKMA HIDAYAT', 'L', 'TEGAL', '0000-00-00', '3328061808980006', 'Islam ', 'LEBAKSIU KIDUL RT.04 RW.04', '4', '4', 'dukuhwinong', 'lebaksiu kidul', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0368631    ', 'Subekhi', 'fatikha', 'LM 12 IA 5', '$2y$10$EjUXW8wB8YYrRm/s4ZRQaOrT6vcqhbBkszHKmXFqX9hbm3fqtfBQy', 'Oqu1Hz', '', '0', 'U03350091556'),
('9986773768', 'DEWI TRIWI ANGGUN', 'P', 'TEGAL', '0000-00-00', '3328060306100273', 'Islam ', 'PENDAWA RT. 04/01 LEBAKSIU', '4', '1', '-', 'PENDAWA', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994655    ', 'MULYONO', 'ENDANG SUPRIYATIN', 'LM 12 IA 1', '$2y$10$7iIjm7XaraYlTDB0AOrCJeLetcWWWYaVcHC3d4u2SyakBvm.ZOUYO', 'P3O4LP', '', '0', 'U03350090089'),
('9986774382', 'YULI DWI DAYANI', 'P', 'TEGAL', '0000-00-00', '3328064107980165', 'Islam ', 'JL.PEMBANGUNAN', '3', '2', '-', 'TEGALANDONG', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0997328    ', 'WAGE', 'SITI MARYAM', 'LM 12 IS 4', '$2y$10$Co4PDFkbqjc2fjpiR7.uVuJSvHcJjRYQwKDwtiBMjQUpcAKESQcV2', 'v3n03e', '', '0', 'U03350092872'),
('9986774426', 'PRISKA PRAMESTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.SURAJAYA RT 02/01 TEGALANDONG TEGAL', '2', '1', NULL, 'TEGALANDONG', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0279667    ', 'USMADI', 'WIDIYAWATI', 'LM 12 IA 3', '$2y$10$KsoSKOIQmmIqN/XZXCFq8e/Nh0zR4Jjo0kOaY9vx6leBViIHk61p2', 'qjBzpL', '', '0', 'U03350090854'),
('9986774799', 'ERLANDA MUSTIKA ALAM', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL. IMAM BONJOL GG. 18 RT. 06/01 KUDAILE ', '6', '1', '-', 'KUDAILE', 'Kec. Slawi', '52413', 'DN-03 DI 0990687    ', 'Fauzi', 'Widiowati', 'LM 12 IS 2', '$2y$10$2zK95ntXVeIQ8iPjRsYA0uJptmtq0wbXKJ/i4j1u1sf8uSOb1ItfC', 'JkA4zz', '', '0', 'U03350091974'),
('9986810972', 'MOCHAMAD AMRI SYARIFUDIN', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.WIJAYAKUSUMA DESA SUROKIDUL RT.01 RW.08 KE', '1', '8', 'SUROKIDUL', 'SUROKIDUL', 'Kec. Pagerbarang', '52462', 'DN-03 DI 0267943    ', 'SATORI', 'TAFRICHATUN', 'LM 12 IA 4', '$2y$10$.gQrWD5bMRusvvAFcehqR.FM4BcYqFMXVMxL4ctCpYjtODxYpHHfO', 'k5Y4Cn', '', '0', 'U03350091129'),
('9986976233', 'SONI DWI WAMBUDI', 'L', 'TEGAL', '0000-00-00', '3328050208980001', 'Islam ', 'JALAN PEMUDA 01', '4', '3', NULL, 'JATIWANGI', 'Kec. Pagerbarang', '52462', 'DN-03 DI 0995979    ', 'TASO', 'CANISAH', 'LM 12 IA 1', '$2y$10$nO5ZMDG7gUTQaGsRGth/WuPXfl9kNfF0bTGiNZLSIQxaI9mYCc5Xa', '2cIjY1', '', '0', 'U03350090276'),
('9987030694', 'EFTETA AULIA RAHIM', 'P', 'TEGAL', '0000-00-00', '3328136407980001', 'Islam ', 'JALAN SUNAN KALIJAGA PENGARASAN, DUKUHTURI TE', '9', '2', '-', 'PENGARASAN, DUKUHTURI TEGAL', 'Kec. Dukuhturi', '52192', 'DN-03 DI 0283580    ', 'Drs. FATCHUROCHIM', 'MARYATI', 'LM 12 IA 4', '$2y$10$N8hgqPWhlrbBwNVXOWulxOOeuFfPkOSy2MLHvpi7VbZUWy8uC4hOW', 'QXjAMA', '', '0', 'U03350091032'),
('9987032018', 'IMAM TANTOWI', 'L', 'TEGAL', '0000-00-00', '3328132104980004', 'Islam ', 'KUPU RT. 03 RW. 03 DUKUHTURI TEGAL', '3', '3', '-', 'Kupu', 'Kec. Dukuhturi', '52192', 'DN-03 DI 1003387    ', 'ABDUROKHIM', 'UMQODAH', 'LM 12 IS 1', '$2y$10$7EyvNF6YbCeBiuBLQxnPyumUOZ5jMe/FmZ4yIIJXYmtykY2Th/msu', 'tNPrPg', '', '0', 'U03350091707'),
('9987033324', 'ANGGUN DESY LARAS ATI W', 'P', 'TEGAL', '0000-00-00', '3328105712980002', 'Islam ', 'JL.Dr.SOEHARSO NO.21', '1', '4', '-', 'DUKUH WRINGIN', 'Kec. Slawi', '52417', 'DN-03 DI 0997345    ', 'BAMBANG WIJANARKO', 'SITI AISAH', 'LM 12 IA 3', '$2y$10$cuPgmMpbO2ig.PsGvmrbIuU4HnyvjNQZZzIgIH0JVQxjR8snnCjO.', '3ed9sB', '', '0', 'U03350090694'),
('9987033397', 'EKA YANUAR PUTRI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'J.WARINGIN 6 RT O3/07 GRIYA PANGKAH INDAH', '0', '0', '-', 'Pangkah', 'Kec. Pangkah', '52471', 'DN-03 DI 0997367    ', 'Drs. Makmuri', 'Nunung Nurul Hidayah', 'LM 12 IS 1', '$2y$10$EYOMvqnUHNbEy5Qra1fHG.BqU4wZJhqq5odhnmwNELvHA3K8q3YDu', 'UO3zuS', '', '0', 'U03350091645'),
('9987033400', 'ANANDA PUTRI KURNIA RAMADHAN', 'P', 'TEGAL', '0000-00-00', '3328096801980006', 'Islam ', 'JL.WARINGIN 7 NO.128 RT 04/07 PANGKAH', '4', '7', NULL, 'pangkah', 'Kec. Pangkah', '52471', 'DN-03 DI 0997294    ', 'Hani Pramayana Ananta', 'Muawanah', 'LM 12 IS 2', '$2y$10$SWyXyC0UpsiKXME5qOsBcOA0gfV/kJG5SdWJJlRob0mkg0Gn7mJdK', '7T0stW', '', '0', 'U03350091947'),
('9987033456', 'FEBRIAN YUDHO SETYANTO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Jl.K.S Tubun', '3', '8', '-', 'Pakembaran', 'Kec. Slawi', '52411', 'DN-03 DI 0992957    ', 'Darmanto', 'Wiwit Setiyowati', 'LM 12 IS 1', '$2y$10$W/p6t22dvmA6L//PkJOA.e6fBhUnKGc1hYKzlEn6Jvg5K/ZpCDzYW', 'vzywwu', '', '0', 'U03350091672'),
('9987033479', 'DODY SETIAWAN', 'L', 'TEGAL', '0000-00-00', '3328101706980004', 'Islam ', 'JL.SEMBOJA RT 03/03 NO.28 PAKEMBARAN', '3', '3', '-', 'Pakembaran', 'Kec. Slawi', '52416', 'DN-03 DI 0997392    ', 'Abadi', 'Rr.Retnowati', 'LM 12 IA 2', '$2y$10$If0vkStFWI4ABmd/XvM1SuSioeJ5/qPLjA.UnyI2.8.b5YnXca72C', '8gBn1p', '', '0', 'U03350090374'),
('9987033583', 'DERA LAPISKA', 'P', 'SURAKARTA', '0000-00-00', '3328104310980001', 'Islam ', 'JL. BRIGJEN KATAMSO SLAWI WETAN', '12', '4', '-', 'Slawi wetan', 'Kec. Slawi', '52411', 'DN-03 DI 0997765    ', 'MOCHAMMAD SUDJADI', 'TRI SETIYANI', 'LM 12 IA 1', '$2y$10$VEXXP/om0CchMCvDu/n5aewYkF40DPDCszzhZHxI776OOuYdumJG6', 'qbU9UM', '', '0', 'U03350090072'),
('9987033620', 'DEA IRANIA FHANY', 'P', 'TEGAL', '0000-00-00', '3328101207110013', 'Islam ', 'JL. WIJAYA KUSUMA 6 NO. 4 PERUM PEPABRI KUDAI', '4', '5', '-', 'Kudaile', 'Kec. Slawi', '52143', 'DN-03 DI 0989668    ', 'AGUNG DWI IRANTONO', 'NUR KHUMAYA', 'LM 12 IA 3', '$2y$10$ICbYFmRACn6Bje.xOYO3tO9NKMpwU6cfeG5zZm4j10l8tC89w/4sW', 'bRxLlp', '', '0', 'U03350090712'),
('9987033621', 'INDI FIKROTUN HANIFAH', 'P', 'TEGAL', '0000-00-00', '3328102202082287', 'Islam ', 'JL.SUPRIYADI RT 1/3 TRAYEMAN', '1', '3', '-', 'Trayeman', 'Kec. Slawi', '52414', 'DN-03 DI 0989663    ', 'Tarsono', 'sriyati', 'LM 12 IA 3', '$2y$10$kQCuxH7MOZ9xtPv0AURx8OysvT.gJ54vsxYNDx6SzOqIBY/vx9fNy', 'JHAHbQ', '', '0', 'U03350090783'),
('9987092002', 'MOH. AJI RIYAN SAPUTRA', 'L', 'TEGAL', '0000-00-00', '3328062605980003', 'Islam ', 'DESA DUKUHDAMU', '5', '3', '-', 'Dukuhdamu', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0993310    ', 'Asari', 'Umayah', 'LM 12 IA 2', '$2y$10$ia/5Yno5Yw/O6qTrcGpIIewY1sQ6rwAFU8l79BQ58jHOD3g2ufP0i', 'LugriV', '', '0', 'U03350090463'),
('9987093718', 'RIMA DIAN PRAMESTI', 'P', 'TEGAL', '0000-00-00', '3328074201980004', 'Islam ', 'CERIH - JATINEGARA', '10', '1', '-', 'cerih', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993588    ', 'JUWARI', 'WARSINIASIH', 'LM 12 IA 2', '$2y$10$5neCKGwzxjSoO79hJ6/0hegDCal8BFq9HCt7K5xkuXqs0x02/sEKK', '1FUIUt', '', '0', 'U03350090569'),
('9987093723', 'EMA NUR ISTIQOMAH ', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', '-', '10', '1', '-', 'CERIH', 'Kec. Jatinegara', NULL, 'DN-03 DI 1001760    ', 'MUHTAMAR', 'ERNI', 'LM 12 IS 1', '$2y$10$nh/h.qGCN4Lep78YplEPsOpTYr1Dsiobuzn06fDJ8wQGZchAwz4zm', '3pXSeo', '', '0', 'U03350091654'),
('9987094046', 'HIDAYATUL MUSTAFID', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DUKUH BANGSA RT 06/03 JATINEGARA', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0993539    ', 'Aksan', '-', 'LM 12 IA 5', '$2y$10$TLiQNJnJobDOyWDRCNlZUOGaX4PxooP2akiBrdd79AmZLhF9n.iNG', 'YJ9I0p', '', '0', 'U03350091405'),
('9987227211', 'AGUNG SETYAWAN', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'prof moh yamin', '4', '2', '-', 'pakembaran', 'Kec. Slawi', NULL, 'DN-03 DI 0279781    ', 'Carno', 'Suciati', 'LM 12 IS 3', '$2y$10$hEg6MNpdgPX8zfPqyShZze9HnWybAvM6/SlVxKEoySMH1cXTK4AQq', '2qnNy1', '', '0', 'U03350092249'),
('9987256382', 'YOGA PRASETYA', 'L', 'TEGAL', '0000-00-00', '3328100812980004', 'Islam ', 'JL. CUT NYAK DIEN BLOK I.1 RT. 3 RW. 08 KALIS', '3', '8', '-', 'KALISAPU', 'Kec. Slawi', '52416', 'DN-03 DI 0997273    ', 'Manis Wardiyanto', 'Sujiasih', 'LM 12 IA 2', '$2y$10$z9z47logM17jAP/QJFbCmOHDOcbeXY3UXwMkcrRFR3PXXRaak/3MG', 'PYr0V5', '', '0', 'U03350090632'),
('9987257570', 'FARAH FAHMA SILMI', 'P', 'TEGAL', '0000-00-00', '332810440798003 ', 'Islam ', 'JL.CUCUT NO.15', '5', '2', '-', 'KALISAPU', 'Kec. Slawi', '52416', 'DN-03 DI 0279683    ', 'MASRUKHIN', 'FARIDAH', 'LM 12 IS 2', '$2y$10$WzDuthqlSqwDm9oUXHDV5.WkLRyu07q0TY5HHAjABY9/1hPXkSFYW', 'v0hmd2', '', '0', 'U03350092009'),
('9987257575', 'RAHMAT AFFANDI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PERUM GPM KALISAPU BLOK A10 ', '5', '8', '-', 'Desa Kalisapu', 'Kec. Slawi', '52416', 'DN-03 DI 0997253    ', 'Kliwon', 'Masruroh', 'LM 12 IS 2', '$2y$10$bri7O.sd3eP3iQgTEEzpPONyMZVJ3bdgz1XHXySKiN3wFpGOGt2em', 'MSb5j0', '', '0', 'U03350092152'),
('9987257578', 'ALFI MUNA SYARIFAH', 'P', 'TEGAL', '0000-00-00', '3328105710980006', 'Islam ', 'Jl. Teri 2', '4', '7', 'karang moncol', 'kalisapu', 'Kec. Slawi', '52417', 'DN-03 DI 0279933    ', 'Munawar', 'kusriyati', 'LM 12 IS 1', '$2y$10$gab4NIUuHFdXsX8qtasF3uNND52ED8CC3.UpI9GjLTfMNwzwDtNfe', 'gc19Sv', '', '0', 'U03350091609'),
('9987295202', 'IMROATUL AZIZAH', 'P', 'TEGAL', '0000-00-00', '3328144703980007', 'Islam ', 'BREKAT RT 05/02 TARUB', '5', '2', 'Kubang', 'Brekat', 'Kec. Tarub', '52184', 'DN-03 DI 0999321    ', 'Nurochman', 'sailah', 'LM 12 IA 1', '$2y$10$bsdsPOrLkmE4YsoFwcPY.ue6REkDbkFgJMClrlW.RDHEOOeWCBY1K', '03M5w3', '', '0', 'U03350090143'),
('9987312863', 'FARAHDILA EKA YUNIASIH', 'P', 'TEGAL', '0000-00-00', '3328092102083799', 'Islam ', 'DS. BOGARES LOR RT. 05/01', '5', '1', '-', 'Bogares Lor', 'Kec. Pangkah', '52471', 'DN-03 DI 0996540    ', 'Wahadi', 'sulela', 'LM 12 IA 1', '$2y$10$WYBm.JtMtj6HUqRfNebcqegMy4r1Gs6yk6HTS54hQMtIFkYP1/RTK', 'kEiBt9', '', '0', 'U03350090125'),
('9987313194', 'GHANIY TRISTIANTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. GROBOG WETAN RT.04 RW.01 PANGKAH', '4', '1', '-', 'Desa Grobog wetan Rt 04/01', 'Kec. Pangkah', '52471', 'DN-03 DI 0996422    ', 'Drs. Trismanto', 'Dra. Suhartati', 'LM 12 IA 2', '$2y$10$Fv0sFjyvEgYKQvSsiRfOb.6b0AzHOFKWbQjfFCqO015avIDNkbaha', '9u7oCV', '', '0', 'U03350090427'),
('9987313215', 'ADELLA RIZQI NURSEPTIANA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. BOGARES LOR RT. 07/02 KEC. PANGKAH', '7', '2', '-', 'Bogares Lor', 'Kec. Pangkah', NULL, 'DN-03 DI 0997370    ', 'Bambang Haryanto', 'Rita Azizah', 'LM 12 IA 2', '$2y$10$QYvXQaYW32qGHq0MqVNjw.0UiVghry3dVVpuEIaq486BslSqT4esC', 'Jci6Co', '', '0', 'U03350090338'),
('9987313310', 'RISKA AINUN NISSA', 'P', 'TEGAL', '0000-00-00', '3328095307980007', 'Islam ', 'DS. JENGGAWUR RT. 04/01', '4', '1', '-', '-', 'Kec. Pangkah', '52471', 'DN-03 DI 0996374    ', 'SUKARDO', 'CHAYATI', 'LM 12 IA 4', '$2y$10$b5a1EpBjYgjDlUsYz/PsyOBOR3nKvDSUHIUTslPKk8JH/6.7Qpi72', 'wvPwqZ', '', '0', 'U03350091183'),
('9987313471', 'FEBRI DWI HARYANTO AFFUAN', 'L', 'KLATEN', '0000-00-00', '3328090702980003', 'Islam ', 'kalikangkung pangkah', '4', '2', '-', 'desa kalikangkung', 'Kec. Pangkah', '52471', 'DN- 03 DI 0989440   ', 'Drs. sodik', 'shita saraswati', 'LM 12 IS 2', '$2y$10$p9ye5uXJ0rJf.MeO2epbzuZlC.I07ePChoG8u.ywAJJH3rnNehLe.', 'TdO6pA', '', '0', 'U03350092018'),
('9987321584', 'DONI OKTA ARIEFIYANTO', 'L', 'TEGAL', '0000-00-00', '3328040410980001', 'Islam ', 'KEL. PROCOT KEC.SLAWI JL. NANGKA NO. 16 RT. 0', '3', '1', '-', 'PROCOT', 'Kec. Slawi', '52412', 'DN-03 DI 1004956    ', 'SUNARTO', 'SUGIARTI', 'LM 12 IA 5', '$2y$10$7IwM7lWOG.OctMoOvBO.Oe/1FqlgM/KAmUMZVl5NOUReDE9aK6bxm', 'aDKjah', '', '0', 'U03350091369'),
('9987338501', 'YENI LIZA SAFITRI', 'P', 'TEGAL', '0000-00-00', '3328091606094174', 'Islam ', 'KALIKANGKUNG RT 03/02 PANGKAH', '3', '2', '-', 'Kalikangkung', 'Kec. Pangkah', '52471', 'DN-03 DI 0989336    ', 'Drs. Mohamad Yahya', 'Siti Mulyati', 'LM 12 IA 3', '$2y$10$Gftk/Uh8tvPbznGzbMHF3OxtkJxTr0n44hRs/VYsZdTzgymODHokC', 'qhU5Y3', '', '0', 'U03350090952'),
('9987338626', 'NUR AENI', 'P', 'TEGAL', '0000-00-00', '3328096508980006', 'Islam ', 'Jl. Wungu No.2', '3', '6', 'Dk. Wungu', 'Pangkah', 'Kec. Pangkah', '52471', 'DN-03 DI 0996602    ', 'Tangkar', 'Siti Fatimah', 'LM 12 IS 3', '$2y$10$W.vtf77CK6DKRdaDpp9Z8etFC6akNG7JjowdJCkrL3Tst9BngF4wC', 'fzrkrV', '', '0', 'U03350092418'),
('9987350499', 'UTAMI DEWI PANGESTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA GROBOG KULON KEC.PANGKAH', '2', '3', NULL, 'Grobog Kulon', 'Kec. Pangkah', '52471', 'DN-03 DI 0989414    ', 'Muhamad Muslih', 'Malikhatun', 'LM 12 IA 4', '$2y$10$1fyMsfWKNEIFnThxSyFQ.uEy78QofK12ui5ge0CqYTB3kzS3MHPJa', 'vqTeW6', '', '0', 'U03350091263'),
('9987358138', 'ZULFIANA RAHMAWATI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Jl. Ketilang DS. TEMBOK KIDUL RT. 10/02', '10', '2', '-', 'Tembok kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990198    ', 'Akhmad Sekhu', 'Muniroh', 'LM 12 IA 3', '$2y$10$mqYaSJywvZpE8gzdFYDBcenfccsXaDR2bsnktibkffE6SaA6KuEaC', '0i6ot6', '', '0', 'U03350090969'),
('9987358369', 'NANDA RAFIKA PUTRI', 'P', 'TEGAL', '0000-00-00', '3328105503980002', 'Islam ', 'ASRAMA KEMANGLEN RT. 01 RW. 08 SLAWI', '1', '8', '-', 'Pakembaran', 'Kec. Slawi', '52416', 'DN-03 DI 0992879    ', 'Kaswin', 'Siti Rahmiana', 'LM 12 IA 3', '$2y$10$lAhvnoaPl0Y21gmjj09bNOWs9dFvedcyziEKlTdUwTDXtu7niTjfi', 'aT4QiY', '', '0', 'U03350090827'),
('9987358378', 'MUHAMAD ARFANI MURDIANTO', 'L', 'TEGAL', '0000-00-00', '3328111406990013', 'Islam ', '-', '18', '3', '-', 'Tembok Kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0283374    ', 'MOHAMAD JUMALI', 'KHALIFATUN', 'LM 12 IS 1', '$2y$10$nBPwvtyuOEh8pUeoTCm5FeddhocQ6WqGYSDc71mj9MU60iAqnmsxW', 'hUiZdO', '', '0', 'U03350091769'),
('9987358383', 'MONIKA PUTRI YULIASTANTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'KOMPLEKS KEMAYARAN BARU RT 21 RW 03 DESA TB.K', '21', '3', '-', 'TEMBOK KIDUL', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989651    ', 'MOHAMAD THOFIK', 'YULIATI', 'LM 12 IA 1', '$2y$10$CbzQJoe4yUSCEabmmf1wnen7Dvso3576LP/RXqjvxGer705dJBxlO', 'OnAAc7', '', '0', 'U03350090196'),
('9987359701', 'FIRDA ALFIATUN ANISA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. LEBAKWANGI RT.05 RW.03 JATINEGARA', '5', '3', '-', 'Lebakwangi', 'Kec. Jatinegara', '52473', 'DN-03 DI 0993542    ', 'Munasir', 'Parisah', 'XII SOS 1', '$2y$10$2CuS.otegtV7DI/ZkkIFceTxuJujqiTxwV39CnFCixxhSvgCXqaFq', '6iRl0o', '', '0', 'U03350091689'),
('9987372839', 'VIA OFTAMIA', 'P', 'TEGAL', '0000-00-00', '3328061504111298', 'Islam ', 'Jl. Krajan III . Lebaksiu Lor', '1', '5', '-', 'Lebaksiu Lor', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994732    ', 'Abdul Rosyid', 'Khalimah', 'LM 12 IA 2', '$2y$10$PiG3Yxv7bwi7jXrKEJS8buYnX2Xq1utDlFBeNeVVKWEps2LPyVe5O', 'AWsXF3', '', '0', 'U03350090614'),
('9987372877', 'WARDAH ARUMSARI', 'P', 'JAKARTA', '0000-00-00', '332809620898002 ', 'Islam ', 'DESA KENDALSERUT RT 06/02', '6', '2', '-', '-', 'Kec. Pangkah', '52471', 'DN-03 DI 0989338    ', 'Rasikun', 'sumarsih', 'XII MS 4', '$2y$10$eUCD5VSKgrROoPtQOLcFWehK11W6hn/7VSLg8mm3pNNsfdQnv8cyC', 'arbnxa', '', '0', 'U03350091272'),
('9987373011', 'SLAMET AJI WINOTO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. BLUBUK RT. 03/08 JL. G. KUMBANG KEC. DUKU', '3', '8', '-', 'BLUBUK', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0993135    ', 'KOSIM', 'SARITAH', 'LM 12 IS 1', '$2y$10$kkO26g7x2SbwiCHsf.H2Tu1cULxPjEhT5cfMo6A.jjlC.SeZhkV3C', 'oC86Sf', '', '0', 'U03350091849'),
('9987452829', 'IKHFI KAMALIYAH', 'P', 'TEGAL', '0000-00-00', '332809600698005 ', 'Islam ', 'KENDALSERUT', '4', '3', NULL, 'KENDALSERUT', 'Kec. Pangkah', '52471', 'DN-03 DI 0998063    ', 'PARTO', 'ETIK RISTIYANINGSIH', 'LM 12 IS 3', '$2y$10$qWFdWAjCi8h28gWYDno1n.wnq7Vm/fZ4AycrdjjX631PeYyDp.lb6', 'VthSol', '', '0', 'U03350092365'),
('9987453337', 'AMELIA KRISMIYANTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.ABIMANYU 40 RT 01/03 RANDUSARI PAGERBARANG', '1', '3', '-', 'Desa Randusari', 'Kec. Pagerbarang', '52462', 'DN-03 DI 0952641    ', 'Satori', '-', 'LM 12 IA 4', '$2y$10$T82V7IFfdUsQdjElbWERVOm7kOP28nXeP2onQDa8OoN37LYzk83dq', 'krfW0y', '', '0', 'U03350090987'),
('9987453361', 'RISKY AYU SISIANA', 'P', 'TEGAL', '0000-00-00', '3328051510099735', 'Islam ', 'JL. ABIMANYU NO. 40 RT. 03 RW. 03 DESA RANDUS', '3', '3', '-', 'RANDUSARI', 'Kec. Pagerbarang', '52462', 'DN-03 DI 0952614    ', 'SUSMINTO', 'SITI JAENAB', 'LM 12 IA 4', '$2y$10$oW1tFR5phTnJN.VzNjdw3Ou9QKfkTb7V065tC1k9Zj3.1VPusDVie', 'e0LW1e', '', '0', 'U03350091192'),
('9987475175', 'BARRU TRI PRAYOGO', 'L', 'TEGAL', '0000-00-00', '3328100106980005', 'Islam ', 'JL.KOLONEL SUGIONO NO.5 RT 18/07 SLAWI WETAN', '18', '7', '-', 'SLAWI WETAN', 'Kec. Slawi', '52411', 'DN-03 DI 0997766    ', 'SUNYOTO', 'WAHYUNI', 'LM 12 IA 1', '$2y$10$EGsMK3TY49OAoOEeSxk0q.ecVZHSt3Yp9e1VlcJeaiBlbPQGrm7YC', 'J8pGF3', '', '0', 'U03350090063'),
('9987478001', 'YOGA PRASETYO', 'L', 'TEGAL', '0000-00-00', '3328132411980003', 'Islam ', '-', '13', '3', NULL, 'Harjosari Lor', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990381    ', 'ARIF SATRIAWAN', 'MAE ANDRIYANI', 'LM 12 IS 3', '$2y$10$NjlL4/KTEOQqkZFbjBn99et.Nzi5O2Ny.chILQOaOhYPHIf0Cap7e', '1VDYhf', '', '0', 'U03350092543'),
('9987512854', 'ADJENG PERDANA PUTRI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DANARAJA, RT.02 RW.01 MARGASARI', '2', '1', 'Dukuh Langgir', 'Danaraja', 'Kec. Margasari', '52463', 'DN-03 DI 0995301    ', 'Dana Setiana', 'Duryati', 'LM 12 IA 5', '$2y$10$YD6lYmSgYWvqZaKDfgJV1uN3eOupxBtZtGMkx.IfEk0pEUrAGJjcu', 'T864kl', '', '0', 'U03350091298'),
('9987512946', 'WINARTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DANARAJA RT 04/04', '4', '4', 'Dukuh randu', 'Danaraja', 'Kec. Margasari', '52463', 'DN-03 DI 0995187    ', 'WASTAP', 'RADEM', 'LM 12 IA 1', '$2y$10$LJv9kq2.buTh3tn28j7/WOJbcU6vIByHpH3ZdOsjL/Xvuq20ktzxy', 'NOCLVD', '', '0', 'U03350090312'),
('9987516803', 'MUKHAMAD MUFLIKHUN', 'L', 'TEGAL', '0000-00-00', '3328031406980004', 'Islam ', 'jalan raya bojong lengkong', '3', '3', 'bojong krajan', 'bojong', 'Kec. Bojong', '52465', 'DN-03 DI 0991691    ', 'Slamet bunasor', 'juhariyah', 'LM 12 IA 3', '$2y$10$dWartadVrSQVAJdDZ3wi8.H2o7zSI.Ugr3vVyeUExuvntD43vyRYS', 'lFjnea', '', '0', 'U03350090818'),
('9987544942', 'NURUL MAULIDA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. PAGEDANGAN', '3', '1', '-', 'PAGEDANGAN', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990279    ', 'MAKMURI', 'ANISAH', 'XII SOS 3', '$2y$10$ZQ9NKdotc0noH...DlEG6.3zZa585V6QfaFPyOFRScEDwkC9jJru6', 'zsptf3', '', '0', 'U03350092436'),
('9987671312', 'ELLA AENATUN NADHIFAH', 'P', 'TEGAL', '0000-00-00', '3328111206980002', 'Islam ', 'DS. UJUNGRUSI RT.15/02 ADIWERNA', '15', '2', '-', 'ujungrusi', 'Kec. Adiwerna', '52194', 'DN- 03 DI 0990071   ', 'marzuki', 'siti fauziyah (alm)', 'LM 12 IS 2', '$2y$10$2ZgpSBaLRlwlqa0vDF795OUXAUC9lqQXAbTH4Xoq0daqw/EfFE/V2', 'UGPgvr', '', '0', 'U03350091965'),
('9987672071', 'SISKA NUR SHOFANIA', 'P', 'TEGAL', '0000-00-00', '3328096609980001', 'Islam ', 'JL.WARINGIN 10 GRIYA PANGKAH INDAH', '5', '7', '-', 'PANGKAH', 'Kec. Pangkah', '52471', 'DN-03 DI 0997397    ', 'SUTIJAN', 'SULASMI', 'LM 12 IA 3', '$2y$10$/QYfqxVfwDRBf84/XlQbF.VBuJoWYC/bE1NURNYyYXOU9YM6WGwJK', 'BIG6Rw', '', '0', 'U03350090934'),
('9987672074', 'RIZKA NOVITASARI', 'P', 'TEGAL', '0000-00-00', '3328095601980002', 'Islam ', 'DK. PESAWAHAN PANGKAH RT. 04/01', '4', '1', 'DK.Pesawahan', 'Pangkah', 'Kec. Pangkah', '52471', 'DN-03 DI 0997944    ', 'suwarso', 'sutrima', 'LM 12 IA 5', '$2y$10$smhpUDGxVF8W6L0J4oCsdeYiE1rN1agt4GDOkEi6Ayn6nQ2Wn22h2', 'gRwv0U', '', '0', 'U03350091512'),
('9987672228', 'DELIANDITA ABIDIN', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. CURUG RT. 01 RW. 02 PANGKAH', '1', '2', NULL, 'curug', 'Kec. Pangkah', '52471', 'DN-03 DI 0996541    ', 'jenal abidin', 'kusningsih', 'LM 12 IS 2', '$2y$10$Am2Rqbf3Qqa/hTgFaW2ZB.Q9f0WIm9i5iXPxsfRH.KfuZsKjYyRLa', 'seGeyN', '', '0', 'U03350091956'),
('9987672249', 'INTAN RIZKY NUR AFIFAH', 'P', 'TEGAL', '0000-00-00', '3328094712980001', 'Islam ', 'CURUG RT 03/1 PANGKAH', '3', '1', NULL, 'CURUG', 'Kec. Pangkah', '52471', 'DN-03 DI 0997288    ', 'MUSTADI', 'NAWANGSIH', 'LM 12 IS 3', '$2y$10$wChI07C/7Kc8zfRzH.tVMOA.3lW93/rRotrP/rM8ES/9I6VPUqOSW', 'damagH', '', '0', 'U03350092374'),
('9987674491', 'DEA AYU INTA VINATIKA', 'P', 'TEGAL', '0000-00-00', '3328085208980002', 'Islam ', 'DS. KEDUNGBANTENG RT. 12 RW. 06', '12', '6', NULL, 'kedungbanteng', 'Kec. Kedung Banteng', '52472', 'DN-03 DI 0996467    ', 'Suroto', 'Rosiah', 'LM 12 IA 5', '$2y$10$uCeI6/9KjcuJ7pD5XbvWkuZ8vIbN/VEVpd5JAW91lFmfSMh2jLcUq', '7U7URq', '', '0', 'U03350091352'),
('9987674636', 'NISA LULU AMALUNA', 'P', 'TEGAL', '0000-00-00', '3328095405980003', 'Islam ', 'JL.MELATI DESA DEPOK PANGKAH - TEGAL', '3', '1', NULL, 'Depok', 'Kec. Pangkah', '52471', 'DN-03 DI 0997950    ', 'Waja', 'Jen Warsinah', 'LM 12 IA 3', '$2y$10$OeYEUL35U2mJrlaU.FMbuuRfyUPDiwhW64XPOJm6lDXNWbaOj5FDy', 'ThM7MM', '', '0', 'U03350090836'),
('9987674652', 'ANGGRAHITA YULIASTIN PRATIWI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA DEPOK RT. 01 RW. 02 KEC. PANGKAH KAB. TE', '1', '2', 'Depok', 'Depok', 'Kec. Pangkah', '52471', 'DN-03 DI 0997346    ', 'UNTUNG ANDIANTO', 'SUTJI ARUM UTAMI', 'LM 12 IS 3', '$2y$10$JS6cUp4bmuirThPwDmSUU.ITNarg7FQ2JdIqTR2uYSZmqTljqB7xO', '7883io', '', '0', 'U03350092276'),
('9987674708', 'FEBRIANI INDAH NUR HIKMAWATI', 'P', 'TEGAL', '0000-00-00', '3328094702980002', 'Islam ', 'PENUSUPAN RT 02/03', '2', '3', 'Penusupan', 'Penusupan', 'Kec. Pangkah', '52471', 'DN-03 DI 0997311    ', 'SAKRONI', 'ENI MARYATI', 'LM 12 IS 4', '$2y$10$vMI554OGa7V6XKAFqrJXxu44vq4RMbj4F.9jnokrE/qZaMMSpC5Hy', 'APGXBG', '', '0', 'U03350092694'),
('9987839055', 'MUKHAMAD FITROH ALDI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.RAYA KALIWADAS', '1', '1', '-', 'KALIWADAS', 'Kec. Adiwerna', '52194', 'DN- 03 DI 0990533   ', 'Alim Riyanto', 'Siti Rodiah', 'LM 12 IA 1', '$2y$10$rzHBmyWF6hc230MGaeURTOLaKNRn/D5nF4yU.m38/c95eUvbYbaw6', 'z49o6g', '', '0', 'U03350090205'),
('9987877034', 'PULIYA USWATUN KHASANAH', 'P', 'TEGAL', '0000-00-00', '3328035103980004', 'Islam ', 'jln.pramuka suniarsih', '4', '1', '-', 'Suniarsih', 'Kec. Bojong', '52465', 'DN-03 DI 0991614    ', 'Topani', 'Hj.Umi Kholasoh', 'LM 12 IS 1', '$2y$10$/zXFgY.HXWJdiOtPxsuabOWe07su5AzSVbNucNhwquBvR9Z3ijeE.', 'uHLsl9', '', '0', 'U03350091805'),
('9987895273', 'IZATI DWI CAHYARINI', 'P', 'TEGAL', '0000-00-00', '3328097108980001', 'Islam ', 'JL. MBAH KEJAKSAN RT. 01 RW. 06 GROBOG WETAN ', '1', '6', '-', 'GROBOG WETAN', 'Kec. Pangkah', '52471', 'DN-03 DI 0996614    ', 'Sunarto', 'Suhesti', 'LM 12 IA 5', '$2y$10$tqtxe8rdsmlXDOnCQq2umuq9x8l1pokWQzGtYoTEz1CZrzwPN7xNC', 'RVUf8R', '', '0', 'U03350091432'),
('9987895600', 'ARRINAL SHOLIFADLIQ', 'L', 'TEGAL', '0000-00-00', '3328101403980002', 'Islam ', 'JL. TERI 2', '2', '5', '-', 'KALISAPU', 'Kec. Slawi', '52416', 'DN-03 DI 0989672    ', 'TARSO', 'MURSITI', 'LM 12 IS 1', '$2y$10$nifR1IlBCpk7NPgFdQ3.1.kSgFPKEMFZIWS7InN7eNdLUwYaSk5Zy', 'CUHCLG', '', '0', 'U03350091627'),
('9987895650', 'SELVY AINUN NURSYAMSIYAH', 'P', 'TEGAL', '0000-00-00', '3328105304980010', 'Islam ', 'JL.PERKUTUT B.26 SLAWI KULON', '3', '1', '-', 'SLAWI KULON', 'Kec. Slawi', '52419', 'DN-03 DI 0279392    ', 'SYAMSU RIZAL', 'SUGIARTI', 'LM 12 IA 1', '$2y$10$3BfPjKEGx5XX9BihjQ/hGO5EmI962gCUpEF1b9muyPNyr1jxW53TG', 'jBzPAR', '', '0', 'U03350090267'),
('9987895654', 'MEZA SAPTINO AJI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PERUM KABUNAN ASRI BLOK B.1 RT O5/01', '5', '1', '-', 'desa kabunan', 'Kec. Dukuhwaru', '52451', 'DN-03 DI 0997332    ', 'Suyono', '-Rahayu Budi Astuti', 'LM 12 IS 1', '$2y$10$HdYDp0Xq0rz2KHxgeAJqnOpiwqKVTFYLQ9ETdU3JsIKfzqqxHzC16', 'hsGt6j', '', '0', 'U03350091734'),
('9987895659', 'RAGA PERTAMA ADHI BANGKIT MAHENDRA', 'L', 'TEGAL', '0000-00-00', '3328102402080010', 'Islam ', 'JL. WIJAYA KUSUMA 12 NO. 27, RT. 3 RW. 05. KU', '3', '5', NULL, 'Kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 0997380    ', 'ADI SUCIPTO', 'SRI HENDRAT ASTUTI', 'LM 12 IS 3', '$2y$10$Kcx4yJc0wHpdevFGgL8d7uXVkJ4yXREhA2YVI3G3kY.wxnfVyYLLq', '30lXNr', '', '0', 'U03350092463'),
('9987895665', 'ANGGUN NOER MAULIDA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PERUM GRIYA INDAH DUKUHWRINGIN', '8', '3', '-', 'Desa Dukuhringin', 'Kec. Slawi', '52419', 'DN-03 DI 0989565    ', 'SUPRIYANTO', 'ARUM RISTIANI', 'LM 12 IS 3', '$2y$10$a7KdP4fK5zeSzH2MmmmeXO/JhjctWcp/U24iAbKjLk8yBa2W9Uku6', 'r71Lhq', '', '0', 'U03350092285'),
('9987895680', 'FAUZIAH GIYANTI', 'P', 'BEKASI', '0000-00-00', '-               ', 'Islam ', 'PERKUTUT', '3', '1', '-', 'SLAWI KULON', 'Kec. Slawi', '52401', 'DN-03 DI 0997438    ', 'GIGIH SUGIHARSO', 'HERNI SRI SURJANTI', 'LM 12 IA 2', '$2y$10$lx3ZF9OiOiwDJCM6mwQBbebjbEJQ6MC8Jk1FSuMWXTP1ER6WVpv3y', 's3BNgk', '', '0', 'U03350090409'),
('9987896113', 'SAHID ABDULLOH YUSRO', 'L', 'TEGAL', '0000-00-00', '3328091005980007', 'Islam ', 'BOGARES KIDUL', '19', '3', '-', 'BOGARES KIDUL', 'Kec. Pangkah', '52471', 'DN-03 DI 0996483    ', 'ABDUL WAHID', 'SAHIRAH', 'LM 12 IA 2', '$2y$10$ojeUygI2L7l5r9xcsg6r3ext3v.mqSNELxYzAcZoywcnxgdxVdcgC', '0XUcVf', '', '0', 'U03350090578'),
('9987896125', 'YULIANI WAHYU LESTARI', 'P', 'TEGAL', '0000-00-00', '3328096207980005', 'Islam ', 'BOGARES KIDUL RT 12/02', '12', '2', '-', 'bogares kidul', 'Kec. Pangkah', '52471', 'DN-03 DI 0996438    ', 'RIYANTO', 'KARNITI', 'LM 12 IS 1', '$2y$10$UVM4TvaTmrwOSVplNeKcFeQlLYrVmkpZKcNBz0AldGc35ft89xoAq', 'W5w9Ik', '', '0', 'U03350091903'),
('9987896135', 'ILHAM WICAKSONO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA DUKUH JATI KIDUL RT. 02 RW. 03', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0996898    ', 'Suparman', '-', 'LM 12 IS 4', '$2y$10$QpHkyux1zC5izkvP9aadiO4I77sXyTicXuD8XqSGl2iqeViZeu9T6', 'X416Zd', '', '0', 'U03350092747'),
('9987896169', 'ARIF WICAKSONO', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PAGIYANTEN RT 15/04 ADIWERNA', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0989706    ', 'A. Manap', '-', 'LM 12 IS 1', '$2y$10$sAHQhkJ3TUDzmsUXTgVER.NIX8vYGs/vvt/gD1pjxJxlZ35LGgxk.', 'p97xgG', '', '0', 'U03350091618'),
('9987896287', 'NURUL AULIA', 'P', 'TEGAL', '0000-00-00', '3328116404980008', 'Islam ', 'ADIWERNA RT. 03/01 KEC. ADIWERNA', '3', '1', 'PESAWAHAN', 'ADIWERNA', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990280    ', 'M. ARIFIN', 'Drs. Hj. KUSMIYATI', 'LM 12 IA 2', '$2y$10$DgbRQOsUTBN4geqITUGLzuFWEkEP30UuSSAw.XkE6gCV.Ze6hNiti', 'fHt61c', '', '0', 'U03350090534'),
('9987896669', 'YUDHA PRATAMA PURWANTO', 'L', 'TEGAL', '0000-00-00', '3328092302084086', 'Islam ', 'Jl.sawo matang komplek masjid At-taqwa', '9', '2', 'BEDUG', 'BEDUG', 'Kec. Pangkah', '52471', 'DN-03 DI 0989335    ', 'AGUS PURWANTO', 'LUTFIATUN NADIROH', 'XII MS 2', '$2y$10$76ZQUA/gaNCt/z2TkydWIOCoYSvmwI6y7WlVDWr.G9dJRcqxusJIO', 'K0sdjK', '', '0', 'U03350090649'),
('9988013479', 'FANNI NADITYA PUTRA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PERUM TAMAN INDO KALIWADAS RT.13/02', '13', '2', '-', 'Desa Kaliwadas', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990330    ', 'Hadi Riyanto - Ernawati', 'Ernawati', 'LM 12 IS 2', '$2y$10$gnn50MMF1hdaz.c3STSQy.NCxZiJiB3cRZNbmed60okv9PYhpfYXG', 'ynGp8k', '', '0', 'U03350091992'),
('9988013505', 'ARKHAN IVANDIARSO', 'L', 'TEGAL', '0000-00-00', '3328110208980005', 'Islam ', '-', '7', '2', '-', 'Harjosari Kidul', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990039    ', 'Budiarso', 'Suratmi', 'LM 12 IA 5', '$2y$10$bzL1KNag//DM4bknWm0fMenYMzeR/q5xY4gRqX5ftJZwlymI.M.FO', 'vreXuM', '', '0', 'U03350091325'),
('9988031199', 'RHESTY CHAHYA MULYANINGROOM', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PESAREAN RT. 15 RW. 04 JL. SITUNGGUL KECAMATA', '15', '4', '-', 'pesarean', 'Kec. Adiwerna', '52194', 'DN-03 DI 0998465    ', 'sutarman', 'dairoh', 'LM 12 IS 3', '$2y$10$DeIOTzZ9QKEw3P0hqt/GS.oLxy7Z2bOCgLRPsE0pJuRmOvuN96xL.', 'KwO3KU', '', '0', 'U03350092489'),
('9988031337', 'FIRDA AYU ALDILLA', 'P', 'TEGAL', '0000-00-00', '3328114104980003', 'Islam ', 'TEMBOK BANJARAN', '2', '1', NULL, 'TEMBOK BANJARAN', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990763    ', 'Drs. Fachrudin', 'TSAMROTUL JANAH', 'LM 12 IS 3', '$2y$10$Zh4epsznc2Z38NRz3VQE5uf.d/KOqSWWAgSS.eQoJPzWcsHZU/iFO', 'TkKwzd', '', '0', 'U03350092347'),
('9988031385', 'MUHAMMAD SYAHRUL MUBAROK', 'L', 'TEGAL', '0000-00-00', '3328112005980009', 'Islam ', 'TEMBOK LOR RT 04 RW 03', '14', '3', '-', 'Tembok Lor', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989654    ', 'JAELANI', 'DANINGSIH', 'LM 12 IA 2', '$2y$10$CoYvovkkajQW8IZG93j9V.SchZghPtyosi301WJVR.hfqaFEKUYDi', 'd8BIhW', '', '0', 'U03350090489'),
('9988350571', 'RIZKI TRI MEI AMALIA', 'P', 'TEGAL', '0000-00-00', '3328115305980001', 'Islam ', 'TEMBOK LUWUNG, JL.AMPEL GADING RT.26 RW.6', '26', '6', '-', 'TEMBOK LUWUNG', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989613    ', 'SUNYOTO, S.Pd I', 'ENNIE HERAWATI', 'XII MS 3', '$2y$10$WGc7.UDxF5uVTeoJePH1ceVCPddNXij9aeK6UuUoPvGp97eo8CZNe', 'aDyWyQ', '', '0', 'U03350090898'),
('9988425658', 'GINA YUDITYA ANDINI', 'P', 'TEGAL', '0000-00-00', '3328115812980003', 'Islam ', 'JL. BEJI NO. 2', '34', '3', '-', 'Pesalakan', 'Kec. Adiwerna', '52194', 'DN-03 DI 0990068    ', 'Khanafi', 'Hj.Titik Haryati', 'LM 12 IS 4', '$2y$10$z/HfIuUh3ttXexD1Z2PFMePCD8zOtXl/B9LjZ2J7JPftKfyuT1cIm', 'WdSZx4', '', '0', 'U03350092729'),
('9988608848', 'IKA SEPTI ISNA ZUHBIAH', 'P', 'TEGAL', '0000-00-00', '3328072002080814', 'Islam ', 'JATINEGARA', '14', '2', 'penyalahan', 'Ds.penyalahan', 'Kec. Jatinegara', '52473', 'DN-03-DI 0993678    ', 'Wahyudin', 'Muhibah Amk', 'LM 12 IS 2', '$2y$10$lx7e5lUJvXNWsNLUHeulMubxDqeOpgWxGVf4/ZNb8FD4SbWbmN47S', 'DwjLFC', '', '0', 'U03350092045'),
('9988755362', 'LARASATI', 'P', 'TEGAL', '0000-00-00', '3328166106980002', 'Islam ', 'DS. KARANGMULYA RT. 01 RW. 08 KEC. SURADADI', '1', '8', 'SIMENDOT', 'KARANGMULYA', 'Kec. Suradadi', '52182', 'DN-03 DI 0994538    ', 'EDY ISTANTO', 'RONITI', 'LM 12 IA 1', '$2y$10$fLyHmotuaVwvjiQHCoDFC.07mPBdMIbV8jL7j5FcQVCXHdzwrn6hG', 'SIt3o6', '', '0', 'U03350090187'),
('9988755795', 'YENI RIZKI AMALIAH', 'P', 'TEGAL', '0000-00-00', '33281649089001  ', 'Islam ', 'DS. GEMBONGDADI RT.07 / RW.03', '7', '3', 'DK.CEMPAKA', 'GEMBONGDADI', 'Kec. Suradadi', '52179', 'DN-03 DI 0993950    ', 'Drajat', 'Nur Khikmah', 'LM 12 IA 5', '$2y$10$0ber.tEMGD4nKXAr9emJ/edmuxB6IJRVSMrrPKhuAVcwCQFMKeNmG', '3aOdZZ', '', '0', 'U03350091583'),
('9988955302', 'NUR MALITA SARI', 'P', 'TEGAL', '0000-00-00', '3328146211980007', 'Islam ', 'DS. SETU RT. 03/ RW. 02', '3', '2', '-', 'Setu', 'Kec. Tarub', '52184', 'DN-03 DI 0998738    ', 'Arrohman', 'Sugiharti', 'LM 12 IS 3', '$2y$10$wH5FXzdq6T9PF1KhZxo5aOxBeHCz602Mh9Mz/7PawKR0fBNXxZBvC', 'IOMcwa', '', '0', 'U03350092427'),
('9989638713', 'NUR AENI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DUKUH PULE GUNUNG AGUNG BUMIJAWA', '1', '1', 'dukuh pule', 'gunung agung', 'Kec. Bumijawa', '52466', 'DN-03 DI 0283781    ', 'Kalyub', 'Ronah', 'LM 12 IA 4', '$2y$10$CPemkcdlUX1ZnSezRxO7Y.i3z8eX0pEdCqLBW2m/B7iQ8DAVrjvJy', 'CzigLS', '', '0', 'U03350091138'),
('9989761727', 'ARDHI RAYHAN EKA PUTRA', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BTN KUDAILE JL. WIJAYA KUSUMA 6 NO. 10 RT. 04', '4', '5', 'Kudaile', 'Kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 0997444    ', 'Abu Choir Rachmat Eka Putra', 'Salimah', 'LM 12 IS 3', '$2y$10$nqoSmQOU.GXeeWceinn12OBh35mN4za1JbyTy8A6mVrMx9gcvJx.m', 'E9jQbJ', '', '0', 'U03350092294'),
('9989814601', 'INTAN JUSTITIA DEWI', 'P', 'PEKALONGAN', '0000-00-00', '3328104103980006', 'Islam ', 'JL. GATOT SUBROTO NO.19 SLAWI KULON', '4', '7', '-', 'Slawi kulon', 'Kec. Slawi', '52419', 'DN-03 DI 0997411    ', 'Purwantoro', 'Sri Herwanti', 'LM 12 IA 5', '$2y$10$F/HgbiFBzHnzhsPZ0rEJOuibFkwRbbwLBH/2zxEqi6KypYZFioDry', 'nyWKRh', '', '0', 'U03350091423'),
('9990703159', 'RIZA HADI ZAMZAMI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'BULAKWARU BARAT', '4', '3', '-', 'BULAKWARU', 'Kec. Tarub', '52184', 'DN-03 DI 0279535    ', 'SUGENG', 'SRI REJEKI PANGESTUTI', 'LM 12 IS 2', '$2y$10$vawudmJhdxpGX3xtwZaUnucFepr8tdt2tT.o3tfNcnEOitV0QQb1W', 'H08gyg', '', '0', 'U03350092187'),
('9992578205', 'SHINTA PRADIAN SARI', 'P', 'BANDA ACEH', '0000-00-00', '-               ', 'Islam ', 'dukuh wringi griya safira Q.9', '7', '3', '-', 'dukuh wringin', 'Kec. Slawi', '52411', 'DN-03 DI 0279665    ', 'wanto', 'rosmala dewi', 'LM 12 IA 3', '$2y$10$sWfyZ46OzQLYKYVgEeWoqOjdp12/te2VJGLTK6MPw8I16R.ctjfJO', 'gY7Fl5', '', '0', 'U03350090925'),
('9993166663', 'NELY LUSIANA', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DESA PECABEAN KEC. PANGKAH KAB. TEGAL', '12', '4', '-', 'PECABEAN', 'Kec. Pangkah', '52471', 'DN-03 DI 0990866    ', 'EDI', 'WIWI NURHAYATI', 'LM 12 IA 1', '$2y$10$1C3uK/.c5kxfZuzMPBNGLOqXp7Qf8MfSCYJieYFGCF9IrKp/MPGAq', 'QM7VXv', '', '0', 'U03350090214'),
('9993755357', 'PUTRI IMALA DEWI', 'P', 'TEGAL', '0000-00-00', '3328064401990002', 'Islam ', 'DUKUHLO RT 03/04 LEBAKSIU', '3', '4', '-', 'DUKUHLO', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994700    ', 'NURIDIN', 'JANATIN', 'LM 12 IA 3', '$2y$10$lB3taQfI89AuqIXGBqnkx.l.JHY3GVDey7fsX2JyPITikDnuXVC9O', 'sI2kgy', '', '0', 'U03350090872'),
('9994969666', 'ANIS TAUCHIDA', 'P', 'TEGAL', '0000-00-00', '3328095601990001', 'Islam ', 'JL.Cemara', '8', '2', '-', 'Talok', 'Kec. Pangkah', '52470', 'DN-03 DI 1003091    ', 'Mukhlison', 'Tutur Rahayu', 'LM 12 IS 4', '$2y$10$u8M6YCuVl9BcOtJbRhtlA.BCfinQGxipw.p1Xs8wzqGAJxppm8QTe', 'qSwaOM', '', '0', 'U03350092596'),
('9994972818', 'RETNO FEBRIYANI PUTRI', 'P', 'KARANGANYAR', '0000-00-00', '3313045502990001', 'Islam ', 'JL. IMAM BONJOL NO. 68 RT. 01/01 KUDAILE SLAW', '1', '1', '-', 'kudaile', 'Kec. Slawi', '52413', 'DN-03 DI 1002032    ', 'sukadi', 'saryani', 'LM 12 IA 1', '$2y$10$Vnod1/eqFdxiXOqT8emgv..pVMUnpoKNSU35g2oeKATS.lMKpkL4y', 'E7wKBy', '', '0', 'U03350090258'),
('9996872318', 'PIPIT AYUNING PRAMESTI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'JL.RANTENSARI NO.36', '8', '1', '-', 'Pagedangan', 'Kec. Adiwerna', '52194', 'DN-03 DI 0989542    ', 'Rokhim Sudiharjo', 'Aniroh', 'LM 12 IA 4', '$2y$10$RHCJMu/iQN07ZFhc2Yi7P.vWtGh7.rnRr.cYkNZ0GMq.tCZls.q/W', 'elYGJA', '', '0', 'U03350091147'),
('9996910073', 'FAJAR SUHARJO', 'L', 'TEGAL', '0000-00-00', '3328040104990004', 'Islam ', 'JL. PISANG RT. 06 RW. 01 NO. 35 BALAPULANG', '6', '1', 'BALAPULANG WETAN', 'BALAPULANG WETAN', 'Kec. Balapulang', '52464', 'DN-03 DI 0991021    ', 'kuntoro', 'teguh rahayu', 'LM 12 IA 1', '$2y$10$/bF7OMDl1INxXa9fLXxo5u/tk../FIbMM9qlNZPhGuVdprWoCNaMS', 'goiJGq', '', '0', 'U03350090116'),
('9996939791', 'RIZANATUL FITRI', 'P', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'Ciwareng No.2', '7', '1', '-', 'Gembong Kulon', 'Kec. Talang', '52189', 'DN-03 DI 0998428    ', 'Kamali', 'Supaedah', 'LM 12 IS 1', '$2y$10$S5cea3tdFlxo6tANx36cWeWDHhGcTIUYsrofIBjEKynqIaIOROQDW', 'OYECOO', '', '0', 'U03350091823'),
('9997033558', 'GEMINTANG SEPTHI NAZIHA', 'P', 'TEGAL', '0000-00-00', '3328066209990007', 'Islam ', 'LEBAKSIU KIDUL RT 02/06', '2', '6', '-', 'Lebaksiu Kidul', 'Kec. Lebaksiu', '52461', 'DN-03 DI 0994649    ', 'Drs. WAHYUDI', 'IRIN SUHERDIANI', 'LM 12 IA 2', '$2y$10$6HUhVTPhQ56827qJM0WQtuaQr4JZmCYXDhCG0kJEkWDoF.zLCaAM.', 'ZQPWN1', '', '0', 'U03350090418'),
('9997126560', 'AJI ASY''ARI', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'DS. HARJOSARI LOR RT. 05 RW. 01', '0', '0', '-', 'DS. HARJOSARI LOR RT 05 RW 01', 'Kec. Adiwerna', NULL, 'DN-03 DI 0990041    ', 'Akhmad Soleh', '-', 'LM 12 IS 3', '$2y$10$/1UvC04gg4yoYNRCbHJYq.hQP7F3rzdZ3JGCA81D0EBhLg1W8duYu', '2vthuX', '', '0', 'U03350092258'),
('9997343242', 'AENUN INTAN MAULIYANAH', 'P', 'TEGAL', '0000-00-00', '3328094707990002', 'Islam ', 'DS. BEDUG RT. 10 RW. 03 KEC. PANGKAH KAB. TEG', '10', '3', '-', 'BEDUG', 'Kec. Pangkah', '52471', 'DN-03 DI 0990084    ', 'AWAN HARI SAPTONO', 'NOOR AENI WIDIYATI', 'LM 12 IA 3', '$2y$10$NSKQliGZL16Ah4N/yD1XMe1C2C490OIU4VHGi6g7iDhXNSc4YQniC', 'PDYTdY', '', '0', 'U03350090658'),
('9997631526', 'LAILINA QADRIN', 'P', 'TEGAL', '0000-00-00', '3328095001990004', 'Islam ', 'JALAN DESA KENDAL SERUT LINGKUNGAN JALINGKOS', '3', '1', '-', 'KENDAL SERUT', 'Kec. Pangkah', '52471', 'DN-03 DI 0997989    ', 'ACHMAD CHOLIK', 'BONGLIN', 'LM 12 IA 1', '$2y$10$qUK4my2hhN8EUfMyC1KhGuxoPnkh5gC3a5eLRRVyckImPC3XQyh1e', 'guG9nm', '', '0', 'U03350090178'),
('9998038033', 'DWI RANGGA YUSMI YANUAR', 'L', 'TEGAL', '0000-00-00', '-               ', 'Islam ', 'PAGEDANGAN RT.06/01 ADIWERNA', '0', '0', '-', '-', 'Indonesia                     ', NULL, 'DN-03 DI 0990289    ', 'Yusron', '-', 'LM 12 IS 4', '$2y$10$SIlpja0Bvm4CIrPsfYxaDuP3hYaNjClo5FQ5WBoTw7K2DInFA9nCO', 'wFHz9p', '', '0', 'U03350092676');
INSERT INTO `siswa` (`nis`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `nik`, `agama`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `no_skhun`, `nm_ayah`, `nm_ibu`, `kd_kelas`, `password`, `password_asli`, `remember_token`, `status`, `no_peserta`) VALUES
('9998051661', 'ROSALINA FITRIYAH', 'P', 'TEGAL', '0000-00-00', '3328096501990004', 'Islam ', 'JALAN CEMPAKA VI DESA DUKUHJATI KIDUL RT 04/0', '4', '2', '-', 'DUKUHJATI KIDUL', 'Kec. Pangkah', '52471', 'DN-03 DI 0996519    ', 'KARNO', 'MUSLIKHATUN', 'LM 12 IA 5', '$2y$10$KAz2q37cML9dH4ZZC3g4J.dM9ICsw5vXYmVBfzgt56nlj26B2oTRq', 'JFYYbn', '', '0', 'U03350091529');

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
(4, 'MTK', 'ims', 0, '123');

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

--
-- Dumping data for table `soal_siswa`
--

INSERT INTO `soal_siswa` (`id`, `id_soal`, `id_detail_soal`, `id_jadwal`, `id_detail_jadwal`, `soal_ke`, `nis`, `jawaban`, `status`, `selesai`, `benar`) VALUES
('07317ce0f646424fa8a94b9f445dec1c', 4, 23, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 19, '9947233221', 'c', '1', 'Y', 'Y'),
('21793eb83c0f4c5087b375df0c74747e', 4, 15, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 2, '9947233221', 'a', '0', 'Y', 'Y'),
('21ce22985b4942918984ebf11df36478', 4, 12, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 8, '9947233221', 'b', '1', 'Y', 'Y'),
('45ffa5408f4c4b12a1c137c1af7996c4', 4, 21, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 16, '9947233221', 'a', '0', 'Y', 'N'),
('4c18e31be1024cd6a8d5b7c63a82f299', 4, 14, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 15, '9947233221', 'a', '0', 'Y', 'Y'),
('518d24f883144dbb93644031a5a813a3', 4, 27, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 18, '9947233221', 'a', '0', 'Y', 'Y'),
('54e17f9da9ed4c14b1013bc9a05b3b53', 4, 13, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 1, '9947233221', 'b', '1', 'Y', 'N'),
('7673b4e748ea4deca72683d0d6dbafc0', 4, 18, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 10, '9947233221', 'a', '0', 'Y', 'Y'),
('8a24858d79834e2bb4c1e2704735e3cc', 4, 20, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 13, '9947233221', 'a', '0', 'Y', 'Y'),
('94ed84318ed64a6e8468c693caba7a0a', 4, 26, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 6, '9947233221', 'a', '0', 'Y', 'Y'),
('983e47efa46b4778a783342adfa2f642', 4, 11, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 7, '9947233221', 'a', '0', 'Y', 'Y'),
('9aa6d44c5e5c4fc5865216dfca033664', 4, 16, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 12, '9947233221', 'a', '0', 'Y', 'Y'),
('9f8652d8683b4049a4d3a4f15b89511d', 4, 17, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 9, '9947233221', 'a', '0', 'Y', 'Y'),
('a50294e250994838aa25a46a5507b9f7', 4, 10, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 17, '9947233221', 'a', '0', 'Y', 'Y'),
('b0abd4f7f2cd40db9689116cbb46750f', 4, 24, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 14, '9947233221', 'a', '0', 'Y', 'Y'),
('ce11781e9c2c43a7b8cc0dcf8df89f1d', 4, 22, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 4, '9947233221', 'c', '1', 'Y', 'Y'),
('ce44b45ba9434794925ef2294a22e635', 4, 25, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 5, '9947233221', 'a', '0', 'Y', 'Y'),
('e1158e9f7d074818ae83129072868177', 4, 19, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 3, '9947233221', 'a', '0', 'Y', 'Y'),
('e9ebc2b0aa3b478a8750fd25104b796f', 4, 28, '15ae2c25dbe24ccf91868e5b8b7debac', 'cecba4b7069a456389ee5bd34e0e68e8', 11, '9947233221', 'a', '0', 'Y', 'Y');

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
