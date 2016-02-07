<?php $__env->startSection('content'); ?>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Login Siswa</p>
		</div>

		<div class="panel-body">
			<?php echo e(Form::open(array('url'=>'login/proses-siswa','method'=>'post'))); ?>

				<?php if(Session::has('pesan')): ?>
					<div class="alert alert-success">
						<?php echo e(Session::get('pesan')); ?>

					</div>
				<?php endif; ?>
				
				<div class="form-group <?php if($errors->has('nis')): ?> has-error <?php endif; ?>">
					<label for="">No. Peserta Ujian</label>
					<input type="nis" name="nis" class="form-control">
					<?php echo e($errors->first('nis')); ?>

				</div>

				<div class="form-group <?php if($errors->has('password')): ?> has-error <?php endif; ?>">
					<label for="">Password</label>
					<input type="password" name="password" class="form-control">
					<?php echo e($errors->first('password')); ?>

				</div>

				<div class="form-group">
					<button class="btn btn-primary">
						Login
					</button>
				</div>
			<?php echo e(Form::close()); ?>

		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('login.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>