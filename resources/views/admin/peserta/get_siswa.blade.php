{{Form::open(['url'=>'admin/simpan-peserta','method'=>'post'])}}
<input type="hidden" name="kelas" value="{{$kelas}}" class="form-control">
<input type="hidden" name="ruang" value="{{$ruang}}" class="form-control">
<table class="table table-striped">
    <thead>
        <tr>
            <th>No.</th>
            <th>NISN</th>
            <th>Nama</th>
            <th>
                
            </th>
        </tr>
    </thead>
    <tbody>
        <?php $no=0;?>
        @foreach($siswa as $row)
            <?php $no++;?>
            <tr>
                <td>{{$no}}</td>
                <td>{{$row->nis}}</td>
                <td>{{$row->nama}}</td>
                <td>
                    <input type="checkbox" name="nis[]" value="{{$row->nis}}">
                </td>
            </tr>
        @endforeach
    </tbody>
</table>

<div class="form-group well">
    <button class="btn btn-primary">
        <i class="glyphicon glyphicon-refresh"></i>
        Tambahkan
    </button>
</div>
{{Form::close()}}