@extends('admin.template')

@section('content')
    <legend>Import Data Siswa</legend>

    {{Form::open(array('url'=>'admin/proses-import-siswa','method'=>'post','files'=>true))}}
        <div class="form-group @if($errors->has('excel')) has-error @endif">
            <label for="">Pilih File ( Excel )</label>
            <input type="file" name="excel" class="form-control">
            {{$errors->first('excel')}}
        </div>

        <div class="form-group well">
            <button class="btn btn-primary">
                <i class="glyphicon glyphicon-upload"></i>
                Upload
            </button>

            <a href="{{URL::to('admin/siswa')}}" class="btn btn-default">Kembali</a>
        </div>
    {{Form::close()}}
@stop