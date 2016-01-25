<?php $__env->startSection('content'); ?>
	<legend>Tambah Ruang</legend>

	<?php if(Session::has('pesan')): ?>
		<div class="alert alert-success">
			<?php echo e(Session::get('pesan')); ?>

		</div>
	<?php endif; ?>

	<?php echo e(Form::open(array('url'=>'admin/simpan-ruang','method'=>'post'))); ?>

		<div class="form-group <?php if($errors->has('kelas')): ?> has-error <?php endif; ?>">
			<label for="">Kelas</label>
			<input type="hidden" name="kode" value="<?php echo e($jadwal->id_jadwal); ?>">
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<?php foreach($kelas as $row): ?>
					<option value="<?php echo e($row->kd_kelas); ?>"><?php echo e($row->kd_kelas); ?></option>
				<?php endforeach; ?>
			</select>
			<?php echo e($errors->first('kelas')); ?>

		</div>

		<div class="form-group <?php if($errors->has('ruang')): ?> has-error <?php endif; ?>">
			<label for="">Ruang Ujian</label>
			<select name="ruang" id="ruang" class="form-control">
				<option value="">--Pilih Ruang Ujian--</option>
				<?php foreach($ruang as $r): ?>
					<option value="<?php echo e($r->id_ruang); ?>"><?php echo e($r->nama_ruang); ?></option>
				<?php endforeach; ?>
			</select>
		</div>

		<div class="form-group <?php if($errors->has('pengawas')): ?> has-error <?php endif; ?>">
			<label for="">Pengawas</label>
			<select name="pengawas" id="pengawas" class="form-control">
				<option value="">--Pilih Pengawas--</option>
				<?php foreach($pengawas as $p): ?>
					<option value="<?php echo e($p->nip); ?>"><?php echo e($p->nama); ?></option>
				<?php endforeach; ?>
			</select>
		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('admin/jadwal/'.$jadwal->id_jadwal)); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>