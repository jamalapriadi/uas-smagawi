@extends('admin.template')

@section('content')
	<legend>Data Siswa</legend>

	<a href="{{URL::to('admin/siswa/create')}}" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Siswa
	</a>

	<a href="{{URL::to('admin/import-siswa')}}" class="btn btn-success">
		<i class="glyphicon glyphicon-import"></i>
		Import Siswa
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
				<th>NISN</th>
				<th>Nama</th>
				<th>Kelas</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($siswa as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->nis}}</td>
					<td>{{$row->nama}}</td>
					<td>{{$row->kd_kelas}}</td>
					<td>
						<a href="{{URL::to('admin/siswa/'.$row->nis)}}" class="btn btn-info">
							<i class="glyphicon glyphicon-list"></i>
						</a>
					</td>
					<td>
						<a href="{{URL::to('admin/siswa/'.$row->nis.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/siswa/'.$row->nis))}}
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