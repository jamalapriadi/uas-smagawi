<?php $__env->startSection('cetak'); ?>
    <a href="<?php echo e(URL::to('admin/laporan/cetak-kartu-peserta?type=pdf&kelas='.$kelas)); ?>" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="<?php echo e(URL::to('admin/laporan/kartu-peserta')); ?>" class="btn btn-default">
        Kembali
    </a>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <legend>Kartu Peserta</legend>

    <div class="row">
        <?php $no=0;?>
        <?php foreach($siswa as $row): ?>
            <div class="col-lg-4 col-xs-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <p>Kartu Sementara Simulasi</p>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped" style="font-size:11px;">
                            <tr>
                                <th>Nama Peserta</th>
                                <th> : <?php echo e(substr($row->nama,0,17)); ?></th>
                            </tr>
                            <tr>
                                <th>Program Studi</th>
                                <th> : <?php echo e($row->kelas->kode_jurusan); ?></th>
                            </tr>
                            <tr>
                                <th>Username</th>
                                <th> : <?php echo e($row->no_peserta); ?></th>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <th> : <?php echo e($row->password_asli); ?></th>
                            </tr>
                            <tr>
                                <th>Ruang Ujian</th>
                                <th> : <?php echo e(isset($row->peserta->ruang->nama_ruang) ? $row->peserta->ruang->nama_ruang : 'Belum Ada'); ?></th>
                            </tr>
                        </table>                  
                    </div>
                </div>
            </div>
            <?php $no++;?>
            <?php if($no % 6==0): ?>
                <div style="page-break-after: always;margin-top:50px;"></div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>