@extends('admin.template')

@section('content')
	<legend>Tambah Jurusan</legend>

	{{Form::open(array('url'=>'admin/ruang','method'=>'post'))}}
		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama Ruang Ujian</label>
			<input type="text" name="nama" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('kuota')) has-error @endif">
			<label for="">Kuota</label>
			<input type="number" name="kuota" class="form-control">
			{{$errors->first('kuota')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/ruang')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop