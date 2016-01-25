@extends('admin.template')

@section('content')
	<legend>Tambah Mapel</legend>

	{{Form::open(array('url'=>'admin/mapel','method'=>'post'))}}
		<div class="form-group @if($errors->has('kode')) has-error @endif">
			<label for="">Kode Mata Pelajaran</label>
			<input type="text" name="kode" class="form-control">
			{{$errors->first('kode')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama Mata Pelajaran</label>
			<input type="text" name="nama" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/mapel')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop