@extends('admin.template')

@section('content')
    <legend>Profile</legend>

    @if(Session::has('pesan'))  
        <div class="alert alert-success">
            {{Session::get('pesan')}}
        </div>
    @endif

    {{Form::open(['url'=>'admin/update-profile','method'=>'post','class'=>'form-horizontal'])}}
        <div class="form-group @if($errors->has('nama')) has-error @endif">
            <label for="" class="col-lg-2 control-label">Nama</label>
            <div class="col-lg-4">
                <input type="hidden" name="id" value="{{$admin->id}}">
                <input type="text" name="nama" value="{{$admin->name}}" class="form-control">
                {{$errors->first('nama')}}
            </div>
        </div>

        <div class="form-group @if($errors->has('nama')) has-error @endif">
            <label for="" class="col-lg-2 control-label">Email</label>
            <div class="col-lg-4">
                <input type="email" name="email" value="{{$admin->email}}" class="form-control">
                {{$errors->first('email')}}
            </div>
        </div>

        <div class="form-group well">
            <label for="" class="col-lg-2 control-label"></label>
            <div class="col-lg-4">
                <button class="btn btn-primary">
                    <i class="glyphicon glyphicon-edit"></i>
                    Update Profile
                </button>
            </div>
        </div>
    {{Form::close()}}
@stop