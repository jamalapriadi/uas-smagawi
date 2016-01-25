SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`jurusan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jurusan` (
  `kode_jurusan` VARCHAR(5) NOT NULL,
  `nama_jurusan` VARCHAR(45) NULL,
  PRIMARY KEY (`kode_jurusan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`kelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`kelas` (
  `kd_kelas` VARCHAR(10) NOT NULL,
  `kelas` VARCHAR(5) NULL,
  `kode_jurusan` VARCHAR(5) NULL,
  `sub_kelas` INT NULL,
  PRIMARY KEY (`kd_kelas`),
  INDEX `index2` (`kode_jurusan` ASC),
  CONSTRAINT `fk_kelas_1`
    FOREIGN KEY (`kode_jurusan`)
    REFERENCES `mydb`.`jurusan` (`kode_jurusan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mapel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mapel` (
  `kd_mapel` VARCHAR(10) NOT NULL,
  `nm_mapel` VARCHAR(45) NULL,
  PRIMARY KEY (`kd_mapel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`siswa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`siswa` (
  `nis` INT NOT NULL,
  `nisn` VARCHAR(45) NULL,
  `nama` VARCHAR(45) NULL,
  `kelas` VARCHAR(5) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`nis`),
  INDEX `index2` (`kelas` ASC),
  CONSTRAINT `fk_siswa_1`
    FOREIGN KEY (`kelas`)
    REFERENCES `mydb`.`kelas` (`kd_kelas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`guru`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`guru` (
  `nip` VARCHAR(25) NOT NULL,
  `nama` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `kd_mapel` VARCHAR(10) NULL,
  PRIMARY KEY (`nip`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `index3` (`kd_mapel` ASC),
  CONSTRAINT `fk_guru_1`
    FOREIGN KEY (`kd_mapel`)
    REFERENCES `mydb`.`mapel` (`kd_mapel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ruang_ujian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ruang_ujian` (
  `id_ruang` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ruang` VARCHAR(45) NULL,
  `kuota` VARCHAR(45) NULL,
  PRIMARY KEY (`id_ruang`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jadwal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jadwal` (
  `id_jadwal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_mapel` VARCHAR(10) NULL,
  `tgl_ujian` DATE NULL,
  `jam` TIME NULL,
  PRIMARY KEY (`id_jadwal`),
  INDEX `index2` (`kd_mapel` ASC),
  CONSTRAINT `fk_jadwal_1`
    FOREIGN KEY (`kd_mapel`)
    REFERENCES `mydb`.`mapel` (`kd_mapel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pengawas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pengawas` (
  `nip` VARCHAR(25) NOT NULL,
  `nama` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`nip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detail_jadwal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`detail_jadwal` (
  `id` INT NOT NULL,
  `id_jadwal` INT UNSIGNED NULL,
  `kd_kelas` VARCHAR(10) NULL,
  `jam_mulai` TIME NULL,
  `id_ruang` INT UNSIGNED NULL,
  `status` ENUM('0','1','2') NULL,
  `pengawas` VARCHAR(25) NULL,
  PRIMARY KEY (`id`),
  INDEX `index2` (`kd_kelas` ASC),
  INDEX `index3` (`id_jadwal` ASC),
  INDEX `index4` (`id_ruang` ASC),
  INDEX `index5` (`pengawas` ASC),
  CONSTRAINT `fk_detail_jadwal_1`
    FOREIGN KEY (`kd_kelas`)
    REFERENCES `mydb`.`kelas` (`kd_kelas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_jadwal_2`
    FOREIGN KEY (`id_jadwal`)
    REFERENCES `mydb`.`jadwal` (`id_jadwal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_jadwal_3`
    FOREIGN KEY (`id_ruang`)
    REFERENCES `mydb`.`ruang_ujian` (`id_ruang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detail_jadwal_4`
    FOREIGN KEY (`pengawas`)
    REFERENCES `mydb`.`pengawas` (`nip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`soal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`soal` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_mapel` VARCHAR(10) NULL,
  `kode_jurusan` VARCHAR(5) NULL,
  `waktu_ujian` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `index2` (`kd_mapel` ASC),
  INDEX `index3` (`kode_jurusan` ASC),
  CONSTRAINT `fk_soal_1`
    FOREIGN KEY (`kode_jurusan`)
    REFERENCES `mydb`.`jurusan` (`kode_jurusan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_soal_2`
    FOREIGN KEY (`kd_mapel`)
    REFERENCES `mydb`.`mapel` (`kd_mapel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detail_soal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`detail_soal` (
  `id` INT NOT NULL,
  `id_soal` INT UNSIGNED NOT NULL,
  `soal_ke` INT NOT NULL,
  `pertanyaan` VARCHAR(255) NULL,
  `gambar` VARCHAR(255) NULL,
  `jawaban_a` VARCHAR(255) NULL,
  `jawaban_b` VARCHAR(255) NULL,
  `jawaban_c` VARCHAR(255) NULL,
  `jawaban_d` VARCHAR(255) NULL,
  `jawaban_e` VARCHAR(255) NULL,
  `kunci_jawaban` ENUM('a','b','c','d','e') NULL,
  PRIMARY KEY (`id`, `id_soal`, `soal_ke`),
  INDEX `index2` (`id_soal` ASC),
  CONSTRAINT `fk_detail_soal_1`
    FOREIGN KEY (`id_soal`)
    REFERENCES `mydb`.`soal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jawaban_siswa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jawaban_siswa` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_detail_soal` INT NULL,
  `soal_ke` INT NULL,
  `jawaban` ENUM('a','b','c','d','e') NULL,
  `status` ENUM('0','1') NULL,
  `nis` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `index2` (`id_detail_soal` ASC),
  INDEX `index3` (`nis` ASC),
  CONSTRAINT `fk_jawaban_siswa_1`
    FOREIGN KEY (`id_detail_soal`)
    REFERENCES `mydb`.`detail_soal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jawaban_siswa_2`
    FOREIGN KEY (`nis`)
    REFERENCES `mydb`.`siswa` (`nis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
