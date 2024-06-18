<?php
	class Login extends CI_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->model("Login_Model");
			$this->load->library("form_validation");
			$this->load->library("session");
			if ($this->session->userdata("logged_in") && $this->router->fetch_method() != "logout") {
				$this->session->set_flashdata(array("type" => "danger","message" => "Zaten giriş yapılmış"));
				redirect(base_url("user/index"));
			}
		}

		public function index() {
			$this->load->view("login/index");
		}

		public function create() {
			$this->form_validation->set_rules("email","Eposta","required|trim");
			$this->form_validation->set_rules("password","Şifre","required|trim");

			$this->form_validation->set_message(array("required" => "{field} alanı doldurulmalıdır."));

			$status = $this->form_validation->run();

			if ($status) {
				$wormer = $this->Login_Model->findUser(
					array(
						"email" => $this->input->post("email"),
						"password" => md5($this->input->post("password"))
					)
				);

				if (isset($wormer->email)) {
					$this->session->set_userdata(array("name" => $wormer->name,"email" => $wormer->email,"logged_in" => true));
					$this->session->set_flashdata(array("type" => "success","message" => "Giriş başarılı!"));
					redirect(base_url("user/index"));
				} else {
					$this->session->set_flashdata(array("type" => "danger","message" => "Kullanıcı bulunamadı"));
					$this->load->view("login/index");
				}
			} else {
				$this->session->set_flashdata(array("type" => "danger","message" => "Validasyon başarısız"));
				$this->load->view("login/index");
			}
		}
		public function logout() {
			$this->session->unset_userdata(array("name","email","logged_in"));
			redirect(base_url("login/index"));
		}
	}
?>