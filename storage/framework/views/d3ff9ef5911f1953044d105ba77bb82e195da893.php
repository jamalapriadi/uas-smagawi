<?php echo e(Form::open(['url'=>'admin/simpan-peserta','method'=>'post'])); ?>

<input type="hidden" name="kelas" value="<?php echo e($kelas); ?>" class="form-control">
<input type="hidden" name="ruang" value="<?php echo e($ruang); ?>" class="form-control">
<input type="hidden" name="sesi" value="<?php echo e($sesi); ?>" class="form-control">
<table class="table table-striped">
    <thead>
        <tr>
            <th>No.</th>
            <th>NISN</th>
            <th>Nama</th>
            <th>
                <input type="checkbox" id="semua"> Pilih Semua
            </th>
        </tr>
    </thead>
    <tbody>
        <?php $no=0;?>
        <?php foreach($siswa as $row): ?>
            <?php $no++;?>
            <tr>
                <td><?php echo e($no); ?></td>
                <td><?php echo e($row->nis); ?></td>
                <td><?php echo e($row->nama); ?></td>
                <td>
                    <input type="checkbox" class="checkbox" name="nis[]" value="<?php echo e($row->nis); ?>">
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<div class="form-group well">
    <button class="btn btn-primary">
        <i class="glyphicon glyphicon-refresh"></i>
        Tambahkan
    </button>
</div>
<?php echo e(Form::close()); ?>