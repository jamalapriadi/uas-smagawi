<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Siswa;
use App\Models\Soal;
use App\Models\Detail;

use PDF;

class LapController extends Controller{
    public function siswa(){
        return View('admin.laporan.siswa');
    }

    public function preview_cetak_siswa(){
        $siswa=Siswa::all();

        return View('admin.laporan.preview_siswa')
            ->with('siswa',$siswa);
    }

    public function export_siswa_pdf(){
        $data['siswa'] = Siswa::all();
        $pdf = PDF::loadView('admin.laporan.siswa_pdf', $data);
        return $pdf->stream();
    }

    public function export_siswa(){
        $siswa=Siswa::all();

        Excel::create('Data Siswa',function($excel) use ($siswa){
            //set properties
            $excel->setTitle('Data Siswa')
                ->setCreator('Jamal Apriadi, S.Kom');

            $excel->sheet('Data Siswa',function($sheet) use ($siswa){
                $row=1;
                $sheet->row($row,array(
                        'NISN',
                        'Nama',
                        'Tempat, Tanggal Lahir',
                        'No. Peserta Ujian'
                    )
                );

                foreach($siswa as $s){
                    $sheet->row(++$row,array(
                        $s->nis,
                        $s->nama,
                        $s->tmp_lahir.' / '.$s->tgl_lahir,
                        $s->no_peserta
                    ));
                }
            });
        })->export('xls');
    }

    public function nilai(){
        return View('admin.laporan.nilai');
    }

    public function preview_nilai(){
        $siswa=Siswa::paginate(30);
        return View('admin.laporan.preview_nilai')
            ->with('siswa',$siswa);
    }

    public function detail_nilai($id){
        $siswa=Siswa::find($id);
        $soal=Detail::all();

        return View('admin.laporan.detail_nilai')
            ->with('siswa',$siswa)
            ->with('soal',$soal);
    }
}