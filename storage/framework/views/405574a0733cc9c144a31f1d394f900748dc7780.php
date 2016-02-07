<table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>NIS</th>
                                <th>Nama</th>
                                <th>Kelas</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no=0;?>
                            <?php foreach($siswa as $row): ?>
                                <?php $no++;?>
                                <tr>
                                    <td><?php echo e($no); ?></td>
                                    <td><?php echo e($row->nis); ?></td>
                                    <td><?php echo e($row->nama); ?></td>
                                    <td>
                                        <?php if($row->status==1): ?>
                                            <a href="#" class="btn btn-success">
                                                <i class="glyphicon glyphicon-ok-sign"></i>
                                                Sudah Login
                                            </a>
                                        <?php else: ?>
                                            <a href="#" class="btn btn-danger">
                                                <i class="glyphicon glyphicon-remove-sign"></i>
                                                Belum Login
                                            </a>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>    