<?php
	class Brand extends CI_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->model("Brand_Model");
			$this->load->library("form_validation");
			$this->load->library("session");
		}

		public function index() {
			$brands = $this->Brand_Model->getAllbrands();
			$array = array(
				"brands" => $brands
			);

			$this->load->view("admin_panel/index",array(
				"brands" => $brands,
				"pages" => array(
					"brand",
					"index"
				)
			));
		}

		public function new() {
			$this->load->view("admin_panel/index",array(
				"pages" => array(
					"brand",
					"new"
				)
			));
		}

		public function create() {
			$this->form_validation->set_rules("title","Başlık","required|trim");

			$this->form_validation->set_message(
				array(
					"required" => "{field} alanı doldurulması zorunludur.",
				)
			);

			$status = $this->form_validation->run();

			if ($status) {
				
				$insert = $this->Brand_Model->addBrand(array(
					"title" => $this->input->post("title"),
				));

				if ($insert) {
					$this->session->set_flashdata(array("message" => "Brand başarıyla eklendi :)"));
					redirect(base_url("brand/index"));
				} else {
					$this->session->set_flashdata(array("message" => "Brand eklemede hata meydana geldi!"));
					redirect(base_url("brand/new"));
				}

			} else {
				$this->session->set_flashdata(array("message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array(
					"pages" => array(
						"brand",
						"new"
					),
					"formError" => true
				));
			}
		}
		public function edit($id) {
			$branch = $this->Brand_Model->findBrand(array("id" => $id));
			if ($branch) {
				$this->load->view("admin_panel/index",array("pages" => array("brand","edit"),"brand" => $branch));
			} else {
				echo "kayıt bulunamadı";
			}
		}

		public function update() {
			$this->form_validation->set_rules("title","Başlık","required|trim");

			$this->form_validation->set_message(
				array(
					"required" => "{field} alanı doldurulması zorunludur.",
				)
			);

			$status = $this->form_validation->run();

			if ($status) {
				
				$insert = $this->Brand_Model->updateBrand(array("id" => $this->input->post("id")),array(
					"title" => $this->input->post("title"),
				));

				if ($insert) {
					$this->session->set_flashdata(array("message" => "Güncelleme işlemi başarıyla gerçekleşti"));
					redirect(base_url("brand/index"));
				} else {
					$this->session->set_flashdata(array("message" => "Güncelleme işleminde hata meydana geldi"));
					redirect(base_url("brand/edit/".$this->input->post("id")));
				}

			} else {
				$branch = $this->Brand_Model->findBranch(array("id" => 8));
				$this->session->set_flashdata(array("message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array(
					"pages" => array(
						"brand",
						"edit"
					),
					"formError" => true,
					"brand" => $branch
				));
			}
		}

		public function destroy($id) {
			$status = $this->Brand_Model->deleteBrand(
				array("id" => $id)
			);


			if ($status) {
				$this->session->set_flashdata(array("message" => "Kayıt başarıyla silindi"));
			} else {
				$this->session->set_flashdata(array("message" => "Kayıt silmede hata meydana geldi!"));
			}
			redirect(base_url("brand/index"));
		}
	}
?>