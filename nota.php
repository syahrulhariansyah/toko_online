<?php 
session_start();
$koneksi = new mysqli("localhost","root","","tokoonline");
?>
<!DOCTYPE html>
<html>
<head>
	<title>nota pembelian</title>
	<link rel="stylesheet" type="text/css" href="admin/bs-binary-admin/assets/css/bootstrap.css">
</head>
<body>

	<?php include 'menu.php' ?>
<section class="konten">
	<div class="container">
		

		<!-- nota disini copas dari nota yang ada di admin -->

		<h2>Detail Pembelian <?php print_r($_SESSION['pelanggan']['nama_pelanggan']); ?></h2>
<?php 
$ambil = $koneksi->query("select * from pembelian join pelanggan on pembelian.id_pelanggan=pelanggan.id_pelanggan where pembelian.id_pembelian='$_GET[id]'");
$detail = $ambil->fetch_assoc();
 ?>
 <!-- <h1>//data orang yang beli </h1> -->
 <!-- <pre><?php //print_r($detail); ?></pre> -->
 
 <!-- <h1>//data orang yang login</h1> -->
 <!-- <pre><?php //print_r($_SESSION) ?></pre> -->
 
<!-- jika pelanggan yang beli tidak sama dengan pelanggan yang login, maka dilarikan ke riwayat.php karena dia tidak berhak melihat nota orang lain-->
<!-- pelanggan yang beli harus pelanggan yang login-->
<?php 
// mendapatkan id pelanggan yang beli 
$idpelangganyangbeli = $detail['id_pelanggan'];

// mendapatkan id pelanggan yang login
$idpelangganyanglogin = $_SESSION['pelanggan']['id_pelanggan'];
if ($idpelangganyangbeli!==$idpelangganyanglogin) 
{
	echo "<script>alert('jangan nakal itu dosa');</script>";
	echo "<script>location='riwayat.php';</script>";
	exit();
}

?>
 <div class="row">
 	<div class="col-md-4">
 		<h3>Pembelian</h3>
 		<strong>No. Pembelian: <?php echo $detail['id_pembelian']; ?></strong><br>
 		Tanggal: <?php echo $detail['tanggal_pembelian']; ?><br>
 		Total: Rp. <?php echo number_format($detail['total_pembelian']); ?>
 	</div>
 	<div class="col-md-4">
 		<h3>Pelanggan</h3>
 		<strong><?php echo $detail['nama_pelanggan']; ?></strong> <br>
 		<p>
		 	<?php echo $detail['telpon_pelanggan']; ?> <br>
		 	<?php echo $detail['email_pelanggan']; ?>
		 </p>

 	</div>
 	<div class="col-md-4">
 		<h3>Pengiriman</h3>
 		<strong><?php echo $detail['nama_kota'] ?></strong><br>
 		Ongkos Kirim: Rp. <?php echo number_format($detail['tarif']); ?><br>
 		Alamat: <?php echo $detail['alamat_pengiriman'] ?>
 	</div>
 </div>

 <table class="table table-bordered">
 	<thead>
 		<tr>
 			<th>No</th>
 			<th>Nama Produk</th>
 			<th>Harga</th>
 			<th>Berat (Gr)</th>
 			<th>jumlah</th>
 			<th>Subberat (Gr)</th>
 			<th>Subtotal</th>
 		</tr>
 	</thead>
 	<tbody>
 		<?php $nomor=1 ?>
 		<?php $ambil=$koneksi->query("select * from pembelian_produk where id_pembelian='$_GET[id]'"); ?>
 		<?php while($pecah=$ambil->fetch_assoc()){ ?>
 		<tr>
 			<td><?php echo $nomor; ?></td>
 			<td><?php echo $pecah['nama'];?></td>
 			<td> Rp. <?php echo number_format($pecah['harga']); ?></td>
 			<td><?php echo $pecah['berat'];?></td>
 			<td><?php echo $pecah['jumlah']; ?></td>
 			<td><?php echo $pecah['subberat']; ?></td>
 			<td> Rp. <?php echo number_format($pecah['subharga']); ?></td>
 		</tr>
 		<?php $nomor++; ?>
 	<?php } ?>
 	</tbody>
 </table>

 <div class="row">
 	<div class="col-md-7">
 		<div class="alert alert-info">
 			<p>
 				silahkan melakukan pembayaran senilai <br> 
 				Total Pembayaran = Rp. <?php echo number_format($detail['total_pembelian']); ?>  ke <br>
 				<strong>BANK BNI Syariah 245-5627 AN. Syahrul Hariansyah</strong>
 			</p>
 		</div>
 	</div>
 </div>

	</div>
</section>

</body>
</html>