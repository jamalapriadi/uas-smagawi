@extends('siswa.template')

@section('content')
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Profile</p>
		</div>

		<div class="panel-body">
			@if(Session::has('pesan'))
				<div class="alert alert-success">
					{{Session::get('pesan')}}
				</div>
			@endif
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
					<td>Jurusan</td>
					<td> : {{$siswa->kelas->kode_jurusan}}</td>
				</tr>
				<tr>
					<td>Kelas</td>
					<td> : {{$siswa->kd_kelas}}</td>
				</tr>
				<tr>
					<td>Ruang Ujian</td>
					<td> : {{$peserta->ruang->nama_ruang}}</td>
				</tr>
			</table>
		</div>

		<div class="panel-footer">
			@if(count($peserta)>0)
				{{Form::open(['url'=>'siswa/lihat-ujian','method'=>'post'])}}
					<input type="hidden" name="jurusan" value="{{$siswa->kelas->kode_jurusan}}">
					<button class="btn btn-primary">
						Lanjutkan
						<i class="glyphicon glyphicon-chevron-right"></i>
					</button>
				{{Form::close()}}
			@else
				<a href="#" class="btn btn-default" disabled>
					Tidak ada Ruang Ujian
					<i class="glyphicon glyphicon-chevron-right"></i>
				</a>
			@endif
		</div>
	</div>
@stop