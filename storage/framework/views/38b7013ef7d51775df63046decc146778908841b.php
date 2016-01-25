<?php $__env->startSection('content'); ?>
	<legend>Data Soal # <?php echo e($soal->kd_mapel); ?></legend>

	<table class="table table-bordered">
		<tr>
			<td style="width:40%">Mata Pelajaran</td>
			<td> :  <?php echo e($soal->kd_mapel); ?></td>
		</tr>
		<tr>
			<td>Jurusan</td>
			<td> : <?php echo e($soal->kode_jurusan); ?></td>
		</tr>
		<tr>
			<td>Waktu Ujian</td>
			<td> : <?php echo e($soal->waktu_ujian); ?> Menit</td>
		</tr>
	</table>

	<a href="<?php echo e(URL::to('admin/tambah-soal/'.$soal->id)); ?>" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Soal
	</a>

	<hr>

	<div id="pesan"></div>

	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>Pertanyaan</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($detail as $row): ?>
				<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->pertanyaan); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/detail-soal/'.$row->id.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						<a href="#" kode="<?php echo e($row->id); ?>" class="btn btn-danger hapus">
							<i class="glyphicon glyphicon-trash"></i>
							Hapus
						</a>
					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	          <h4 class="modal-title">Keterangan</h4>
	        </div>
	        <div class="modal-body">
	        	<div id="loading" style="display:none;">Loading</div>
	        	<input type="hidden" id="idhapus">
	        	Apakah anda yakin ingin menghapus data ini??
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          <a href="#" id="konfirmasi" class="btn btn-primary">
	          	Hapus
	          </a>
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	<script>
		$(function(){
			$("#konfirmasi").click(function(){
				var kode=$("#idhapus").val();

				$.ajax({
					url:"<?php echo e(URL::to('admin/hapus-soal')); ?>",
					type:"POST",
					data:"kode="+kode,
					cache:false,
					success:function(){
						location.reload();
					},
					error:function(){
						$("#pesan").html("<div class='alert alert-danger'>Data Gagal dihapus</div>");
						$("#myModal").modal("hide");
					}
				})
			})
		})
	</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>