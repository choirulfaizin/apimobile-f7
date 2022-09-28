<?php 

class Tampil_m extends CI_Model{

	function get_data()
	{
		$nama = $this->session->userdata('username');

		$query = $this->db->query("SELECT * FROM user WHERE username = '$nama'");

		return $query->row();
	}
	function simpana($data, $nik){
		
		// $sql = "UPDATE tbl_alumni VALUES('','$nama','$temla','$tglahir','$gender','$sts','$nik','$ngr','$prv','$kab','$kec','$ds','$alm') WHERE nik ='$nik'";
		$this->db->where('nik',$nik);
		$this->db->update('tbl_alumni',$data);
	
		return $this->db->result();
		
	}
	public function cek_login($usr, $psw)
	{
		$sql = "SELECT tbl_user.full_name, tbl_user.is_aktif, tbl_user.id_user_level, tbl_user.nik, tbl_alumni.id_alumni, tbl_alumni.tmp_lahir, tbl_alumni.tgl_lahir, tbl_alumni.jenis_kelamin, tbl_alumni.status, tbl_alumni.negara, tbl_alumni.alamat FROM tbl_user INNER JOIN tbl_alumni ON tbl_user.nik=tbl_alumni.nik WHERE tbl_user.full_name='$usr' AND tbl_user.password='$psw'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function ceksesi($usr)
	{
		$sql = "SELECT * FROM tbl_user WHERE fullname = '$usr'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function cekusername($full_name)
	{
		$sql = "SELECT * FROM tbl_user WHERE full_name = '$full_name'";
		$querySQL = $this->db->query($sql)->row();
		return $querySQL;
	}
	public function daftar($full_name, $email, $nik, $password)
	{
		$sql = "INSERT INTO tbl_user (full_name, email, password, nik, images, id_user_level, code, is_aktif, aktive) VALUES ('$full_name', '$email','$password', '$nik', ' ', 5, ' ', '1', ' ')";
		$querySQL = $this->db->query($sql);
		if($querySQL){return "1";}
		else{return "0";}
	}
	public function daftar2($nama_lengkap, $nik)
	{
		$sql = "INSERT INTO tbl_alumni (nama_lengkap, nik) VALUES ('$nama_lengkap', '$nik')";
		$querySQL = $this->db->query($sql);
		if($querySQL){return "1";}
		else{return "0";}
	}
	function tampilalumni(){
		$query = $this->db->query("SELECT * FROM tbl_alumni order by id_alumni desc limit 10");
		return $query->result();
	}
	function tampiltabelalumni(){
		$query = $this->db->query("SELECT * FROM tbl_alumni order by id_alumni desc limit 30");
		return $query->result();
	}
	public function cari($nama){
		$sql = "SELECT * FROM tbl_alumni WHERE nama_lengkap = '$nama'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function prov()
	{
		$sql = "SELECT * FROM m_ipropinsi";
		$querySQL = $this->db->query($sql);
		
		return $querySQL->result();
		 
	}

	public function carikab($prov){
		$sql = "SELECT id_kabkota, nama_kabkota FROM m_ikabkota WHERE id_propinsi = '$prov'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function carikec($kab){
		$sql = "SELECT id_kecamatan, nama_kecamatan FROM m_ikecamatan WHERE id_kabkota = '$kab'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function caridesa($kec){
		$sql = "SELECT id_kelurahan, nama_kelurahan FROM m_ikelurahan WHERE id_kecamatan = '$kec'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	
	public function cek_alumni($nik){
		$sql = "SELECT * FROM tbl_alumni WHERE nik = '$nik'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function asrama()
	{
		$sql = "SELECT * FROM mst_asrama";
		$querySQL = $this->db->query($sql);
		
		return $querySQL->result();
		 
	}
	public function pendidikan()
	{
		$sql = "SELECT * FROM mst_sekolah";
		$querySQL = $this->db->query($sql);
		
		return $querySQL->result();
		 
	}
	public function pekerjaan()
	{
		$sql = "SELECT * FROM mst_pekerjaan";
		$querySQL = $this->db->query($sql);
		
		return $querySQL->result();
		 
	}
	public function cekasrama($id_alumni)
	{
		$sql = "SELECT * FROM tbl_riwy_asrama WHERE id_alumni = '$id_alumni'";
		$querySQL = $this->db->query($sql)->row();
		return $querySQL;
	}

	public function tambahasrama($id_asrama, $id_alumni, $tgl)
	{
		$sql = "INSERT INTO tbl_riwy_asrama (id_alumni, id_asrama, thn_lulus) VALUES ('$id_alumni', '$id_asrama', '$tgl')";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function updateasrama($id_alumni, $upd){
		
		// $sql = "UPDATE tbl_alumni VALUES('','$nama','$temla','$tglahir','$gender','$sts','$nik','$ngr','$prv','$kab','$kec','$ds','$alm') WHERE nik ='$nik'";
		$this->db->where('id_alumni',$id_alumni);
		$this->db->update('tbl_riwy_asrama',$upd);
	
		return $this->db->result();
		
	}
	public function cariasrama($id)
	{
		$sql = "SELECT mst_asrama.nama_asrama, tbl_riwy_asrama.thn_lulus FROM mst_asrama INNER JOIN tbl_riwy_asrama ON tbl_riwy_asrama.id_asrama=mst_asrama.id_asrama WHERE tbl_riwy_asrama.id_alumni='$id'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function cekpend($id_alumni)
	{
		$sql = "SELECT * FROM tbl_riwy_pend WHERE id_alumni = '$id_alumni'";
		$querySQL = $this->db->query($sql)->row();
		return $querySQL;
	}

	public function tambahpend($id_sekolah, $id_alumni, $tgl)
	{
		$sql = "INSERT INTO tbl_riwy_pend (id_alumni, id_sekolah, thn_lulus) VALUES ('$id_alumni', '$id_sekolah', '$tgl')";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function updatepend($id_alumni, $upd){
		
		// $sql = "UPDATE tbl_alumni VALUES('','$nama','$temla','$tglahir','$gender','$sts','$nik','$ngr','$prv','$kab','$kec','$ds','$alm') WHERE nik ='$nik'";
		$this->db->where('id_alumni',$id_alumni);
		$this->db->update('tbl_riwy_asrama',$upd);
	
		return $this->db->result();
		
	}
	public function caripend($id)
	{
		$sql = "SELECT mst_sekolah.nama_sekolah, tbl_riwy_pend.thn_lulus FROM mst_sekolah INNER JOIN tbl_riwy_pend ON tbl_riwy_pend.id_sekolah=mst_sekolah.id_sekolah WHERE tbl_riwy_pend.id_alumni='$id'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function cekpek($id_alumni)
	{
		$sql = "SELECT * FROM tbl_riwy_pekerjaan WHERE id_alumni = '$id_alumni'";
		$querySQL = $this->db->query($sql)->row();
		return $querySQL;
	}

	public function tambahpek($id_pekerjaan, $id_alumni, $tgl)
	{
		$sql = "INSERT INTO tbl_riwy_pekerjaan (id_alumni, id_pekerjaan, tahun) VALUES ('$id_alumni', '$id_pekerjaan', '$tgl')";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}

	public function caripek($id)
	{
		$sql = "SELECT mst_pekerjaan.nama_pekerjaan, tbl_riwy_pekerjaan.tahun FROM mst_pekerjaan INNER JOIN tbl_riwy_pekerjaan ON tbl_riwy_pekerjaan.id_pekerjaan=mst_pekerjaan.id_pekerjaan WHERE tbl_riwy_pekerjaan.id_alumni='$id'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	public function cekkeg($id_alumni)
	{
		$sql = "SELECT * FROM tbl_riwy_keg_masyarakat WHERE id_alumni = '$id_alumni'";
		$querySQL = $this->db->query($sql)->row();
		return $querySQL;
	}

	public function tambahkeg($kegmas, $id_alumni, $tgl)
	{
		$sql = "INSERT INTO tbl_riwy_keg_masyarakat (id_alumni, bentuk_keg_masyarakat, tahun) VALUES ('$id_alumni', '$kegmas', '$tgl')";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}

	public function carikeg($id)
	{
		$sql = "SELECT * FROM tbl_riwy_keg_masyarakat WHERE id_alumni='$id'";
		$querySQL = $this->db->query($sql);
		return $querySQL->result();
	}
	function tampildtalumni(){
		$query = $this->db->query("SELECT * FROM tbl_alumni order by id_alumni");
		return $query->result();
	}
	function tampiltabeldtalumni(){
		$query = $this->db->query("SELECT * FROM tbl_alumni order by id_alumni");
		return $query->result();
	}
}
?>
