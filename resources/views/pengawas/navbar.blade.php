<nav class="navbar" style="border-radius:0 0 0 0;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      {{Html::image('assets/img/logo.png','',array('class'=>'logo'))}}
      <div class="logo-caption">
        <p class="caption-besar">SMA NEGERI 3 SLAWI</p>
      </div>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <br>
      <ul class="nav navbar-nav navbar-right">
         
        <li><a href="{{URL::to('login/logout-pengawas')}}">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>