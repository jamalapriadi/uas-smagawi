@extends('admin.template')

@section('content')
	<legend>Tambah Jurusan</legend>

	{!! Form::model($kelas,array('url'=>route('admin.kelas.update',['kelas'=>$kelas->kd_kelas]),'method'=>'put'))!!}
		<!--
		<div class="form-group @if($errors->has('rombel')) has-error @endif">
			<label for="">Rombel</label>
			<input type="text" name="rombel" value="{{$kelas->kd_kelas}}" class="form-control">
			{{$errors->first('rombel')}}
		</div>
		-->

		<div class="form-group @if($errors->has('kode')) has-error @endif">
			<label for="">Kelas</label>
			<select name="kode" id="kode" class="form-control">
				<option value="">--Pilih Kelas--</option>
				<option value="X" @if($kelas->kelas=='X') selected='selected' @endif>X</option>
				<option value="XI" @if($kelas->kelas=='XI') selected='selected' @endif>XI</option>
				<option value="XII" @if($kelas->kelas=='XII') selected='selected' @endif>XII</option>
			</select>
			{{$errors->first('kode')}}
		</div>

		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $row)
					<option value="{{$row->kode_jurusan}}" @if($kelas->kode_jurusan==$row->kode_jurusan) selected='selected' @endif>{{$row->nama_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

		<div class="form-group @if($errors->has('sub')) has-error @endif">
			<label for="">Sub Kelas</label>
			<input type="number" name="sub" value="{{$kelas->sub_kelas}}" class="form-control">
			{{$errors->first('sub')}}
		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/kelas')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop