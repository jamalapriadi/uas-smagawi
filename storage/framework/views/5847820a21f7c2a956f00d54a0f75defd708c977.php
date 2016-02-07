<?php $__env->startSection('content'); ?>
	<legend>Data Soal</legend>

	<?php if(Session::has('pesan')): ?>
		<div class="alert alert-success">
			<?php echo e(Session::get('pesan')); ?>

		</div>
	<?php endif; ?>

	<table class="table table-striped" id="data">
		<thead>
			<tr>
				<th>No.</th>
				<th>Mata Pelajaran</th>
				<th>Jurusan</th>
				<th>Penulis</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($soal as $row): ?>
			<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->kd_mapel); ?></td>
					<td><?php echo e($row->kode_jurusan); ?></td>
					<td><?php echo e($row->author); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/soal/'.$row->id)); ?>" class="btn btn-success">
							<i class="glyphicon glyphicon-list-alt"></i>
							Detail Soal
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/soal/'.$row->id))); ?>

							<?php echo e(Form::hidden('_method','DELETE')); ?>

							<button class="btn btn-danger">
								<i class="glyphicon glyphicon-trash"></i>
								Hapus
							</button>
						<?php echo e(Form::close()); ?>

					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>