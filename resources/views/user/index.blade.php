@extends('template.template')

@section('title')
@include('user.title')
@endsection

@section('nav')
@include('user.nav')
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Data User</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<a class="btn btn-success btn-sm" href="{{route('user.create')}}">
                  <i class="glyphicon glyphicon-plus"></i> Tambah
                </a><br><br>
              <table class="table table-bordered table-hover datatable" style="width: 100%">
                <thead>
	                <tr>
	                  <th>Username / NPP</th>
                    <th>Nama</th>
                    <th>Tipe</th>
                    <th>Level</th>
	                  <th>Proses</th>
	                </tr>
                </thead>
                <tbody>
                	@foreach($users as $item)
                	<tr>
                		<td>{{$item->pegawai ? $item->pegawai->npp : $item->username}}</td>
                    <td>{{$item->pegawai ? $item->pegawai->nama : $item->username}}</td>
                    @php
                    if ($item->pegawai) {
                          switch ($item->pegawai->tipe) {
                              case 'pw':
                                  $tipe = 'Pegawai';
                                  break;
                              case 'pg':
                                  $tipe = 'Pengemudi';
                                  break;
                              case 'pj':
                                  $tipe = 'Petugas Jaga';
                                  break;
                              case 'fu':
                                  $tipe = 'Fungsi Umum';
                                  break;
                              default:
                                  $tipe = '#N/A';
                                  break;
                          }
                      } else {
                        $tipe = $item->username;
                      }
                    switch ($item->level) {
                      case 'a':
                        $level = 'Admin';
                        break;
                      case 'pw':
                        $level = 'Pegawai';
                        break;
                      case 'pg':
                        $level = 'Pengemudi';
                        break;
                      case 'pj':
                        $level = 'Petugas Jaga';
                        break;
                      case 'fu':
                        $level = 'Fungsi Umum';
                        break;
                      default:
                        $level = '#N/A';
                        break;
                    }
                    @endphp

                    <td>{{$tipe}}</td>
                    <td>{{$level}}</td>
                		
                		<td>

			                {!! Form::open(['id' => 'formHapus' . $item->id, 'route' => ['user.destroy', $item->id], 'method' => 'delete']) !!}

	                			<a class="btn btn-primary btn-sm" href="{{route('user.edit', $item->id)}}">
				                  <i class="glyphicon glyphicon-pencil"></i> Edit
				                </a>

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

function sync(urlString) {
  swal({
    title: "Yakin Sync ???",
    text: "Data yang sudah disinkron tidak dapat dikembalikan lagi !!!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#70BA17",
    confirmButtonText: "Sync",
  }, function(){
    window.location = urlString;
  });
}
</script>
@endsection