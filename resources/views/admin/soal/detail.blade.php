@extends('admin.template')

@section('content')
	<legend>Data Soal # {{$soal->kd_mapel}}</legend>

	<table class="table table-bordered">
		<tr>
			<td style="width:40%">Mata Pelajaran</td>
			<td> :  {{$soal->kd_mapel}}</td>
		</tr>
		<tr>
			<td>Jurusan</td>
			<td> : {{$soal->kode_jurusan}}</td>
		</tr>
		<tr>
			<td>Waktu Ujian</td>
			<td> : {{$soal->waktu_ujian}} Menit</td>
		</tr>
	</table>

	<hr>

	<div id="pesan"></div>

	<table class="table" id="data">
				<thead>
					<tr>
						<th>No.</th>
						<th>Soal</th>
						<th>Jawaban</th>
					</tr>
				</thead>
				<tbody>
					<?php $no=0;?>
					@foreach($detail as $row)
						<?php $no++;?>
						<tr>
							<td>{{$no}}</td>
							<td>{{Html::image('uploads/small/'.$row->gambar_kecil,'',array('class'=>'img-responsive'))}}</td>
							<td>{{$row->kunci_jawaban}}</td>
						</tr>
					@endforeach
				</tbody>
			</table>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	          <h4 class="modal-title">Keterangan</h4>
	        </div>
	        <div class="modal-body">
	        	<div id="loading" style="display:none;">Loading</div>
	        	<input type="hidden" id="idhapus">
	        	Apakah anda yakin ingin menghapus data ini??
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          <a href="#" id="konfirmasi" class="btn btn-primary">
	          	Hapus
	          </a>
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
@stop

@section('footer')
	<script>
		$(function(){
			$("#konfirmasi").click(function(){
				var kode=$("#idhapus").val();

				$.ajax({
					url:"{{URL::to('admin/hapus-soal')}}",
					type:"POST",
					data:"kode="+kode,
					cache:false,
					success:function(){
						location.reload();
					},
					error:function(){
						$("#pesan").html("<div class='alert alert-danger'>Data Gagal dihapus</div>");
						$("#myModal").modal("hide");
					}
				})
			})
		})
	</script>
@stop