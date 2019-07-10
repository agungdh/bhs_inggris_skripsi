<div class="box-body">

	@php
	$class = $errors->has('unit') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('unit') ? $errors->first('unit') : '';
	@endphp
	<div class="{{$class}}">
		<label for="unit" data-toggle="tooltip" title="{{$message}}">Unit</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::text('unit',null,['class'=> 'form-control','placeholder'=>'Isi Unit', 'id' => 'unit']) !!}
		</div>
	</div>

	@php
	$class = $errors->has('materi') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('materi') ? $errors->first('materi') : '';
	@endphp
	<div class="{{$class}}">
		<label for="materi" data-toggle="tooltip" title="{{$message}}">Materi</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::text('materi',null,['class'=> 'form-control','placeholder'=>'Isi Materi', 'id' => 'materi']) !!}
		</div>
	</div>

	@php
	$class = $errors->has('deskripsi') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('deskripsi') ? $errors->first('deskripsi') : '';
	@endphp
	<div class="{{$class}}">
		<label for="deskripsi" data-toggle="tooltip" title="{{$message}}">Deskripsi</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::textarea('deskripsi',null,['class'=> 'form-control','placeholder'=>'Isi Deskripsi', 'id' => 'deskripsi', 'style' => 'resize: none;', 'rows' => 10]) !!}
		</div>
	</div>
	
	@php
	$class = $errors->has('berkas') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('berkas') ? $errors->first('berkas') : '';
	@endphp
	<div class="{{$class}}">
		<label for="berkas" data-toggle="tooltip" title="{{$message}}">Berkas</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::file('berkas',['class'=> 'form-control','id' => 'berkas']) !!}
		</div>
	</div>

	@php
	$class = $errors->has('jumlah_pertanyaan_ujian') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('jumlah_pertanyaan_ujian') ? $errors->first('jumlah_pertanyaan_ujian') : '';
	@endphp
	<div class="{{$class}}">
		<label for="jumlah_pertanyaan_ujian" data-toggle="tooltip" title="{{$message}}">Jumlah Pertanyaan Ujian</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::text('jumlah_pertanyaan_ujian',null,['class'=> 'form-control','placeholder'=>'Isi Jumlah Pertanyaan Ujian', 'id' => 'jumlah_pertanyaan_ujian']) !!}
		</div>
	</div>

	@php
	$class = $errors->has('jumlah_pertanyaan_mid') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('jumlah_pertanyaan_mid') ? $errors->first('jumlah_pertanyaan_mid') : '';
	@endphp
	<div class="{{$class}}">
		<label for="jumlah_pertanyaan_mid" data-toggle="tooltip" title="{{$message}}">Jumlah Pertanyaan Mid</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::text('jumlah_pertanyaan_mid',null,['class'=> 'form-control','placeholder'=>'Isi Jumlah Pertanyaan Mid', 'id' => 'jumlah_pertanyaan_mid']) !!}
		</div>
	</div>

	@php
	$class = $errors->has('jumlah_pertanyaan_akhir') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('jumlah_pertanyaan_akhir') ? $errors->first('jumlah_pertanyaan_akhir') : '';
	@endphp
	<div class="{{$class}}">
		<label for="jumlah_pertanyaan_akhir" data-toggle="tooltip" title="{{$message}}">Jumlah Pertanyaan Akhir</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::text('jumlah_pertanyaan_akhir',null,['class'=> 'form-control','placeholder'=>'Isi Jumlah Pertanyaan Akhir', 'id' => 'jumlah_pertanyaan_akhir']) !!}
		</div>
	</div>

</div>