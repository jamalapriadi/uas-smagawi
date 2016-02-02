<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Halaman Pengawas</title>
	{{Html::style('assets/css/bootstrap.min.css')}}
	{{Html::style('assets/css/jquery.dataTables.css')}}
	{{HTML::style('assets/datetimepicker/jquery.datetimepicker.css')}}
	{{Html::style('assets/css/smagawi.css')}}

	@yield('head')
</head>
<body>
	<header>
		<div class="container">
			@include('pengawas.navbar')
		</div>
	</header>
	
	<div id="main-admin">
		<br><br>
		<div class="container">
			@yield('content')
		</div>
	</div>

	<footer>
        <div class="container">
            <div class="row">
            	<div class="col-lg-6">
            		<h3 class="footer">Unggul, Jaya, Maju Terus</h3>
            	</div>

            	<div class="col-lg-6">
            		<p class="footer">
            			Jln. Prof. Moh. Yamin Slawi - Kab. Tegal <br>
            			Email : sman3slawi.yahoo.co.id <br>
            			Website : sman3slawi.sch.id <br>
            			Telp : ( 0283 ) 491152
            		</p>
            	</div>
            </div>
        </div>
    </footer>

	{{Html::script('assets/js/jquery-1.11.3.min.js')}}
	{{Html::script('assets/js/bootstrap.min.js')}}
	{{Html::script('assets/js/jquery.dataTables.min.js')}}
	{{HTML::script('assets/datetimepicker/build/jquery.datetimepicker.full.js')}}
	<script src="{{URL::asset('assets/js/admin.js')}}"  type="text/javascript"></script>

	@yield('footer')
</body>
</html>