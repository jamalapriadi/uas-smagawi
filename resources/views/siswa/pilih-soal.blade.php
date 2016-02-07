<legend>Soal No. {{$soal->soal_ke}}</legend>
	<a class="single_image" href="{{URL::asset('uploads/big/'.$soal->detail->gambar_besar)}}">
		{{Html::image('uploads/small/'.$soal->detail->gambar_kecil,'',array('class'=>'img-responsive','style'=>' max-height:350px;'))}}
	</a>

	<hr>

	<div class="form-group">
		<label for="">Jawaban Anda</label>
		<select name="jawaban" id="jawaban" class="form-control">
			<option value="">--Pilih Jawaban--</option>
			<option value="a" @if($soal->jawaban=='a') selected='selected' @endif>A</option>
			<option value="b" @if($soal->jawaban=='b') selected='selected' @endif>B</option>
			<option value="c" @if($soal->jawaban=='c') selected='selected' @endif>C</option>
			<option value="d" @if($soal->jawaban=='d') selected='selected' @endif>D</option>
		</select>
	</div>
	
	<hr>
	<div class="well">
		<a href="#" no="{{$no}}" class="btn btn-success jawab">
			@if($soal->status==0)
				Jawab
			@else
				Ubah Jawaban
			@endif
		</a>
	</div>
