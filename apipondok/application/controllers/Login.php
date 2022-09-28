<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {


	function __construct(){
		parent::__construct();		
		$this->load->model('Tampil_m');

	}

	function index(){
		$this->load->view('Auth');
		
		

	}


	
}