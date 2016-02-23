@extends('admin.template')

@section('content')
	<legend>Tambah Data Jadwal</legend>

	{!! Form::model($jadwal,array('url'=>route('admin.jadwal.update',['jadwal'=>$jadwal->id_jadwal]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $jur)
					<option value="{{$jur->kode_jurusan}}" @if($jadwal->kode_jurusan==$jur->kode_jurusan) selected='selected' @endif>{{$jur->nama_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

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
			<label for="">Jam Mulai</label>
			<input type="text" name="jam" value="{{$jadwal->jam}}" id="jam" class="form-control">
			{{$errors->first('jam')}}
		</div>

		<div class="form-group @if($errors->has('selesai')) has-error @endif">
			<label for="">Jam Selesai</label>
			<input type="text" name="selesai" value="{{$jadwal->selesai}}" id="selesai" class="form-control">
			{{$errors->first('selesai')}}
		</div>

		<div class="form-group @if($errors->has('lama')) has-error @endif">
			<label for="">Waktu Ujian ( Menit )</label>
			<input type="number" name="lama" value="{{$jadwal->waktu_ujian}}" id="lama" class="form-control">
			{{$errors->first('lama')}}
		</div>

		<div class="form-group @if($errors->has('sesi')) has-error @endif">
			<label for="">Sesi</label>
			<select name="sesi" id="sesi" class="form-control">
				<option value="">--Pilih Sesi--</option>
				<option value="1" @if($jadwal->sesi==1) selected='selected' @endif>1</option>
				<option value="2" @if($jadwal->sesi==2) selected='selected' @endif>2</option>
				<option value="3" @if($jadwal->sesi==3) selected='selected' @endif>3</option>
			</select>
			{{$errors->first('sesi')}}
		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/jadwal')}}" class="btn btn-default">Kembali</a>
		</div>
	{{Form::close()}}
@stop