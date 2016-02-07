@extends('admin.template')

@section('content')
	<legend>Tambah Siswa</legend>

	{{Form::open(array('url'=>'admin/siswa','method'=>'post'))}}
		<div class="form-group @if($errors->has('peserta')) has-error @endif">
			<label for="">No. Peserta Ujian</label>
			<input type="text" name="peserta" class="form-control">
			{{$errors->first('peserta')}}
		</div>

		<div class="form-group @if($errors->has('nis')) has-error @endif">
			<label for="">NISN</label>
			<input type="text" name="nis" class="form-control">
			{{$errors->first('nis')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('jk')) has-error @endif">
			<label for="">jk</label>
			<select name="jk" id="jk" class="form-control">
				<option value="">Pilih Jenis Kelamin</option>
				<option value="L">Laki - Laki</option>
				<option value="P">Perempuan</option>
			</select>
			{{$errors->first('jk')}}
		</div>

		<div class="form-group @if($errors->has('tempat')) has-error @endif">
			<label for="">Tempat Lahir</label>
			<input type="text" name="tempat" class="form-control">
			{{$errors->first('tempat')}}
		</div>

		<div class="form-group @if($errors->has('tanggal')) has-error @endif">
			<label for="">Tanggal Lahir</label>
			<input type="text" name="tanggal" id="tanggal" class="form-control">
			{{$errors->first('tanggal')}}
		</div>

		<div class="form-group @if($errors->has('nik')) has-error @endif">
			<label for="">NIK</label>
			<input type="text" name="nik" class="form-control">
			{{$errors->first('nik')}}
		</div>

		<div class="form-group @if($errors->has('agama')) has-error @endif">
			<label for="">Agama</label>
			<select name="agama" id="agama" class="form-control">
				<option value="">Pilih Agama</option>
				<option value="Islam">Islam</option>
				<option value="Kristen">Kristen</option>
				<option value="Budha">Budha</option>
				<option value="Katolik">Katolik</option>
				<option value="Hindu">Hindu</option>
			</select>
			{{$errors->first('agama')}}
		</div>

		<div class="form-group @if($errors->has('alamat')) has-error @endif">
			<label for="">Alamat</label>
			<input type="text" name="alamat" class="form-control">
			{{$errors->first('alamat')}}
		</div>

		<div class="form-group @if($errors->has('rt')) has-error @endif">
			<label for="">RT</label>
			<input type="text" name="rt" class="form-control">
			{{$errors->first('rt')}}
		</div>

		<div class="form-group @if($errors->has('rw')) has-error @endif">
			<label for="">RW</label>
			<input type="text" name="rw" class="form-control">
			{{$errors->first('rw')}}
		</div>

		<div class="form-group @if($errors->has('dusun')) has-error @endif">
			<label for="">Dusun</label>
			<input type="text" name="dusun" class="form-control">
			{{$errors->first('dusun')}}
		</div>

		<div class="form-group @if($errors->has('kelurahan')) has-error @endif">
			<label for="">Kelurahan</label>
			<input type="text" name="kelurahan" class="form-control">
			{{$errors->first('kelurahan')}}
		</div>

		<div class="form-group @if($errors->has('kecamatan')) has-error @endif">
			<label for="">Kecamatan</label>
			<input type="text" name="kecamatan" class="form-control">
			{{$errors->first('kecamatan')}}
		</div>

		<div class="form-group @if($errors->has('pos')) has-error @endif">
			<label for="">Kode POS</label>
			<input type="text" name="pos" class="form-control">
			{{$errors->first('pos')}}
		</div>

		<div class="form-group @if($errors->has('skhun')) has-error @endif">
			<label for="">No. SKHUN</label>
			<input type="text" name="skhun" class="form-control">
			{{$errors->first('skhun')}}
		</div>

		<div class="form-group @if($errors->has('ayah')) has-error @endif">
			<label for="">Nama Ayah</label>
			<input type="text" name="ayah" class="form-control">
			{{$errors->first('ayah')}}
		</div>

		<div class="form-group @if($errors->has('ibu')) has-error @endif">
			<label for="">Nama Ibu</label>
			<input type="text" name="ibu" class="form-control">
			{{$errors->first('ibu')}}
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

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/siswa')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop