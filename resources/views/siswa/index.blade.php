@extends('siswa.template')

@section('content')
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Profile</p>
		</div>

		<div class="panel-body">
			<table class="table table-striped">
				<tr>
					<td>NIS</td>
					<td> : {{$siswa->nis}}</td>
				</tr>
				<tr>
					<td>Nama</td>
					<td> : {{$siswa->nama}}</td>
				</tr>
				<tr>
					<td>Kelas</td>
					<td> : {{$siswa->kd_kelas}}</td>
				</tr>
			</table>
		</div>

		<div class="panel-footer">
			<a href="{{URL::to('siswa/lihat-ujian')}}" class="btn btn-primary">
				Lanjutkan
				<i class="glyphicon glyphicon-chevron-right"></i>
			</a>
		</div>
	</div>
@stop