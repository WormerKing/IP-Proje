<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Brand ekle</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <div class="float-sm-right">
            <a href="<?php echo base_url('brand/index')?>" class="btn btn-warning">Tüm brandler</a>
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
      <div class="row">
        <div class="col-sm-12">
          <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Brand ekle</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" action="<?php echo base_url('brand/create')?>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputTitle" class="col-sm-2 col-form-label">Başlık</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control<?php echo isset($formError) && form_error("title") ? " is-invalid" : ""?>" id="inputTitle" name="title" placeholder="Başlık" value="<?php echo isset($formError) ? set_value('title') : ''?>">
                      <?php if (form_error("title")) {?>
                        <div class="invalid-feedback">
                          <?php echo form_error("title")?>
                        </div>
                      <?php }?>
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