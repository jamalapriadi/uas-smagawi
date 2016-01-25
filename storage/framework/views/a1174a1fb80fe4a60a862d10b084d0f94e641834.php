<?php $__env->startSection('content'); ?>
	<legend>Tambah Jurusan</legend>

	<?php echo e(Form::open(array('url'=>'admin/ruang','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama Ruang Ujian</label>
			<input type="text" name="nama" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kuota')): ?> has-error <?php endif; ?>">
			<label for="">Kuota</label>
			<input type="number" name="kuota" class="form-control">
			<?php echo e($errors->first('kuota')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/ruang')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>