<nav class="navbar navbar-inverse" style="border-radius:0 0 0 0;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<?php echo e(URL::to('admin')); ?>">Beranda <span class="sr-only">(current)</span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Master <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<?php echo e(URL::to('admin/siswa')); ?>">Siswa</a></li>
            <li><a href="<?php echo e(URL::to('admin/guru')); ?>">Guru</a></li>
            <li><a href="<?php echo e(URL::to('admin/ruang')); ?>">Ruang Ujian</a></li>
            <li class="divider"></li>
            <li><a href="<?php echo e(URL::to('admin/mapel')); ?>">Mata Pelajaran</a></li>
            <li><a href="<?php echo e(URL::to('admin/kelas')); ?>">Kelas</a></li>
            <li><a href="<?php echo e(URL::to('admin/jurusan')); ?>">Jurusan</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Soal <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<?php echo e(URL::to('admin/soal')); ?>">Data Soal</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Jadwal <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<?php echo e(URL::to('admin/jadwal')); ?>">Data Jadwal</a></li>
            <li><a href="<?php echo e(URL::to('admin/pengawas')); ?>">Data Pengawas</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<?php echo e(URL::to('login/logout')); ?>">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>