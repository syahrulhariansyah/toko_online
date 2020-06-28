# Host: localhost  (Version 5.5.5-10.1.13-MariaDB)
# Date: 2020-06-28 16:28:53
# Generator: MySQL-Front 5.3  (Build 5.33)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'syahrul','syahrul','syahrul hariansyah'),(2,'karina','karina','karina larasati');

#
# Structure for table "kategori"
#

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "kategori"
#

INSERT INTO `kategori` VALUES (1,'ilmu'),(2,'fashion'),(3,'teknologi'),(6,'food'),(7,'minuman');

#
# Structure for table "ongkir"
#

DROP TABLE IF EXISTS `ongkir`;
CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`id_ongkir`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "ongkir"
#

INSERT INTO `ongkir` VALUES (1,'Bantaeng',20000),(2,'Jenneponto',25000),(3,'soppeng',10000);

#
# Structure for table "pelanggan"
#

DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telpon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pelanggan"
#

INSERT INTO `pelanggan` VALUES (1,'cecep@gmail.com','cecep','cecep taufik','34567898765',''),(2,'afifa@gfmail.com','afifa','nur afifah','45678900',''),(3,'rina_andriani@gmail.com','rina','rina','085367891234','barru'),(4,'gekganteng@gmail.com','gekkk','gekkk','08654323467','Leppangeng'),(5,'kharisma06056@gmail.com','kharisma','kharisma','086754321890','soppeng');

#
# Structure for table "pembayaran"
#

DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "pembayaran"
#

INSERT INTO `pembayaran` VALUES (2,16,'rina','bni syariah',470000,'2020-06-23','20200623152239IMG-20191024-WA0003.jpeg'),(3,15,'rin','mandiri',480000,'2020-06-23','20200623152445Logo IDI.gif'),(4,17,'rina','bri',85000,'2020-06-23','20200623164432IMG-20191031-WA0008.jpeg'),(5,1,'cecep taufik','mandiri',3000000,'2020-06-23','20200623164649IMG-20191105-WA0021.jpeg');

#
# Structure for table "pembelian"
#

DROP TABLE IF EXISTS `pembelian`;
CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Data for table "pembelian"
#

INSERT INTO `pembelian` VALUES (12,2,1,'2020-06-21',230000,'Bantaeng',20000,'','pending',''),(13,1,2,'2020-06-21',55000,'Jenneponto',25000,'jl suka maju samping sd cebdrawasih kode pos 56789','pending',''),(14,2,1,'2020-06-21',230000,'Bantaeng',20000,'jl sukma aini kode pos 5678','pending',''),(15,3,0,'2020-06-22',480000,'',0,'','sudah kirim pembayaran',''),(18,1,1,'2020-06-23',380000,'Bantaeng',20000,'jl tete watu no 76 kode pos 34','pending',''),(19,3,1,'2020-06-24',170000,'Bantaeng',20000,'jl cendrawsih no 56 kode pos456','pending',''),(20,4,0,'2020-06-24',180000,'',0,'','pending',''),(21,5,3,'2020-06-28',35000,'soppeng',10000,'jl kemakmuran soppeng kode pos 4567','pending','');

#
# Structure for table "pembelian_produk"
#

