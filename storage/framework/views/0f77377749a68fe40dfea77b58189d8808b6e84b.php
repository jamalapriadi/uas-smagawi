<?php $__env->startSection('content'); ?>
    <legend>Setting Peserta Ujian</legend>

    <?php echo e(Form::open(['url'=>'admin/simpan-peserta','method'=>'post','class'=>'form-horizontal'])); ?>

        <div class="form-group">
            <div class="col-lg-2 control-label">Ruang Ujian</div>
            <div class="col-lg-4">
                <select name="ruang" id="ruang" class="form-control">
                    <option value="">--Pilih Ruang Ujian--</option>
                    <?php foreach($ruang as $r): ?>
                        <option value="<?php echo e($r->id_ruang); ?>"><?php echo e($r->nama_ruang); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-2 control-label">Kelas</div>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                    <?php foreach($kelas as $k): ?>
                        <option value="<?php echo e($k->kd_kelas); ?>"><?php echo e($k->kd_kelas); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>

    <hr>

    <div id="loading" style="display:none;">
        <div class="alert alert-info">
            <?php echo e(Html::image('assets/img/loading.gif','',array('style'=>'width:80px;'))); ?> Loading....
        </div>
    </div>

    <div id="tampil"></div>

    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
    <script>
        $(function(){
            $("#kelas").change(function(){
                var kelas=$("#kelas").val();

                $.ajax({
                    url:"<?php echo e(URL::to('admin/get-siswa')); ?>",
                    type:"POST",
                    data:"kelas="+kelas,
                    cache:false,
                    beforeSend:function(){
                        $("#loading").show();
                    },
                    success:function(html){
                        $("#loading").hide();
                        $("#tampil").html(html);
                    },
                    error:function(){
                        $("#loading").hide();
                        $("#tampil").html("<div class='alert alert-danger'>Data tidak dapat ditampilkan</div>");
                    }
                })
            })
        })
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>