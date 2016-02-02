@extends('siswa.template')

@section('head')
	<style>
		.nomor{
			margin-bottom: 20px;
			width: 40px;
		}
		.dipilih{
			background: red;
		}
	</style>
@stop

@section('content')
	<div class="row">
		<div class="col-lg-3 col-xs-4 col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<p>Nomor Soal</p>
				</div>

				<div class="panel-body">
					<ul class="list-inline">
						@for($i=1;$i<=50;$i++)
							<li><a href="#" no="{{$i}}" class="btn btn-default nomor">{{$i}}</a></li>
						@endfor
					</ul>
				</div>
			</div>
		</div>

		<div class="col-lg-9">
			<div id="pesan"></div>
			<div id="loading" style="display:none;">Loading....</div>
			<div id="soal"></div>
		</div>
	</div>
@stop

@section('footer')
	<script>
		$(function(){
			$('.nomor').click(function(){
				var no=$(this).attr("no");

				$.ajax({
					url:"{{URL::to('siswa/pilih-soal')}}",
					type:"GET",
					data:"no="+no,
					beforeSend:function(){
						$("#loading").show();
					},
					success:function(html){
						$("#loading").hide();
						$("#soal").html(html);
					}
				});
			});
		})
	</script>
@stop