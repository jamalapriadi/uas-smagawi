<?php $__env->startSection('content'); ?>
	<legend>Data Jadwal</legend>

	<a href="<?php echo e(URL::to('admin/jadwal/create')); ?>" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Jadwal
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
				<th>Jurusan</th>
				<th>Mata Pelajaran</th>
				<th>Tanggal</th>
				<th>Jam</th>
				<th>Lama Ujian ( Menit )</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			<?php foreach($jadwal as $row): ?>
				<?php $no++;?>
				<tr>
					<td><?php echo e($no); ?></td>
					<td><?php echo e($row->kode_jurusan); ?></td>
					<td><?php echo e($row->kd_mapel); ?></td>
					<td><?php echo e($row->tgl_ujian); ?></td>
					<td><?php echo e($row->jam); ?> s/d <?php echo e($row->selesai); ?></td>
					<td><?php echo e($row->waktu_ujian); ?></td>
					<td>
						<a href="<?php echo e(URL::to('admin/jadwal/'.$row->id_jadwal)); ?>" class="btn btn-success">
							<i class="glyphicon glyphicon-list-alt"></i>
							List Jadwal
						</a>
					</td>
					<td>
						<a href="<?php echo e(URL::to('admin/jadwal/'.$row->id_jadwal.'/edit')); ?>" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						<?php echo e(Form::open(array('url'=>'admin/jadwal/'.$row->id_jadwal))); ?>

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