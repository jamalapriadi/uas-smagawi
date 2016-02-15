@extends('guru.template')

@section('content')
    @if(Session::has('pesan'))
        <div class="alert alert-success">
            {{Session::get('pesan')}}
        </div>
    @endif

    <a href="{{URL::to('guru')}}" class="btn btn-primary">Kembali</a>
@stop