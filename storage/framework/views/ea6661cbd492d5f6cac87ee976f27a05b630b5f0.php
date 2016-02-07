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
                <th>NISN</th>
                <th> : <?php echo e($siswa->nis); ?></th>
            </tr>
            <tr>
                <th>No. Peserta</th>
                <th> : <?php echo e($siswa->no_peserta); ?></th>
            </tr>
            <tr>
                <th>Nama</th>
                <th> : <?php echo e($siswa->nama); ?></th>
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
                <th>Soal</th>
                <th>Jawaban Benar</th>
                <th>Jawaban Siswa</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($soal as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td>
                        <a href="#" class="">
                            <?php echo e(Html::image('uploads/small/'.$row->gambar_kecil,'',['class'=>'img-responsive','style'=>'width:100px;'])); ?>

                        </a>
                    </td>
                    <td><?php echo e($row->kunci_jawaban); ?></td>
                    <td></td>
                    <td></td>
                </tr>
            <?php endforeach; ?>
        </tbody>

        <tfoot>
            <tr>
                <th colspan="4">Total Jawaban Benar</th>
                <th> : </th>
            </tr>
            <tr>
                <th colspan="4">Total Jawaban Salah</th>
                <th> : </th>
            </tr>
            <tr>
                <th colspan="4">Total Nilai</th>
                <th> : </th>
            </tr>
        </tfoot>
    </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>