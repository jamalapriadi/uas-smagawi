<?php $__env->startSection('content'); ?>
    <legend>Detail Siswa</legend>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No. Peserta Ujian</th>
                <th> : <?php echo e($siswa->no_peserta); ?></th>
            </tr>
            <tr>
                <th>NISN</th>
                <th> : <?php echo e($siswa->nis); ?></th>
            </tr>
            <tr>
                <th>Nama</th>
                <th> : <?php echo e($siswa->nama); ?></th>
            </tr>
            <tr>
                <th>JK</th>
                <th> : <?php echo e($siswa->jk); ?></th>
            </tr>
            <tr>
                <th>Tempat, Tanggal Lahir</th>
                <th> : <?php echo e($siswa->tmp_lahir); ?>, <?php echo e($siswa->tgl_lahir); ?></th>
            </tr>
            <tr>
                <th>NIK</th>
                <th> : <?php echo e($siswa->nik); ?></th>
            </tr>
            <tr>
                <th>Agama</th>
                <th> : <?php echo e($siswa->agama); ?></th>
            </tr>
            <tr>
                <th>Alamat</th>
                <th> : <?php echo e($siswa->alamat); ?></th>
            </tr>
            <tr>
                <th>RT</th>
                <th> : <?php echo e($siswa->rt); ?></th>
            </tr>
            <tr>
                <th>RW</th>
                <th> : <?php echo e($siswa->rw); ?></th>
            </tr>
            <tr>
                <th>Dusun</th>
                <th> : <?php echo e($siswa->dusun); ?></th>
            </tr>
            <tr>
                <th>Kelurahan</th>
                <th> : <?php echo e($siswa->kelurahan); ?></th>
            </tr>
            <tr>
                <th>Kecamatan</th>
                <th> : <?php echo e($siswa->kecamatan); ?></th>
            </tr>
            <tr>
                <th>Kode POS</th>
                <th> : <?php echo e($siswa->kode_pos); ?></th>
            </tr>
            <tr>
                <th>No. SKHUN</th>
                <th> : <?php echo e($siswa->no_skhun); ?></th>
            </tr>
            <tr>
                <th>Nama Ayah</th>
                <th> : <?php echo e($siswa->nm_ayah); ?></th>
            </tr>
            <tr>
                <th>Nama Ibu</th>
                <th> : <?php echo e($siswa->nm_ibu); ?></th>
            </tr>
            <tr>
                <th>Kelas</th>
                <th> : <?php echo e($siswa->kd_kelas); ?></th>
            </tr>
        </thead>
    </table>

    <div class="well">
        <a href="<?php echo e(URL::to('admin/siswa')); ?>" class="btn btn-default">Kembali</a>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>