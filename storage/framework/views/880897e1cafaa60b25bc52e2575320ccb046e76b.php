<?php $__env->startSection('content'); ?>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Selesai</p>
		</div>

		<div class="panel-body">
			<p>Apakah anda yakin ingin menghakhiri ujian ini??</p>
		</div>

		<div class="panel-footer">
			<a href="#" class="btn btn-primary">Selesai</a>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>