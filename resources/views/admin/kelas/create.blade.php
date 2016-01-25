@extends('admin.template')

@section('content')
	<legend>Tambah Jurusan</legend>

	{{Form::open(array('url'=>'admin/kelas','method'=>'post'))}}
		<div class="form-group @if($errors->has('kode')) has-error @endif">
			<label for="">Kelas</label>
			<select name="kode" id="kode" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<option value="x">X</option>
			</select>
			{{$errors->first('kode')}}
		</div>

		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $row)
					<option value="{{$row->kode_jurusan}}">{{$row->nama_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

		<div class="form-group @if($errors->has('sub')) has-error @endif">
			<label for="">Sub Kelas</label>
			<input type="number" name="sub" class="form-control">
			{{$errors->first('sub')}}
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