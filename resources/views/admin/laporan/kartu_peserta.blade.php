@extends('admin.template')

@section('content')
    <legend>Data Kartu Peserta</legend>

    {{Form::open(['url'=>'admin/laporan/preview-kartu-peserta','method'=>'post','class'=>'form-horizontal'])}}
        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Pilih Kelas</label>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                    @foreach($kelas as $row)
                        <option value="{{$row->kd_kelas}}">{{$row->kd_kelas}}</option>
                    @endforeach
                    <option value="semua">Semua</option>
                </select>
            </div>
        </div>

        <div class="form-group well">
            <label for="" class="col-lg-2 control-label"></label>
            <div class="col-lg-4">
                <button class="btn btn-primary">
                    <i class="glyphicon glyphicon-print"></i>
                    Tampilkan
                </button>
            </div>
        </div>
    {{Form::close()}}
@stop