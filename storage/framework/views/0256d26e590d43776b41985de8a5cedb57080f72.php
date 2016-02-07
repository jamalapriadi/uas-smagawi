<legend>Soal No. <?php echo e($soal->soal_ke); ?></legend>
	<a class="single_image" href="<?php echo e(URL::asset('uploads/big/'.$soal->detail->gambar_besar)); ?>">
		<?php echo e(Html::image('uploads/small/'.$soal->detail->gambar_kecil,'',array('class'=>'img-responsive','style'=>' max-height:350px;'))); ?>

	</a>

	<hr>

	<div class="form-group">
		<label for="">Jawaban Anda</label>
		<select name="jawaban" id="jawaban" class="form-control">
			<option value="">--Pilih Jawaban--</option>
			<option value="a" <?php if($soal->jawaban=='a'): ?> selected='selected' <?php endif; ?>>A</option>
			<option value="b" <?php if($soal->jawaban=='b'): ?> selected='selected' <?php endif; ?>>B</option>
			<option value="c" <?php if($soal->jawaban=='c'): ?> selected='selected' <?php endif; ?>>C</option>
			<option value="d" <?php if($soal->jawaban=='d'): ?> selected='selected' <?php endif; ?>>D</option>
		</select>
	</div>
	
	<hr>
	<div class="well">
		<a href="#" no="<?php echo e($no); ?>" class="btn btn-success jawab">
			<?php if($soal->status==0): ?>
				Jawab
			<?php else: ?>
				Ubah Jawaban
			<?php endif; ?>
		</a>
	</div>
