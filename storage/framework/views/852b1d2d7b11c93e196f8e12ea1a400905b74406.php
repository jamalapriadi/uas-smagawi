<?php $__env->startSection('content'); ?>
	<legend>Data Jurusan</legend>

	<a href="<?php echo e(URL::to('admin/kelas/create')); ?>" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Kelas
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
				<th>Kode Kelas</th>
				<th>Kelas</th>
				<th>Jurusan</th>
				<th>Sub Kelas</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($kelas as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->kd_kelas); ?></td>
					<td><?php echo e($row->kelas); ?></td>
					<td><?php echo e($row->jurusan->nama_jurusan); ?></td>
					<td><?php echo e($row->sub_kelas); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/kelas/'.$row->kd_kelas.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/kelas/'.$row->kd_kelas))); ?>

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