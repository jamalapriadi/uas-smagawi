@extends('admin.template')

@section('content')
	<legend>Tambah Ruang</legend>

	@if(Session::has('pesan'))
		<div class="alert alert-success">
			{{Session::get('pesan')}}
		</div>
	@endif

	{{Form::open(array('url'=>'admin/simpan-ruang','method'=>'post'))}}
		<div class="form-group @if($errors->has('kelas')) has-error @endif">
			<label for="">Kelas</label>
			<input type="hidden" name="kode" value="{{$jadwal->id_jadwal}}">
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				@foreach($kelas as $row)
					<option value="{{$row->kd_kelas}}">{{$row->kd_kelas}}</option>
				@endforeach
			</select>
			{{$errors->first('kelas')}}
		</div>

		<div class="form-group @if($errors->has('ruang')) has-error @endif">
			<label for="">Ruang Ujian</label>
			<select name="ruang" id="ruang" class="form-control">
				<option value="">--Pilih Ruang Ujian--</option>
				@foreach($ruang as $r)
					<option value="{{$r->id_ruang}}">{{$r->nama_ruang}}</option>
				@endforeach
			</select>
		</div>

		<div class="form-group @if($errors->has('pengawas')) has-error @endif">
			<label for="">Pengawas</label>
			<select name="pengawas" id="pengawas" class="form-control">
				<option value="">--Pilih Pengawas--</option>
				@foreach($pengawas as $p)
					<option value="{{$p->nip}}">{{$p->nama}}</option>
				@endforeach
			</select>
		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="glyphicon glyphicon-saved"></i>
				Simpan
			</button>

			<a href="{{URL::to('admin/jadwal/'.$jadwal->id_jadwal)}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop