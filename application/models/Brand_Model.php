<?php
	class Brand_Model extends CI_Model {
		public function __construct() {
			parent::__construct();
		}

		public function getAllBrands() {
			return $this->db->query("select * from brands");
		}

		public function addBrand($array = array()) {
			return $this->db->insert("brands",$array);
		}

		public function findBrand($where = array()) {
			return $this->db->where($where)->get("brands")->row();
		}

		public function deleteBrand($where = array()) {
			return $this->db->where($where)->delete("brands");
		}

		public function updateBrand($where = array(), $data = array()) {
			return $this->db->where($where)->update("brands",$data);
		}
	}
?>