@extends('siswa.template')

@section('content')
	{{Form::open(['url'=>'siswa/telah-selesai','method'=>'post'])}}
		<div class="panel panel-primary">
			<div class="panel-heading">
				<p>Selesai</p>
			</div>

			<div class="panel-body">
				<input type="hidden" name="jadwal" value="{{$jadwal}}">
				<input type="hidden" name="detailjadwal" value="{{$detail}}">
				<p>Apakah anda yakin ingin menghakhiri ujian ini??</p>
			</div>

			<div class="panel-footer">
				<button class="btn btn-primary">
					<i class="glyphicon glyphicon-check"></i>
					Ya
				</button>

				<a href="{{URL::to('siswa/ujian-berlangsung/'.$jadwal.'/'.$detail)}}" class="btn btn-default">
					Kembali
				</a>
			</div>
		</div>
	{{Form::close()}}
@stop