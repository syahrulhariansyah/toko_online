<?php  

$id_foto = $_GET['idfoto'];
$id_produk = $_GET['idproduk'];

// mengambil data 
$ambilfoto = $koneksi->query("select * from produk_foto where id_produk_foto='$id_foto'");
$detailfoto = $ambilfoto->fetch_assoc();

$namafilefoto = $detailfoto['nama_produk_foto'];
// menghapus file foto dari folder
unlink("../foto_produk/".$namafilefoto);

// menghapus dari mysql
$koneksi->query("delete from produk_foto where id_produk_foto='$id_foto'");

echo "<script>alert(' foto produk terhapus');</script>";
echo "<script>location='index.php?halaman=detailproduk&id=$id_produk';</script>";

echo "<pre>";
print_r($namafilefoto);
echo "</pre>";

?>