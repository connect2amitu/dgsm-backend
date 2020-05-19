<?php
$formData=false;
$btnName="Add";

if(isset($data)){
    $formData=$data[0];
    $redirect='tracks/edit/'.$formData['id'];
    $btnName="Update";
}else{
    $redirect='tracks/add';
}
$selectedAlbum="";
if(isset($_GET['album'])){
    $selectedAlbum=$_GET['album'];
}
?>

<script>
let searchParams = new URLSearchParams(window.location.search)

$(document).ready(function(){
if(searchParams.has('album')){
    var albumId = searchParams.get('album');
    $('#is_in_album').prop('checked', true);
    $("#album_section").fadeIn(500);
    $('#album_id option[value='+albumId+']').prop('selected', 'selected').change();
}else{
  $("#city_section,#album_section").hide();
} 
  $('#artist_id').on('change', function() {
    var selectedItem =  $( "#artist_id option:selected" ).text();
    if(selectedItem === "Others"){
      $("#city_section").fadeIn(500);
    }else{
      $("#city_section").fadeOut(500);
    }
});
$('#is_in_album').change(function() {
  console.log('this.checked => ',this.checked);
    if(this.checked){
      $("#album_section").fadeIn(500);
    }else{
      $("#album_section").fadeOut(500);
    }
});
});
</script>

<form class="form-horizontal form-validate-jquery" enctype="multipart/form-data" method="POST" action="<?= base_url($redirect); ?>">
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title"><?= $btnName ?> Track</h5>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Tracks: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">
                            <input type="file" name="tracks[]" multiple required="required" />
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Include In Album?</label>
                        <div class="col-lg-9">
                            <input type="checkbox" name="is_in_album" value="1"  id="is_in_album" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="album_section">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Album: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">

                            <select id="album_id" name="album_id" class="select-search" required="required">
                                <option value="-1" disabled selected>-Select Album-</option>
                                <?php
													foreach ($albums as $row) {
													?>
                                <option <?= $formData && $formData['album_id']===$row['id']?"selected":""; ?>
                                    value="<?=$row['id']?>"><?=$row['name']?></option>
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
                        <label class="col-lg-3 control-label">Artist: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">

                            <select id="artist_id" name="artist_id" class="select-search" required="required">
                                <option value="-1" disabled selected>-Select Artist-</option>
                                <?php
													foreach ($artists as $row) {
													?>
                                <option <?= $formData && $formData['artist_id']===$row['id']?"selected":""; ?>
                                    value="<?=$row['id']?>"><?=$row['name']?></option>
                                <?php
													}
							?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row" id="city_section">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">City: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">

                            <select id="city_id" name="city_id" class="select-search" required="required">
                                <option value="-1" disabled selected>-Select Artist-</option>
                                <?php
													foreach ($cities as $row) {
													?>
                                <option <?= $formData && $formData['city_id']===$row['id']?"selected":""; ?>
                                    value="<?=$row['id']?>"><?=$row['name']?></option>
                                <?php
													}
							?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>


            <div class="text-right">
                <button type="submit" class="btn bg-teal-400 access-multiple-open legitRipple"><?= $btnName; ?>
                    <i class="icon-circle-right2 position-right"></i></button>
                <a href="<?= base_url('tracks'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
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
            city_id:"Please select City",
            artist_id:"Please select Artist",
            album_id:"Please select Album",
            "tracks[]":"Please select Tracks",
        }
    });
    console.log('validator =>',validator);
    
    })
</script>
<!-- /2 columns form -->