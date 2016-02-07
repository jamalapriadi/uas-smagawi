@extends('admin.template')

@section('content')
	<legend>Tambah Soal</legend>

	{!! Form::model($soal,array('url'=>route('admin.soal.update',['soal'=>$soal->id]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				@foreach($mapel as $m)
					<option value="{{$m->kd_mapel}}" @if($soal->kd_mapel==$m->kd_mapel) selected='selected' @endif>{{$m->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
		</div>

		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $jur)
					<option value="{{$jur->kode_jurusan}}" @if($soal->kode_jurusan==$jur->kode_jurusan) selected='selected' @endif>{{$jur->kode_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/soal')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop