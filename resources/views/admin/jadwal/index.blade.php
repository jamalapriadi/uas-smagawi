@extends('admin.template')

@section('content')
	<legend>Data Jadwal</legend>

	<a href="{{URL::to('admin/jadwal/create')}}" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Jadwal
	</a>

	<hr>

	@if(Session::has('pesan'))
		<div class="alert alert-success">
			{{Session::get('pesan')}}
		</div>
	@endif

	<table class="table table-striped" id="data">
		<thead>
			<tr>
				<th>No.</th>
				<th>Jurusan</th>
				<th>Mata Pelajaran</th>
				<th>Tanggal</th>
				<th>Jam</th>
				<th>Lama Ujian ( Menit )</th>
				<th>Sesi</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($jadwal as $row)
				<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->kode_jurusan}}</td>
					<td>{{$row->kd_mapel}}</td>
					<td>{{$row->tgl_ujian}}</td>
					<td>{{$row->jam}} s/d {{$row->selesai}}</td>
					<td>{{$row->waktu_ujian}}</td>
					<td>{{$row->sesi}}</td>
					<td>
						<a href="{{URL::to('admin/jadwal/'.$row->id_jadwal)}}" class="btn btn-success">
							<i class="glyphicon glyphicon-list-alt"></i>
							List Jadwal
						</a>
					</td>
					<td>
						<a href="{{URL::to('admin/jadwal/'.$row->id_jadwal.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/jadwal/'.$row->id_jadwal))}}
							{{Form::hidden('_method','DELETE')}}
							<button class="btn btn-danger">
								<i class="glyphicon glyphicon-trash"></i>
								Hapus
							</button>
						{{Form::close()}}
					</td>
				</tr>
			@endforeach
		</tbody>
	</table>
@stop