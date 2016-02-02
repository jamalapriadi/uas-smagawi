<?php $__env->startSection('content'); ?>
	<legend>Tambah Soal</legend>

	<?php echo e(Form::open(array('url'=>'guru/simpan-soal','method'=>'post','files'=>true))); ?>

		<div class="form-group <?php if($errors->has('soal')): ?> has-error <?php endif; ?>">
			<label for="">Soal</label>
			<input type="file" name="soal" class="form-control">
			<?php echo e($errors->first('soal')); ?>

		</div>

		<div class="form-group <?php if($errors->has('kunci')): ?> has-error <?php endif; ?>">
			<label for="">Kunci Jawaban</label>
			<select name="kunci" id="kunci" class="form-control">
				<option value="">--Pilih Kunci Jawaban--</option>
				<option value="a">A</option>
				<option value="b">B</option>
				<option value="c">C</option>
				<option value="d">D</option>
				<option value="e">E</option>
			</select>
			<?php echo e($errors->first('kunci')); ?>

		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="<?php echo e(URL::to('guru')); ?>" class="btn btn-default">
				Kembali
			</a>
		</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('guru.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>