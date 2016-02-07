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
                            @foreach($siswa as $row)
                                <?php $no++;?>
                                <tr>
                                    <td>{{$no}}</td>
                                    <td>{{$row->nis}}</td>
                                    <td>{{$row->nama}}</td>
                                    <td>
                                        @if($row->status==1)
                                            <a href="#" class="btn btn-success">
                                                <i class="glyphicon glyphicon-ok-sign"></i>
                                                Sudah Login
                                            </a>
                                        @else
                                            <a href="#" class="btn btn-danger">
                                                <i class="glyphicon glyphicon-remove-sign"></i>
                                                Belum Login
                                            </a>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>    