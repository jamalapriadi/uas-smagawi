<?php $__env->startSection('content'); ?>
	<legend>Tambah Data Jadwal</legend>

	<?php echo Form::model($jadwal,array('url'=>route('admin.jadwal.update',['jadwal'=>$jadwal->id_jadwal]),'method'=>'put')); ?>

		<div class="form-group <?php if($errors->has('jurusan')): ?> has-error <?php endif; ?>">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				<?php foreach($jurusan as $jur): ?>
					<option value="<?php echo e($jur->kode_jurusan); ?>" <?php if($jadwal->kode_jurusan==$jur->kode_jurusan): ?> selected='selected' <?php endif; ?>><?php echo e($jur->nama_jurusan); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('jurusan')); ?>

		</div>

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
			<label for="">Jam Mulai</label>
			<input type="text" name="jam" value="<?php echo e($jadwal->jam); ?>" id="jam" class="form-control">
			<?php echo e($errors->first('jam')); ?>

		</div>

		<div class="form-group <?php if($errors->has('selesai')): ?> has-error <?php endif; ?>">
			<label for="">Jam Selesai</label>
			<input type="text" name="selesai" value="<?php echo e($jadwal->selesai); ?>" id="selesai" class="form-control">
			<?php echo e($errors->first('selesai')); ?>

		</div>

		<div class="form-group <?php if($errors->has('lama')): ?> has-error <?php endif; ?>">
			<label for="">Waktu Ujian ( Menit )</label>
			<input type="number" name="lama" value="<?php echo e($jadwal->waktu_ujian); ?>" id="lama" class="form-control">
			<?php echo e($errors->first('lama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('sesi')): ?> has-error <?php endif; ?>">
			<label for="">Sesi</label>
			<select name="sesi" id="sesi" class="form-control">
				<option value="">--Pilih Sesi--</option>
				<option value="1" <?php if($jadwal->sesi==1): ?> selected='selected' <?php endif; ?>>1</option>
				<option value="2" <?php if($jadwal->sesi==2): ?> selected='selected' <?php endif; ?>>2</option>
				<option value="3" <?php if($jadwal->sesi==3): ?> selected='selected' <?php endif; ?>>3</option>
			</select>
			<?php echo e($errors->first('sesi')); ?>

		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/jadwal')); ?>" class="btn btn-default">Kembali</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>