@extends('admin.laporan.template-pdf')

@section('content')
    <legend>Daftar Peserta Ujian</legend>

    <table class="gridtable">
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
    <table class="gridtable">
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