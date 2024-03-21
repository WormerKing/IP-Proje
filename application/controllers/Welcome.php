<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model("Branch_Model");
	}


	public function index() {
		$array = array("page" => "main_page");
		$this->load->view('admin_panel/index',$array);
	}

	public function show_branches() {
		$branches = $this->Branch_Model->getAllBranches();
		$array = array(
			"branches" => $branches,
			"page" => "list_branches"
		);

		$this->load->view('admin_panel/index',$array);
	}
}
