<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<?php echo e(Html::style('assets/css/bootstrap.min.css')); ?>

	<?php echo e(Html::style('assets/css/smagawi.css')); ?>

</head>
<body>
	<header>
		<div class="container">
			<?php echo e(Html::image('assets/img/logo.png','',array('class'=>'logo'))); ?>

			<div class="logo-caption">
				<p class="caption-besar">SMA NEGERI 3 SLAWI</p>
			</div>
		</div>
	</header>

	<br><br>

	<div id="main">
		<div class="container">
			<div class="col-lg-8"></div>

			<div class="col-lg-4">
				<?php echo $__env->yieldContent('content'); ?>
			</div>
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
</body>
</html>