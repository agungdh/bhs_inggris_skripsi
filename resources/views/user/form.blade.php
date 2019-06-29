<div class="box-body">

	<div class="col-md-6">
		@php
		$class = $errors->has('id_pegawai') ? 'form-group has-error' : 'form-group';
		$message = $errors->has('id_pegawai') ? $errors->first('id_pegawai') : '';
		@endphp
		<div class="{{$class}}">
			<label for="id_pegawai" data-toggle="tooltip" title="{{$message}}">Pegawai</label>
			<div data-toggle="tooltip" title="{{$message}}">
				{!! Form::select('id_pegawai',$pegawais,null,['class'=> 'form-control select2','placeholder'=>'Pilih Pegawai','id'=>'id_pegawai']) !!}
			</div>
		</div>
	</div>

	<div class="col-md-6">
		@php
		$class = $errors->has('username') ? 'form-group has-error' : 'form-group';
		$message = $errors->has('username') ? $errors->first('username') : '';
		@endphp
		<div class="{{$class}}">
			<label for="username" data-toggle="tooltip" title="{{$message}}">Username</label>
			<div data-toggle="tooltip" title="{{$message}}">
				{!! Form::text('username',null,['class'=> 'form-control', 'placeholder'=>'Isi Username', 'id' => 'username']) !!}
			</div>
		</div>
	</div>

	<div class="col-md-6">
		@php
		$class = $errors->has('password') ? 'form-group has-error' : 'form-group';
		$message = $errors->has('password') ? $errors->first('password') : '';
		@endphp
		<div class="{{$class}}">
			<label for="password" data-toggle="tooltip" title="{{$message}}">Password</label>
			<div data-toggle="tooltip" title="{{$message}}">
				{!! Form::password('password',['class'=> 'form-control','placeholder'=>'Isi Password', 'id' => 'password']) !!}
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		@php
		$class = $errors->has('password') ? 'form-group has-error' : 'form-group';
		$message = $errors->has('password') ? $errors->first('password') : '';
		@endphp
		<div class="{{$class}}">
			<label for="password_confirmation" data-toggle="tooltip" title="{{$message}}">Password Konfirmasi</label>
			<div data-toggle="tooltip" title="{{$message}}">
				{!! Form::password('password_confirmation',['class'=> 'form-control','placeholder'=>'Isi Password Konfirmasi', 'id' => 'password_confirmation']) !!}
			</div>
		</div>
	</div>
	
</div>

@section('js')
<script type="text/javascript">
	{{-- Event --}}
	$("#id_pegawai").change(function() {
		toggleUsername();
	});
</script>

<script type="text/javascript">
	{{-- Auto Start --}}
	$(function() {
		toggleUsername();
	});
</script>

<script type="text/javascript">
	{{-- Function --}}
	function toggleUsername() {
		if ($("#id_pegawai").val() == "")
		{
			$("#username").prop("readonly", false);
		} else {
			$("#username").prop("readonly", true);
		}
	}
</script>
@endsection