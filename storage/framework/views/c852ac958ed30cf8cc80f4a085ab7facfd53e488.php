<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="cache-control" content="private, max-age=0, no-cache">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="0">
	<title>Halaman Siswa</title>
	<?php echo e(Html::style('assets/css/bootstrap.min.css')); ?>

	<?php echo e(Html::style('assets/css/jquery.dataTables.css')); ?>

	<?php echo e(HTML::style('assets/datetimepicker/jquery.datetimepicker.css')); ?>

	<?php echo e(Html::style('assets/css/smagawi.css')); ?>


	<?php echo $__env->yieldContent('head'); ?>
</head>
<body>
	<header>
		<div class="container">
			<?php echo $__env->make('siswa.navbar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
		</div>
	</header>
	
	<div id="main-admin">
		<br><br>
		<div class="container">
			<?php echo $__env->yieldContent('content'); ?>
		</div>
	</div>

	<footer>
        <div class="container">
            <div class="row">
            	<div class="col-lg-6">
            		<h3 class="footer">Unggul, Jaya, Maju Terus</h3>
            	</div>

            	<div class="col-lg-6">
            		<p class="footer">
            			Jln. Prof. Moh. Yamin Slawi - Kab. Tegal <br>
            			Email : sman3slawi.yahoo.co.id <br>
            			Website : sman3slawi.sch.id <br>
            			Telp : ( 0283 ) 491152
            		</p>
            	</div>
            </div>
        </div>
    </footer>

	<?php echo e(Html::script('assets/js/jquery-1.11.3.min.js')); ?>

	<?php echo e(Html::script('assets/js/bootstrap.min.js')); ?>

	<?php echo e(Html::script('assets/js/jquery.dataTables.min.js')); ?>

	<?php echo e(Html::script('assets/datetimepicker/build/jquery.datetimepicker.full.js')); ?>

    <?php echo e(Html::script('assets/js/admin.js')); ?>

    <?php echo e(HTML::script('assets/js/time/jquery.simple.timer.js')); ?>

    <?php echo e(HTML::script('assets/js/jqClock.min.js')); ?>


	<?php echo $__env->yieldContent('footer'); ?>
</body>
</html>