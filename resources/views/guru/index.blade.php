@extends('guru.template')

@section('head')
	{{Html::style('assets/fancybox/jquery.fancybox.css')}}
@stop

@section('content')
	<legend>Selamat Datang dihalaman Guru</legend>

	<div class="row">
		<div class="col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<p>Profile</p>
				</div>

				<div class="panel-body">
					<table class="table table-striped">
						<tr>
							<td>NIP</td>
							<td> : {{$guru->nip}}</td>
						</tr>
						<tr>
							<td>Nama</td>
							<td> : {{$guru->nama}}</td>
						</tr>
						<tr>
							<td>Mata Pelajaran</td>
							<td> : {{$guru->mapel->nm_mapel}}</td>
						</tr>
						<tr>
							<td>Jurusan</td>
							<td> : {{$guru->soal->kode_jurusan}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<a href="{{URL::to('guru/create-soal')}}" class="btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i>
				Tambah Soal
			</a>

			<hr>
			@if(Session::has('pesan'))
				<div class="alert alert-success">
					{{Session::get('pesan')}}
				</div>
			@endif

			<table class="table" id="data">
				<thead>
					<tr>
						<th>No.</th>
						<th>Soal</th>
						<th>Jawaban</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php $no=0;?>
					@foreach($detail as $row)
						<?php $no++;?>
						<tr>
							<td>{{$no}}</td>
							<td>
								<a class="single_image" href="{{URL::asset('uploads/big/'.$row->gambar_besar)}}">
									{{Html::image('uploads/small/'.$row->gambar_kecil,'',array('class'=>'img-responsive'))}}
								</a>
							</td>
							<td>{{$row->kunci_jawaban}}</td>
							<td>
								<a href="{{URL::to('guru/edit/'.$row->id)}}" class="btn btn-warning">
									<i class="glyphicon glyphicon-edit"></i>
								</a>
							</td>
							<td>
								<a href="#" kode="{{$row->id}}" class="btn btn-danger hapus">
									<i class="glyphicon glyphicon-trash"></i>
								</a>
							</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>

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
	{{Html::script('assets/fancybox/jquery.fancybox.js')}}

	<script>
		$(function(){
			$("a.single_image").fancybox();
			$("#data").dataTable();

			$( document ).on( "click", "a.hapus", function() {
			  	var kode=$(this).attr("kode");

				$("#idhapus").val(kode);

				$("#myModal").modal("show");
			});

			$("#konfirmasi").click(function(){
				var kode=$("#idhapus").val();

				$.ajax({
					url:"{{URL::to('guru/hapus-soal')}}",
					type:"POST",
					data:"kode="+kode,
					cache:false,
					beforeSend:function(){
						$("#loading").show();
					},
					success:function(html){
						location.reload();
					},
					error:function(html){
						$("#myModal").modal('hide');
						$("#pesan").html("<div class='alert alert-danger'>Data Gagal dihapus</div>");
					}
				})
			})
		})
	</script>
@stop