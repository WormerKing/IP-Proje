<?php
	class Branch_Model extends CI_Model {
		public function __construct() {
			parent::__construct();
		}

		public function getAllBranches() {
			return $this->db->query("select * from branches");
		}

		public function addBranch($array = array()) {
			$this->db->insert("branches",$array);
		}
	}
?>