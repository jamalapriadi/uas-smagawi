<?php $__env->startSection('content'); ?>
	<legend>Tambah Pengawas</legend>

	<?php echo Form::model($pengawas,array('url'=>route('admin.pengawas.update',['pengawas'=>$pengawas->nip]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('nip')): ?> has-error <?php endif; ?>">
			<label for="">NIP</label>
			<input type="text" name="nip" readonly="readonly" value="<?php echo e($pengawas->nip); ?>" class="form-control">
			<?php echo e($errors->first('nip')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama</label>
			<input type="text" name="nama" value="<?php echo e($pengawas->nama); ?>" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>
		
		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Update
			</button>
		</div>

	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>