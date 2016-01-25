<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Halaman Pengawas</title>
	<?php echo e(Html::style('assets/css/spacelab.css')); ?>

	<?php echo e(Html::style('assets/css/jquery.dataTables.css')); ?>

	<?php echo e(HTML::style('assets/datetimepicker/jquery.datetimepicker.css')); ?>


	<?php echo $__env->yieldContent('head'); ?>
</head>
<body>
	<?php echo $__env->make('pengawas.navbar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

	<div class="container">
		<?php echo $__env->yieldContent('content'); ?>
	</div>

	<?php echo e(Html::script('assets/js/jquery-1.11.3.min.js')); ?>

	<?php echo e(Html::script('assets/js/bootstrap.min.js')); ?>

	<?php echo e(Html::script('assets/js/jquery.dataTables.min.js')); ?>

	<?php echo e(HTML::script('assets/datetimepicker/build/jquery.datetimepicker.full.js')); ?>

	<script src="<?php echo e(URL::asset('assets/js/admin.js')); ?>"  type="text/javascript"></script>

	<?php echo $__env->yieldContent('footer'); ?>
</body>
</html>