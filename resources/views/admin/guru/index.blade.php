@extends('admin.template')

@section('content')
	<legend>Data Guru</legend>

	<a href="{{URL::to('admin/guru/create')}}" class="btn btn-primary">
		<i class="fa fa-plus"></i>
		Tambah Guru
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
				<th>NIP</th>
				<th>Nama</th>
				<th>Mata Pelajaran</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($guru as $row)
			<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->nip}}</td>
					<td>{{$row->nama}}</td>
					<td>{{$row->mapel->nm_mapel}}</td>
					<td>
						<a href="{{URL::to('admin/guru/'.$row->nip.'/edit')}}" class="btn btn-warning">
							<i class="glyphicon glyphicon-edit"></i>
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/guru/'.$row->nip))}}
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