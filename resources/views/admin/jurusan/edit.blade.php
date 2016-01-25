@extends('admin.template')

@section('content')
	<legend>Tambah Jurusan</legend>

	{!! Form::model($jurusan,array('url'=>route('admin.jurusan.update',['jurusan'=>$jurusan->kode_jurusan]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('kode')) has-error @endif">
			<label for="">Kode Jurusan</label>
			<input type="text" name="kode" readonly="readonly" value="{{$jurusan->kode_jurusan}}" class="form-control">
			{{$errors->first('kode')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama Jurusan</label>
			<input type="text" name="nama" value="{{$jurusan->nama_jurusan}}" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/jurusan')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop