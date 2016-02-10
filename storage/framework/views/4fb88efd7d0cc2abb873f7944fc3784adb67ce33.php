<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Laporan</title>
    <?php echo e(Html::style('assets/css/bootstrap.min.css')); ?>

</head>
<body>
    <nav class="navbar navbar-default" style="padding-top:5px;padding-bottom:5px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <?php echo $__env->yieldContent('cetak'); ?>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <?php echo $__env->yieldContent('content'); ?>
    </div>
</body>
</html>