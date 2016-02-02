@extends('admin.template')

@section('content')
    <legend>Setting Peserta Ujian</legend>

    {{Form::open(['url'=>'admin/simpan-peserta','method'=>'post','class'=>'form-horizontal'])}}
        <div class="form-group">
            <div class="col-lg-2 control-label">Ruang Ujian</div>
            <div class="col-lg-4">
                <select name="ruang" id="ruang" class="form-control">
                    <option value="">--Pilih Ruang Ujian--</option>
                    @foreach($ruang as $r)
                        <option value="{{$r->id_ruang}}">{{$r->nama_ruang}}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-2 control-label">Kelas</div>
            <div class="col-lg-4">
                <select name="kelas" id="kelas" class="form-control">
                    <option value="">--Pilih Kelas--</option>
                    @foreach($kelas as $k)
                        <option value="{{$k->kd_kelas}}">{{$k->kd_kelas}}</option>
                    @endforeach
                </select>
            </div>
        </div>

    <hr>

    <div id="loading" style="display:none;">
        <div class="alert alert-info">
            {{Html::image('assets/img/loading.gif','',array('style'=>'width:80px;'))}} Loading....
        </div>
    </div>

    <div id="tampil"></div>

    {{Form::close()}}
@stop

@section('footer')
    <script>
        $(function(){
            $("#kelas").change(function(){
                var kelas=$("#kelas").val();

                $.ajax({
                    url:"{{URL::to('admin/get-siswa')}}",
                    type:"POST",
                    data:"kelas="+kelas,
                    cache:false,
                    beforeSend:function(){
                        $("#loading").show();
                    },
                    success:function(html){
                        $("#loading").hide();
                        $("#tampil").html(html);
                    },
                    error:function(){
                        $("#loading").hide();
                        $("#tampil").html("<div class='alert alert-danger'>Data tidak dapat ditampilkan</div>");
                    }
                })
            })
        })
    </script>
@stop