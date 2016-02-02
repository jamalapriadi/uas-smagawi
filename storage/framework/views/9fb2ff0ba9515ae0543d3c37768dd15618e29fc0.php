<?php $__env->startSection('content'); ?>
    <legend>Peserta Ujian</legend>

    <a href="<?php echo e(URL::to('admin/seting-peserta')); ?>" class="btn btn-primary">
        <i class="glyphicon glyphicon-cog"></i>
        Setting Peserta
    </a>

    <hr>

    <table class="table table-striped" id="data">
        <thead>
            <tr>
                <th>No.</th>
                <th>Ruang Ujian</th>
                <th>Kuota</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($ruang as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nama_ruang); ?></td>
                    <td><?php echo e($row->kuota); ?></td>
                    <td>
                        <a href="<?php echo e(URL::to('admin/atur-peserta/'.$row->id_ruang)); ?>" class="btn btn-primary">
                            Atur Peseta Ujian
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>