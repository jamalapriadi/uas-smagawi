@extends('guru.template')

@section('content')
    <legend>Tambah Soal</legend>

    {{Form::open(array('url'=>'guru/update-soal','method'=>'post','files'=>true))}}
        <div class="form-group @if($errors->has('soal')) has-error @endif">
            <label for="">Soal</label>
            {{Html::image('uploads/small/'.$detail->gambar_kecil,'',array('class'=>'img-responsive'))}}
        </div>

        <div class="form-group @if($errors->has('soal')) has-error @endif">
            <input type="hidden" name="kode" value="{{$detail->id}}" class="form-control">
            <input type="file" name="soal" class="form-control" value="">
            {{$errors->first('soal')}}
        </div>

        <div class="form-group @if($errors->has('kunci')) has-error @endif">
            <label for="">Kunci Jawaban</label>
            <select name="kunci" id="kunci" class="form-control">
                <option value="">--Pilih Kunci Jawaban--</option>
                <option value="a" @if($detail->kunci_jawaban=='a') selected='selected' @endif>A</option>
                <option value="b" @if($detail->kunci_jawaban=='b') selected='selected' @endif>B</option>
                <option value="c" @if($detail->kunci_jawaban=='c') selected='selected' @endif>C</option>
                <option value="d" @if($detail->kunci_jawaban=='d') selected='selected' @endif>D</option>
                <option value="e" @if($detail->kunci_jawaban=='e') selected='selected' @endif>E</option>
            </select>
            {{$errors->first('kunci')}}
        </div>

        <div class="form-group well">
            <button class="btn btn-primary">
                <i class="fa fa-save"></i>
                Simpan
            </button>

            <a href="{{URL::to('guru')}}" class="btn btn-default">
                Kembali
            </a>
        </div>
    {{Form::close()}}
@stop