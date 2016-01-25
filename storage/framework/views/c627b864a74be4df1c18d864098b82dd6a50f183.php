<?php $__env->startSection('content'); ?>
	<legend>Data Mata Pelajaran</legend>

	<a href="<?php echo e(URL::to('admin/mapel/create')); ?>" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Mapel
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
				<th>Kode Mata Pelajaran</th>
				<th>Nama Mata Pelajaran</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($mapel as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->kd_mapel); ?></td>
					<td><?php echo e($row->nm_mapel); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/mapel/'.$row->kd_mapel.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/mapel/'.$row->kd_mapel))); ?>

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