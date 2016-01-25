<?php $__env->startSection('content'); ?>
	<legend>Tambah Soal</legend>

	<?php if(Session::has('pesan')): ?>
		<div class="alert alert-success">
			<?php echo e(Session::get('pesan')); ?>

		</div>
	<?php endif; ?>
	
	<?php echo e(Form::open(array('url'=>'admin/simpan-soal','method'=>'post'))); ?>

	<div class="row">
		<div class="col-lg-8">
			<div class="form-group">
				<label for="">Pertanyaan</label>
				<input type="hidden" name="soal" value="<?php echo e($soal->id); ?>">
				<textarea name="pertanyaan" class="form-control" id="pertanyaan" cols="30" rows="10"></textarea>
			</div>

			<div class="form-group">
				<label for="">Jawaban A</label>
				<input type="text" name="jawabana" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban B</label>
				<input type="text" name="jawabanb" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban C</label>
				<input type="text" name="jawabanc" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban D</label>
				<input type="text" name="jawaband" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Jawaban E</label>
				<input type="text" name="jawabane" class="form-control">
			</div>

			<div class="form-group">
				<label for="">Kunci Jawaban</label>
				<select name="kunci" id="kunci" class="form-control">
					<option value="a">A</option>
					<option value="b">B</option>
					<option value="c">C</option>
					<option value="d">D</option>
					<option value="e">E</option>
				</select>
			</div>

			<div class="form-group well">
				<label for=""></label>
				<button class="btn btn-primary">
					<i class="glyphicon glyphicon-saved"></i>
					Simpan
				</button>

				<a href="<?php echo e(URL::to('admin/soal/'.$soal->id)); ?>" class="btn btn-default">
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