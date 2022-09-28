-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jun 2021 pada 16.04
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_alumni`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_asrama`
--

CREATE TABLE `mst_asrama` (
  `id_asrama` int(2) NOT NULL,
  `nama_asrama` varchar(30) DEFAULT NULL,
  `pengasuh` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_kuota`
--

CREATE TABLE `mst_kuota` (
  `id_kuota` int(2) NOT NULL,
  `id_sekolah` int(2) DEFAULT NULL,
  `jml_kuota` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_pekerjaan`
--

CREATE TABLE `mst_pekerjaan` (
  `id_pekerjaan` int(3) NOT NULL,
  `nama_pekerjaan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_pekerjaan`
--

INSERT INTO `mst_pekerjaan` (`id_pekerjaan`, `nama_pekerjaan`) VALUES
(991, 'PNS'),
(992, 'Guru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_pendapatan`
--

CREATE TABLE `mst_pendapatan` (
  `id_pendapatan` int(3) NOT NULL,
  `nama_pendapatan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_pendidikan`
--

CREATE TABLE `mst_pendidikan` (
  `id_pendidikan` int(3) NOT NULL,
  `nama_pendidikan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_sekolah`
--

CREATE TABLE `mst_sekolah` (
  `id_sekolah` int(2) NOT NULL,
  `nama_sekolah` varchar(45) DEFAULT NULL,
  `kepala_sekolah` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_siswa`
--

CREATE TABLE `mst_siswa` (
  `id_siswa` int(7) NOT NULL,
  `id_sekolah` int(2) DEFAULT NULL,
  `id_asrama` int(2) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `nama_siswa` varchar(30) DEFAULT NULL,
  `tmp_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nama_ayah` varchar(30) DEFAULT NULL,
  `nama_ibu` varchar(30) DEFAULT NULL,
  `pekerjaan_wali` varchar(25) DEFAULT NULL,
  `alamat_wali` varchar(25) DEFAULT NULL,
  `desa` varchar(25) DEFAULT NULL,
  `kec` varchar(25) DEFAULT NULL,
  `kota` varchar(25) DEFAULT NULL,
  `prop` varchar(25) DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `tgl_lulus` date DEFAULT NULL,
  `status` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_thn_ajar`
--

CREATE TABLE `mst_thn_ajar` (
  `id_thn-ajar` int(2) NOT NULL,
  `nama_thn_ajar` varchar(10) DEFAULT NULL,
  `status_thn` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `santri_baru`
--

CREATE TABLE `santri_baru` (
  `id_santri_baru` int(4) NOT NULL,
  `id_asrama` int(2) DEFAULT NULL,
  `nama_santri` varchar(30) DEFAULT NULL,
  `tmp_lahir` varchar(25) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nama_wali` varchar(30) DEFAULT NULL,
  `pekerjaan_wali` varchar(25) DEFAULT NULL,
  `Alamat` varchar(30) DEFAULT NULL,
  `kota` varchar(25) DEFAULT NULL,
  `prop` varchar(25) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `status_santri` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_baru`
--

CREATE TABLE `siswa_baru` (
  `id_siswa_baru` int(3) NOT NULL,
  `id_sekolah` int(2) DEFAULT NULL,
  `nama_siswa` varchar(30) DEFAULT NULL,
  `tmp_lahir` varchar(25) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nama_wali` varchar(30) DEFAULT NULL,
  `alamat` varchar(25) DEFAULT NULL,
  `kota` varchar(25) DEFAULT NULL,
  `prop` varchar(25) DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  `status_siswa` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_alumni`
--

CREATE TABLE `tbl_alumni` (
  `id_alumni` int(11) NOT NULL,
  `nama_lengkap` varchar(120) NOT NULL,
  `tmp_lahir` varchar(120) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `status` enum('Single','Menikah','Duda/Janda') DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `negara` int(3) DEFAULT NULL,
  `prov` int(3) DEFAULT NULL,
  `kab` int(3) DEFAULT NULL,
  `kec` int(3) DEFAULT NULL,
  `desa` int(3) DEFAULT NULL,
  `alamat` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_alumni`
--

INSERT INTO `tbl_alumni` (`id_alumni`, `nama_lengkap`, `tmp_lahir`, `tgl_lahir`, `jenis_kelamin`, `status`, `nik`, `negara`, `prov`, `kab`, `kec`, `desa`, `alamat`) VALUES
(10111, 'M Zaed', 'Malang', '1991-02-01', 'L', 'Menikah', '9991', 62, 31, 32, 33, 34, 'Poncokusumo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_hak_akses`
--

CREATE TABLE `tbl_hak_akses` (
  `id` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_main_menu` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL COMMENT 'y=yes,n=no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwy_asrama`
--

CREATE TABLE `tbl_riwy_asrama` (
  `id_riwy_asrama` int(11) NOT NULL,
  `id_asrama` int(11) NOT NULL,
  `thn_lulus` date NOT NULL,
  `keterangan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwy_keg_masyarakat`
--

CREATE TABLE `tbl_riwy_keg_masyarakat` (
  `id_riwy_keg_masy` int(11) NOT NULL,
  `bentuk_keg_masyarakat` varchar(40) NOT NULL,
  `tahun` date DEFAULT NULL,
  `keterangan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwy_pekerjaan`
--

CREATE TABLE `tbl_riwy_pekerjaan` (
  `id_riwy_pekerjaan` int(11) NOT NULL,
  `id_pekerjaan` int(11) NOT NULL,
  `tahun` date DEFAULT NULL,
  `keterangan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwy_pend`
--

CREATE TABLE `tbl_riwy_pend` (
  `id_riwy_pend` int(11) NOT NULL,
  `id_pendidikan` int(11) NOT NULL,
  `thn_lulus` date NOT NULL,
  `keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `id_setting` int(11) NOT NULL,
  `nama_setting` varchar(50) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_users` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lembaga` int(11) NOT NULL,
  `images` text NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `is_aktif` enum('y','n') NOT NULL,
  `cookie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_users`, `full_name`, `email`, `password`, `lembaga`, `images`, `id_user_level`, `is_aktif`, `cookie`) VALUES
(1, 'Admin', 'adm@gmail.com', 'admin', 101, '', 50001, 'y', 'yay'),
(2, 'Petugas', 'ptgs@gmail.com', 'petugas', 102, '', 50002, 'y', 'yuy');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_level`
--

CREATE TABLE `tbl_user_level` (
  `id_user_level` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_level`
--

INSERT INTO `tbl_user_level` (`id_user_level`, `nama_level`) VALUES
(50001, 'Super Admin'),
(50002, 'Alumni');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mst_asrama`
--
ALTER TABLE `mst_asrama`
  ADD PRIMARY KEY (`id_asrama`);

--
-- Indeks untuk tabel `mst_kuota`
--
ALTER TABLE `mst_kuota`
  ADD PRIMARY KEY (`id_kuota`);

--
-- Indeks untuk tabel `mst_pekerjaan`
--
ALTER TABLE `mst_pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indeks untuk tabel `mst_pendapatan`
--
ALTER TABLE `mst_pendapatan`
  ADD PRIMARY KEY (`id_pendapatan`);

--
-- Indeks untuk tabel `mst_pendidikan`
--
ALTER TABLE `mst_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indeks untuk tabel `mst_sekolah`
--
ALTER TABLE `mst_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indeks untuk tabel `mst_siswa`
--
ALTER TABLE `mst_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `mst_thn_ajar`
--
ALTER TABLE `mst_thn_ajar`
  ADD PRIMARY KEY (`id_thn-ajar`);

--
-- Indeks untuk tabel `santri_baru`
--
ALTER TABLE `santri_baru`
  ADD PRIMARY KEY (`id_santri_baru`);

--
-- Indeks untuk tabel `siswa_baru`
--
ALTER TABLE `siswa_baru`
  ADD PRIMARY KEY (`id_siswa_baru`);

--
-- Indeks untuk tabel `tbl_alumni`
--
ALTER TABLE `tbl_alumni`
  ADD PRIMARY KEY (`id_alumni`);

--
-- Indeks untuk tabel `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `tbl_riwy_asrama`
--
ALTER TABLE `tbl_riwy_asrama`
  ADD PRIMARY KEY (`id_riwy_asrama`);

--
-- Indeks untuk tabel `tbl_riwy_keg_masyarakat`
--
ALTER TABLE `tbl_riwy_keg_masyarakat`
  ADD PRIMARY KEY (`id_riwy_keg_masy`);

--
-- Indeks untuk tabel `tbl_riwy_pekerjaan`
--
ALTER TABLE `tbl_riwy_pekerjaan`
  ADD PRIMARY KEY (`id_riwy_pekerjaan`);

--
-- Indeks untuk tabel `tbl_riwy_pend`
--
ALTER TABLE `tbl_riwy_pend`
  ADD PRIMARY KEY (`id_riwy_pend`);

--
-- Indeks untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_users`);

--
-- Indeks untuk tabel `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mst_asrama`
--
ALTER TABLE `mst_asrama`
  MODIFY `id_asrama` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `mst_kuota`
--
ALTER TABLE `mst_kuota`
  MODIFY `id_kuota` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mst_pekerjaan`
--
ALTER TABLE `mst_pekerjaan`
  MODIFY `id_pekerjaan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=993;

--
-- AUTO_INCREMENT untuk tabel `mst_pendapatan`
--
ALTER TABLE `mst_pendapatan`
  MODIFY `id_pendapatan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mst_pendidikan`
--
ALTER TABLE `mst_pendidikan`
  MODIFY `id_pendidikan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `mst_sekolah`
--
ALTER TABLE `mst_sekolah`
  MODIFY `id_sekolah` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `mst_siswa`
--
ALTER TABLE `mst_siswa`
  MODIFY `id_siswa` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `mst_thn_ajar`
--
ALTER TABLE `mst_thn_ajar`
  MODIFY `id_thn-ajar` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `santri_baru`
--
ALTER TABLE `santri_baru`
  MODIFY `id_santri_baru` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa_baru`
--
ALTER TABLE `siswa_baru`
  MODIFY `id_siswa_baru` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_alumni`
--
ALTER TABLE `tbl_alumni`
  MODIFY `id_alumni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10112;

--
-- AUTO_INCREMENT untuk tabel `tbl_hak_akses`
--
ALTER TABLE `tbl_hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwy_asrama`
--
ALTER TABLE `tbl_riwy_asrama`
  MODIFY `id_riwy_asrama` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwy_pekerjaan`
--
ALTER TABLE `tbl_riwy_pekerjaan`
  MODIFY `id_riwy_pekerjaan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwy_pend`
--
ALTER TABLE `tbl_riwy_pend`
  MODIFY `id_riwy_pend` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_level`
--
ALTER TABLE `tbl_user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
