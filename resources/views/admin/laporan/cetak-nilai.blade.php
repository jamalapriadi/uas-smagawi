@extends('admin.laporan.template-pdf')

@section('content')
    <h3>Laporan Data Nilai</h3>
    <hr>
    <table class="gridtable" style="width:100%;">
            <tr>
                <td>Kelas</td>
                <td> : {{$kelas}}</td>
            </tr>
            <tr>
                <td>Mata Pelajaran</td>
                <td> : {{$mapel}}</td>
            </tr>
    </table>
    <br><br>
    <table class="gridtable">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>No. Peserta</th>
                <th>Nama</th>
                <th>Benar</th>
                <th>Salah</th>
                <th>Nilai</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($siswa as $row)
                <?php 
                    $no++;
                    $benar=DB::table('nilai_siswa')
                            ->where('kd_mapel',$mapel)
                            ->where('kd_kelas',$kelas)
                            ->where('nis',$row->nis)
                            ->where('benar','Y')
                            ->count();

                    $salah=DB::table('nilai_siswa')
                            ->where('kd_mapel',$mapel)
                            ->where('kd_kelas',$kelas)
                            ->where('nis',$row->nis)
                            ->where('benar','N')
                            ->count();
                ?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nis}}</td>
                    <td>{{$row->no_peserta}}</td>
                    <td>{{$row->nama}}</td>
                    <td>{{$benar}}</td>
                    <td>{{$salah}}</td>
                    <td>
                        {{$benar-$salah}}
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop