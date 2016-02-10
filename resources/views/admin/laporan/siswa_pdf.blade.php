@extends('admin.laporan.template-pdf')

@section('content')
    <legend>Laporan Data Siswa Kelas : {{$kelas}}</legend>

    <hr>

    <table class="gridtable">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>JK</th>
                <th>Tempat, Tanggal Lahir</th>
                <th>NIK</th>
                <th>Agama</th>
                <th>Alamat</th>
                <th>Nama Ayah</th>
                <th>Nama Ibu</th>
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
                    <td>{{$row->jk}}</td>
                    <td>{{$row->tmp_lahir.','.$row->tgl_lahir}}</td>
                    <td>{{$row->nik}}</td>
                    <td>{{$row->agama}}</td>
                    <td>{{$row->alamat}}</td>
                    <td>{{$row->nm_ayah}}</td>
                    <td>{{$row->nm_ibu}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop