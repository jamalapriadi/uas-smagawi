<?php $__env->startSection('content'); ?>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Profile</p>
		</div>

		<div class="panel-body">
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
					<td>Kelas</td>
					<td> : <?php echo e($siswa->kd_kelas); ?></td>
				</tr>
			</table>
		</div>

		<div class="panel-footer">
			<a href="<?php echo e(URL::to('siswa/lihat-ujian')); ?>" class="btn btn-primary">
				Lanjutkan
				<i class="glyphicon glyphicon-chevron-right"></i>
			</a>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>