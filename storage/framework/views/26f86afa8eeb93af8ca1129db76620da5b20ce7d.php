<?php $__env->startSection('content'); ?>
    <legend>Daftar Peserta Ujian</legend>

    <table class="gridtable">
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
    <table class="gridtable">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Kelas</th>
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
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template-pdf', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>