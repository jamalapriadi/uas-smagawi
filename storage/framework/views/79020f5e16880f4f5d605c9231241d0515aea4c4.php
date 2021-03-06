<?php $__env->startSection('content'); ?>
    <legend>
        <a href="<?php echo e(URL::to('admin/peserta-ujian')); ?>" class="btn btn-default">Kembali</a>
        Atur Peserta</legend>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Nama Ruang</th>
                <th> : <?php echo e($ruang->nama_ruang); ?></th>
            </tr>
            <tr>
                <th>Kuota</th>
                <th> : <?php echo e($ruang->kuota); ?></th>
            </tr>
        </thead>
    </table>

    
    <?php if(count($peserta)<$ruang->kuota): ?>
        
    <?php else: ?>
        <div class="alert alert-info">
            Kuota Sudah Terpenuhi
        </div>
    <?php endif; ?>

    <?php if(Session::has('pesan')): ?>
        <div class="alert alert-success">
            <?php echo e(Session::get('pesan')); ?>

        </div>
    <?php endif; ?>

    <div id="pesan"></div>

    <table class="table table-striped">
        <?php echo e(Form::open(['url'=>'admin/delete-atur-peserta','method'=>'post'])); ?>

        <thead>
            <tr>
                <th>No.</th>
                <th>No. Meja</th>
                <th>NIS</th>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Sesi</th>
                <th></th>
                <th>
                    <input type="checkbox" id="deleteall"> Pilih
                </th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            <?php foreach($peserta as $row): ?>
                <?php $no++;?>
                <tr>
                    <td><?php echo e($no); ?></td>
                    <td><?php echo e($row->no_meja); ?></td>
                    <td><?php echo e($row->nis); ?></td>
                    <td><?php echo e($row->siswa->nama); ?></td>
                    <td><?php echo e($row->siswa->kd_kelas); ?></td>
                    <td><?php echo e($row->sesi); ?></td>
                    <td>
                        <a href="#" kode="<?php echo e($row->id); ?>" class="btn btn-danger hapus">
                            <i class="glyphicon glyphicon-trash"></i>
                        </a>
                    </td>
                    <td>
                        <input type="checkbox" class="pilih" name="pilih[]" value="<?php echo e($row->id); ?>">
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="8">
                    <?php if(count($peserta)>0): ?>
                        <button class="btn btn-danger">Hapus Data Yang di Pilih</button>
                    <?php endif; ?>
                </td>
            </tr>
        </tfoot>
        <?php echo e(Form::close()); ?>

    </table>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Konfirmasi?</h4>
          </div>
          <div class="modal-body">
            <div id="loading" style="display:none;">Loading. . .</div>
            <input type="hidden" id="idhapus">
            <p>Apakah anda yakin ingin menghapus data ini?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" id="hps" class="btn btn-primary">Hapus</button>
          </div>
        </div>
      </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
    <script>
        $(function(){

            $("#hps").click(function(){
                var kode=$("#idhapus").val();

                $.ajax({
                    url:"<?php echo e(URL::to('admin/hapus-peserta')); ?>",
                    type:"POST",
                    data:"kode="+kode,
                    cache:false,
                    beforeSend:function(){
                        $("#loading").show();
                    },
                    success:function(){
                        location.reload();
                    },
                    error:function(){
                        $("#loading").hide();
                        $("#myModal").modal("hide");
                        $("#pesan").html("<div class='alert alert-danger'>Data Gagal dihapus</div>");
                    }
                })
            });

            $(document).on('change',"#deleteall",function(){
                $(".pilih").prop('checked', $(this).prop("checked"));
            });

            $("#datapeserta").dataTable();

        })
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>