<?php $__env->startSection('cetak'); ?>
    <a href="<?php echo e(URL::to('admin/laporan/cetak-peserta?type=pdf&ruang='.$ruang->id_ruang)); ?>" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/cetak-peserta?type=excel&ruang='.$ruang->id_ruang)); ?>" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/peserta')); ?>" class="btn btn-default">
        Kembali
    </a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <legend>Daftar Peserta Ujian</legend>

    <table class="table table-striped">
        <tr>
            <td>Nama Ruangan</td>
            <td> : <?php echo e($ruang->nama_ruang); ?></td>
        </tr>
        <tr>
            <td>Kuota</td>
            <td> : <?php echo e($ruang->kuota); ?></td>
        </tr>
    </table>
    
    <hr>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($peserta as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nis); ?></td>
                    <td><?php echo e($row->siswa->no_peserta); ?></td>
                    <td><?php echo e($row->siswa->nama); ?></td>
                    <td><?php echo e($row->siswa->kd_kelas); ?></td>
                    <td><?php echo e($row->siswa->password_asli); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>