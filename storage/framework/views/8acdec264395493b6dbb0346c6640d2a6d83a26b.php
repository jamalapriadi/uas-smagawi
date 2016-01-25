<?php $__env->startSection('content'); ?>
	<legend>Tambah Siswa</legend>

	<?php echo Form::model($siswa,array('url'=>route('admin.siswa.update',['siswa'=>$siswa->nis]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('nis')): ?> has-error <?php endif; ?>">
			<label for="">NIS</label>
			<input type="text" name="nis" value="<?php echo e($siswa->nis); ?>" readonly="readonly" class="form-control">
			<?php echo e($errors->first('nis')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nisn')): ?> has-error <?php endif; ?>">
			<label for="">NISN</label>
			<input type="text" name="nisn" value="<?php echo e($siswa->nisn); ?>" class="form-control">
			<?php echo e($errors->first('nisn')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama</label>
			<input type="text" name="nama" value="<?php echo e($siswa->nama); ?>" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kelas')): ?> has-error <?php endif; ?>">
			<label for="">Kelas</label>
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<?php foreach($kelas as $row): ?>
					<option value="<?php echo e($row->kd_kelas); ?>" <?php if($siswa->kd_kelas==$row->kd_kelas): ?> selected='selected' <?php endif; ?>><?php echo e($row->kd_kelas); ?></option>
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