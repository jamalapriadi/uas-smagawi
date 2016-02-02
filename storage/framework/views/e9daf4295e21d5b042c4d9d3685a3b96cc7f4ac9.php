<?php $__env->startSection('content'); ?>
	<div class="row">
		<div class="col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					Pengawas
				</div>

				<div class="panel-body">
					<table class="table table-striped">
						<tr>
							<td>NIP</td>
							<td> : <?php echo e($pengawas->nip); ?></td>
						</tr>
						<tr>
							<td>Nama</td>
							<td> : <?php echo e($pengawas->nama); ?></td>
						</tr>
						<tr>
							<td>Mata Pelajaran</td>
							<td> : Bahasa Indonesia</td>
						</tr>
						<tr>
							<td>Kelas</td>
							<td> : X.IS.1</td>
						</tr>
						<tr>
							<td>Ruang Ujian</td>
							<td> :  Lab A</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="alert alert-info">
				<p>Untuk Memulai Ujian silahkan Klik Start</p>
			</div>

			<div class="form-group">
				<label for="">Token</label>
				<input type="text" class="form-control" value="xw2342jsd">
			</div>

			<div class="form-group">
				<button class="btn btn-primary">
					<i class="glyphicon glyphicon-play-circle"></i>
					Mulai Ujian
				</button>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<p>Login Siswa</p>
				</div>

				<div class="panel-body">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>No.</th>
								<th>NIS</th>
								<th>Nama</th>
								<th>Kelas</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>7923</td>
								<td>Jamal Apriadi</td>
								<td>X.IS.2</td>
							</tr>
							<tr>
								<td>2</td>
								<td>7924</td>
								<td>Agus Imam B</td>
								<td>X.IS.2</td>
							</tr>
							<tr>
								<td>3</td>
								<td>7925</td>
								<td>Sugiono Pamungkas</td>
								<td>X.IS.2</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('pengawas.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>