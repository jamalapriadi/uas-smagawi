<?php $__env->startSection('content'); ?>
	<legend>Tambah Guru</legend>

	<?php echo e(Form::open(array('url'=>'admin/guru','method'=>'post'))); ?>

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

		<div class="form-group <?php if($errors->has('mapel')): ?> has-error <?php endif; ?>">
			<label for="">Mapel</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mapel--</option>
				<?php foreach($mapel as $row): ?>
					<option value="<?php echo e($row->kd_mapel); ?>"><?php echo e($row->nm_mapel); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('mapel')); ?>

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