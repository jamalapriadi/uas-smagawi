<?php $__env->startSection('content'); ?>
	<legend>Halaman Siswa</legend>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>