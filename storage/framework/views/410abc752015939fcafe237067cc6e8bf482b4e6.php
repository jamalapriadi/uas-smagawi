<?php $__env->startSection('content'); ?>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Profile</p>
		</div>

		<div class="panel-body">
			<?php if(Session::has('pesan')): ?>
				<div class="alert alert-success">
					<?php echo e(Session::get('pesan')); ?>

				</div>
			<?php endif; ?>
			<table class="table table-striped">
				<tr>
					<td>NIS</td>
					<td> : <?php echo e($siswa->nis); ?></td>
				</tr>
				<tr>
					<td>Nama</td>
					<td> : <?php echo e($siswa->nama); ?></td>
				</tr>
				<tr>
					<td>Jurusan</td>
					<td> : <?php echo e($siswa->kelas->kode_jurusan); ?></td>
				</tr>
				<tr>
					<td>Kelas</td>
					<td> : <?php echo e($siswa->kd_kelas); ?></td>
				</tr>
				<tr>
					<td>Ruang Ujian</td>
					<td> : <?php echo e($peserta->ruang->nama_ruang); ?></td>
				</tr>
			</table>
		</div>

		<div class="panel-footer">
			<?php if(count($peserta)>0): ?>
				<?php echo e(Form::open(['url'=>'siswa/lihat-ujian','method'=>'post'])); ?>

					<input type="hidden" name="jurusan" value="<?php echo e($siswa->kelas->kode_jurusan); ?>">
					<button class="btn btn-primary">
						Lanjutkan
						<i class="glyphicon glyphicon-chevron-right"></i>
					</button>
				<?php echo e(Form::close()); ?>

			<?php else: ?>
				<a href="#" class="btn btn-default" disabled>
					Tidak ada Ruang Ujian
					<i class="glyphicon glyphicon-chevron-right"></i>
				</a>
			<?php endif; ?>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>