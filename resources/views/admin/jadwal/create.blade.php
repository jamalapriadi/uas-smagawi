@extends('admin.template')

@section('content')
	<legend>Tambah Data Jadwal</legend>

	{{Form::open(array('url'=>'admin/jadwal','method'=>'post'))}}
		<div class="form-group @if($errors->has('jurusan')) has-error @endif">
			<label for="">Jurusan</label>
			<select name="jurusan" id="jurusan" class="form-control">
				<option value="">--Pilih Jurusan--</option>
				@foreach($jurusan as $jur)
					<option value="{{$jur->kode_jurusan}}">{{$jur->nama_jurusan}}</option>
				@endforeach
			</select>
			{{$errors->first('jurusan')}}
		</div>

		<div class="form-group @if($errors->has('mapel')) has-error @endif">
			<label for="">Mata Pelajaran</label>
			<select name="mapel" id="mapel" class="form-control">
				<option value="">--Pilih Mata Pelajaran--</option>
				@foreach($mapel as $map)
					<option value="{{$map->kd_mapel}}">{{$map->nm_mapel}}</option>
				@endforeach
			</select>
			{{$errors->first('mapel')}}
		</div>

		<div class="form-group @if($errors->has('tanggal')) has-error @endif">
			<label for="">Tanggal</label>
			<div class="input-group">
				<input type="text" id="tanggal" name="tanggal" class="form-control">
				<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
				</span>
			</div>
			{{$errors->first('tanggal')}}
		</div>

		<div class="form-group @if($errors->has('jam')) has-error @endif">
			<label for="">Jam Mulai</label>
			<input type="text" name="jam" id="jam" class="form-control">
			{{$errors->first('jam')}}
		</div>

		<div class="form-group @if($errors->has('selesai')) has-error @endif">
			<label for="">Jam Selesai</label>
			<input type="text" name="selesai" id="selesai" class="form-control">
			{{$errors->first('selesai')}}
		</div>

		<div class="form-group @if($errors->has('lama')) has-error @endif">
			<label for="">Waktu Ujian ( Menit )</label>
			<input type="number" name="lama" id="lama" class="form-control">
			{{$errors->first('lama')}}
		</div>

		<div class="form-group @if($errors->has('sesi')) has-error @endif">
			<label for="">Sesi</label>
			<select name="sesi" id="sesi" class="form-control">
				<option value="">--Pilih Sesi--</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
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