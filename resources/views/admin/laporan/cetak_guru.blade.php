@extends('admin.laporan.template-pdf')

@section('content')
    <legend>Laporan Data Guru</legend>

    <hr>
    <table class="gridtable">
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