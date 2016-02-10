<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laporan</title>
    {{Html::style('assets/css/bootstrap.min.css')}}
</head>
<body>
    <nav class="navbar navbar-default" style="padding-top:5px;padding-bottom:5px;">
        <div class="container-fluid">
            <div class="navbar-header">
                @yield('cetak')
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        @yield('content')
    </div>
</body>
</html>