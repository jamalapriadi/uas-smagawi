<?php $__env->startSection('head'); ?>
	<?php echo e(Html::style('assets/fancybox/jquery.fancybox.css')); ?>

	<style>
		.nomor{
			margin-bottom: 20px;
			width: 40px;
		}
		.dipilih{
			background: red;
		}
	</style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
	<div class="row">
		<div class="col-lg-3 col-xs-4 col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<p>Nomor Soal</p>
				</div>

				<div class="panel-body">
					<div class="alert alert-warning">
						<h4>Sisa Waktu :  <span class="timer" data-seconds-left=<?php echo e($detik); ?>></span></h4>
					</div>

					<ul class="list-inline">
						<?php foreach($detail as $row): ?>
						<li><a href="#" no="<?php echo e($row->id); ?>" class="btn <?php if($row->status=='0'): ?> btn-default <?php else: ?> btn-success <?php endif; ?> nomor"><?php echo e($row->soal_ke); ?></a></li>
						<?php endforeach; ?>
					</ul>
				</div>

				<div class="panel-footer">
					<a href="<?php echo e(URL::to('siswa/selesai/'.$jadwal.'/'.$detailjadwal)); ?>" class="btn btn-block btn-warning">
						Selesai
					</a>
				</div>
			</div>
		</div>

		<div class="col-lg-9">
			<div id="pesan">
				<?php if(Session::has('pesan')): ?>
					<div class="alert alert-info"><?php echo e(Session::get('pesan')); ?></div>
				<?php endif; ?>
			</div>
			<div id="loading" style="display:none;">Loading....</div>
			<div id="soal"></div>
		</div>
	</div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	<?php echo e(Html::script('assets/fancybox/jquery.fancybox.js')); ?>


	<script>
		$(function(){
			$("a.single_image").fancybox();

			$('.timer').startTimer({
                onComplete: function(element){
                  element.addClass('is-complete');
                  window.location.href="<?php echo e(URL::to('siswa/waktu-habis')); ?>";
                }
            });

			$('.nomor').click(function(){
				$("#pesan").html('');
				var no=$(this).attr("no");

				$.ajax({
					url:"<?php echo e(URL::to('siswa/pilih-soal')); ?>",
					type:"GET",
					data:"no="+no,
					beforeSend:function(){
						$("#loading").show();
					},
					success:function(html){
						$("#loading").hide();
						$("#soal").html(html);
					}
				});
			});

			$( document ).on( "click", "a.jawab", function() {
				var soal=$(this).attr("no");
				var jawaban=$("#jawaban").val();

				$.ajax({
					url:"<?php echo e(URL::to('siswa/jawab-soal')); ?>",
					type:"POST",
					data:"soal="+soal+"&jawaban="+jawaban,
					cache:false,
					success:function(){
						location.reload();
					},
					error:function(){
						alert("Jawaban gagal disimpan");
					}
				})
			});
		})
	</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>