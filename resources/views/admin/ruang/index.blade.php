@extends('admin.template')

@section('content')
	<legend>Data Ruang Ujian</legend>

	<a href="{{URL::to('admin/ruang/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Ruang
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
				<th>Nama Ruang Ujian</th>
				<th>Kuota</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($ruang as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->nama_ruang}}</td>
					<td>{{$row->kuota}}</td>
					<td>
						<a href="{{URL::to('admin/ruang/'.$row->id_ruang.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/ruang/'.$row->id_ruang))}}
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