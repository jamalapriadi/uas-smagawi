<?php $__env->startSection('content'); ?>
    <legend>Laporan Peserta Ujian</legend>

    <?php echo e(Form::open(array('url'=>'admin/laporan/preview-peserta','method'=>'post','class'=>'form-horizontal'))); ?>

        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Ruang Ujian</label>
            <div class="col-lg-4">
                <select name="ruang" id="ruang" class="form-control">
                    <option value="">--Pilih Ruang Ujian--</option>
                    <?php foreach($ruang as $row): ?>
                        <option value="<?php echo e($row->id_ruang); ?>"><?php echo e($row->nama_ruang); ?></option>
                    <?php endforeach; ?>
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