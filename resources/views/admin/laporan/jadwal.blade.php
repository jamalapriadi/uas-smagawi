@extends('admin.template')

@section('content')
    <legend>Data Jadwal</legend>

    <a href="{{URL::to('admin/laporan/cetak-jadwal?type=pdf')}}" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="{{URL::to('admin/laporan/cetak-jadwal?type=excel')}}" class="btn btn-success" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export Excel
    </a>

    <hr>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>Tanggal</th>
                <th>Mata Pelajaran</th>
                <th>Jam</th>
                <th>Ruang Ujian | Pengawas</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($jadwal as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{date('d-m-Y',strtotime($row->tgl_ujian))}}</td>
                    <td>{{$row->kd_mapel}}</td>
                    <td>{{$row->jam}} s/d {{$row->selesai}}</td>
                    <?php $detail=App\Models\Djadwal::where('id_jadwal',$row->id_jadwal)->get();?>
                    <td>
                        <ul>
                            @foreach($detail as $d)
                                <li>{{$d->ruang->nama_ruang}} | {{$d->getpengawas->nama}}</li>
                            @endforeach
                        </ul>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop