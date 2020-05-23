-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2019 pada 12.36
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyek3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun_pengguna`
--

CREATE TABLE `akun_pengguna` (
  `id_pengguna` varchar(7) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hak_akses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun_pengguna`
--

INSERT INTO `akun_pengguna` (`id_pengguna`, `username`, `password`, `hak_akses`) VALUES
('USER001', 'harun', '$2y$10$nxax1fn6c57V6iowJLujx.0mN0D3olNxO6y3n6wJmX5Q7..ztFuY6', 0),
('USER002', 'nico', '$2y$10$NHdTA7Zw2lnc0QePdmKCGuV.czTKaO2Bfu0H0dB5pZ95K8/unHH4G', 3),
('USER003', 'kevin', '$2y$10$kLPmM3Bne7h7I.OENyISC.aCFq5HXySGn4st6H96963G1/.m7iQPy', 3),
('USER004', 'habib', '$2y$10$ZjAsJ9RNVGfGE5TB/0ir8utBk2milk6NUZjCgt73rnjKN7iASKp3K', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `asal_barang`
--

CREATE TABLE `asal_barang` (
  `id_asal` varchar(6) NOT NULL,
  `nama_lokasi_asal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `asal_barang`
--

INSERT INTO `asal_barang` (`id_asal`, `nama_lokasi_asal`) VALUES
('FRM001', 'Subang'),
('FRM002', 'Bandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_lorong` varchar(7) NOT NULL,
  `id_barang` varchar(7) NOT NULL,
  `id_pengemudi` varchar(9) NOT NULL,
  `id_kendaraan` varchar(7) NOT NULL,
  `id_tujuan` varchar(6) NOT NULL,
  `waktu_keluar` datetime NOT NULL,
  `jumlah_barang_keluar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_lorong`, `id_barang`, `id_pengemudi`, `id_kendaraan`, `id_tujuan`, `waktu_keluar`, `jumlah_barang_keluar`) VALUES
('LANE001', 'ITEM001', 'DRV002', 'TNPS001', 'LCT001', '2019-11-27 00:00:00', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` varchar(7) NOT NULL,
  `id_asal` varchar(6) NOT NULL,
  `waktu_masuk` datetime DEFAULT NULL,
  `jumlah_brg_masuk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang`, `id_asal`, `waktu_masuk`, `jumlah_brg_masuk`) VALUES
('ITEM001', 'FRM001', '2019-11-26 00:00:00', 100);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_barang_keluar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_barang_keluar` (
`id_barang` varchar(7)
,`nama_ktgr_brg` varchar(50)
,`nama_merk_barang` varchar(50)
,`nama_barang` varchar(50)
,`jenis_barang` int(11)
,`panjang_barang` int(11)
,`lebar_barang` int(11)
,`tinggi_barang` int(11)
,`jumlah_barang_keluar` int(11)
,`id_tujuan` varchar(6)
,`nama_lokasi_tujuan` varchar(50)
,`latitude` varchar(30)
,`longitude` varchar(30)
,`nama` varchar(50)
,`id_pengemudi` varchar(9)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_kendaraan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_kendaraan` (
`id_kendaraan` varchar(7)
,`id_merk_kendaraan` varchar(7)
,`id_nama_kendaraan` varchar(8)
,`jenis_kendaraan` int(11)
,`kapasitas` int(11)
,`no_kendaraan` varchar(10)
,`status_kendaraan` int(11)
,`nama_mk` varchar(25)
,`nama_kendaraan` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_merk_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_merk_barang` (
`id_ktgr_brg` varchar(7)
,`nama_ktgr_brg` varchar(50)
,`id_merk_barang` varchar(7)
,`nama_merk_barang` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_nama_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_nama_barang` (
`nama_merk_barang` varchar(50)
,`id_nama_barang` varchar(8)
,`id_merk_barang` varchar(7)
,`nama_barang` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_nama_kendaraan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_nama_kendaraan` (
`nama_mk` varchar(25)
,`id_nama_kendaraan` varchar(8)
,`id_merk_kendaraan` varchar(7)
,`nama_kendaraan` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_pengemudi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_pengemudi` (
`id_pengguna` varchar(7)
,`nama` varchar(50)
,`umur` int(11)
,`alamat_pengguna` varchar(100)
,`id_pengemudi` varchar(9)
,`tanggal_lahir` date
,`no_hp_penggemudi` varchar(13)
,`foto_penggemudi` varchar(50)
,`status_pengemudi` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_pengguna`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_pengguna` (
`id_pengguna` varchar(7)
,`nama` varchar(50)
,`umur` int(11)
,`alamat_pengguna` varchar(100)
,`username` varchar(16)
,`password` varchar(255)
,`hak_akses` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_rak`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_rak` (
`id_rak` varchar(6)
,`nama_lorong` varchar(50)
,`nama_ktgr_brg` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_ktgr_brg` varchar(7) NOT NULL,
  `nama_ktgr_brg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_ktgr_brg`, `nama_ktgr_brg`) VALUES
('CTGR001', 'Makanan'),
('CTGR002', 'Minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` varchar(7) NOT NULL,
  `id_merk_kendaraan` varchar(7) NOT NULL,
  `id_nama_kendaraan` varchar(8) NOT NULL,
  `jenis_kendaraan` int(11) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `no_kendaraan` varchar(10) NOT NULL,
  `status_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `id_merk_kendaraan`, `id_nama_kendaraan`, `jenis_kendaraan`, `kapasitas`, `no_kendaraan`, `status_kendaraan`) VALUES
('TNPS001', 'MRKT001', 'TNAME002', 3, 4000, 'D 1234 AD', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pengguna`
--

CREATE TABLE `log_pengguna` (
  `id_pengguna` varchar(7) NOT NULL,
  `waktu_log` datetime DEFAULT NULL,
  `aktivitas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lorong`
--

CREATE TABLE `lorong` (
  `id_lorong` varchar(7) NOT NULL,
  `nama_lorong` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lorong`
--

INSERT INTO `lorong` (`id_lorong`, `nama_lorong`) VALUES
('LANE001', 'Subang'),
('LANE002', 'Bandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merk_barang`
--

CREATE TABLE `merk_barang` (
  `id_ktgr_brg` varchar(7) NOT NULL,
  `id_merk_barang` varchar(7) NOT NULL,
  `nama_merk_barang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `merk_barang`
--

INSERT INTO `merk_barang` (`id_ktgr_brg`, `id_merk_barang`, `nama_merk_barang`) VALUES
('CTGR002', 'MRKB001', 'Fanta'),
('CTGR001', 'MRKB002', 'Sari Roti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merk_kendaraan`
--

CREATE TABLE `merk_kendaraan` (
  `id_merk_kendaraan` varchar(7) NOT NULL,
  `nama_mk` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `merk_kendaraan`
--

INSERT INTO `merk_kendaraan` (`id_merk_kendaraan`, `nama_mk`) VALUES
('MRKT001', 'Lamborghini'),
('MRKT002', 'Ferrari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nama_barang`
--

CREATE TABLE `nama_barang` (
  `id_nama_barang` varchar(8) NOT NULL,
  `id_merk_barang` varchar(7) NOT NULL,
  `nama_barang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nama_barang`
--

INSERT INTO `nama_barang` (`id_nama_barang`, `id_merk_barang`, `nama_barang`) VALUES
('ITMN001', 'MRKB001', 'Minuman Bersoda'),
('ITMN002', 'MRKB002', 'Roti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nama_kendaraan`
--

CREATE TABLE `nama_kendaraan` (
  `id_nama_kendaraan` varchar(8) NOT NULL,
  `id_merk_kendaraan` varchar(7) NOT NULL,
  `nama_kendaraan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nama_kendaraan`
--

INSERT INTO `nama_kendaraan` (`id_nama_kendaraan`, `id_merk_kendaraan`, `nama_kendaraan`) VALUES
('TNAME001', 'MRKT001', 'Aventador'),
('TNAME002', 'MRKT001', 'Feneno');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengemudi`
--

CREATE TABLE `pengemudi` (
  `id_pengemudi` varchar(9) NOT NULL,
  `id_pengguna` varchar(7) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_hp_penggemudi` varchar(13) NOT NULL,
  `foto_penggemudi` varchar(50) DEFAULT NULL,
  `status_pengemudi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengemudi`
--

INSERT INTO `pengemudi` (`id_pengemudi`, `id_pengguna`, `tanggal_lahir`, `no_hp_penggemudi`, `foto_penggemudi`, `status_pengemudi`) VALUES
('DRV001', 'USER003', '2019-11-14', '085123456789', 'Fufumon_b.jpg', 0),
('DRV002', 'USER002', '2019-11-27', '081361327635', 'Fufumon_b.jpg', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(7) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `umur` int(11) NOT NULL,
  `alamat_pengguna` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `umur`, `alamat_pengguna`) VALUES
('USER001', 'Harun Ar - Rasyid', 20, 'Subang'),
('USER002', 'Nico', 20, 'Medan'),
('USER003', 'Kevin', 21, 'Bandung'),
('USER004', 'Habib', 30, 'Subang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak_barang`
--

CREATE TABLE `rak_barang` (
  `id_rak` varchar(6) NOT NULL,
  `id_lorong` varchar(7) NOT NULL,
  `id_ktgr_brg` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rak_barang`
--

INSERT INTO `rak_barang` (`id_rak`, `id_lorong`, `id_ktgr_brg`) VALUES
('RCK001', 'LANE001', 'CTGR001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_barang`
--

CREATE TABLE `stok_barang` (
  `id_barang` varchar(7) NOT NULL,
  `id_ktgr_brg` varchar(7) NOT NULL,
  `id_merk_barang` varchar(7) NOT NULL,
  `id_nama_barang` varchar(8) NOT NULL,
  `id_rak` varchar(6) NOT NULL,
  `stok_barang` int(11) DEFAULT NULL,
  `jenis_barang` int(11) DEFAULT NULL,
  `panjang_barang` int(11) NOT NULL,
  `lebar_barang` int(11) NOT NULL,
  `tinggi_barang` int(11) NOT NULL,
  `waktu_tiba` datetime DEFAULT NULL,
  `status_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stok_barang`
--

INSERT INTO `stok_barang` (`id_barang`, `id_ktgr_brg`, `id_merk_barang`, `id_nama_barang`, `id_rak`, `stok_barang`, `jenis_barang`, `panjang_barang`, `lebar_barang`, `tinggi_barang`, `waktu_tiba`, `status_barang`) VALUES
('ITEM001', 'CTGR001', 'MRKB002', 'ITMN001', 'RCK001', 100, 0, 10, 10, 10, '2019-11-26 00:00:00', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tujuan`
--

CREATE TABLE `tujuan` (
  `id_tujuan` varchar(6) NOT NULL,
  `nama_lokasi_tujuan` varchar(50) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tujuan`
--

INSERT INTO `tujuan` (`id_tujuan`, `nama_lokasi_tujuan`, `latitude`, `longitude`) VALUES
('LCT001', 'Subang', '3.135782', '101.541306'),
('LCT002', 'Bandung', '-6.917464', '107.619125');

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_barang_keluar`
--
DROP TABLE IF EXISTS `detail_barang_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_barang_keluar`  AS  select `stok_barang`.`id_barang` AS `id_barang`,`kategori_barang`.`nama_ktgr_brg` AS `nama_ktgr_brg`,`merk_barang`.`nama_merk_barang` AS `nama_merk_barang`,`nama_barang`.`nama_barang` AS `nama_barang`,`stok_barang`.`jenis_barang` AS `jenis_barang`,`stok_barang`.`panjang_barang` AS `panjang_barang`,`stok_barang`.`lebar_barang` AS `lebar_barang`,`stok_barang`.`tinggi_barang` AS `tinggi_barang`,`barang_keluar`.`jumlah_barang_keluar` AS `jumlah_barang_keluar`,`tujuan`.`id_tujuan` AS `id_tujuan`,`tujuan`.`nama_lokasi_tujuan` AS `nama_lokasi_tujuan`,`tujuan`.`latitude` AS `latitude`,`tujuan`.`longitude` AS `longitude`,`detail_pengemudi`.`nama` AS `nama`,`pengemudi`.`id_pengemudi` AS `id_pengemudi` from (((((((`stok_barang` join `kategori_barang` on(`kategori_barang`.`id_ktgr_brg` = `stok_barang`.`id_ktgr_brg`)) join `merk_barang` on(`merk_barang`.`id_merk_barang` = `stok_barang`.`id_merk_barang`)) join `nama_barang` on(`nama_barang`.`id_nama_barang` = `stok_barang`.`id_nama_barang`)) join `barang_keluar` on(`barang_keluar`.`id_barang` = `stok_barang`.`id_barang`)) join `tujuan` on(`tujuan`.`id_tujuan` = `barang_keluar`.`id_tujuan`)) join `pengemudi` on(`pengemudi`.`id_pengemudi` = `barang_keluar`.`id_pengemudi`)) join `detail_pengemudi` on(`detail_pengemudi`.`id_pengemudi` = `barang_keluar`.`id_pengemudi`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_kendaraan`
--
DROP TABLE IF EXISTS `detail_kendaraan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_kendaraan`  AS  select `kendaraan`.`id_kendaraan` AS `id_kendaraan`,`kendaraan`.`id_merk_kendaraan` AS `id_merk_kendaraan`,`kendaraan`.`id_nama_kendaraan` AS `id_nama_kendaraan`,`kendaraan`.`jenis_kendaraan` AS `jenis_kendaraan`,`kendaraan`.`kapasitas` AS `kapasitas`,`kendaraan`.`no_kendaraan` AS `no_kendaraan`,`kendaraan`.`status_kendaraan` AS `status_kendaraan`,`merk_kendaraan`.`nama_mk` AS `nama_mk`,`nama_kendaraan`.`nama_kendaraan` AS `nama_kendaraan` from ((`kendaraan` join `merk_kendaraan` on(`merk_kendaraan`.`id_merk_kendaraan` = `kendaraan`.`id_merk_kendaraan`)) join `nama_kendaraan` on(`nama_kendaraan`.`id_nama_kendaraan` = `kendaraan`.`id_nama_kendaraan`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_merk_barang`
--
DROP TABLE IF EXISTS `detail_merk_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_merk_barang`  AS  select `kategori_barang`.`id_ktgr_brg` AS `id_ktgr_brg`,`kategori_barang`.`nama_ktgr_brg` AS `nama_ktgr_brg`,`merk_barang`.`id_merk_barang` AS `id_merk_barang`,`merk_barang`.`nama_merk_barang` AS `nama_merk_barang` from (`kategori_barang` join `merk_barang` on(`merk_barang`.`id_ktgr_brg` = `kategori_barang`.`id_ktgr_brg`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_nama_barang`
--
DROP TABLE IF EXISTS `detail_nama_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_nama_barang`  AS  select `merk_barang`.`nama_merk_barang` AS `nama_merk_barang`,`nama_barang`.`id_nama_barang` AS `id_nama_barang`,`nama_barang`.`id_merk_barang` AS `id_merk_barang`,`nama_barang`.`nama_barang` AS `nama_barang` from (`nama_barang` join `merk_barang` on(`merk_barang`.`id_merk_barang` = `nama_barang`.`id_merk_barang`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_nama_kendaraan`
--
DROP TABLE IF EXISTS `detail_nama_kendaraan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_nama_kendaraan`  AS  select `merk_kendaraan`.`nama_mk` AS `nama_mk`,`nama_kendaraan`.`id_nama_kendaraan` AS `id_nama_kendaraan`,`nama_kendaraan`.`id_merk_kendaraan` AS `id_merk_kendaraan`,`nama_kendaraan`.`nama_kendaraan` AS `nama_kendaraan` from (`nama_kendaraan` join `merk_kendaraan` on(`merk_kendaraan`.`id_merk_kendaraan` = `nama_kendaraan`.`id_merk_kendaraan`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_pengemudi`
--
DROP TABLE IF EXISTS `detail_pengemudi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_pengemudi`  AS  select `pengguna`.`id_pengguna` AS `id_pengguna`,`pengguna`.`nama` AS `nama`,`pengguna`.`umur` AS `umur`,`pengguna`.`alamat_pengguna` AS `alamat_pengguna`,`pengemudi`.`id_pengemudi` AS `id_pengemudi`,`pengemudi`.`tanggal_lahir` AS `tanggal_lahir`,`pengemudi`.`no_hp_penggemudi` AS `no_hp_penggemudi`,`pengemudi`.`foto_penggemudi` AS `foto_penggemudi`,`pengemudi`.`status_pengemudi` AS `status_pengemudi` from (`pengguna` join `pengemudi` on(`pengemudi`.`id_pengguna` = `pengguna`.`id_pengguna`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_pengguna`
--
DROP TABLE IF EXISTS `detail_pengguna`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_pengguna`  AS  select `pengguna`.`id_pengguna` AS `id_pengguna`,`pengguna`.`nama` AS `nama`,`pengguna`.`umur` AS `umur`,`pengguna`.`alamat_pengguna` AS `alamat_pengguna`,`akun_pengguna`.`username` AS `username`,`akun_pengguna`.`password` AS `password`,`akun_pengguna`.`hak_akses` AS `hak_akses` from (`pengguna` join `akun_pengguna` on(`pengguna`.`id_pengguna` = `akun_pengguna`.`id_pengguna`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_rak`
--
DROP TABLE IF EXISTS `detail_rak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_rak`  AS  select `rak_barang`.`id_rak` AS `id_rak`,`lorong`.`nama_lorong` AS `nama_lorong`,`kategori_barang`.`nama_ktgr_brg` AS `nama_ktgr_brg` from ((`rak_barang` join `lorong` on(`lorong`.`id_lorong` = `rak_barang`.`id_lorong`)) join `kategori_barang` on(`kategori_barang`.`id_ktgr_brg` = `rak_barang`.`id_ktgr_brg`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun_pengguna`
--
ALTER TABLE `akun_pengguna`
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `asal_barang`
--
ALTER TABLE `asal_barang`
  ADD PRIMARY KEY (`id_asal`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD KEY `fk_bk_kendaraan` (`id_kendaraan`),
  ADD KEY `fk_bk_barang` (`id_barang`),
  ADD KEY `fk_bk_tujuan` (`id_tujuan`),
  ADD KEY `barang_keluar_index` (`id_lorong`,`id_barang`,`id_kendaraan`,`id_tujuan`,`id_pengemudi`) USING BTREE,
  ADD KEY `fk_bk_pengemudi` (`id_pengemudi`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD KEY `id_barang` (`id_barang`,`id_asal`),
  ADD KEY `fk_bm_asal` (`id_asal`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_ktgr_brg`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`),
  ADD KEY `fk_ken_nk` (`id_nama_kendaraan`),
  ADD KEY `index_kendaraan` (`id_nama_kendaraan`,`id_merk_kendaraan`) USING BTREE,
  ADD KEY `fk_ken_mk` (`id_merk_kendaraan`);

--
-- Indeks untuk tabel `log_pengguna`
--
ALTER TABLE `log_pengguna`
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `lorong`
--
ALTER TABLE `lorong`
  ADD PRIMARY KEY (`id_lorong`);

--
-- Indeks untuk tabel `merk_barang`
--
ALTER TABLE `merk_barang`
  ADD PRIMARY KEY (`id_merk_barang`),
  ADD KEY `id_lorong` (`id_ktgr_brg`);

--
-- Indeks untuk tabel `merk_kendaraan`
--
ALTER TABLE `merk_kendaraan`
  ADD PRIMARY KEY (`id_merk_kendaraan`);

--
-- Indeks untuk tabel `nama_barang`
--
ALTER TABLE `nama_barang`
  ADD PRIMARY KEY (`id_nama_barang`),
  ADD KEY `id_merk_barang` (`id_merk_barang`);

--
-- Indeks untuk tabel `nama_kendaraan`
--
ALTER TABLE `nama_kendaraan`
  ADD PRIMARY KEY (`id_nama_kendaraan`),
  ADD KEY `id_merk_kendaraan` (`id_merk_kendaraan`);

--
-- Indeks untuk tabel `pengemudi`
--
ALTER TABLE `pengemudi`
  ADD PRIMARY KEY (`id_pengemudi`),
  ADD KEY `id_pengguna` (`id_pengguna`) USING BTREE,
  ADD KEY `fk_pengemudi_tujuan` (`id_pengguna`) USING BTREE;

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `rak_barang`
--
ALTER TABLE `rak_barang`
  ADD PRIMARY KEY (`id_rak`),
  ADD KEY `fk_rak_ktgrB` (`id_ktgr_brg`),
  ADD KEY `rak_index` (`id_ktgr_brg`,`id_lorong`) USING BTREE,
  ADD KEY `fk_rak_lorong` (`id_lorong`);

--
-- Indeks untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_stok_rak` (`id_rak`),
  ADD KEY `index_stok_barang` (`id_nama_barang`,`id_rak`,`id_ktgr_brg`,`id_merk_barang`) USING BTREE,
  ADD KEY `fk_stok_merk` (`id_merk_barang`),
  ADD KEY `fk_stok_ktgr` (`id_ktgr_brg`);

--
-- Indeks untuk tabel `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id_tujuan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun_pengguna`
--
ALTER TABLE `akun_pengguna`
  ADD CONSTRAINT `fk_akun_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `fk_bk_barang` FOREIGN KEY (`id_barang`) REFERENCES `stok_barang` (`id_barang`),
  ADD CONSTRAINT `fk_bk_kendaraan` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`),
  ADD CONSTRAINT `fk_bk_lorong` FOREIGN KEY (`id_lorong`) REFERENCES `lorong` (`id_lorong`),
  ADD CONSTRAINT `fk_bk_pengemudi` FOREIGN KEY (`id_pengemudi`) REFERENCES `pengemudi` (`id_pengemudi`),
  ADD CONSTRAINT `fk_bk_tujuan` FOREIGN KEY (`id_tujuan`) REFERENCES `tujuan` (`id_tujuan`);

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `fk_bm_asal` FOREIGN KEY (`id_asal`) REFERENCES `asal_barang` (`id_asal`),
  ADD CONSTRAINT `fk_bm_barang` FOREIGN KEY (`id_barang`) REFERENCES `stok_barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `fk_ken_mk` FOREIGN KEY (`id_merk_kendaraan`) REFERENCES `merk_kendaraan` (`id_merk_kendaraan`),
  ADD CONSTRAINT `fk_ken_nk` FOREIGN KEY (`id_nama_kendaraan`) REFERENCES `nama_kendaraan` (`id_nama_kendaraan`);

--
-- Ketidakleluasaan untuk tabel `log_pengguna`
--
ALTER TABLE `log_pengguna`
  ADD CONSTRAINT `fk_log_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Ketidakleluasaan untuk tabel `merk_barang`
--
ALTER TABLE `merk_barang`
  ADD CONSTRAINT `fk_mb_ktgrB` FOREIGN KEY (`id_ktgr_brg`) REFERENCES `kategori_barang` (`id_ktgr_brg`);

--
-- Ketidakleluasaan untuk tabel `nama_barang`
--
ALTER TABLE `nama_barang`
  ADD CONSTRAINT `fk_nb_mb` FOREIGN KEY (`id_merk_barang`) REFERENCES `merk_barang` (`id_merk_barang`);

--
-- Ketidakleluasaan untuk tabel `nama_kendaraan`
--
ALTER TABLE `nama_kendaraan`
  ADD CONSTRAINT `fk_nk_mk` FOREIGN KEY (`id_merk_kendaraan`) REFERENCES `merk_kendaraan` (`id_merk_kendaraan`);

--
-- Ketidakleluasaan untuk tabel `pengemudi`
--
ALTER TABLE `pengemudi`
  ADD CONSTRAINT `fk_pengemudi_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Ketidakleluasaan untuk tabel `rak_barang`
--
ALTER TABLE `rak_barang`
  ADD CONSTRAINT `fk_rak_ktgrB` FOREIGN KEY (`id_ktgr_brg`) REFERENCES `kategori_barang` (`id_ktgr_brg`),
  ADD CONSTRAINT `fk_rak_lorong` FOREIGN KEY (`id_lorong`) REFERENCES `lorong` (`id_lorong`);

--
-- Ketidakleluasaan untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD CONSTRAINT `fk_stok_ktgr` FOREIGN KEY (`id_ktgr_brg`) REFERENCES `kategori_barang` (`id_ktgr_brg`),
  ADD CONSTRAINT `fk_stok_merk` FOREIGN KEY (`id_merk_barang`) REFERENCES `merk_barang` (`id_merk_barang`),
  ADD CONSTRAINT `fk_stok_nb` FOREIGN KEY (`id_nama_barang`) REFERENCES `nama_barang` (`id_nama_barang`),
  ADD CONSTRAINT `fk_stok_rak` FOREIGN KEY (`id_rak`) REFERENCES `rak_barang` (`id_rak`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
