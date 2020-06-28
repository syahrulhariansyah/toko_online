<h3>Data Kategori</h3>
<hr>
<?php
$semuadata=array();  
$koneksi = new mysqli("localhost","root","","tokoonline");
$ambil = $koneksi->query("SELECT * FROM kategori");
while($tiap = $ambil->fetch_assoc())

{
	$semuadata[]=$tiap;
}
// echo "<pre>";
// print_r($semuadata);
// echo "</pre>";

?>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>No</th>
			<th>Kategori</th>
			<th>Aksi</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($semuadata as $key => $value): ?>
			
		
		<tr>
			<td><?php echo $key+1 ?></td>
			<td><?php echo $value['nama_kategori'] ?></td>
			<td>
				<a href="index.php?halaman=ubahkategori&id=<?php echo $value['id_kategori']; ?>" class="btn btn-warning btn-sm"> <i class="glyphicon glyphicon-edit"></i>Ubah</a>
				<a href="index.php?halaman=hapuskategori&id=<?php echo $value['id_kategori']; ?>" class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i>Hapus</a>
			</td>
		</tr>
		<?php endforeach ?>
	</tbody>
</table>

<a href="index.php?halaman=tambahkategori" class="btn btn-primary" class="btn btn-primary"> <i class="glyphicon glyphicon-info"></i>Tambah Data</a>