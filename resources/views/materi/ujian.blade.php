@extends('template.template')

@section('title')
Ujian
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="box box-primary">
            <div class="box-body">
                {!! Form::open(['route' => ['materi.simpanUjian', $materi->id], 'role' => 'form']) !!}

                @php($i = 1)
                @foreach($soals as $soal)
                    <p>{{$i}}. {{$soal->pertanyaan}}</p>

                    <ol type="a">
                        <li><input type="radio" name="soal[{{$soal->id}}]" value="a">{{$soal->jawaban_a}}</li>
                        <li><input type="radio" name="soal[{{$soal->id}}]" value="b">{{$soal->jawaban_b}}</li>
                        <li><input type="radio" name="soal[{{$soal->id}}]" value="c">{{$soal->jawaban_c}}</li>
                        <li><input type="radio" name="soal[{{$soal->id}}]" value="d">{{$soal->jawaban_d}}</li>
                        <li><input type="radio" name="soal[{{$soal->id}}]" value="e">{{$soal->jawaban_e}}</li>
                    </ol>

                    @php($i++)
                @endforeach

                <button type="button" onclick="cekSubmit()">Submit</button>

                {!! Form::close() !!}
            </div>
        </div>
	</div>
</div>
@endsection

@section('js')
<script type="text/javascript">
    function cekSubmit() {
        var data = $("form").serializeArray();

        if (data.length < 16) {
            swal('Peringatan', `Masih ada ${16 - data.length} soal yang belum dijawab`, 'error');
        } else {
            swal({
              title: "Konfirmasi",
              text: "Yakin submit jawaban ?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Hapus",
            }, function(){
              $("form").submit();
            });
        }
    }
</script>
@endsection