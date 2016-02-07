<?php $__env->startSection('content'); ?>
    <legend>Laporan Data Siswa</legend>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>Nama</th>
                <th>No. Peserta</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($siswa as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nis); ?></td>
                    <td><?php echo e($row->nama); ?></td>
                    <td><?php echo e($row->no_peserta); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>