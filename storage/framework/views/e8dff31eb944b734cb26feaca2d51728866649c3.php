<?php $__env->startSection('content'); ?>
	<legend>Data Ruang Ujian</legend>

	<a href="<?php echo e(URL::to('admin/ruang/create')); ?>" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Ruang
	</a>

	<hr>

	<?php if(Session::has('pesan')): ?>
		<div class="alert alert-success">
			<?php echo e(Session::get('pesan')); ?>

		</div>
	<?php endif; ?>

	<table class="table table-striped" id="data">
		<thead>
			<tr>
				<th>No.</th>
				<th>Nama Ruang Ujian</th>
				<th>Kuota</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($ruang as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->nama_ruang); ?></td>
					<td><?php echo e($row->kuota); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/ruang/'.$row->id_ruang.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/ruang/'.$row->id_ruang))); ?>

							<?php echo e(Form::hidden('_method','DELETE')); ?>

							<button class="btn btn-danger">
								<i class="glyphicon glyphicon-trash"></i>
							</button>
						<?php echo e(Form::close()); ?>

					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>