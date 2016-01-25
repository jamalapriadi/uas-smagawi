@extends('admin.template')

@section('content')
	<legend>Data Jurusan</legend>

	<a href="{{URL::to('admin/jurusan/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Jurusan
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
				<th>Kode Jurusan</th>
				<th>Nama Jurusan</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($jurusan as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->kode_jurusan}}</td>
					<td>{{$row->nama_jurusan}}</td>
					<td>
						<a href="{{URL::to('admin/jurusan/'.$row->kode_jurusan.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/jurusan/'.$row->kode_jurusan))}}
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