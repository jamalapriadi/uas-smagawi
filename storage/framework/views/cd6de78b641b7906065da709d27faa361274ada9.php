<?php $__env->startSection('content'); ?>
    <legend>Tambah Soal</legend>

    <?php echo e(Form::open(array('url'=>'guru/update-soal','method'=>'post','files'=>true))); ?>

        <div class="form-group <?php if($errors->has('soal')): ?> has-error <?php endif; ?>">
            <label for="">Soal</label>
            <?php echo e(Html::image('uploads/small/'.$detail->gambar_kecil,'',array('class'=>'img-responsive'))); ?>

        </div>

        <div class="form-group <?php if($errors->has('soal')): ?> has-error <?php endif; ?>">
            <input type="hidden" name="kode" value="<?php echo e($detail->id); ?>" class="form-control">
            <input type="file" name="soal" class="form-control" value="">
            <?php echo e($errors->first('soal')); ?>

        </div>

        <div class="form-group <?php if($errors->has('kunci')): ?> has-error <?php endif; ?>">
            <label for="">Kunci Jawaban</label>
            <select name="kunci" id="kunci" class="form-control">
                <option value="">--Pilih Kunci Jawaban--</option>
                <option value="a" <?php if($detail->kunci_jawaban=='a'): ?> selected='selected' <?php endif; ?>>A</option>
                <option value="b" <?php if($detail->kunci_jawaban=='b'): ?> selected='selected' <?php endif; ?>>B</option>
                <option value="c" <?php if($detail->kunci_jawaban=='c'): ?> selected='selected' <?php endif; ?>>C</option>
                <option value="d" <?php if($detail->kunci_jawaban=='d'): ?> selected='selected' <?php endif; ?>>D</option>
                <option value="e" <?php if($detail->kunci_jawaban=='e'): ?> selected='selected' <?php endif; ?>>E</option>
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