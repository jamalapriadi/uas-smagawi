@extends('admin.template')

@section('content')
    <legend>Laporan Peserta Ujian</legend>

    {{Form::open(array('url'=>'admin/laporan/preview-peserta','method'=>'post','class'=>'form-horizontal'))}}
        <div class="form-group">
            <label for="" class="col-lg-2 control-label">Ruang Ujian</label>
            <div class="col-lg-4">
                <select name="ruang" id="ruang" class="form-control">
                    <option value="">--Pilih Ruang Ujian--</option>
                    @foreach($ruang as $row)
                        <option value="{{$row->id_ruang}}">{{$row->nama_ruang}}</option>
                    @endforeach
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