<?php
	class Branch_Model extends CI_Model {
		public function __construct() {
			parent::__construct();
		}

		public function getAllBranches() {
			return $this->db->query("select * from branches");
		}

		public function addBranch($array = array()) {
			return $this->db->insert("branches",$array);
		}

		public function findBranch($where = array()) {
			return $this->db->where($where)->get("branches")->row();
		}

		public function deleteBranch($where = array()) {
			return $this->db->where($where)->delete("branches");
		}

		public function updateBranch($where = array(), $data = array()) {
			return $this->db->where($where)->update("branches",$data);
		}
	}
?>