<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Siswa;
use App\Models\Soal;
use App\Models\Detail;
use App\Models\Kelas;
use App\Models\Mapel;
use App\Models\Ruang;
use App\Models\Peserta;
use App\Models\Guru;
use App\Models\Jadwal;
use App\Models\Djadwal;

use PDF,DB;

class LapController extends Controller{
    public function siswa(){
        $kelas=Kelas::all();

        return View('admin.laporan.siswa')
            ->with('kelas',$kelas);
    }

    public function preview_siswa(Request $request){
        $kelas=$request->input('kelas');

        $siswa=Siswa::where('kd_kelas',$kelas)->get();

        return View('admin.laporan.preview_siswa')
            ->with('siswa',$siswa)
            ->with('kelas',$kelas);
    }

    public function cetak_siswa(Request $request){
        $type=$request->input('type');
        $kelas=$request->input('kelas');

        $siswa=Siswa::where('kd_kelas',$kelas)->get();

        switch ($type) {
            case 'pdf':
                    $data['siswa'] = Siswa::where('kd_kelas',$kelas)->get();
                    $data['kelas']=$kelas;
                    $pdf = PDF::loadView('admin.laporan.siswa_pdf', $data)->setOrientation('landscape');
                    return $pdf->stream();
                break;

            case 'excel':
                    Excel::create('Data Siswa',function($excel) use ($siswa){
                    //set properties
                    $excel->setTitle('Data Siswa')
                        ->setCreator('Jamal Apriadi, S.Kom');

                    $excel->sheet('Data Siswa',function($sheet) use ($siswa){
                        $row=1;
                        $sheet->row($row,array(
                                'No.',
                                'NISN',
                                'No. Peserta',
                                'Nama',
                                'JK',
                                'Tempat, Tanggal Lahir',
                                'NIK',
                                'Agama',
                                'Alamat',
                                'Nama Ayah',
                                'Nama Ibu',
                            )
                        );

                        foreach($siswa as $s){
                            $sheet->row(++$row,array(
                                $s->nis,
                                $s->no_peserta,
                                $s->nama,
                                $s->jk,
                                $s->tmp_lahir.','.$s->tgl_lahir,
                                $s->nik,
                                $s->agama,
                                $s->alamat,
                                $s->nm_ayah,
                                $s->nm_ibu,
                            ));
                        }
                    });
                })->export('xls');
                break;
            
            default:
                # code...
                break;
        }
    }

    public function guru(){
        $guru=Guru::all();

        return View('admin.laporan.guru')
            ->with('guru',$guru);
    }

    public function cetak_guru(Request $request){
        $type=$request->input('type');
        $guru=Guru::all();
        switch ($type) {
            case 'pdf':
                    $data['guru'] = Guru::all();
                    $pdf = PDF::loadView('admin.laporan.cetak_guru', $data)->setOrientation('landscape');
                    return $pdf->stream();
                break;

            case 'excel':
                    Excel::create('Data Guru',function($excel) use ($guru){
                        //set properties
                        $excel->setTitle('Data Guru')
                            ->setCreator('Jamal Apriadi, S.Kom');

                        $excel->sheet('Laporan Nilai Siswa',function($sheet) use ($guru){
                            $row=1;
                            $sheet->row($row,array(
                                    'No.',
                                    'NIP',
                                    'Nama',
                                    'Mata Pelajaran'
                                )
                            );

                            foreach($guru as $s){
                                $sheet->row(++$row,array(
                                    $s->nip,
                                    $s->nama,
                                    $s->mapel->nm_mapel
                                ));
                            }
                        });
                    })->export('xls');
                break;
            
            default:
                # code...
                break;
        }
    }

    public function nilai(){
        $kelas=Kelas::all();
        $mapel=Mapel::all();

        return View('admin.laporan.nilai')
            ->with('kelas',$kelas)
            ->with('mapel',$mapel);
    }

    public function preview_nilai(Request $request){
        $kelas=$request->input('kelas');
        $mapel=$request->input('mapel');

        $siswa=Siswa::where('kd_kelas',$kelas)->get();

        return View('admin.laporan.preview_nilai')
            ->with('siswa',$siswa)
            ->with('kelas',$kelas)
            ->with('mapel',$mapel);
    }

    public function cetak_nilai(Request $request){
        $type=$request->input('type');
        $kelas=$request->input('kelas');
        $mapel=$request->input('mapel');

        $siswa=Siswa::where('kd_kelas',$kelas)->get();

        switch ($type) {
            case 'pdf':
                    $data['kelas']=$kelas;
                    $data['mapel']=$mapel;
                    $data['siswa']=Siswa::where('kd_kelas',$kelas)->get();

                    $pdf = PDF::loadView('admin.laporan.cetak-nilai', $data);
                    return $pdf->stream();
                break;

            case 'excel':
                    Excel::create('Nilai Siswa',function($excel) use ($siswa,$mapel,$kelas){
                    //set properties
                    $excel->setTitle('Data Siswa')
                        ->setCreator('Jamal Apriadi, S.Kom');

                    $excel->sheet('Laporan Nilai Siswa',function($sheet) use ($siswa,$mapel,$kelas){
                        $row=1;
                        $sheet->row($row,array(
                                'NISN',
                                'No. Peserta',
                                'Nama',
                                'Benar',
                                'Salah',
                                'Nilai'
                            )
                        );

                        foreach($siswa as $s){
                            $benar=DB::table('nilai_siswa')
                                    ->where('kd_mapel',$mapel)
                                    ->where('kd_kelas',$kelas)
                                    ->where('nis',$s->nis)
                                    ->where('benar','Y')
                                    ->count();

                            $salah=DB::table('nilai_siswa')
                                    ->where('kd_mapel',$mapel)
                                    ->where('kd_kelas',$kelas)
                                    ->where('nis',$s->nis)
                                    ->where('benar','N')
                                    ->count();

                            $sheet->row(++$row,array(
                                $s->nis,
                                $s->no_peserta,
                                $s->nama,
                                $benar,
                                $salah,
                                $benar-$salah
                            ));
                        }
                    });
                })->export('xls');

                break;
            
            default:
                # code...
                break;
        }
    }

