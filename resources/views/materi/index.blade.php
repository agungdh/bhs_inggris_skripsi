@extends('template.template')

@section('title')
Materi
@endsection

@section('nav')
@include('materi.nav')
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Data Materi</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                @if(ADHhelper::getUserData()->level == 'a')
            	<a class="btn btn-success btn-sm" href="{{route('materi.create')}}">
                  <i class="glyphicon glyphicon-plus"></i> Tambah
                </a><br><br>
                @endif
              <table class="table table-bordered table-hover datatable" style="width: 100%">
                <thead>
	                <tr>
	                  <th>Unit</th>
                    <th>Materi</th>
                    <th>Deskripsi</th>
                    @if(ADHhelper::getUserData()->level == 's')
                    <th>Nilai</th>
                    @endif
	                  <th>Proses</th>
	                </tr>
                </thead>
                <tbody>
                	@foreach($materis as $item)

                    @php
                        $nilai = DB::table('ujian')->where([
                            'id_user' => session('userID'),
                            'id_materi' => $item->id,
                        ])->first();
                    @endphp

                	<tr>
                		<td>{{$item->unit}}</td>
                        <td>{{$item->materi}}</td>
                        <td>{{$item->deskripsi}}</td>
                        @if(ADHhelper::getUserData()->level == 's')
                        <td>{{$nilai ? $nilai->nilai : '-'}}</td>
                        @endif
                		
                		<td>

			                {!! Form::open(['id' => 'formHapus' . $item->id, 'route' => ['materi.destroy', $item->id], 'method' => 'delete']) !!}

                                <a target="_blank" class="btn btn-default btn-sm" href="{{route('materi.berkas', $item->id)}}">
				                  <i class="glyphicon glyphicon-file"></i> Berkas
				                </a>

                                @if(ADHhelper::getUserData()->level == 'a')
                                <a class="btn btn-default btn-sm" href="{{route('soal.index', $item->id)}}">
                                  <i class="glyphicon glyphicon-question-sign"></i> Soal
                                </a>

                                <a class="btn btn-default btn-sm" href="{{route('materi.nilai', $item->id)}}">
                                  <i class="glyphicon glyphicon-question-sign"></i> Nilai
                                </a>

                                <a class="btn btn-primary btn-sm" href="{{route('materi.edit', $item->id)}}">
                                  <i class="glyphicon glyphicon-pencil"></i> Edit
                                </a>

			              		<button type="button" class="btn btn-danger btn-sm" onclick="hapus('{{ $item->id }}')"><i class="glyphicon glyphicon-trash"></i> Hapus</button>
                                @else
                                <a class="btn btn-default btn-sm" href="{{route('materi.ujian', $item->id)}}">
                                  <i class="glyphicon glyphicon-question-sign"></i> Ujian
                                </a>
                                @endif

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

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Data Ujian</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered table-hover datatable" style="width: 100%">
                <thead>
                    <tr>
                      <th>Ujian</th>
                        @if(ADHhelper::getUserData()->level == 's')
                        <th>Nilai</th>
                        @endif
                      <th>Proses</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mid</td>
                        @if(ADHhelper::getUserData()->level == 's')
                        @php
                            $nilai = DB::table('mid')->where([
                                'id_user' => session('userID'),
                            ])->first();
                        @endphp
                        <td>{{$nilai ? $nilai->nilai : '-'}}</td>
                        <td>
                            <a class="btn btn-default btn-sm" href="{{route('materi.mid')}}">
                              <i class="glyphicon glyphicon-question-sign"></i> Ujian Mid
                            </a>
                        </td>
                        @else
                        <td>
                            <a class="btn btn-default btn-sm" href="{{route('materi.nilaiMid')}}">
                              <i class="glyphicon glyphicon-question-sign"></i> Nilai
                            </a>
                        </td>
                        @endif
                    </tr>
                    <tr>
                        <td>Akhir</td>
                        @if(ADHhelper::getUserData()->level == 's')
                        @php
                            $nilai = DB::table('akhir')->where([
                                'id_user' => session('userID'),
                            ])->first();
                        @endphp
                        <td>{{$nilai ? $nilai->nilai : '-'}}</td>
                        <td>
                            <a class="btn btn-default btn-sm" href="{{route('materi.akhir')}}">
                              <i class="glyphicon glyphicon-question-sign"></i> Ujian Akhir
                            </a>
                        </td>
                        @else
                        <td>
                            <a class="btn btn-default btn-sm" href="{{route('materi.nilaiAkhir')}}">
                              <i class="glyphicon glyphicon-question-sign"></i> Nilai
                            </a>
                        </td>
                        @endif
                    </tr>
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