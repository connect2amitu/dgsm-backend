
<?php
$formData=false;
$btnName="Add";
if(isset($data)){
    $formData=$data[0];
    $redirect='cities/edit/'.$formData['id'];
    $btnName="Update";
}else{
    $redirect='cities/add';
}
?>
<form class="form-horizontal form-validate-jquery" method="POST" action="<?= base_url($redirect); ?>">
    <div class="panel panel-flat">
        <div class="panel-heading">
            <h5 class="panel-title"><?= $btnName ?> city</h5>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Name: <span class="text-danger">*</span></label>
                        <div class="col-lg-9">
                            <input autocomplete="off" required="required"  autofocus name="name" value="<?= $formData ? $formData['name']:"" ?>"
                                type="text" class="form-control" placeholder="Enter city Name">
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-right">
                <button type="submit" class="btn bg-teal-400 access-multiple-open legitRipple"><?= $btnName; ?>
                    <i class="icon-circle-right2 position-right"></i></button>
                <a href="<?= base_url('cities'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
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
                minlength: 3,
            },
        },
        messages: {
            name:{required:"Name required"},
        }
    });
    })
</script>
<!-- /2 columns form -->