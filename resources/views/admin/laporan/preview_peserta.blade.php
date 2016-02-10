@extends('admin.laporan.template')

@section('cetak')
    <a href="{{URL::to('admin/laporan/cetak-peserta?type=pdf&ruang='.$ruang->id_ruang)}}" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="{{URL::to('admin/laporan/cetak-peserta?type=excel&ruang='.$ruang->id_ruang)}}" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <a href="{{URL::to('admin/laporan/peserta')}}" class="btn btn-default">
        Kembali
    </a>
@stop

@section('content')
    <legend>Daftar Peserta Ujian</legend>

    <table class="table table-striped">
        <tr>
            <td>Nama Ruangan</td>
            <td> : {{$ruang->nama_ruang}}</td>
        </tr>
        <tr>
            <td>Kuota</td>
            <td> : {{$ruang->kuota}}</td>
        </tr>
    </table>
    
    <hr>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($peserta as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nis}}</td>
                    <td>{{$row->siswa->no_peserta}}</td>
                    <td>{{$row->siswa->nama}}</td>
                    <td>{{$row->siswa->kd_kelas}}</td>
                    <td>{{$row->siswa->password_asli}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop