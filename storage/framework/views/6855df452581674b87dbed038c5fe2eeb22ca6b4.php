<?php $__env->startSection('content'); ?>
	<legend>Data Jurusan</legend>

	<a href="<?php echo e(URL::to('admin/jurusan/create')); ?>" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Jurusan
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
				<th>Kode Jurusan</th>
				<th>Nama Jurusan</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($jurusan as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->kode_jurusan); ?></td>
					<td><?php echo e($row->nama_jurusan); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/jurusan/'.$row->kode_jurusan.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/jurusan/'.$row->kode_jurusan))); ?>

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