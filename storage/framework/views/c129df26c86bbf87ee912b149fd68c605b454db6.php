<?php $__env->startSection('content'); ?>
	<legend>Tambah Mapel</legend>

	<?php echo Form::model($mapel,array('url'=>route('admin.mapel.update',['mapel'=>$mapel->kd_mapel]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('kode')): ?> has-error <?php endif; ?>">
			<label for="">Kode Mata Pelajaran</label>
			<input type="text" name="kode" value="<?php echo e($mapel->kd_mapel); ?>" class="form-control">
			<?php echo e($errors->first('kode')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama Mata Pelajaran</label>
			<input type="text" name="nama" value="<?php echo e($mapel->nm_mapel); ?>" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Update
			</button>

			<a href="<?php echo e(URL::to('admin/mapel')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>