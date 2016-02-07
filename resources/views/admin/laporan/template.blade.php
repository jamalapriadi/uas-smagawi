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
                <a class="btn btn-primary" href="#">
                    <i class="glyphicon glyphicon-export"></i>
                    Export PDF
                </a>

                <a class="btn btn-success" href="#">
                    <i class="glyphicon glyphicon-export"></i>
                    Export Excel
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        @yield('content')
    </div>
</body>
</html>