<?php $__env->startSection('content'); ?>
    <legend>Data Jadwal</legend>

    <a href="<?php echo e(URL::to('admin/laporan/cetak-jadwal?type=pdf')); ?>" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/cetak-jadwal?type=excel')); ?>" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>Tanggal</th>
                <th>Mata Pelajaran</th>
                <th>Jam</th>
                <th>Ruang Ujian | Pengawas</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($jadwal as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e(date('d-m-Y',strtotime($row->tgl_ujian))); ?></td>
                    <td><?php echo e($row->kd_mapel); ?></td>
                    <td><?php echo e($row->jam); ?> s/d <?php echo e($row->selesai); ?></td>
                    <?php $detail=App\Models\Djadwal::where('id_jadwal',$row->id_jadwal)->get();?>
                    <td>
                        <ul>
                            <?php foreach($detail as $d): ?>
                                <li><?php echo e($d->ruang->nama_ruang); ?> | <?php echo e($d->getpengawas->nama); ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>