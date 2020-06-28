<?php 
session_start();
?>
<?php $koneksi = new mysqli("localhost","root","","tokoonline"); ?>
<?php  
// mendapatkan id produk dari url
$id_produk = $_GET['id'];

// query ambil data 
$ambil = $koneksi->query("SELECT * FROM produk WHERE id_produk='$id_produk'");
$detail = $ambil->fetch_assoc();

$fotoproduk=array();
$ambilfoto = $koneksi->query("SELECT * FROM produk_foto WHERE id_produk='$id_produk'");
while($tiap = $ambilfoto->fetch_assoc())
{
	$fotoproduk[]=$tiap;
}
// echo "<pre>";
// print_r($detail);
// print_r($fotoproduk);
// echo "</pre>";

?>
<!DOCTYPE html>
<html>
<head>
	<title>Detail Produk</title>
	<link rel="stylesheet" type="text/css" href="admin/bs-binary-admin/assets/css/bootstrap.css">
</head>
<body>
<?php include 'menu.php' ?>

<section class="konten">
	<div class="container">
		<div class="row">
			<?php foreach ($fotoproduk as $key => $value): ?>
				
			
			<div class="col-md-6">
				<img src="admin/foto_produk/<?php echo $value['nama_produk_foto']; ?>" alt="" class="img-responsive" >
			</div>
			
			<?php endforeach ?>
			<div class="col-md-6">
				<h2><?php echo $detail['nama_produk'] ?></h2>
				<h4>Rp. <?php echo number_format($detail['harga_produk']); ?></h4>

				<h5>Stock: <?php echo $detail['stok_produk'] ?></h5>

				<form method="post">
					<div class="form-group">
						<div class="input-group">
							<input type="number" min="1" class="form-control" name="jumlah" max="<?php echo $detail['stok_produk'] ?>">
							<div class="input-group-btn">
								<button class="btn btn-primary" name="beli">Beli</button>
							</div>
						</div>
					</div>
				</form>

				<?php  
				// jika ada tombol beli
				if (isset($_POST["beli"]))
				{
					// mendapatkan jumlah yang diinputkan
					$jumlah = $_POST['jumlah'];
					// masukkan dikeranjang belanja
					$_SESSION['keranjang'][$id_produk] = $jumlah;
					echo "<script>alert('produk telah masuk di keranjang belanja');</script>";
					echo "<script>location='keranjang.php';</script>";
				}

				?>
				<p><?php echo $detail['deskripsi_produk']; ?></p>
			</div>
		</div>
	</div>
</section>

</body>
</html>