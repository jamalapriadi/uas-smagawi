@extends('admin.template')

@section('content')
	<legend>Tambah Siswa</legend>

	{{Form::open(array('url'=>'admin/siswa','method'=>'post'))}}
		<div class="form-group @if($errors->has('nis')) has-error @endif">
			<label for="">NIS</label>
			<input type="text" name="nis" class="form-control">
			{{$errors->first('nis')}}
		</div>

		<div class="form-group @if($errors->has('nisn')) has-error @endif">
			<label for="">NISN</label>
			<input type="text" name="nisn" class="form-control">
			{{$errors->first('nisn')}}
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

		<div class="form-group @if($errors->has('kelas')) has-error @endif">
			<label for="">Kelas</label>
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				@foreach($kelas as $row)
					<option value="{{$row->kd_kelas}}">{{$row->kd_kelas}}</option>
				@endforeach
			</select>
			{{$errors->first('kelas')}}
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