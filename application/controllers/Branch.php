<?php
	class Branch extends CI_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->model("Branch_Model");
			$this->load->library("form_validation");
			$this->load->library("session");
		}

		public function index() {
			$branches = $this->Branch_Model->getAllBranches();
			$array = array(
				"branches" => $branches
			);

			$this->load->view("admin_panel/index",array(
				"branches" => $branches,
				"pages" => array(
					"branch",
					"index"
				)
			));
		}

		public function new() {
			$this->load->view("admin_panel/index",array(
				"pages" => array(
					"branch",
					"new"
				)
			));
		}

		public function create() {
			$this->form_validation->set_rules("title","Başlık","required|trim");
			$this->form_validation->set_rules("adress","Adres","required|trim|is_unique[branches.adress]");

			$this->form_validation->set_message(
				array(
					"required" => "{field} alanı doldurulması zorunludur.",
					"is_unique" => "{field} alanı eşsiz olmalıdır!"
				)
			);

			$status = $this->form_validation->run();

			if ($status) {
				
				$insert = $this->Branch_Model->addBranch(array(
					"title" => $this->input->post("title"),
					"adress" => $this->input->post("adress")
				));

				if ($insert) {
					$this->session->set_flashdata(array("message" => "Branch başarıyla eklendi :)"));
					redirect(base_url("branch/index"));
				} else {
					$this->session->set_flashdata(array("message" => "Branch eklemede hata meydana geldi!"));
					redirect(base_url("branch/new"));
				}

			} else {
				$this->session->set_flashdata(array("message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array(
					"pages" => array(
						"branch",
						"new"
					),
					"formError" => true
				));
			}
		}
		public function edit($id) {
			$branch = $this->Branch_Model->findBranch(array("id" => $id));
			if ($branch) {
				$this->load->view("admin_panel/index",array("pages" => array("branch","edit"),"branch" => $branch));
			} else {
				echo "kayıt bulunamadı";
			}
		}

		public function update() {
			$this->form_validation->set_rules("title","Başlık","required|trim");
			$this->form_validation->set_rules("adress","Adres","required|trim");

			$this->form_validation->set_message(
				array(
					"required" => "{field} alanı doldurulması zorunludur.",
				)
			);

			$status = $this->form_validation->run();

			if ($status) {
				
				$insert = $this->Branch_Model->updateBranch(array("id" => $this->input->post("id")),array(
					"title" => $this->input->post("title"),
					"adress" => $this->input->post("adress")
				));

				if ($insert) {
					$this->session->set_flashdata(array("message" => "Güncelleme işlemi başarıyla gerçekleşti"));
					redirect(base_url("branch/index"));
				} else {
					$this->session->set_flashdata(array("message" => "Güncelleme işleminde hata meydana geldi"));
					redirect(base_url("branch/edit/".$this->input->post("id")));
				}

			} else {
				$branch = $this->Branch_Model->findBranch(array("id" => 8));
				$this->session->set_flashdata(array("message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array(
					"pages" => array(
						"branch",
						"edit"
					),
					"formError" => true,
					"branch" => $branch
				));
			}
		}

		public function destroy($id) {
			$status = $this->Branch_Model->deleteBranch(
				array("id" => $id)
			);


			if ($status) {
				$this->session->set_flashdata(array("message" => "Kayıt başarıyla silindi"));
			} else {
				$this->session->set_flashdata(array("message" => "Kayıt silmede hata meydana geldi!"));
			}
			redirect(base_url("branch/index"));
		}
	}
?>