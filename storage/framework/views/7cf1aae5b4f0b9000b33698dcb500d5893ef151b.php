<?php $__env->startSection('content'); ?>
	<legend>Tambah Jurusan</legend>

	<?php echo Form::model($kelas,array('url'=>route('admin.kelas.update',['kelas'=>$kelas->kd_kelas]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('kode')): ?> has-error <?php endif; ?>">
			<label for="">Kelas</label>
			<select name="kode" id="kode" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<option value="x" <?php if($kelas->kelas=='x'): ?> selected='selected' <?php endif; ?>>X</option>
			</select>
			<?php echo e($errors->first('kode')); ?>

		</div>

		<div class="form-group <?php if($errors->has('jurusan')): ?> has-error <?php endif; ?>">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				<?php foreach($jurusan as $row): ?>
					<option value="<?php echo e($row->kode_jurusan); ?>" <?php if($kelas->kode_jurusan==$row->kode_jurusan): ?> selected='selected' <?php endif; ?>><?php echo e($row->nama_jurusan); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('jurusan')); ?>

		</div>

		<div class="form-group <?php if($errors->has('sub')): ?> has-error <?php endif; ?>">
			<label for="">Sub Kelas</label>
			<input type="number" name="sub" value="<?php echo e($kelas->sub_kelas); ?>" class="form-control">
			<?php echo e($errors->first('sub')); ?>

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