    public function detail_nilai($id){
        $siswa=Siswa::find($id);
        $soal=Detail::all();

        return View('admin.laporan.detail_nilai')
            ->with('siswa',$siswa)
            ->with('soal',$soal);
    }

    public function peserta(){
        $ruang=Ruang::all();

        return View('admin.laporan.peserta')
            ->with('ruang',$ruang);
    }

    public function preview_peserta(Request $request){
        $idruang=$request->input('ruang');

        $ruang=Ruang::find($idruang);

        $peserta=Peserta::where('id_ruang',$idruang)->get();

        return View('admin.laporan.preview_peserta')
            ->with('peserta',$peserta)
            ->with('ruang',$ruang);
    }

    public function cetak_peserta(Request $request){
        $type=$request->input('type');
        $idruang=$request->input('ruang');

        $ruang=Ruang::find($idruang);

        $peserta=Peserta::where('id_ruang',$idruang)->get();

        switch ($type) {
            case 'pdf':
                    $data['ruang']=Ruang::find($idruang);
                    $data['peserta']=Peserta::where('id_ruang',$idruang)->get();

                    $pdf = PDF::loadView('admin.laporan.cetak-peserta', $data);
                    return $pdf->stream();
                break;

            case 'excel':
                    Excel::create('Data Peserta',function($excel) use ($ruang,$peserta){
                    //set properties
                    $excel->setTitle('Data Peserta')
                        ->setCreator('Jamal Apriadi, S.Kom');

                    $excel->sheet('Laporan Nilai Siswa',function($sheet) use ($ruang,$peserta){
                        $row=1;
                        $sheet->row($row,array(
                                'NISN',
                                'No. Peserta',
                                'Nama',
                                'Kelas',
                                'Password'
                            )
                        );

                        foreach($peserta as $s){
                            $sheet->row(++$row,array(
                                $s->nis,
                                $s->siswa->no_peserta,
                                $s->siswa->nama,
                                $s->siswa->kd_kelas,
                                $s->siswa->password_asli
                            ));
                        }
                    });
                })->export('xls');
                break;
            
            default:
                # code...
                break;
        }
    }

    public function jadwal(){
        $jadwal=Jadwal::all();

        return View('admin.laporan.jadwal')
            ->with('jadwal',$jadwal);
    }

    public function cetak_jadwal(Request $request){
        $type=$request->input('type');

        $jadwal=Jadwal::all();

        switch ($type) {
            case 'pdf':
                    $data['jadwal']=Jadwal::all();

                    $pdf = PDF::loadView('admin.laporan.cetak-jadwal', $data);
                    return $pdf->stream();
                break;
            case 'excel':
                    Excel::create('Data jadwal',function($excel) use ($jadwal){
                    //set properties
                    $excel->setTitle('Data jadwal')
                        ->setCreator('Jamal Apriadi, S.Kom');

                    $excel->sheet('Data Jadwal',function($sheet) use ($jadwal){
                        $row=1;
                        $sheet->row($row,array(
                                'Tanggal',
                                'Mata Pelajaran',
                                'Jam'
                            )
                        );

                        foreach($jadwal as $s){
                            $sheet->row(++$row,array(
                                date('d-m-Y',strtotime($s->tgl_ujian)),
                                $s->kd_mapel,
                                $s->jam.' s/d '.$s->selesai
                            ));
                        }
                    });
                })->export('xls');
                break;
            
            default:
                # code...
                break;
        }
    }

    public function kartu_peserta(){
        $kelas=Kelas::all();
        return View('admin.laporan.kartu_peserta')
            ->with('kelas',$kelas);
    }

    function preview_kartu_peserta(Request $request){
        $kelas=$request->input('kelas');

        if($kelas=='semua'){
            $siswa=Siswa::all();
        }else{
            $siswa=Siswa::where('kd_kelas',$kelas)->get();
        }

        return View('admin.laporan.preview_kartu_peserta')
            ->with('siswa',$siswa)
            ->with('kelas',$kelas);
    }

    function cetak_kartu_peserta(Request $request){
        $type=$request->input('type');
        $kelas=$data['kelas']=$request->input('kelas');

        if($kelas=='semua'){
            $data['siswa']=Siswa::all();
        }else{
            $data['siswa']=Siswa::where('kd_kelas',$kelas)->get();
        }

        $pdf = PDF::loadView('admin.laporan.cetak-kartu-peserta', $data)->setPaper('f4');
        return $pdf->stream();
    }
}