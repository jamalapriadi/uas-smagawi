<?php $__env->startSection('content'); ?>
	<legend>Tambah Jurusan</legend>

	<?php echo e(Form::open(array('url'=>'admin/jurusan','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('kode')): ?> has-error <?php endif; ?>">
			<label for="">Kode Jurusan</label>
			<input type="text" name="kode" class="form-control">
			<?php echo e($errors->first('kode')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama Jurusan</label>
			<input type="text" name="nama" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/jurusan')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>