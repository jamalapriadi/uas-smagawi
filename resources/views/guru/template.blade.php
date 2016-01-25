<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Halaman Guru</title>
	{{Html::style('assets/css/spacelab.css')}}
	{{Html::style('assets/css/jquery.dataTables.css')}}
	{{HTML::style('assets/datetimepicker/jquery.datetimepicker.css')}}

	@yield('head')
</head>
<body>
	@include('guru.navbar')

	<div class="container">
		@yield('content')
	</div>

	{{Html::script('assets/js/jquery-1.11.3.min.js')}}
	{{Html::script('assets/js/bootstrap.min.js')}}
	{{Html::script('assets/js/jquery.dataTables.min.js')}}
	{{HTML::script('assets/datetimepicker/build/jquery.datetimepicker.full.js')}}
	<script src="{{URL::asset('assets/js/admin.js')}}"  type="text/javascript"></script>

	@yield('footer')
</body>
</html>