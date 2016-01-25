@extends('admin.template')

@section('content')
	<legend>Data Mata Pelajaran</legend>

	<a href="{{URL::to('admin/mapel/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Mapel
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
				<th>Kode Mata Pelajaran</th>
				<th>Nama Mata Pelajaran</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($mapel as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->kd_mapel}}</td>
					<td>{{$row->nm_mapel}}</td>
					<td>
						<a href="{{URL::to('admin/mapel/'.$row->kd_mapel.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/mapel/'.$row->kd_mapel))}}
							{{Form::hidden('_method','DELETE')}}
							<button class="btn btn-danger">
								<i class="glyphicon glyphicon-trash"></i>
							</button>
						{{Form::close()}}
					</td>
				</tr>
			@endforeach
		</tbody>
	</table>
@stop