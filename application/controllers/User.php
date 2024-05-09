<?php 
	class User extends CI_Controller {
		public function __construct() {
			parent::__construct();
			$this->load->model("User_Model");
			$this->load->library("session");
			$this->load->library("form_validation");
		}

		public function index() {
			$users = $this->User_Model->getAllUsers();

			$this->load->view("admin_panel/index",array(
				"users" => $users,
				"pages" => array(
					"user",
					"index"
				)
			));
		}

		public function new() {
			$this->load->view("admin_panel/index",array("pages" => array("user","new")));
		}

		public function create() {
			$this->form_validation->set_rules("name","İsim","required|trim|min_length[3]|max_length[10]");
			$this->form_validation->set_rules("surname","Soyisim","required|trim|min_length[5]|max_length[20]");
			$this->form_validation->set_rules("email","Eposta","required|trim|is_unique[users.email]|valid_email");
			$this->form_validation->set_rules("password","Şifre","required|trim|min_length[5]|max_length[100]");
			$this->form_validation->set_rules("re_password","Şifre Tekrarı","required|trim|matches[password]");
			$this->form_validation->set_rules("is_active","Aktif mi","required|trim|regex_match[(true|false)]");

			$this->form_validation->set_message(array(
				"required" => "{field} alanı doldurulmalıdır!",
				"regex_match" => "{field} alanı geçerli verilerden değil!",
				"is_unique" => "{field} alanı eşsiz olmalıdır!",
				"min_length" => "{field} alanı minimum {param} karakter olmalıdır!",
				"max_length" => "{field} alanı maksimum {param} karakter olabilir!",
				"valid_email" => "{field} kısmı geçerli bir email değil!",
				"matches" => "Şifre alanı ile şifre tekrarı alanı uyuşmuyor!"
			));

			$success = $this->form_validation->run();

			if ($success) {
				$array = array(
					"name" => $this->input->post("name"),
					"surname" => $this->input->post("surname"),
					"email" => $this->input->post("email"),
					"password" => md5($this->input->post("password")),
					"is_active" => ($this->input->post("is_active") == "true" ? 1 : 0),
				);

				if ($this->User_Model->addUser($array)) {
					$this->session->set_flashdata(array("type" => "success","message" => "Yeni kullanıcı başarıyla eklendi"));
				} else {
					$this->session->set_flashdata(array("type" =>"danger","message" => "Kayıt bilinmeyen bir nedenden dolayı başarısız oldu :("));
				}
				redirect(base_url("user"));
			} else {
				$this->session->set_flashdata(array("type" => "danger","message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array("pages" => array("user","new"),"formError" => true));
			}
		}

		public function edit($id) {
			$this->load->view("admin_panel/index",
				array(
					"pages" => array("user","edit"),
					"user" => $this->User_Model->findUser(array("id" => $id))
				)
			);
		}

		public function update() {
			
			if ($this->User_Model->findUser(array("id" => $this->input->post("id")))->email == $this->input->post("email")) {
				$unique_email = "required|trim|valid_email";
			} else {
				$unique_email = "required|trim|valid_email|is_unique[users.email]";
			}

			$this->form_validation->set_rules("name","İsim","required|trim|min_length[3]|max_length[10]");
			$this->form_validation->set_rules("surname","Soyisim","required|trim|min_length[5]|max_length[20]");

			$this->form_validation->set_rules("email","Eposta",$unique_email);

			$this->form_validation->set_rules("password","Şifre","required|trim|min_length[5]|max_length[100]");
			$this->form_validation->set_rules("is_active","Aktif mi","required|trim|regex_match[(true|false)]");

			$this->form_validation->set_message(array(
				"required" => "{field} alanı doldurulmalıdır!",
				"regex_match" => "{field} alanı geçerli verilerden değil!",
				"is_unique" => "{field} alanı eşsiz olmalıdır!",
				"min_length" => "{field} alanı minimum {param} karakter olmalıdır!",
				"max_length" => "{field} alanı maksimum {param} karakter olabilir!",
				"valid_email" => "{field} kısmı geçerli bir email değil!"
			));

			$success = $this->form_validation->run();

			if ($success) {
				$array = array(
					"name" => $this->input->post("name"),
					"surname" => $this->input->post("surname"),
					"email" => $this->input->post("email"),
					"password" => md5($this->input->post("password")),
					"is_active" => ($this->input->post("is_active") == "true" ? 1 : 0),
				);

				if ($this->User_Model->updateUser(array("id" => $this->input->post("id")),$array)) {
					$this->session->set_flashdata(array("type" => "success","message" => "Kullanıcı bilgileri başarıyla güncellendi"));
				} else {
					$this->session->set_flashdata(array("type" => "danger","message" => "Güncelleme bilinmeyen bir nedenden dolayı başarısız oldu :("));
				}
				redirect(base_url("user"));
			} else {
				$this->session->set_flashdata(array("type" => "danger","message" => "Validasyon başarısız!"));
				$this->load->view("admin_panel/index",array("pages" => array("user","new"),"formError" => true));
			}
		}
		public function destroy($id) {
			if ($this->User_Model->deleteUser(array("id" => $id))) {
				$this->session->set_flashdata(array("type" => "success","message" => "Kayıt başarıyla silindi!"));
			} else {
				$this->session->set_flashdata(array("type" => "danger","message" => "Kayıt silmede hata meydana geldi!"));
			}
			redirect(base_url("user"));
		}
	}
?>