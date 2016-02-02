@extends('siswa.template')

@section('content')
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Daftar Ujian</p>
		</div>

		<div class="panel-body">
			<table class="table tabl-striped">
				<tr>
					<td>Mata Pelajaran</td>
					<td> : Matematika</td>
				</tr>
				<tr>
					<td>Jurusan</td>
					<td> : IS</td>
				</tr>
				<tr>
					<td>Waktu</td>
					<td> : 120 Menit</td>
				</tr>
			</table>

			<div class="alert alert-info">
				*Masukkan Kode Token untuk memulai Ujian
			</div>
			
			{{Form::open(['url'=>'siswa/ujian-berlangsung','method'=>'post'])}}
				<div class="form-group">
					<label for="">Kode Token</label>
					<input type="text" name="token" class="form-control">
				</div>

				<div class="form-group">
					<button class="btn btn-primary">
						<i class="glyphicon glyphicon-play-circle"></i>
						Mulai
					</button>
				</div>
			{{Form::close()}}
		</div>
	</div>
@stop