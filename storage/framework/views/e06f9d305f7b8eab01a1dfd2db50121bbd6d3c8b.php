<?php $__env->startSection('content'); ?>
	<legend>Tambah Siswa</legend>

	<?php echo e(Form::open(array('url'=>'admin/siswa','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('nis')): ?> has-error <?php endif; ?>">
			<label for="">NIS</label>
			<input type="text" name="nis" class="form-control">
			<?php echo e($errors->first('nis')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nisn')): ?> has-error <?php endif; ?>">
			<label for="">NISN</label>
			<input type="text" name="nisn" class="form-control">
			<?php echo e($errors->first('nisn')); ?>

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

		<div class="form-group <?php if($errors->has('kelas')): ?> has-error <?php endif; ?>">
			<label for="">Kelas</label>
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<?php foreach($kelas as $row): ?>
					<option value="<?php echo e($row->kd_kelas); ?>"><?php echo e($row->kd_kelas); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('kelas')); ?>

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