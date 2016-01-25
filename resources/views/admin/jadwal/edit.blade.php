@extends('admin.template')

@section('content')
	<legend>Tambah Data Jadwal</legend>

	{!! Form::model($jadwal,array('url'=>route('admin.jadwal.update',['jadwal'=>$jadwal->id_jadwal]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				@foreach($mapel as $map)
					<option value="{{$map->kd_mapel}}" @if($jadwal->kd_mapel==$map->kd_mapel) selected='selected' @endif>{{$map->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
		</div>

		<div class="form-group @if($errors->has('tanggal')) has-error @endif">
			<label for="">Tanggal</label>
			<div class="input-group">
				<input type="text" id="tanggal" value="{{$jadwal->tgl_ujian}}" name="tanggal" class="form-control">
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			{{$errors->first('tanggal')}}
		</div>

		<div class="form-group @if($errors->has('jam')) has-error @endif">
			<label for="">Jam</label>
			<input type="text" name="jam" value="{{$jadwal->jam}}" id="jam" class="form-control">
			{{$errors->first('jam')}}
		</div>

		<div class="form-group">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>
		</div>
	{{Form::close()}}
@stop