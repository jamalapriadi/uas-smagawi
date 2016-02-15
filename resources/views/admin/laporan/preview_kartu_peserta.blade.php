@extends('admin.laporan.template')

@section('cetak')
    <a href="{{URL::to('admin/laporan/cetak-kartu-peserta?type=pdf&kelas='.$kelas)}}" class="btn btn-primary" target="new target">
        <i class="glyphicon glyphicon-print"></i>
        Export PDF
    </a>

    <a href="{{URL::to('admin/laporan/kartu-peserta')}}" class="btn btn-default">
        Kembali
    </a>
@stop

@section('content')
    <legend>Kartu Peserta</legend>

    <div class="row">
        <?php $no=0;?>
        @foreach($siswa as $row)
            <div class="col-lg-4 col-xs-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <p>Kartu Sementara Simulasi</p>
                    </div>

                    <div class="panel-body">
                        <table class="table table-striped" style="font-size:11px;">
                            <tr>
                                <th>Nama Peserta</th>
                                <th> : {{substr($row->nama,0,17)}}</th>
                            </tr>
                            <tr>
                                <th>Program Studi</th>
                                <th> : {{$row->kelas->kode_jurusan}}</th>
                            </tr>
                            <tr>
                                <th>Username</th>
                                <th> : {{$row->no_peserta}}</th>
                            </tr>
                            <tr>
                                <th>Password</th>
                                <th> : {{$row->password_asli}}</th>
                            </tr>
                            <tr>
                                <th>Ruang Ujian</th>
                                <th> : {{ isset($row->peserta->ruang->nama_ruang) ? $row->peserta->ruang->nama_ruang : 'Belum Ada' }}</th>
                            </tr>
                        </table>                  
                    </div>
                </div>
            </div>
            <?php $no++;?>
            @if($no % 6==0)
                <div style="page-break-after: always;margin-top:50px;"></div>
            @endif
        @endforeach
    </div>
@stop