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
                <th>NISN</th>
                <th> : {{$siswa->nis}}</th>
            </tr>
            <tr>
                <th>No. Peserta</th>
                <th> : {{$siswa->no_peserta}}</th>
            </tr>
            <tr>
                <th>Nama</th>
                <th> : {{$siswa->nama}}</th>
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
                <th>Soal</th>
                <th>Jawaban Benar</th>
                <th>Jawaban Siswa</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($soal as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>
                        <a href="#" class="">
                            {{Html::image('uploads/small/'.$row->gambar_kecil,'',['class'=>'img-responsive','style'=>'width:100px;'])}}
                        </a>
                    </td>
                    <td>{{$row->kunci_jawaban}}</td>
                    <td></td>
                    <td></td>
                </tr>
            @endforeach
        </tbody>

        <tfoot>
            <tr>
                <th colspan="4">Total Jawaban Benar</th>
                <th> : </th>
            </tr>
            <tr>
                <th colspan="4">Total Jawaban Salah</th>
                <th> : </th>
            </tr>
            <tr>
                <th colspan="4">Total Nilai</th>
                <th> : </th>
            </tr>
        </tfoot>
    </table>
@stop