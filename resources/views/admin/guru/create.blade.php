@extends('admin.template')

@section('content')
	<legend>Tambah Guru</legend>

	{{Form::open(array('url'=>'admin/guru','method'=>'post'))}}
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

		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mapel</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mapel--</option>
				@foreach($mapel as $row)
					<option value="{{$row->kd_mapel}}">{{$row->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
		</div>

		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih jurusan--</option>
				@foreach($jurusan as $jur)
					<option value="{{$jur->kode_jurusan}}">{{$jur->nama_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

		<div class="form-group well">
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