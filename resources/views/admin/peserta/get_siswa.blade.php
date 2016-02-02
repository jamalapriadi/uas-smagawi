<table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>NISN</th>
                <th>Nama</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @for($i=1;$i<=20;$i++)
                <tr>
                    <td>{{$i}}</td>
                    <td>7923</td>
                    <td>Jamal Apriadi</td>
                    <td>
                        <div class="col-xs-3">
                            <input type="number" name="no" class="form-control">
                        </div>
                    </td>
                </tr>
            @endfor
        </tbody>
    </table>

    <div class="form-group well">
        <button class="btn btn-primary">
            <i class="glyphicon glyphicon-refresh"></i>
            Tambahkan
        </button>
    </div>