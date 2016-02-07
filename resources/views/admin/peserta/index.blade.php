@extends('admin.template')

@section('content')
    <legend>Peserta Ujian</legend>

    <a href="{{URL::to('admin/seting-peserta')}}" class="btn btn-primary">
        <i class="glyphicon glyphicon-cog"></i>
        Setting Peserta
    </a>

    <hr>

    <table class="table table-striped" id="data">
        <thead>
            <tr>
                <th>No.</th>
                <th>Ruang Ujian</th>
                <th>Kuota</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($ruang as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->nama_ruang}}</td>
                    <td>{{$row->kuota}}</td>
                    <td>
                        <a href="{{URL::to('admin/atur-peserta/'.$row->id_ruang)}}" class="btn btn-primary">
                            Atur Peseta Ujian
                        </a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@stop