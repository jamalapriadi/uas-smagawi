<?php $__env->startSection('content'); ?>
	<legend>Tambah Siswa</legend>

	<?php echo e(Form::open(array('url'=>'admin/siswa','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('peserta')): ?> has-error <?php endif; ?>">
			<label for="">No. Peserta Ujian</label>
			<input type="text" name="peserta" class="form-control">
			<?php echo e($errors->first('peserta')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nis')): ?> has-error <?php endif; ?>">
			<label for="">NISN</label>
			<input type="text" name="nis" class="form-control">
			<?php echo e($errors->first('nis')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
			<label for="">Nama</label>
			<input type="text" name="nama" class="form-control">
			<?php echo e($errors->first('nama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('jk')): ?> has-error <?php endif; ?>">
			<label for="">jk</label>
			<select name="jk" id="jk" class="form-control">
				<option value="">Pilih Jenis Kelamin</option>
				<option value="L">Laki - Laki</option>
				<option value="P">Perempuan</option>
			</select>
			<?php echo e($errors->first('jk')); ?>

		</div>

		<div class="form-group <?php if($errors->has('tempat')): ?> has-error <?php endif; ?>">
			<label for="">Tempat Lahir</label>
			<input type="text" name="tempat" class="form-control">
			<?php echo e($errors->first('tempat')); ?>

		</div>

		<div class="form-group <?php if($errors->has('tanggal')): ?> has-error <?php endif; ?>">
			<label for="">Tanggal Lahir</label>
			<input type="text" name="tanggal" id="tanggal" class="form-control">
			<?php echo e($errors->first('tanggal')); ?>

		</div>

		<div class="form-group <?php if($errors->has('nik')): ?> has-error <?php endif; ?>">
			<label for="">NIK</label>
			<input type="text" name="nik" class="form-control">
			<?php echo e($errors->first('nik')); ?>

		</div>

		<div class="form-group <?php if($errors->has('agama')): ?> has-error <?php endif; ?>">
			<label for="">Agama</label>
			<select name="agama" id="agama" class="form-control">
				<option value="">Pilih Agama</option>
				<option value="Islam">Islam</option>
				<option value="Kristen">Kristen</option>
				<option value="Budha">Budha</option>
				<option value="Katolik">Katolik</option>
				<option value="Hindu">Hindu</option>
			</select>
			<?php echo e($errors->first('agama')); ?>

		</div>

		<div class="form-group <?php if($errors->has('alamat')): ?> has-error <?php endif; ?>">
			<label for="">Alamat</label>
			<input type="text" name="alamat" class="form-control">
			<?php echo e($errors->first('alamat')); ?>

		</div>

		<div class="form-group <?php if($errors->has('rt')): ?> has-error <?php endif; ?>">
			<label for="">RT</label>
			<input type="text" name="rt" class="form-control">
			<?php echo e($errors->first('rt')); ?>

		</div>

		<div class="form-group <?php if($errors->has('rw')): ?> has-error <?php endif; ?>">
			<label for="">RW</label>
			<input type="text" name="rw" class="form-control">
			<?php echo e($errors->first('rw')); ?>

		</div>

		<div class="form-group <?php if($errors->has('dusun')): ?> has-error <?php endif; ?>">
			<label for="">Dusun</label>
			<input type="text" name="dusun" class="form-control">
			<?php echo e($errors->first('dusun')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kelurahan')): ?> has-error <?php endif; ?>">
			<label for="">Kelurahan</label>
			<input type="text" name="kelurahan" class="form-control">
			<?php echo e($errors->first('kelurahan')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kecamatan')): ?> has-error <?php endif; ?>">
			<label for="">Kecamatan</label>
			<input type="text" name="kecamatan" class="form-control">
			<?php echo e($errors->first('kecamatan')); ?>

		</div>

		<div class="form-group <?php if($errors->has('pos')): ?> has-error <?php endif; ?>">
			<label for="">Kode POS</label>
			<input type="text" name="pos" class="form-control">
			<?php echo e($errors->first('pos')); ?>

		</div>

		<div class="form-group <?php if($errors->has('skhun')): ?> has-error <?php endif; ?>">
			<label for="">No. SKHUN</label>
			<input type="text" name="skhun" class="form-control">
			<?php echo e($errors->first('skhun')); ?>

		</div>

		<div class="form-group <?php if($errors->has('ayah')): ?> has-error <?php endif; ?>">
			<label for="">Nama Ayah</label>
			<input type="text" name="ayah" class="form-control">
			<?php echo e($errors->first('ayah')); ?>

		</div>

		<div class="form-group <?php if($errors->has('ibu')): ?> has-error <?php endif; ?>">
			<label for="">Nama Ibu</label>
			<input type="text" name="ibu" class="form-control">
			<?php echo e($errors->first('ibu')); ?>

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

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/siswa')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>