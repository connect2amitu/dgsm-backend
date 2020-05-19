<?php
$formData=false;
$btnName="Add";
if(isset($data)){
    $formData=$data[0];
    $redirect='playlist/edit/'.$formData['id'];
    $btnName="Update";
}else{
    $redirect='playlist/add';
}
?>
<form class="form-horizontal" method="POST" action="<?= base_url($redirect); ?>">
  <div class="panel panel-flat">
    <div class="panel-heading">
      <h5 class="panel-title"><?= $btnName ?> Album</h5>
    </div>

    <div class="panel-body">
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Name:</label>
            <div class="col-lg-9">
              <input autocomplete="off" autofocus name="name" value="<?= $formData ? $formData['name']:"" ?>" type="text"
                class="form-control" placeholder="Enter Album Name">
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Artist:</label>
            <div class="col-lg-9">

              <select id="artist_id" name="artist_id" class="select-search">
												<option value="-1" disabled selected>-Select Artist-</option>
												<?php
													foreach ($artists as $row) {
													?>
														<option <?= $formData && $formData['artist_id']===$row['id']?"selected":""; ?>  value="<?=$row['id']?>"><?=$row['name']?></option>
													<?php
													}
							?>
												</select>
            </div>
          </div>
        </div>
      </div>

      <div class="text-right">
        <button type="submit" class="btn bg-teal-400 access-multiple-open legitRipple"><?= $btnName; ?> <i
            class="icon-circle-right2 position-right"></i></button>
        <a href="<?= base_url('artist'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
            class="icon-circle-left2 position-left"></i> Cancel </a>
      </div>
    </div>
  </div>
</form>
<!-- /2 columns form -->