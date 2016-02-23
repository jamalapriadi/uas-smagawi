<?php $__env->startSection('content'); ?>
    <legend>
        <a href="<?php echo e(URL::to('admin/peserta-ujian')); ?>" class="btn btn-default">Kembali</a>
        Setting Peserta Ujian
    </legend>

    <div class="form-horizontal">
        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Ruang Ujian</label>
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
            <label for="" class="col-lg-2 control-label">Sesi</label>
            <div class="col-lg-4">
                <select name="sesi" id="sesi" class="form-control">
                    <option value="">--Pilih Sesi--</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Kelas</label>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                    <?php foreach($kelas as $k): ?>
                        <option value="<?php echo e($k->kd_kelas); ?>"><?php echo e($k->kd_kelas); ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
    </div>
    <hr>

    <div id="loading" style="display:none;">
        <div class="alert alert-info">
            <?php echo e(Html::image('assets/img/loading.gif','',array('style'=>'width:80px;'))); ?> Loading....
        </div>
    </div>

    <div id="tampil"></div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
    <script>
        $(function(){
            $("#kelas").attr("disabled",true);
            $("#sesi").attr("disabled",true);

            $("#ruang").change(function(){
                var ruang=$("#ruang").val();

                if(ruang==""){
                    $("#kelas").attr("disabled",true);
                    $("#sesi").attr("disabled",true);
                }else{
                    $("#kelas").attr("disabled",false);
                    $("#sesi").attr("disabled",false);
                }
            });

            $("#kelas").change(function(){
                var ruang=$("#ruang").val();
                var kelas=$("#kelas").val();
                var sesi=$("#sesi").val();

                $.ajax({
                    url:"<?php echo e(URL::to('admin/get-siswa')); ?>",
                    type:"GET",
                    data:"kelas="+kelas+"&ruang="+ruang+"&sesi="+sesi,
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
            });

            
            $(document).on('change',"#semua",function(){
                $(".checkbox").prop('checked', $(this).prop("checked"));
            });
        })
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>