<?php $__env->startSection('content'); ?>
    <legend>Laporan Data Guru</legend>

    <hr>
    <table class="gridtable">
        <thead>
            <tr>
                <th>No.</th>
                <th>NIP</th>
                <th>Nama</th>
                <th>Mata Pelajaran</th>
                <th>Jurusan</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($guru as $row): ?>
            <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nip); ?></td>
                    <td><?php echo e($row->nama); ?></td>
                    <td><?php echo e($row->mapel->nm_mapel); ?></td>
                    <td><?php echo e($row->soal->kode_jurusan); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template-pdf', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>