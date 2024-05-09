<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model("Branch_Model");
		$this->load->library("session");
	}


	public function index() {
		$array = array("pages" => array("pages","main_page"));
		$this->load->view('admin_panel/index',$array);
	}

	public function show_branches() {
		$branches = $this->Branch_Model->getAllBranches();
		$array = array(
			"branches" => $branches,
			"pages" => array("pages","list_branches")
		);

		$this->load->view('admin_panel/index',$array);
	}
}
