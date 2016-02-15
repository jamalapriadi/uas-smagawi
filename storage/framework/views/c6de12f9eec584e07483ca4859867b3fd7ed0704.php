<?php $__env->startSection('content'); ?>
    <legend>Data Kartu Peserta</legend>

    <?php echo e(Form::open(['url'=>'admin/laporan/preview-kartu-peserta','method'=>'post','class'=>'form-horizontal'])); ?>

        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Pilih Kelas</label>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                    <?php foreach($kelas as $row): ?>
                        <option value="<?php echo e($row->kd_kelas); ?>"><?php echo e($row->kd_kelas); ?></option>
                    <?php endforeach; ?>
                    <option value="semua">Semua</option>
                </select>
            </div>
        </div>

        <div class="form-group well">
            <label for="" class="col-lg-2 control-label"></label>
            <div class="col-lg-4">
                <button class="btn btn-primary">
                    <i class="glyphicon glyphicon-print"></i>
                    Tampilkan
                </button>
            </div>
        </div>
    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>