@extends('template.template')

@section('title')
Profil
@endsection

@section('nav')
<li><a href="{{ route('main.profil') }}"><i class="fa fa-home"></i> Profil</a></li>
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Profil</h3>
			</div>

			{!! Form::model($profil, ['route' => 'main.saveProfil', 'role' => 'form', 'method' => 'put']) !!}
				<div class="box-body">

				<div class="col-md-6">
					@php
					$class = $errors->has('npp') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('npp') ? '<span class="help-block">' . $errors->first('npp') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="npp">NPP</label>
						{!! Form::text('npp',null,['class'=> 'form-control','placeholder'=>'Isi NPP', 'id' => 'npp', 'readonly' => true]) !!}
						{!! $message !!}
					</div>
				</div>

				<div class="col-md-6">
					@php
					$class = $errors->has('nama') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('nama') ? '<span class="help-block">' . $errors->first('nama') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="nama">Nama</label>
						{!! Form::text('nama',null,['class'=> 'form-control','placeholder'=>'Isi Nama', 'id' => 'nama', 'readonly' => true]) !!}
						{!! $message !!}
					</div>
				</div>
				
				<div class="col-md-6">
					@php
					$class = $errors->has('tipe') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('tipe') ? '<span class="help-block">' . $errors->first('tipe') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="tipe">Tipe</label>
						{!! Form::text('tipe',null,['class'=> 'form-control','placeholder'=>'Isi Tipe', 'id' => 'tipe', 'readonly' => true]) !!}
						{!! $message !!}
					</div>
				</div>
				
				<div class="col-md-6">
					@php
					$class = $errors->has('level') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('level') ? '<span class="help-block">' . $errors->first('level') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="level">Level</label>
						{!! Form::text('level',null,['class'=> 'form-control','placeholder'=>'Isi Level', 'id' => 'level', 'readonly' => true]) !!}
						{!! $message !!}
					</div>
				</div>
				
				<div class="col-md-6">
					@php
					$class = $errors->has('password') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('password') ? '<span class="help-block">' . $errors->first('password') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="password">Password</label>
						{!! Form::password('password',['class'=> 'form-control','placeholder'=>'Isi Password', 'id' => 'password']) !!}
						{!! $message !!}
					</div>
				</div>
				
				<div class="col-md-6">
					@php
					$class = $errors->has('password') ? 'form-group has-error' : 'form-group';
					$message = $errors->has('password') ? '<span class="help-block">' . $errors->first('password') . '</span>' : '';
					@endphp
					<div class="{{$class}}">
						<label for="password_confirmation">Password Konfirmasi</label>
						{!! Form::password('password_confirmation',['class'=> 'form-control','placeholder'=>'Isi Password Konfirmasi', 'id' => 'password_confirmation']) !!}
						{!! $message !!}
					</div>
				</div>
				
			</div>

				<div class="box-footer">
					<button type="submit" class="btn btn-success">Simpan</button>
					<a href="{{route('main.profil')}}" class="btn btn-info">Batal</a>
				</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endsection