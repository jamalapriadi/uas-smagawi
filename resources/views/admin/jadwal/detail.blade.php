@extends('admin.template')

@section('content')
	<legend>Data Jadwal</legend>

	@if(Session::has('pesan'))
		<div class="alert alert-success">
			{{Session::get('pesan')}}
		</div>
	@endif

	<table class="table">
		<tr>
			<th>Mata Pelajaran</th>
			<th> : {{$jadwal->kd_mapel}}</th>
		</tr>
		<tr>
			<th>Tanggal</th>
			<th> : {{$jadwal->tgl_ujian}}</th>
		</tr>
		<tr>
			<th>Jam</th>
			<th> : {{$jadwal->jam}}</th>
		</tr>
	</table>

	<a href="{{URL::to('admin/tambah-ruang/'.$jadwal->id_jadwal)}}" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Ruang
	</a>

	<hr>

	<table class="table table-striped">
		<thead>
			<tr>
				<th>No.</th>
				<th>Kelas</th>
				<th>Ruang</th>
				<th>Pengawas</th>
				<th>Status</th>
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
					<td>{{$row->kd_kelas}}</td>
					<td>{{$row->id_ruang}}</td>
					<td>{{$row->pengawas}}</td>
					<td>{{$row->status}}</td>
					<td>
						<a href="{{URL::to('admin/detail-jadwal/'.$row->id.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						<a href="#" kode="{{$row->id}}" class="btn btn-danger hapus">
							<i class="glyphicon glyphicon-trash"></i>
							Hapus
						</a>
					</td>
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
					url:"{{URL::to('admin/hapus-ruang')}}",
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