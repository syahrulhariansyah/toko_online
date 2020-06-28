<h2>Ubah Kategori</h2>
<?php  
$ambil = $koneksi->query("select * from kategori where id_kategori='$_GET[id]'");
$pecah = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($pecah);
// echo "</pre>";

?>

<form method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label>Nama Kategori</label>
		<input type="text" class="form-control" name="nama" value="<?php echo $pecah['nama_kategori']; ?>">
	</div>
<button class="btn btn-warning" name="edit"><i class="glyphicon glyphicon-edit"></i>Ubah</button>
</form>

<?php  
if (isset($_POST['edit'])) 
{
	$koneksi->query("update kategori set nama_kategori='$_POST[nama]' where id_kategori='$_GET[id]'");

	echo "<div class='alert alert-info'>Data Kategori diubah</div>";
	echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=kategori'>";
}

?>