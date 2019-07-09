@extends('template.template')

@section('title')
Ujian
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <p>Siswa Waktu <span id="textSisaWaktu"></span></p>
            </div>

            <div class="box-body">
                {!! Form::open(['route' => ['materi.simpanUjian', $materi->id], 'role' => 'form']) !!}

                @php
                $i = 1;
                @endphp
                @foreach($soals as $soal)

                    @php
                    $pertanyaans = [];

                    $pertanyaans[0]['id_soal'] = $soal->id;
                    $pertanyaans[0]['value'] = 'a';
                    $pertanyaans[0]['jawaban'] = $soal->jawaban_a;

                    $pertanyaans[1]['id_soal'] = $soal->id;
                    $pertanyaans[1]['value'] = 'b';
                    $pertanyaans[1]['jawaban'] = $soal->jawaban_b;

                    $pertanyaans[2]['id_soal'] = $soal->id;
                    $pertanyaans[2]['value'] = 'c';
                    $pertanyaans[2]['jawaban'] = $soal->jawaban_c;

                    $pertanyaans[3]['id_soal'] = $soal->id;
                    $pertanyaans[3]['value'] = 'd';
                    $pertanyaans[3]['jawaban'] = $soal->jawaban_d;

                    $pertanyaans[4]['id_soal'] = $soal->id;
                    $pertanyaans[4]['value'] = 'e';
                    $pertanyaans[4]['jawaban'] = $soal->jawaban_e;

                    shuffle($pertanyaans);
                    @endphp

                    <p>{{$i}}. {{$soal->pertanyaan}}</p>

                    <ol type="a">
                        @foreach($pertanyaans as $pertanyaan)
                        <li><input type="radio" name="soal[{{$pertanyaan['id_soal']}}]" value="{{$pertanyaan['value']}}">{{$pertanyaan['jawaban']}}</li>
                        @endforeach
                    </ol>

                    @php
                    $i++;
                    @endphp
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

    var countDownDate = new Date().addHours(2).getTime();
    var x = setInterval(function() {
    var now = new Date().getTime();

    var distance = countDownDate - now;

    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    siswaWaktu = `${hours} Jam ${minutes} Menit ${seconds} Detik`
    $("#textSisaWaktu").text(siswaWaktu);

    if (distance < 0) {
        clearInterval(x);
        $("form").submit();
    }
    }, 1000);
</script>
@endsection