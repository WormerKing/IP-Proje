<?php
	class Login_Model extends CI_Model {
		public function __construct() {
			parent::__construct();
		}

		public function findUser($where = array()) {
			return $this->db->where($where)->get("users")->row();
		}
	}
?>