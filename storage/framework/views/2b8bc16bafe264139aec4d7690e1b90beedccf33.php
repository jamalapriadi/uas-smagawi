<?php $__env->startSection('content'); ?>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Daftar Ujian</p>
		</div>

		<div class="panel-body">
			<table class="table tabl-striped">
				<tr>
					<td>Mata Pelajaran</td>
					<td> : <?php echo e($jadwal->kd_mapel); ?></td>
				</tr>
				<tr>
					<td>Jurusan</td>
					<td> : <?php echo e($jadwal->kode_jurusan); ?></td>
				</tr>
				<tr>
					<td>Jam</td>
					<td> : <?php echo e($jadwal->jam); ?> s.d <?php echo e($jadwal->selesai); ?></td>
				</tr>
				<tr>
					<td>Ruang Ujian</td>
					<td> : <?php echo e($jadwal->detail->ruang->nama_ruang); ?></td>
				</tr>
			</table>
			<?php
				$soal=DB::table('soal')
					->where('kd_mapel',$jadwal->kd_mapel)
					->where('kode_jurusan',$jadwal->kode_jurusan);
			?>
			<?php if($soal->count()>0): ?>
				<div class="alert alert-info">
					<?php if(Session::has('pesan')): ?>
						<?php echo e(Session::get('pesan')); ?>

					<?php else: ?>
						*Masukkan Kode Token untuk memulai Ujian
					<?php endif; ?>
				</div>
				
				<?php echo e(Form::open(['url'=>'siswa/ujian-berlangsung','method'=>'post'])); ?>

					<div class="form-group <?php if($errors->has('token')): ?> has-error <?php endif; ?>">
						<label for="">Kode Token</label>
						<input type="hidden" name="idjadwal" value="<?php echo e($jadwal->id_jadwal); ?>">
						<input type="hidden" name="detailjadwal" value="<?php echo e($jadwal->detail->id); ?>">
						<input type="text" name="token" class="form-control" required="required">
						<?php echo e($errors->first('token')); ?>

					</div>

					<div class="form-group">
						<button class="btn btn-primary">
							<i class="glyphicon glyphicon-play-circle"></i>
							Mulai
						</button>
					</div>
				<?php echo e(Form::close()); ?>

			<?php else: ?>
				<div class="alert alert-info">
					*Tidak ada soal
				</div>
			<?php endif; ?>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('siswa.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>