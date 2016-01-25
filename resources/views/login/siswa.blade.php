@extends('login.template')

@section('content')
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Login Siswa</p>
		</div>

		<div class="panel-body">
			{{Form::open(array('url'=>'login/proses-siswa','method'=>'post'))}}
				@if(Session::has('pesan'))
					<div class="alert alert-success">
						{{Session::get('pesan')}}
					</div>
				@endif
				
				<div class="form-group @if($errors->has('nis')) has-error @endif">
					<label for="">NIS</label>
					<input type="nis" name="nis" class="form-control">
					{{$errors->first('nis')}}
				</div>

				<div class="form-group @if($errors->has('password')) has-error @endif">
					<label for="">Password</label>
					<input type="password" name="password" class="form-control">
					{{$errors->first('password')}}
				</div>

				<div class="form-group">
					<button class="btn btn-primary">
						Login
					</button>
				</div>
			{{Form::close()}}
		</div>
	</div>
@stop