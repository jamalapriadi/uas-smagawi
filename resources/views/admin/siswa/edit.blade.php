@extends('admin.template')

@section('content')
	<legend>Tambah Siswa</legend>

	{!! Form::model($siswa,array('url'=>route('admin.siswa.update',['siswa'=>$siswa->nis]),'method'=>'put'))!!}
		<div class="form-group @if($errors->has('peserta')) has-error @endif">
			<label for="">No. Peserta Ujian</label>
			<input type="text" name="peserta" class="form-control" value="{{$siswa->no_peserta}}" readonly="readonly">
			{{$errors->first('peserta')}}
		</div>

		<div class="form-group @if($errors->has('nis')) has-error @endif">
			<label for="">NISN</label>
			<input type="text" name="nis" value="{{$siswa->nis}}" readonly="readonly" class="form-control">
			{{$errors->first('nis')}}
		</div>

		<div class="form-group @if($errors->has('nama')) has-error @endif">
			<label for="">Nama</label>
			<input type="text" name="nama" value="{{$siswa->nama}}" class="form-control">
			{{$errors->first('nama')}}
		</div>

		<div class="form-group @if($errors->has('jk')) has-error @endif">
			<label for="">jk</label>
			<select name="jk" id="jk" class="form-control">
				<option value="">Pilih Jenis Kelamin</option>
				<option value="L" @if($siswa->jk=='L') selected='selected' @endif>Laki - Laki</option>
				<option value="P" @if($siswa->jk=='P') selected='selected' @endif>Perempuan</option>
			</select>
			{{$errors->first('jk')}}
		</div>

		<div class="form-group @if($errors->has('tempat')) has-error @endif">
			<label for="">Tempat Lahir</label>
			<input type="text" name="tempat" value="{{$siswa->tmp_lahir}}" class="form-control">
			{{$errors->first('tempat')}}
		</div>

		<div class="form-group @if($errors->has('tanggal')) has-error @endif">
			<label for="">Tanggal Lahir</label>
			<input type="text" name="tanggal" id="tanggal" value="{{$siswa->tgl_lahir}}" class="form-control">
			{{$errors->first('tanggal')}}
		</div>

		<div class="form-group @if($errors->has('nik')) has-error @endif">
			<label for="">NIK</label>
			<input type="text" name="nik" class="form-control" value="{{$siswa->nik}}">
			{{$errors->first('nik')}}
		</div>

		<div class="form-group @if($errors->has('agama')) has-error @endif">
			<label for="">Agama</label>
			<select name="agama" id="agama" class="form-control">
				<option value="">Pilih Agama</option>
				<option value="Islam" @if($siswa->agama=='Islam') selected='selected' @endif>Islam</option>
				<option value="Kristen" @if($siswa->agama=='Kristen') selected='selected' @endif>Kristen</option>
				<option value="Budha" @if($siswa->agama=='Budha') selected='selected' @endif>Budha</option>
				<option value="Katolik" @if($siswa->agama=='Katolik') selected='selected' @endif>Katolik</option>
				<option value="Hindu" @if($siswa->agama=='Hindu') selected='selected' @endif>Hindu</option>
			</select>
			{{$errors->first('agama')}}
		</div>

		<div class="form-group @if($errors->has('alamat')) has-error @endif">
			<label for="">Alamat</label>
			<input type="text" name="alamat" class="form-control" value="{{$siswa->alamat}}">
			{{$errors->first('alamat')}}
		</div>

		<div class="form-group @if($errors->has('rt')) has-error @endif">
			<label for="">RT</label>
			<input type="text" name="rt" class="form-control" value="{{$siswa->rt}}">
			{{$errors->first('rt')}}
		</div>

		<div class="form-group @if($errors->has('rw')) has-error @endif">
			<label for="">RW</label>
			<input type="text" name="rw" class="form-control" value="{{$siswa->rw}}">
			{{$errors->first('rw')}}
		</div>

		<div class="form-group @if($errors->has('dusun')) has-error @endif">
			<label for="">Dusun</label>
			<input type="text" name="dusun" class="form-control" value="{{$siswa->dusun}}">
			{{$errors->first('dusun')}}
		</div>

		<div class="form-group @if($errors->has('kelurahan')) has-error @endif">
			<label for="">Kelurahan</label>
			<input type="text" name="kelurahan" class="form-control" value="{{$siswa->kelurahan}}">
			{{$errors->first('kelurahan')}}
		</div>

		<div class="form-group @if($errors->has('kecamatan')) has-error @endif">
			<label for="">Kecamatan</label>
			<input type="text" name="kecamatan" class="form-control" value="{{$siswa->kelurahan}}">
			{{$errors->first('kecamatan')}}
		</div>

		<div class="form-group @if($errors->has('pos')) has-error @endif">
			<label for="">Kode POS</label>
			<input type="text" name="pos" class="form-control" value="{{$siswa->kode_pos}}">
			{{$errors->first('pos')}}
		</div>

		<div class="form-group @if($errors->has('skhun')) has-error @endif">
			<label for="">No. SKHUN</label>
			<input type="text" name="skhun" class="form-control" value="{{$siswa->no_skhun}}">
			{{$errors->first('skhun')}}
		</div>

		<div class="form-group @if($errors->has('ayah')) has-error @endif">
			<label for="">Nama Ayah</label>
			<input type="text" name="ayah" class="form-control" value="{{$siswa->nm_ayah}}">
			{{$errors->first('ayah')}}
		</div>

		<div class="form-group @if($errors->has('ibu')) has-error @endif">
			<label for="">Nama Ibu</label>
			<input type="text" name="ibu" class="form-control" value="{{$siswa->nm_ibu}}">
			{{$errors->first('ibu')}}
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