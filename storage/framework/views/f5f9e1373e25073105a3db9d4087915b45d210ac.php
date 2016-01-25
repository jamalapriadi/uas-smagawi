<?php $__env->startSection('content'); ?>
	<legend>Tambah Soal</legend>

	<?php if(Session::has('pesan')): ?>
		<div class="alert alert-success">
			<?php echo e(Session::get('pesan')); ?>

		</div>
	<?php endif; ?>
	
	<?php echo e(Form::open(array('url'=>'admin/update-soal','method'=>'post'))); ?>

	<div class="row">
		<div class="col-lg-8">
			<div class="form-group">
				<label for="">Pertanyaan</label>
				<input type="hidden" name="kode" value="<?php echo e($detail->id); ?>">
				<textarea name="pertanyaan" class="form-control" id="pertanyaan" cols="30" rows="10"><?php echo e($detail->pertanyaan); ?></textarea>
			</div>

			<div class="form-group">
				<label for="">Jawaban A</label>
				<input type="text" name="jawabana" value="<?php echo e($detail->jawaban_a); ?>" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban B</label>
				<input type="text" name="jawabanb" value="<?php echo e($detail->jawaban_b); ?>" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban C</label>
				<input type="text" name="jawabanc" value="<?php echo e($detail->jawaban_c); ?>" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban D</label>
				<input type="text" name="jawaband" value="<?php echo e($detail->jawaban_d); ?>" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban E</label>
				<input type="text" name="jawabane" value="<?php echo e($detail->jawaban_e); ?>" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Kunci Jawaban</label>
				<select name="kunci" id="kunci" class="form-control">
					<option value="a" <?php if($detail->kunci_jawaban=='a'): ?> selected='selected' <?php endif; ?>>A</option>
					<option value="b" <?php if($detail->kunci_jawaban=='b'): ?> selected='selected' <?php endif; ?>>B</option>
					<option value="c" <?php if($detail->kunci_jawaban=='c'): ?> selected='selected' <?php endif; ?>>C</option>
					<option value="d" <?php if($detail->kunci_jawaban=='d'): ?> selected='selected' <?php endif; ?>>D</option>
					<option value="e" <?php if($detail->kunci_jawaban=='e'): ?> selected='selected' <?php endif; ?>>E</option>
				</select>
			</div>

			<div class="form-group well">
				<label for=""></label>
				<button class="btn btn-primary">
					<i class="glyphicon glyphicon-saved"></i>
					Simpan
				</button>

				<a href="<?php echo e(URL::to('admin/soal/'.$detail->id_soal)); ?>" class="btn btn-default">
					Kembali
				</a>
			</div>
		</div>

		<div class="col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<p>Feature Image</p>
				</div>
				<div class="panel-body">
					<input type="file" name="gambar" class="form-control">
				</div>
			</div>
		</div>
	</div>
	<?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	<script src="<?php echo e(URL::asset('assets/ckeditor/ckeditor.js')); ?>"></script>

	<script>
		$(function(){
			CKEDITOR.replace( 'content' );
		});
	</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>