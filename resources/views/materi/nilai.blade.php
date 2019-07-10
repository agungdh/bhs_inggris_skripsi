@extends('template.template')

@section('title')
Nilai
@endsection

@section('nav')
@include('materi.nav')
<li><a href="{{ route('materi.nilai', $materi->id) }}"> Nilai</a></li>
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Data Nilai</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <p>{{$materi->unit}} - {{$materi->materi}}</p>
              <table class="table table-bordered table-hover datatable" style="width: 100%">
                <thead>
	                <tr>
                        <th>Nama</th>
	                  <th>Nilai</th>
	                  <th>Proses</th>
	                </tr>
                </thead>
                <tbody>
                	@foreach($nilais as $item)
                	<tr>
                		<td>{{$item->user->nama}}</td>
                        <td>{{$item->nilai}}</td>
                		
                		<td>

			                {!! Form::open(['id' => 'formHapus' . $item->id, 'route' => ['materi.hapusNilai', $item->id], 'method' => 'delete']) !!}

			              		<button type="button" class="btn btn-danger btn-sm" onclick="hapus('{{ $item->id }}')"><i class="glyphicon glyphicon-trash"></i> Hapus</button>

			              	{!! Form::close() !!}
                		</td>
                	</tr>
                	@endforeach
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
	</div>
</div>
@endsection

@section('js')
<script type="text/javascript">
function hapus(id) {
	swal({
	  title: "Yakin Hapus ???",
	  text: "Data yang sudah dihapus tidak dapat dikembalikan lagi !!!",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Hapus",
	}, function(){
	  $("#formHapus" + id).submit();
	});
}
</script>
@endsection