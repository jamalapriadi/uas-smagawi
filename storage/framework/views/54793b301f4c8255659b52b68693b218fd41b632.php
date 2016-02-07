<?php $__env->startSection('content'); ?>
	<legend>Data Siswa</legend>

	<a href="<?php echo e(URL::to('admin/siswa/create')); ?>" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Siswa
	</a>

	<a href="<?php echo e(URL::to('admin/import-siswa')); ?>" class="btn btn-success">
		<i class="glyphicon glyphicon-import"></i>
		Import Siswa
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
				<th>NISN</th>
				<th>Nama</th>
				<th>Kelas</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($siswa as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->nis); ?></td>
					<td><?php echo e($row->nama); ?></td>
					<td><?php echo e($row->kd_kelas); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/siswa/'.$row->nis)); ?>" class="btn btn-info">
							<i class="glyphicon glyphicon-list"></i>
						</a>
					</td>
					<td>
						<a href="<?php echo e(URL::to('admin/siswa/'.$row->nis.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/siswa/'.$row->nis))); ?>

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