<?php $__env->startSection('content'); ?>
    <blockquote>
        <h3>Selamat Datang di Halaman Administrator</h3>
    </blockquote>

    <div class="row">
        <div class="col-lg-8">
            
        </div>

        <div class="col-lg-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <p>User</p>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>