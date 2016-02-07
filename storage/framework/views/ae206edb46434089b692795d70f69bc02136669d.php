<?php $__env->startSection('content'); ?>
    <legend>Laporan Data Nilai</legend>

    <?php echo e(Form::open(['url'=>'admin/laporan/preview-nilai','method'=>'post','class'=>'form-horizontal'])); ?>

        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Kelas</label>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Mata Pelajaran</label>
            <div class="col-lg-4">
                <select name="mapel" id="mapel" class="form-control">
                    <option value="">--Pilih Mata Pelajaran--</option>
                </select>
            </div>
        </div>

        <div class="form-group well">
            <label for="" class="col-lg-2 control-label"></label>
            <button class="btn btn-primary">
                <i class="glyphicon glyphicon-print"></i>
                Tampilkan
            </button>
        </div>
    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>