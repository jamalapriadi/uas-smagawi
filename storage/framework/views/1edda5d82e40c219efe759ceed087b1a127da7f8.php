<?php $__env->startSection('content'); ?>
	<legend>Tambah Data Jadwal</legend>

	<?php echo Form::model($jadwal,array('url'=>route('admin.jadwal.update',['jadwal'=>$jadwal->id_jadwal]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('mapel')): ?> has-error <?php endif; ?>">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				<?php foreach($mapel as $map): ?>
					<option value="<?php echo e($map->kd_mapel); ?>" <?php if($jadwal->kd_mapel==$map->kd_mapel): ?> selected='selected' <?php endif; ?>><?php echo e($map->nm_mapel); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('mapel')); ?>

		</div>

		<div class="form-group <?php if($errors->has('tanggal')): ?> has-error <?php endif; ?>">
			<label for="">Tanggal</label>
			<div class="input-group">
				<input type="text" id="tanggal" value="<?php echo e($jadwal->tgl_ujian); ?>" name="tanggal" class="form-control">
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			<?php echo e($errors->first('tanggal')); ?>

		</div>

		<div class="form-group <?php if($errors->has('jam')): ?> has-error <?php endif; ?>">
			<label for="">Jam</label>
			<input type="text" name="jam" value="<?php echo e($jadwal->jam); ?>" id="jam" class="form-control">
			<?php echo e($errors->first('jam')); ?>

		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>