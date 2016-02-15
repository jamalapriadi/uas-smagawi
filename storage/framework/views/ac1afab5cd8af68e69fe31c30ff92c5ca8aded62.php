<?php $__env->startSection('content'); ?>
    <h3>Data Kartu Sementara</h3> <hr>

    <div class="row">
        <?php $no=0;?>
        <?php foreach($siswa as $row): ?>  
          <?php $no++;?>
            <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table-striped gridtable" style="page-break-inside:avoid;margin-top:15px;">
                          <thead>
                            <tr>
                              <th colspan="2"><p>Kartu Sementara Simulasi</p></th>
                            </tr>
                          </thead>
                            <tr>
                                <td style="width:50%;">Nama Peserta</td>
                                <td> : <?php echo e($row->nama); ?></td>
                            </tr>
                            <tr>
                                <td>Program Studi</td>
                                <td> : <?php echo e($row->kelas->kode_jurusan); ?></td>
                            </tr>
                            <tr>
                                <td>Username</td>
                                <td> : <?php echo e($row->no_peserta); ?></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td> : <?php echo e($row->password_asli); ?></td>
                            </tr>
                            <tr>
                                <td>Ruang Ujian</td>
                                <td> : <?php echo e(isset($row->peserta->ruang->nama_ruang) ? $row->peserta->ruang->nama_ruang : 'Belum Ada'); ?></td>
                            </tr>
                        </table>                  
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.laporan.template-pdf', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>