DROP TABLE IF EXISTS `pembelian_produk`;
CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL,
  PRIMARY KEY (`id_pembelian_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Data for table "pembelian_produk"
#

INSERT INTO `pembelian_produk` VALUES (1,1,1,1,'',0,0,0,0),(2,1,2,1,'',0,0,0,0),(3,0,12,2,'',0,0,0,0),(4,0,16,1,'',0,0,0,0),(5,0,15,1,'',0,0,0,0),(6,7,12,2,'',0,0,0,0),(7,7,16,1,'',0,0,0,0),(8,7,15,1,'',0,0,0,0),(9,8,12,2,'',0,0,0,0),(10,8,16,1,'',0,0,0,0),(11,8,15,1,'',0,0,0,0),(12,9,12,2,'',0,0,0,0),(13,9,15,1,'',0,0,0,0),(14,10,15,1,'sepatu',100000,100,100,100000),(15,10,16,1,'jaket',150000,100,100,150000),(16,12,16,1,'jaket',150000,100,100,150000),(17,12,12,2,'buku pemrograman web',30000,300,600,60000),(18,0,12,2,'buku pemrograman web',30000,300,600,60000),(19,0,15,1,'sepatu',150000,100,100,150000),(20,13,12,1,'buku pemrograman web',30000,300,300,30000),(21,14,12,2,'buku pemrograman web',30000,300,600,60000),(22,14,15,1,'sepatu',150000,100,100,150000),(23,15,16,3,'jaket',150000,100,300,450000),(24,15,12,1,'buku pemrograman web',30000,300,300,30000),(25,16,15,1,'sepatu',150000,100,100,150000),(26,16,16,2,'jaket',150000,100,200,300000),(27,17,12,2,'buku pemrograman web',30000,300,600,60000),(28,18,12,2,'buku pemrograman web',30000,300,600,60000),(29,18,16,2,'jaket',150000,100,200,300000),(30,19,15,1,'sepatu',150000,100,100,150000),(31,20,12,1,'buku pemrograman web',30000,300,300,30000),(32,20,15,1,'sepatu',150000,100,100,150000),(33,21,24,1,'buku pemrograman python',25000,400,400,25000);

#
# Structure for table "produk"
#

DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

#
# Data for table "produk"
#

INSERT INTO `produk` VALUES (12,1,'buku pemrograman web',30000,300,'foto_buku_pemrograman.jpg','',5),(13,3,'laptop lenovo ideapad 330',10000000,1000,'lenovo_ideapad330_14.jpg','laptop premium berkualitas bagus',5),(15,2,'sepatu',150000,100,'sepatu.jpg','ini model terbaru bahan yang ringan dan keren',3),(16,2,'jaket',150000,100,'jaket.jpg','jaket keren baru',3),(18,1,'buku php',25000,200,'buku_php.jpg','',5),(20,2,'sepatu snakers',200000,300,'sepatu_snakers_hitam.jpg','ini sepatu populer dan terlaris di kalangan anak mudah',5),(21,3,'laptop hp  14 ac',2000000,500,'laptophp1.jpg','ini laptop bagus',5),(22,6,'donat',20000,1000,'donat1.jpg','donat yang enak untuk  santai bareng teman keluarga dengan beragam variasi rasa yang menggugah selera',20),(23,1,'buku pemrograman vb 6',40000,300,'buku_vb_6.png','ini buku direkomendasikan untuk mulai belajar pemrograman visual basic',10),(24,1,'buku pemrograman python',25000,400,'bukuPpython.jpg','buku ini direkomendasikan untuk yang baru akan mulai belajar bahasa pemrograman python ',4),(25,7,'thai tea',10000,200,'thai_tea.jpg','ini minuman enak',10);

#
# Structure for table "produk_foto"
#

DROP TABLE IF EXISTS `produk_foto`;
CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_produk_foto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Data for table "produk_foto"
#

INSERT INTO `produk_foto` VALUES (2,19,'laptophpputih.jpg'),(3,19,'laptophpmerah.jpg'),(4,20,'sepatu_snakers_hitam.jpg'),(5,20,'sepatu_snakers_merah.jpg'),(6,20,'sepatu_snakers.jpg'),(7,19,'20200625192008laptophp1.jpg'),(8,19,'20200625200146'),(9,19,'20200625200214'),(10,21,'laptophp1.jpg'),(11,21,'laptophpputih.jpg'),(12,21,'laptophpmerah.jpg'),(13,22,'donat1.jpg'),(14,22,'donat2.jpg'),(15,22,'donat3.jpg'),(16,23,'buku_vb_6.png'),(17,24,'bukuPpython.jpg'),(18,25,'thai_tea.jpg');
