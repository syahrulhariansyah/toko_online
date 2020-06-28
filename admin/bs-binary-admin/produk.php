<h2>Data Produk</h2>
<br>
<a href="index.php?halaman=tambahproduk" class="btn btn-primary btn-tambah">Tambah Data</a>
<br>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>No</th>
			<th>Kategori</th>
			<th>Nama</th>
			<th>Harga</th>
			<th>Berat</th>
			<th>Foto</th>
			<th>Deskripsi</th>
			<th>Stok</th>
			<th>aksi</th>
		</tr>
	</thead>
	<tbody>
		<?php $nomor=1; ?>
		<?php $ambil=$koneksi->query("select * from produk left join kategori on produk.id_kategori=kategori.id_kategori"); ?>
		<?php while($pecah = $ambil->fetch_assoc()){ ?>
		<tr>
			<td><?php echo $nomor; ?></td>
			<td><?php echo $pecah['nama_kategori']; ?></td>
			<td><?php echo $pecah['nama_produk']; ?></td>
			<td><?php echo $pecah['harga_produk']; ?></td>
			<td><?php echo $pecah['berat']; ?></td>
			<td>
				<img src="../foto_produk/<?php echo $pecah['foto_produk']; ?>" widht="100">
			</td>
			<td><?php echo $pecah['deskripsi_produk']; ?></td>
			<td><?php echo $pecah['stok_produk']; ?></td>
			<td>
				<a href="index.php?halaman=hapusproduk&id=<?php echo $pecah['id_produk']; ?>" class="btn btn-danger" onclick="return confirm('yakin hapus?')"><i class="glyphicon glyphicon-trash"></i> hapus</a>
				<br>
				<a href="index.php?halaman=ubahproduk&id=<?php echo $pecah['id_produk']; ?>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i>ubah</a>
				<br>
				<a href="index.php?halaman=detailproduk&id=<?php echo $pecah['id_produk']; ?>" class="btn btn-info"><i class="glyphicon glyphicon-eye"></i>Detail</a>
			</td>
		</tr>>
		<?php $nomor++; ?>
	<?php } ?>
	</tbody>>
</table> 

		
			

