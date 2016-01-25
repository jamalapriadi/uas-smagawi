@extends('admin.template')

@section('content')
	<legend>Data Soal</legend>

	<a href="{{URL::to('admin/soal/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Soal
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
				<th>Mata Pelajaran</th>
				<th>Jurusan</th>
				<th>Waktu Ujian</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($soal as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->kd_mapel}}</td>
					<td>{{$row->kode_jurusan}}</td>
					<td>{{$row->waktu_ujian}}</td>
					<td>
						<a href="{{URL::to('admin/soal/'.$row->id)}}" class="btn btn-success">
							<i class="glyphicon glyphicon-list-alt"></i>
							Detail Soal
						</a>
					</td>
					<td>
						<a href="{{URL::to('admin/soal/'.$row->id.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/soal/'.$row->id))}}
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