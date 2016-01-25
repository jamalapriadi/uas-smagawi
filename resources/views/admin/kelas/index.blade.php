@extends('admin.template')

@section('content')
	<legend>Data Jurusan</legend>

	<a href="{{URL::to('admin/kelas/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Kelas
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
				<th>Kode Kelas</th>
				<th>Kelas</th>
				<th>Jurusan</th>
				<th>Sub Kelas</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($kelas as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->kd_kelas}}</td>
					<td>{{$row->kelas}}</td>
					<td>{{$row->jurusan->nama_jurusan}}</td>
					<td>{{$row->sub_kelas}}</td>
					<td>
						<a href="{{URL::to('admin/kelas/'.$row->kd_kelas.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/kelas/'.$row->kd_kelas))}}
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