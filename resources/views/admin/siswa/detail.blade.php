@extends('admin.template')

@section('content')
    <legend>Detail Siswa</legend>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>No. Peserta Ujian</th>
                <th> : {{$siswa->no_peserta}}</th>
            </tr>
            <tr>
                <th>NISN</th>
                <th> : {{$siswa->nis}}</th>
            </tr>
            <tr>
                <th>Nama</th>
                <th> : {{$siswa->nama}}</th>
            </tr>
            <tr>
                <th>JK</th>
                <th> : {{$siswa->jk}}</th>
            </tr>
            <tr>
                <th>Tempat, Tanggal Lahir</th>
                <th> : {{$siswa->tmp_lahir}}, {{$siswa->tgl_lahir}}</th>
            </tr>
            <tr>
                <th>NIK</th>
                <th> : {{$siswa->nik}}</th>
            </tr>
            <tr>
                <th>Agama</th>
                <th> : {{$siswa->agama}}</th>
            </tr>
            <tr>
                <th>Alamat</th>
                <th> : {{$siswa->alamat}}</th>
            </tr>
            <tr>
                <th>RT</th>
                <th> : {{$siswa->rt}}</th>
            </tr>
            <tr>
                <th>RW</th>
                <th> : {{$siswa->rw}}</th>
            </tr>
            <tr>
                <th>Dusun</th>
                <th> : {{$siswa->dusun}}</th>
            </tr>
            <tr>
                <th>Kelurahan</th>
                <th> : {{$siswa->kelurahan}}</th>
            </tr>
            <tr>
                <th>Kecamatan</th>
                <th> : {{$siswa->kecamatan}}</th>
            </tr>
            <tr>
                <th>Kode POS</th>
                <th> : {{$siswa->kode_pos}}</th>
            </tr>
            <tr>
                <th>No. SKHUN</th>
                <th> : {{$siswa->no_skhun}}</th>
            </tr>
            <tr>
                <th>Nama Ayah</th>
                <th> : {{$siswa->nm_ayah}}</th>
            </tr>
            <tr>
                <th>Nama Ibu</th>
                <th> : {{$siswa->nm_ibu}}</th>
            </tr>
            <tr>
                <th>Kelas</th>
                <th> : {{$siswa->kd_kelas}}</th>
            </tr>
        </thead>
    </table>

    <div class="well">
        <a href="{{URL::to('admin/siswa')}}" class="btn btn-default">Kembali</a>
    </div>
@stop