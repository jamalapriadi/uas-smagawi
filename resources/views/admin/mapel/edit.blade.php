@extends('admin.template')

@section('content')
	<legend>Tambah Mapel</legend>

	{!! Form::model($mapel,array('url'=>route('admin.mapel.update',['mapel'=>$mapel->kd_mapel]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('kode')) has-error @endif">
			<label for="">Kode Mata Pelajaran</label>
			<input type="text" name="kode" value="{{$mapel->kd_mapel}}" class="form-control">
			{{$errors->first('kode')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama Mata Pelajaran</label>
			<input type="text" name="nama" value="{{$mapel->nm_mapel}}" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Update
			</button>

			<a href="{{URL::to('admin/mapel')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop