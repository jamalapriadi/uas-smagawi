@extends('admin.template')

@section('content')
	<legend>Tambah Siswa</legend>

	{!! Form::model($siswa,array('url'=>route('admin.siswa.update',['siswa'=>$siswa->nis]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('nis')) has-error @endif">
			<label for="">NIS</label>
			<input type="text" name="nis" value="{{$siswa->nis}}" readonly="readonly" class="form-control">
			{{$errors->first('nis')}}
		</div>

		<div class="form-group @if($errors->has('nisn')) has-error @endif">
			<label for="">NISN</label>
			<input type="text" name="nisn" value="{{$siswa->nisn}}" class="form-control">
			{{$errors->first('nisn')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" value="{{$siswa->nama}}" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('kelas')) has-error @endif">
			<label for="">Kelas</label>
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				@foreach($kelas as $row)
					<option value="{{$row->kd_kelas}}" @if($siswa->kd_kelas==$row->kd_kelas) selected='selected' @endif>{{$row->kd_kelas}}</option>
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