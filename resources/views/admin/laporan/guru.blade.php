@extends('admin.template')

@section('content')
    <legend>Laporan Data Guru</legend>
    
    <a href="{{URL::to('admin/laporan/cetak-guru?type=pdf')}}" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="{{URL::to('admin/laporan/cetak-guru?type=excel')}}" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <hr>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>NIP</th>
                <th>Nama</th>
                <th>Mata Pelajaran</th>
                <th>Jurusan</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($guru as $row)
            <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nip}}</td>
                    <td>{{$row->nama}}</td>
                    <td>{{$row->mapel->nm_mapel}}</td>
                    <td>{{$row->soal->kode_jurusan}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop