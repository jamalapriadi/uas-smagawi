@extends('admin.template')

@section('content')
	<legend>Data Pengawas</legend>

	<a href="{{URL::to('admin/pengawas/create')}}" class="btn btn-primary">
		<i class="glyphicon glyphicon-plus"></i>
		Tambah Pengawas
	</a>

	<hr>

	@if(Session::has('pesan'))
		{{Session::get('pesan')}}
	@endif

	<table class="table" id="data">
		<thead>
			<tr>
				<th>No.</th>
				<th>NIP</th>
				<th>Nama</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $no=0;?>
			@foreach($pengawas as $row)
				<?php $no++;?>
				<tr>
					<td>{{$no}}</td>
					<td>{{$row->nip}}</td>
					<td>{{$row->nama}}</td>
					<td>
						<a href="{{URL::to('admin/pengawas/'.$row->nip.'/edit')}}" class="btn btn-primary">
							<i class="glyphicon glyphicon-edit"></i>
							Edit
						</a>
					</td>
					<td>
						{{Form::open(array('url'=>'admin/pengawas/'.$row->nip))}}
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