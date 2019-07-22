<div class="box-body">
	<p>{{$materi->unit}} - {{$materi->materi}}</p>
	@php
	$class = $errors->has('isi_cerita') ? 'form-group has-error' : 'form-group';
	$message = $errors->has('isi_cerita') ? $errors->first('isi_cerita') : '';
	@endphp
	<div class="{{$class}}">
		<label for="isi_cerita" data-toggle="tooltip" title="{{$message}}">Narasi</label>
		<div data-toggle="tooltip" title="{{$message}}">
			{!! Form::textarea('isi_cerita',null,['class'=> 'form-control','placeholder'=>'Isi Narasi', 'id' => 'isi_cerita', 'style' => 'resize: none;', 'rows' => 10]) !!}
		</div>
	</div>
	
</div>