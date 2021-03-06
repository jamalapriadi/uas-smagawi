<?php $__env->startSection('cetak'); ?>
    <a href="<?php echo e(URL::to('admin/laporan/cetak-nilai?type=pdf&kelas='.$kelas.'&mapel='.$mapel)); ?>" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/cetak-nilai?type=excel&kelas='.$kelas.'&mapel='.$mapel)); ?>" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/nilai')); ?>" class="btn btn-default">
        Kembali
    </a>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
    <legend>Data Nilai</legend>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Kelas</th>
                <th> : <?php echo e($kelas); ?></th>
            </tr>
            <tr>
                <th>Mata Pelajaran</th>
                <th> : <?php echo e($mapel); ?></th>
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
                <th>Benar</th>
                <th>Salah</th>
                <th>Nilai</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($siswa as $row): ?>
                <?php 
                    $no++;
                    $benar=DB::table('nilai_siswa')
                            ->where('kd_mapel',$mapel)
                            ->where('kd_kelas',$kelas)
                            ->where('nis',$row->nis)
                            ->where('benar','Y')
                            ->count();

                    $salah=DB::table('nilai_siswa')
                            ->where('kd_mapel',$mapel)
                            ->where('kd_kelas',$kelas)
                            ->where('nis',$row->nis)
                            ->where('benar','N')
                            ->count();
                ?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->nis); ?></td>
                    <td><?php echo e($row->no_peserta); ?></td>
                    <td><?php echo e($row->nama); ?></td>
                    <td><?php echo e($benar); ?></td>
                    <td><?php echo e($salah); ?></td>
                    <td>
                        <?php echo e($benar-$salah); ?>

                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>