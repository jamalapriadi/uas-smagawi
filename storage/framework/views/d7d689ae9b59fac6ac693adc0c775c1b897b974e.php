<?php $__env->startSection('content'); ?>
    <legend>Profile</legend>

    <?php if(Session::has('pesan')): ?>  
        <div class="alert alert-success">
            <?php echo e(Session::get('pesan')); ?>

        </div>
    <?php endif; ?>

    <?php echo e(Form::open(['url'=>'admin/update-profile','method'=>'post','class'=>'form-horizontal'])); ?>

        <div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
            <label for="" class="col-lg-2 control-label">Nama</label>
            <div class="col-lg-4">
                <input type="hidden" name="id" value="<?php echo e($admin->id); ?>">
                <input type="text" name="nama" value="<?php echo e($admin->name); ?>" class="form-control">
                <?php echo e($errors->first('nama')); ?>

            </div>
        </div>

        <div class="form-group <?php if($errors->has('nama')): ?> has-error <?php endif; ?>">
            <label for="" class="col-lg-2 control-label">Email</label>
            <div class="col-lg-4">
                <input type="email" name="email" value="<?php echo e($admin->email); ?>" class="form-control">
                <?php echo e($errors->first('email')); ?>

            </div>
        </div>

        <div class="form-group well">
            <label for="" class="col-lg-2 control-label"></label>
            <div class="col-lg-4">
                <button class="btn btn-primary">
                    <i class="glyphicon glyphicon-edit"></i>
                    Update Profile
                </button>
            </div>
        </div>
    <?php echo e(Form::close()); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>