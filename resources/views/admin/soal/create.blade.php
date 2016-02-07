@extends('admin.template')

@section('content')
	<legend>Tambah Soal</legend>

	{{Form::open(array('url'=>'admin/soal','method'=>'post'))}}
		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				@foreach($mapel as $m)
					<option value="{{$m->kd_mapel}}">{{$m->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
		</div>

		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $jur)
					<option value="{{$jur->kode_jurusan}}">{{$jur->kode_jurusan}}</option>
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