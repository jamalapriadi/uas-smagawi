<?php $__env->startSection('content'); ?>
	<?php echo e(Form::open(['url'=>'siswa/telah-selesai','method'=>'post'])); ?>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<p>Selesai</p>
			</div>

			<div class="panel-body">
				<input type="hidden" name="jadwal" value="<?php echo e($jadwal); ?>">
				<input type="hidden" name="detailjadwal" value="<?php echo e($detail); ?>">
				<p>Apakah anda yakin ingin menghakhiri ujian ini??</p>
			</div>

			<div class="panel-footer">
				<button class="btn btn-primary">
					<i class="glyphicon glyphicon-check"></i>
					Ya
				</button>

				<a href="<?php echo e(URL::to('siswa/ujian-berlangsung/'.$jadwal.'/'.$detail)); ?>" class="btn btn-default">
					Kembali
				</a>
			</div>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>