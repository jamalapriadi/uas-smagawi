@extends('admin.laporan.template')

@section('content')
    <legend>Laporan Data Siswa</legend>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>Nama</th>
                <th>No. Peserta</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($siswa as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nis}}</td>
                    <td>{{$row->nama}}</td>
                    <td>{{$row->no_peserta}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop