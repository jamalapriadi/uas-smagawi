@extends('admin.template')

@section('content')
    <legend>
        <a href="{{URL::to('admin/peserta-ujian')}}" class="btn btn-default">Kembali</a>
        Atur Peserta</legend>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Nama Ruang</th>
                <th> : {{$ruang->nama_ruang}}</th>
            </tr>
            <tr>
                <th>Kuota</th>
                <th> : {{$ruang->kuota}}</th>
            </tr>
        </thead>
    </table>

    
    @if(count($peserta)<$ruang->kuota)
        
    @else
        <div class="alert alert-info">
            Kuota Sudah Terpenuhi
        </div>
    @endif

    @if(Session::has('pesan'))
        <div class="alert alert-success">
            {{Session::get('pesan')}}
        </div>
    @endif

    <div id="pesan"></div>

    <table class="table table-striped" id="datapeserta">
        <thead>
            <tr>
                <th>No.</th>
                <th>No. Meja</th>
                <th>NIS</th>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Sesi</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php $no=0;?>
            @foreach($peserta as $row)
                <?php $no++;?>
                <tr>
                    <td>{{$no}}</td>
                    <td>{{$row->no_meja}}</td>
                    <td>{{$row->nis}}</td>
                    <td>{{$row->siswa->nama}}</td>
                    <td>{{$row->siswa->kd_kelas}}</td>
                    <td>{{$row->sesi}}</td>
                    <td>
                        <a href="#" kode="{{$row->id}}" class="btn btn-danger hapus">
                            <i class="glyphicon glyphicon-trash"></i>
                        </a>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Konfirmasi?</h4>
          </div>
          <div class="modal-body">
            <div id="loading" style="display:none;">Loading. . .</div>
            <input type="hidden" id="idhapus">
            <p>Apakah anda yakin ingin menghapus data ini?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" id="hps" class="btn btn-primary">Hapus</button>
          </div>
        </div>
      </div>
    </div>

@stop

@section('footer')
    <script>
        $(function(){

            $("#hps").click(function(){
                var kode=$("#idhapus").val();

                $.ajax({
                    url:"{{URL::to('admin/hapus-peserta')}}",
                    type:"POST",
                    data:"kode="+kode,
                    cache:false,
                    beforeSend:function(){
                        $("#loading").show();
                    },
                    success:function(){
                        location.reload();
                    },
                    error:function(){
                        $("#loading").hide();
                        $("#myModal").modal("hide");
                        $("#pesan").html("<div class='alert alert-danger'>Data Gagal dihapus</div>");
                    }
                })
            });

            $("#datapeserta").dataTable();
        })
    </script>
@stop