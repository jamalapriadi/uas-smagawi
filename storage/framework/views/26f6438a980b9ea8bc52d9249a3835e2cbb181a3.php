<?php $__env->startSection('content'); ?>
    <legend>Import Data Siswa</legend>

    <?php echo e(Form::open(array('url'=>'admin/proses-import-siswa','method'=>'post','files'=>true))); ?>

        <div class="form-group <?php if($errors->has('excel')): ?> has-error <?php endif; ?>">
            <label for="">Pilih File ( Excel )</label>
            <input type="file" name="excel" class="form-control">
            <?php echo e($errors->first('excel')); ?>

        </div>

        <div class="form-group well">
            <button class="btn btn-primary">
                <i class="glyphicon glyphicon-upload"></i>
                Upload
            </button>

            <a href="<?php echo e(URL::to('admin/siswa')); ?>" class="btn btn-default">Kembali</a>
        </div>
    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>