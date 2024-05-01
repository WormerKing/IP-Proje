<script type="module">
  import { Application, Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"
  window.Stimulus = Application.start()

  Stimulus.register("showBranches", class extends Controller {
    static targets = [ "parent","child" ]

    connect() {
      this.parentTarget.checked = false;
      this.childTargets.map(x => x.checked = false);
    }

    toggleChildren() {
      if (this.parentTarget.checked) {
        this.childTargets.map(x => x.checked = true);
      } else {
        this.childTargets.map(x => x.checked = false);
      }
    }

    toggleParent() {
      if (!this.childTargets.map(x => x.checked).includes(false)) {
        this.parentTarget.checked = true;
      } else {
        this.parentTarget.checked = false;
      }
    }
  });
</script>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Branches</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <div class="float-sm-right">
            <a href="<?php echo base_url('branch/new')?>" class="btn btn-warning">Ekle</a>
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
          <table class="table table-bordered text-center" data-controller="showBranches">
            <thead class="table-info">
              <tr>
                <td><input type="checkbox" name="" id="" data-showBranches-target="parent" data-action="change->showBranches#toggleChildren"></td>
                <td>id</td>
                <td>title</td>
                <td>adress</td>
                <td>created_at</td>
                <td>Action</td>
              </tr>
            </thead>
            <tbody class="table-secondary">
              <?php foreach($branches->result() as $branch) { ?>
                <tr>
                  <td><input type="checkbox" name="ids[]" value="<?php echo $branch->id?>"data-action="change->showBranches#toggleParent" data-showBranches-target="child"></td>
                  <td><?php echo $branch->id?></td>
                  <td><?php echo $branch->title?></td>
                  <td><?php echo $branch->adress?></td>
                  <td><?php echo dateTimeFormat($branch->created_at)?></td>
                  <td>
                    <a href="<?php echo base_url('branch/edit/'.$branch->id)?>" class="btn btn-warning">Düzenle</a>
                    <a href="<?php echo base_url('branch/destroy/'.$branch->id)?>" class="btn btn-danger mx-3 delete" data-confirm="Are you sure to delete this item?">Sil</a>
                  </td>
                </tr>
              <?php }?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</div>
<script>
  var deleteLinks = document.querySelectorAll('.delete');

for (var i = 0; i < deleteLinks.length; i++) {
  deleteLinks[i].addEventListener('click', function(event) {
      event.preventDefault();

      var choice = confirm(this.getAttribute('data-confirm'));

      if (choice) {
        window.location.href = this.getAttribute('href');
      }
  });
}

</script>