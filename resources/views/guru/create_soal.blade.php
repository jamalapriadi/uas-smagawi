@extends('guru.template')

@section('content')
	<legend>Tambah Soal</legend>

	{{Form::open(array('url'=>'guru/simpan-soal','method'=>'post','files'=>true))}}
		<div class="form-group @if($errors->has('soal')) has-error @endif">
			<label for="">Soal</label>
			<input type="file" name="soal" class="form-control">
			{{$errors->first('soal')}}
		</div>

		<div class="form-group @if($errors->has('kunci')) has-error @endif">
			<label for="">Kunci Jawaban</label>
			<select name="kunci" id="kunci" class="form-control">
				<option value="">--Pilih Kunci Jawaban--</option>
				<option value="a">A</option>
				<option value="b">B</option>
				<option value="c">C</option>
				<option value="d">D</option>
				<option value="e">E</option>
			</select>
			{{$errors->first('kunci')}}
		</div>

		<div class="form-group well">
			<button class="btn btn-primary">
				<i class="fa fa-save"></i>
				Simpan
			</button>

			<a href="{{URL::to('guru')}}" class="btn btn-default">
				Kembali
			</a>
		</div>
	{{Form::close()}}
@stop