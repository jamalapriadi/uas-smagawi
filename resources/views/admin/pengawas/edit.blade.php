@extends('admin.template')

@section('content')
	<legend>Tambah Pengawas</legend>

	{!! Form::model($pengawas,array('url'=>route('admin.pengawas.update',['pengawas'=>$pengawas->nip]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('nip')) has-error @endif">
			<label for="">NIP</label>
			<input type="text" name="nip" readonly="readonly" value="{{$pengawas->nip}}" class="form-control">
			{{$errors->first('nip')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" value="{{$pengawas->nama}}" class="form-control">
			{{$errors->first('nama')}}
		</div>
		
		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Update
			</button>
		</div>

	{{Form::close()}}
@stop