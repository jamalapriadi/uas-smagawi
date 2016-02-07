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
					<td> : {{$jadwal->kd_mapel}}</td>
				</tr>
				<tr>
					<td>Jurusan</td>
					<td> : {{$jadwal->kode_jurusan}}</td>
				</tr>
				<tr>
					<td>Jam</td>
					<td> : {{$jadwal->jam}} s.d {{$jadwal->selesai}}</td>
				</tr>
				<tr>
					<td>Ruang Ujian</td>
					<td> : {{$jadwal->detail->ruang->nama_ruang}}</td>
				</tr>
			</table>
			<?php
				$soal=DB::table('soal')
					->where('kd_mapel',$jadwal->kd_mapel)
					->where('kode_jurusan',$jadwal->kode_jurusan);
			?>
			@if($soal->count()>0)
				<div class="alert alert-info">
					@if(Session::has('pesan'))
						{{Session::get('pesan')}}
					@else
						*Masukkan Kode Token untuk memulai Ujian
					@endif
				</div>
				
				{{Form::open(['url'=>'siswa/ujian-berlangsung','method'=>'post'])}}
					<div class="form-group @if($errors->has('token')) has-error @endif">
						<label for="">Kode Token</label>
						<input type="hidden" name="idjadwal" value="{{$jadwal->id_jadwal}}">
						<input type="hidden" name="detailjadwal" value="{{$jadwal->detail->id}}">
						<input type="text" name="token" class="form-control" required="required">
						{{$errors->first('token')}}
					</div>

					<div class="form-group">
						<button class="btn btn-primary">
							<i class="glyphicon glyphicon-play-circle"></i>
							Mulai
						</button>
					</div>
				{{Form::close()}}
			@else
				<div class="alert alert-info">
					*Tidak ada soal
				</div>
			@endif
		</div>
	</div>
@stop