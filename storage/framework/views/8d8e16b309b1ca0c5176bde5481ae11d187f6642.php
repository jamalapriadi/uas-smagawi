<?php $__env->startSection('content'); ?>
	<legend>Data Pengawas</legend>

	<a href="<?php echo e(URL::to('admin/pengawas/create')); ?>" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Pengawas
	</a>

	<hr>

	<?php if(Session::has('pesan')): ?>
		<?php echo e(Session::get('pesan')); ?>

	<?php endif; ?>

	<table class="table" id="data">
		<thead>
			<tr>
				<th>No.</th>
				<th>NIP</th>
				<th>Nama</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($pengawas as $row): ?>
				<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->nip); ?></td>
					<td><?php echo e($row->nama); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/pengawas/'.$row->nip.'/edit')); ?>" class="btn btn-primary">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/pengawas/'.$row->nip))); ?>

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