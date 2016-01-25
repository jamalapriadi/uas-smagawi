@extends('admin.template')

@section('content')
	<legend>Tambah Guru</legend>

	{!! Form::model($guru,array('url'=>route('admin.guru.update',['guru'=>$guru->nip]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('nip')) has-error @endif">
			<label for="">NIP</label>
			<input type="text" name="nip" value="{{$guru->nip}}" readonly="readonly" class="form-control">
			{{$errors->first('nip')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" value="{{$guru->nama}}" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mapel</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mapel--</option>
				@foreach($mapel as $row)
					<option value="{{$row->kd_mapel}}" @if($guru->kd_mapel==$row->kd_mapel) selected='selected' @endif>{{$row->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
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