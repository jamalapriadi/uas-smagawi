<?php $__env->startSection('head'); ?>
	<?php echo e(Html::style('assets/fancybox/jquery.fancybox.css')); ?>

	<style>
		img.kecil{
			width: 200px;
		}
	</style>
<?php $__env->stopSection(); ?>

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

	<hr>

	<div id="pesan"></div>

	<table class="table" id="datatabel">
				<thead>
					<tr>
						<th>No.</th>
						<th>Soal</th>
						<th>Jawaban</th>
					</tr>
				</thead>
				<tbody>
					<?php $no=0;?>
					<?php foreach($detail as $row): ?>
						<?php $no++;?>
						<tr>
							<td><?php echo e($no); ?></td>
							<td>
								<a class="single_image" href="<?php echo e(URL::asset('uploads/big/'.$row->gambar_kecil)); ?>">
									<?php echo e(Html::image('uploads/small/'.$row->gambar_kecil,'',array('class'=>'kecil img-responsive'))); ?>

								</a>
							</td>
							<td><?php echo e($row->kunci_jawaban); ?></td>
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
	<?php echo e(Html::script('assets/fancybox/jquery.fancybox.js')); ?>


	<script>
		$(function(){
			$("a.single_image").fancybox();
			$("#datatabel").dataTable();

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