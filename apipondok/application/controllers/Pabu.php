<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pabu extends CI_Controller {


	function __construct(){
		parent::__construct();

        $this->load->model('Tampil_m');


	}

    public function login()
    {
        $usr = trim($this->input->post("usr"));
        $psw = md5(trim($this->input->post("psw")));
        $dtlogin = $this->Tampil_m->cek_login($usr, $psw);
        if (is_array($dtlogin)) {
            foreach ($dtlogin as $dl) {
                $full_name = $dl->full_name;
                $status = $dl->is_aktif;
                $lvl_usr = $dl->id_user_level;
                $nik = $dl->nik;
                $id = $dl->id_alumni;
                $tlahir = $dl->tmp_lahir;
                $tglahir= $dl->tgl_lahir;
                $jk = $dl->jenis_kelamin;
                $st = $dl->status;
                $ng = $dl->negara;
                $alm = $dl->alamat;
                
            }
            
            echo "1|$full_name|$status|$lvl_usr|$nik|$id|$tlahir|$tglahir|$jk|$st|$ng|$alm";
        } else {
            echo "0|";
        }
    }

    public function ceklogin()
    {
        $usr = trim($this->input->post("usr"));
        $dtlogin = $this->Tampil_m->ceksesi($usr);
        if (count($dtlogin) > 0) {
            echo "1";
        } else {
            echo "0";
        }
    }
    public function cekprofil()
    {
        $usr = trim($this->input->get("usr"));
        $dtlogin = $this->Tampil_m->ceksesi($usr);
        echo json_encode($dtlogin);
    }
    public function daftar()
    {
        $full_name = trim($this->input->post("full_name"));
        $email = trim($this->input->post("email"));
        $nik = trim($this->input->post("nik"));
        $password = md5(trim($this->input->post("pass1")));
        $data = $this->Tampil_m->cekusername($full_name);
        if ($data > 0) {
            echo "2";
        } else {
            $operasi = $this->Tampil_m->daftar($full_name, $email, $nik, $password);
            $this->Tampil_m->daftar2($full_name, $nik);
            echo $operasi;
        }
    }

	function simpanuser(){
        $nik = $this->input->post('nik');
		$data = array('nama_lengkap' => $this->input->post('nama'),
        'tmp_lahir' => $this->input->post('temla'),
        'tgl_lahir' => $this->input->post('tglahir'),
        'jenis_kelamin' => $this->input->post('gender'),
        'status' => $this->input->post('sts'),
        'nik' => $this->input->post('nik'),
        'negara' => $this->input->post('ngr'),
        'prov' => $this->input->post('prv'),
        'kab' => $this->input->post('kab'),
        'kec' => $this->input->post('kec'),
        'desa' => $this->input->post('ds'),
        'alamat' => $this->input->post('alm'));
		$dataa = $this->Tampil_m->simpana($data, $nik);
       
        if ($dataa > 0) {
            echo "0";
        } else {
            echo "1";
        }
	}
    function tabelalumni(){
        $data = $this->Tampil_m->tampiltabelalumni();
        echo json_encode($data);
    }
    function dataalumni(){
        $data = $this->Tampil_m->tampilalumni();
        echo json_encode($data);
    }
    public function cari(){
        $nama = trim($this->input->post("nama"));
        $dtcari = $this->Tampil_m->cari($nama);
        if (is_array($dtcari)){
            foreach ($dtcari as $dl){
                $namaa = $dl->nama_lengkap;
                $nik = $dl->nik;
                $tglahir = $dl->tgl_lahir;
                $jk = $dl->jenis_kelamin;
                $status = $dl->status;
                $alamat = $dl->alamat;
            }
            echo "1|$namaa|$nik|$tglahir|$jk|$status|$alamat";
        }else{
            echo "0|";
        }
    }

    function provinsi(){
        $data = $this->Tampil_m->prov();
        echo json_encode($data);
    }

    function kabupaten(){
        $prov = trim($this->input->post("prov"));
        $dtcari = $this->Tampil_m->carikab($prov);
        
        echo json_encode($dtcari);
    }
    function kecamatan(){
        $kab = trim($this->input->post("kab"));
        $dtcari = $this->Tampil_m->carikec($kab);
        
        echo json_encode($dtcari);
    }
    function desa(){
        $kec = trim($this->input->post("kec"));
        $dtcari = $this->Tampil_m->caridesa($kec);
        
        echo json_encode($dtcari);
    }


    function riwasrama(){
        $data = $this->Tampil_m->asrama();
        echo json_encode($data);
    }

    function riwpendidikan(){
        $data = $this->Tampil_m->pendidikan();
        echo json_encode($data);
    }

    function riwpekerjaan(){
        $data = $this->Tampil_m->pekerjaan();
        echo json_encode($data);
    }

       public function simasrama()
    {
        $id_alumni = trim($this->input->post("id"));
        $tgl = trim($this->input->post("tgl"));
        $id_asrama = trim($this->input->post("nama"));
        $upd = array('id_alumni' => $this->input->post("id"),
                    'id_asrama' => $this->input->post("nama"),
                    'thn_lulus' => $this->input->post("tgl"));

            $operasi = $this->Tampil_m->tambahasrama($id_asrama, $id_alumni, $tgl);
            
            echo "1";

    }
    public function tampilasrama(){
        $id = trim($this->input->post("ida"));
        $dtcari = $this->Tampil_m->cariasrama($id);

        echo json_encode($dtcari);
    }
    public function simpend()
    {
        $id_alumni = trim($this->input->post("id"));
        $tgl = trim($this->input->post("tgl"));
        $id_sekolah = trim($this->input->post("nama"));
        // $upd = array('id_alumni' => $this->input->post("id"),
        //             'id_sekolah' => $this->input->post("pend"),
        //             'thn_lulus' => $this->input->post("thnlulus"));

            $operasi = $this->Tampil_m->tambahpend($id_sekolah, $id_alumni, $tgl);
            
            echo "1";

    }
    public function tampilpend(){
        $id = trim($this->input->post("ida"));
        $dtcari = $this->Tampil_m->caripend($id);
        echo json_encode($dtcari);
    }
    public function simpek()
    {
        $id_alumni = trim($this->input->post("id"));
        $tgl = trim($this->input->post("tgl"));
        $id_pekerjaan = trim($this->input->post("nama"));
        // $upd = array('id_alumni' => $this->input->post("id"),
        //             'id_sekolah' => $this->input->post("pend"),
        //             'thn_lulus' => $this->input->post("thnlulus"));

            $operasi = $this->Tampil_m->tambahpek($id_pekerjaan, $id_alumni, $tgl);
            
            echo "1";

    }
    public function tampilpek(){
        $id = trim($this->input->post("ida"));
        $dtcari = $this->Tampil_m->caripek($id);
        echo json_encode($dtcari);
    }
    public function simkeg()
    {
        $id_alumni = trim($this->input->post("id"));
        $tgl = trim($this->input->post("tgl"));
        $kegmas = trim($this->input->post("nama"));
        // $upd = array('id_alumni' => $this->input->post("id"),
        //             'id_sekolah' => $this->input->post("pend"),
        //             'thn_lulus' => $this->input->post("thnlulus"));

            $operasi = $this->Tampil_m->tambahkeg($kegmas, $id_alumni, $tgl);
            
            echo "1";

    }
    public function tampilkeg(){
        $id = trim($this->input->post("ida"));
        $dtcari = $this->Tampil_m->carikeg($id);
        echo json_encode($dtcari);
    }
    function dtalumni(){
        $data = $this->Tampil_m->tampildtalumni();
        echo json_encode($data);
    }
    function tabeldtalumni(){
        $data = $this->Tampil_m->tampiltabeldtalumni();
        echo json_encode($data);
    }
}
