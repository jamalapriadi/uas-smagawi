@extends('siswa.template')

@section('head')
	{{Html::style('assets/fancybox/jquery.fancybox.css')}}
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
					<div class="alert alert-warning">
						<h4>Sisa Waktu :  <span class="timer" data-seconds-left={{$detik}}></span></h4>
					</div>

					<ul class="list-inline">
						@foreach($detail as $row)
						<li><a href="#" no="{{$row->id}}" class="btn @if($row->status=='0') btn-default @else btn-success @endif nomor">{{$row->soal_ke}}</a></li>
						@endforeach
					</ul>
				</div>

				<div class="panel-footer">
					<a href="{{URL::to('siswa/selesai/'.$jadwal.'/'.$detailjadwal)}}" class="btn btn-block btn-warning">
						Selesai
					</a>
				</div>
			</div>
		</div>

		<div class="col-lg-9">
			<div id="pesan">
				@if(Session::has('pesan'))
					<div class="alert alert-info">{{Session::get('pesan')}}</div>
				@endif
			</div>
			<div id="loading" style="display:none;">Loading....</div>
			<div id="soal"></div>
		</div>
	</div>
@stop

@section('footer')
	{{Html::script('assets/fancybox/jquery.fancybox.js')}}

	<script>
		$(function(){
			$("a.single_image").fancybox();

			$('.timer').startTimer({
                onComplete: function(element){
                  element.addClass('is-complete');
                  window.location.href="{{URL::to('siswa/waktu-habis')}}";
                }
            });

			$('.nomor').click(function(){
				$("#pesan").html('');
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

			$( document ).on( "click", "a.jawab", function() {
				var soal=$(this).attr("no");
				var jawaban=$("#jawaban").val();

				$.ajax({
					url:"{{URL::to('siswa/jawab-soal')}}",
					type:"POST",
					data:"soal="+soal+"&jawaban="+jawaban,
					cache:false,
					success:function(){
						location.reload();
					},
					error:function(){
						alert("Jawaban gagal disimpan");
					}
				})
			});
		})
	</script>
@stop