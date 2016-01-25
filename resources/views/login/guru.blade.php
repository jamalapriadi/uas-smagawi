@extends('login.template')

@section('content')
	<div class="panel panel-primary">
		<div class="panel-heading">
			<p>Login Guru</p>
		</div>

		<div class="panel-body">
			{{Form::open(array('url'=>'login/proses-guru','method'=>'post'))}}
				@if(Session::has('pesan'))
					<div class="alert alert-success">
						{{Session::get('pesan')}}
					</div>
				@endif
				
				<div class="form-group @if($errors->has('nip')) has-error @endif">
					<label for="">NIP</label>
					<input type="nip" name="nip" class="form-control">
					{{$errors->first('nip')}}
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