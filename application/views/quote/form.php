
<?php
$formData=false;
$btnName="Add";
if(isset($data)){
    $formData=$data[0];
    $redirect='quotes/edit/'.$formData['id'];
    $btnName="Update";
}else{
    $redirect='quotes/add';
}
?>
<form class="form-horizontal form-validate-jquery" method="POST" action="<?= base_url($redirect); ?>">
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title"><?= $btnName ?> quote</h5>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-lg-1 control-label">Quote: <span class="text-danger">*</span></label>
                        <div class="col-lg-11">
                            <textarea style="resize: none;" rows="3" cols="200" autocomplete="off" required="required" autofocus name="quote" class="form-control" placeholder="Enter Quote"><?php if($formData) echo $formData['quote']; ?></textarea>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-lg-1 control-label">Artist: <span class="text-danger">*</span></label>
                        <div class="col-lg-3">

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

            <div class="text-right">
                <button type="submit" class="btn bg-teal-400 access-multiple-open legitRipple"><?= $btnName; ?>
                    <i class="icon-circle-right2 position-right"></i></button>
                <a href="<?= base_url('quotes'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
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
            quote: {
                minlength: 3,
            },
        },
        messages: {
            quote:{required:"quote required"},
            artist_id:{required:"artist required"},
        }
    });
    })
</script>
<!-- /2 columns form -->