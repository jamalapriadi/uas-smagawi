@extends('admin.template')

@section('content')
	<legend>Edit Ruang</legend>

	@if(Session::has('pesan'))
		<div class="alert alert-success">
			{{Session::get('pesan')}}
		</div>
	@endif

	{{Form::open(array('url'=>'admin/update-ruang','method'=>'post'))}}
		<div class="form-group @if($errors->has('kelas')) has-error @endif">
			<label for="">Kelas</label>
			<input type="hidden" value="{{$jadwal->id}}" name="kode">
			<select name="kelas" id="kelas" class="form-control">
				<option value="">--Pilih Kelas--</option>
				@foreach($kelas as $row)
					<option value="{{$row->kd_kelas}}" @if($jadwal->kd_kelas==$row->kd_kelas) selected='selected' @endif>{{$row->kd_kelas}}</option>
				@endforeach
			</select>
			{{$errors->first('kelas')}}
		</div>

		<div class="form-group @if($errors->has('ruang')) has-error @endif">
			<label for="">Ruang Ujian</label>
			<select name="ruang" id="ruang" class="form-control">
				<option value="">--Pilih Ruang Ujian--</option>
				@foreach($ruang as $r)
					<option value="{{$r->id_ruang}}" @if($jadwal->id_ruang==$r->id_ruang) selected='selected' @endif>{{$r->nama_ruang}}</option>
				@endforeach
			</select>
		</div>

		<div class="form-group @if($errors->has('pengawas')) has-error @endif">
			<label for="">Pengawas</label>
			<select name="pengawas" id="pengawas" class="form-control">
				<option value="">--Pilih Pengawas--</option>
				@foreach($pengawas as $p)
					<option value="{{$p->nip}}" @if($jadwal->pengawas==$p->nip) selected='selected' @endif>{{$p->nama}}</option>
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