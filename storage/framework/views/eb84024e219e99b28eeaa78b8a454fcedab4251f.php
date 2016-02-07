<?php $__env->startSection('content'); ?>
    <legend>Data Nilai</legend>

    <a href="#" class="btn btn-primary">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="#" class="btn btn-success">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/nilai')); ?>" class="btn btn-default">
        Kembali
    </a>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Kelas</th>
                <th> : LS IA 3</th>
            </tr>
            <tr>
                <th>Mata Pelajaran</th>
                <th> : Matematika</th>
            </tr>
        </thead>
    </table>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Nilai</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($siswa as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nis); ?></td>
                    <td><?php echo e($row->no_peserta); ?></td>
                    <td><?php echo e($row->nama); ?></td>
                    <td>8</td>
                    <td>
                        <a href="<?php echo e(URL::to('admin/laporan/detail-nilai/'.$row->nis)); ?>" class="btn btn-primary">
                            <i class="glyphicon glyphicon-list-alt"></i>
                            Detail
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>