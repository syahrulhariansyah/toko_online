<?php  

$ambil = $koneksi->query("select * from kategori where id_kategori='$_GET[id]'");
$pecah = $ambil->fetch_assoc();

$koneksi->query("delete from kategori where id_kategori='$_GET[id]'");

echo "<script>alert('kategoriterhapus');</script>";
echo "<script>location='index.php?halaman=kategori';</script>";
?>