<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	{{Html::style('assets/css/bootstrap.min.css')}}
	<style>
		body,html{
			margin-top: 10px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="col-lg-8"></div>

		<div class="col-lg-4">
			@yield('content')
		</div>
	</div>
</body>
</html>