<?php $__env->startSection('content'); ?>
	<legend>Tambah Soal</legend>

	<?php echo Form::model($soal,array('url'=>route('admin.soal.update',['soal'=>$soal->id]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('mapel')): ?> has-error <?php endif; ?>">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				<?php foreach($mapel as $m): ?>
					<option value="<?php echo e($m->kd_mapel); ?>" <?php if($soal->kd_mapel==$m->kd_mapel): ?> selected='selected' <?php endif; ?>><?php echo e($m->nm_mapel); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('mapel')); ?>

		</div>

		<div class="form-group <?php if($errors->has('jurusan')): ?> has-error <?php endif; ?>">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				<?php foreach($jurusan as $jur): ?>
					<option value="<?php echo e($jur->kode_jurusan); ?>" <?php if($soal->kode_jurusan==$jur->kode_jurusan): ?> selected='selected' <?php endif; ?>><?php echo e($jur->kode_jurusan); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('jurusan')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/soal')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>