<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Kullanıcı ekle</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <div class="float-sm-right">
            <a href="<?php echo base_url('user/index')?>" class="btn btn-warning">Tüm Kullanıcılar</a>
          </div>
          <ol class="breadcrumb float-sm-right px-4">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Dashboard v1</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <hr class="border border-primary">
  <section class="content">
    <div class="container-fluid">
      <?php if ($this->session->flashdata("message") && $this->session->flashdata("type")) {?>
        <div class="alert alert-<?php echo $this->session->flashdata("type");?> text-center py-3" role="alert">
          <h5><?php echo $this->session->flashdata("message");?></h5>
        </div>
      <?php }?>
      <div class="row">
        <div class="col-sm-12">
          <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Kullanıcı ekle</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" action="<?php echo base_url('user/create')?>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">İsim</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control<?php echo isset($formError) && form_error("name") ? " is-invalid" : ""?>" id="inputName" name="name" placeholder="İsim" value="<?php echo isset($formError) ? set_value('name') : ''?>">
                      <?php if (form_error("name")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("name")?>
                        </div>
                      <?php }?>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputSurname" class="col-sm-2 col-form-label">Soyisim</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control<?php echo isset($formError) && form_error("name") ? " is-invalid" : ""?>" id="inputSurname" name="surname" placeholder="Soyisim" value="<?php echo isset($formError) ? set_value('surname') : ''?>">
                      <?php if (form_error("surname")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("surname")?>
                        </div>
                      <?php }?>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                      <input type="email" class="form-control<?php echo isset($formError) && form_error("email") ? " is-invalid" : ""?>" id="inputEmail" name="email" placeholder="Email" value="<?php echo isset($formError) ? set_value('email') : ''?>">
                      <?php if (form_error("email")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("email")?>
                        </div>
                      <?php }?>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Şifre</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control<?php echo isset($formError) && form_error("password") ? " is-invalid" : ""?>" id="inputPassword" name="password" placeholder="Şifre" value="<?php echo isset($formError) ? set_value('password') : ''?>">
                      <?php if (form_error("password")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("password")?>
                        </div>
                      <?php }?>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputRePassword" class="col-sm-2 col-form-label">Şifre tekrar</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control<?php echo isset($formError) && form_error("re_password") ? " is-invalid" : ""?>" id="inputRePassword" name="re_password" placeholder="Şifre" value="<?php echo isset($formError) ? set_value('password') : ''?>">
                      <?php if (form_error("re_password")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("re_password")?>
                        </div>
                      <?php }?>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputİsActive" class="col-sm-2 col-form-label">Aktif mi</label>
                    <div class="col-sm-10">
                      <select class="form-select" aria-label="Default select example" name="is_active">
                        <option value="true">Evet</option>
                        <option value="false">Hayır</option>
                      </select>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer d-flex justify-content-center">
                  <button type="submit" class="btn btn-info">Ekle</button>
                </div>
                <!-- /.card-footer -->
              </form>
            </div>
        </div>
      </div>
    </div>
  </section>
</div>