<?php $__env->startSection('content'); ?>
    <h3>Laporan Data Nilai</h3>
    <hr>
    <table class="gridtable" style="width:100%;">
            <tr>
                <td>Kelas</td>
                <td> : <?php echo e($kelas); ?></td>
            </tr>
            <tr>
                <td>Mata Pelajaran</td>
                <td> : <?php echo e($mapel); ?></td>
            </tr>
    </table>
    <br><br>
    <table class="gridtable">
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
<?php echo $__env->make('admin.laporan.template-pdf', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>