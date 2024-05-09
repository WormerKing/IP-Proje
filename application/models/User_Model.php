<?php
	class User_Model extends CI_Model {
		public function __construct() {
			parent::__construct();
		}

		public function getAllUsers() {
			return $this->db->query("select * from users");
		}

		public function addUser($array = array()) {
			return $this->db->insert("users",$array);
		}

		public function findUser($where = array()) {
			return $this->db->where($where)->get("users")->row();
		}

		public function deleteUser($where = array()) {
			return $this->db->where($where)->delete("users");
		}

		public function updateUser($where = array(), $data = array()) {
			return $this->db->where($where)->update("users",$data);
		}
	}
?>