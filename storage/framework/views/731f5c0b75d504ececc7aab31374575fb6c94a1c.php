<?php $__env->startSection('content'); ?>
	<legend>Tambah Jurusan</legend>

	<?php echo e(Form::open(array('url'=>'admin/kelas','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('rombel')): ?> has-error <?php endif; ?>">
			<label for="">Rombel</label>
			<input type="text" name="rombel" class="form-control">
			<?php echo e($errors->first('rombel')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kode')): ?> has-error <?php endif; ?>">
			<label for="">Kelas</label>
			<select name="kode" id="kode" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<option value="x">X</option>
			</select>
			<?php echo e($errors->first('kode')); ?>

		</div>

		<div class="form-group <?php if($errors->has('jurusan')): ?> has-error <?php endif; ?>">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				<?php foreach($jurusan as $row): ?>
					<option value="<?php echo e($row->kode_jurusan); ?>"><?php echo e($row->nama_jurusan); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('jurusan')); ?>

		</div>

		<div class="form-group <?php if($errors->has('sub')): ?> has-error <?php endif; ?>">
			<label for="">Sub Kelas</label>
			<input type="number" name="sub" class="form-control">
			<?php echo e($errors->first('sub')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/kelas')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>