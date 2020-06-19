<?php
$formData=false;
$btnName="Add";
$tags = array_column($artists, 'name');
if(isset($data)){
    $formData=$data[0];
    $redirect='albums/edit/'.$formData['id'];
    $btnName="Update";
    $tags = array_unique(array_merge($tags,array_map('trim', explode(',', $formData['tags']))));
}else{
    $redirect='albums/add';
}
?>
<script>
  $(document).ready(function(){
    $('.select-multiple-tags').select2({
  insertTag: function (data, tag) {
    // Insert the tag at the end of the results
    data.push(tag);
  }
});
  })
</script>
<form class="form-horizontal form-validate-jquery" method="POST"  enctype="multipart/form-data" action="<?= base_url($redirect); ?>">
  <div class="panel panel-flat">
    <div class="panel-heading">
      <h5 class="panel-title"><?= $btnName ?> Album</h5>
    </div>

    <div class="panel-body">

      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Name: <span class="text-danger">*</span></label>
            <div class="col-lg-9">
              <input autocomplete="off" autofocus name="name" required="required"  value="<?= $formData ? $formData['name']:"" ?>" type="text"
                class="form-control" placeholder="Enter Album Name">
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Artist: <span class="text-danger">*</span></label>
            <div class="col-lg-9">

              <select id="artist_id" name="artist_id" class="select-search" required="required">
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


      <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Album Type: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">
                            <label for="bhajan">Bhajan </label><input type="radio" <?= $formData && $formData['type']==="bhajan"?"checked":""; ?>  name="type" id="bhajan" value="bhajan" />&nbsp;
                            <label for="vani">Vani </label><input type="radio" <?= $formData && $formData['type']==="vani"?"checked":""; ?> name="type" id="vani" value="vani" />&nbsp;
                        </div>
                    </div>
                </div>
            </div>

      <?php
        if($formData && $formData['slug']){
        ?>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-lg-3 control-label">Slug: <span class="text-danger"></span></label>
                <div class="col-lg-9">
                  <input autocomplete="off" autofocus name="slug" required="required"  value="<?= $formData ? $formData['slug']:"" ?>" type="text"
                    class="form-control" placeholder="Enter Album slug">
                </div>
              </div>
            </div>
          </div>
        <?php
        }
      ?>
      
      
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Cover: <span class="text-danger">*</span></label>
            <div class="col-lg-9">
              <?php 
              if($formData){
              ?>
                <input name="cover" type="file" class="form-control">
              <?php
              }else{
              ?>
                <input name="cover" type="file" class="form-control"  required="required" >
              <?php
              }
              ?>
            </div>
          </div>
        </div>
      </div>


      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
            <label class="col-lg-3 control-label">Tags: <span class="text-danger">*</span></label>
            <div class="col-lg-9">

              <select id="tags" name="tags[]" class="select-multiple-tags" multiple="multiple" required="required">
												<?php
													foreach ($tags as $row) {
													?>
														<option <?= $formData && strpos($formData['tags'], $row) !== false  ?"selected":""; ?>  value="<?=$row?>"><?=$row?></option>
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
        <a href="<?= base_url('albums'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
            class="icon-circle-left2 position-left"></i> Cancel </a>
      </div>
    </div>
  </div>
</form>



<script>
    $(document).ready(function(){
         // Initialize
    var validator = $(".form-validate-jquery").validate({
        errorClass: 'validation-error-label',
        successClass: 'validation-valid-label',
        highlight: function(element, errorClass) {
            $(element).removeClass(errorClass);
        },
        unhighlight: function(element, errorClass) {
            $(element).removeClass(errorClass);
        },

        // Different components require proper error label placement
        errorPlacement: function(error, element) {
             // Styled checkboxes, radios, bootstrap switch
             if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice") || element.parent().hasClass('bootstrap-switch-container') ) {
                if(element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                    error.appendTo( element.parent().parent().parent().parent() );
                }
                 else {
                    error.appendTo( element.parent().parent().parent().parent().parent() );
                }
            }

            // Unstyled checkboxes, radios
            else if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('radio')) {
                error.appendTo( element.parent().parent().parent() );
            }

            // Input with icons and Select2
            else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
                error.appendTo( element.parent() );
            }

            // Inline checkboxes, radios
            else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                error.appendTo( element.parent().parent() );
            }

            // Input group, styled file input
            else if (element.parent().hasClass('uploader') || element.parents().hasClass('input-group')) {
                error.appendTo( element.parent().parent() );
            }

            else {
                error.insertAfter(element);
            }
        },
        validClass: "validation-valid-label",
        success: function(label) {
            label.addClass("validation-valid-label").text("Success.")
        },
        rules: {
            name: {
                minlength: 3
            },
        },
        messages: {
            name:{required:"Name required"},
            artist_id:"Please select Artist",
            cover:"Please select album cover image",
            "tags[]":"Please select any tags",
        }
    });
    })
</script>

<!-- /2 columns form -->