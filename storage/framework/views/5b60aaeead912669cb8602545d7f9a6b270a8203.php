<?php $__env->startSection('content'); ?>
	<legend>Tambah Pengawas</legend>

	<?php echo e(Form::open(array('url'=>'admin/pengawas','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('nip')): ?> has-error <?php endif; ?>">
			<label for="">NIP</label>
			<input type="text" name="nip" class="form-control">
			<?php echo e($errors->first('nip')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama</label>
			<input type="text" name="nama" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('password')): ?> has-error <?php endif; ?>">
			<label for="">Password</label>
			<input type="password" name="password" class="form-control">
			<?php echo e($errors->first('password')); ?>

		</div>
		
		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>
		</div>

	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>