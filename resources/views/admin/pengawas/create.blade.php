@extends('admin.template')

@section('content')
	<legend>Tambah Pengawas</legend>

	{{Form::open(array('url'=>'admin/pengawas','method'=>'post'))}}
		<div class="form-group @if($errors->has('nip')) has-error @endif">
			<label for="">NIP</label>
			<input type="text" name="nip" class="form-control">
			{{$errors->first('nip')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('password')) has-error @endif">
			<label for="">Password</label>
			<input type="password" name="password" class="form-control">
			{{$errors->first('password')}}
		</div>
		
		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>
		</div>

	{{Form::close()}}
@stop