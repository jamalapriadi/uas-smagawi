@extends('admin.template')

@section('content')
    <legend>Data Nilai</legend>

    <a href="#" class="btn btn-primary">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="#" class="btn btn-success">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <a href="{{URL::to('admin/laporan/nilai')}}" class="btn btn-default">
        Kembali
    </a>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Kelas</th>
                <th> : LS IA 3</th>
            </tr>
            <tr>
                <th>Mata Pelajaran</th>
                <th> : Matematika</th>
            </tr>
        </thead>
    </table>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Nilai</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($siswa as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nis}}</td>
                    <td>{{$row->no_peserta}}</td>
                    <td>{{$row->nama}}</td>
                    <td>8</td>
                    <td>
                        <a href="{{URL::to('admin/laporan/detail-nilai/'.$row->nis)}}" class="btn btn-primary">
                            <i class="glyphicon glyphicon-list-alt"></i>
                            Detail
                        </a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop