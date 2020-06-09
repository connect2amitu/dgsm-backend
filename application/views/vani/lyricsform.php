<?php
$formData=false;
$btnName="Add";

if(isset($data)){
    $formData=$data[0];
    $redirect='tracks/editLyrics/'.$formData['id'];
    $btnName="Update";
}else{
    $redirect='tracks/add';
}
?>
<script>
function closeSelf(){
    // do something
        var data={
            id:<?=$formData['id']?>,
            lyrics:$("#lyricsInput").val()
        }
        console.log('data =>',data);
        $.ajax({
            url: '<?= base_url($redirect) ?>',
            type: 'POST',
            data: data,
            success: function(data){
            console.log('data =>',data);
            window.close();
        },
        error: function(errorThrown ){
                console.log( errorThrown );
            }
        });
}
</script>
<form class="form-horizontal form-validate-jquery" name="certform" enctype="multipart/form-data" method="POST" action="<?= base_url($redirect); ?>">
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
                            <textarea  cols="88" rows="25" id="lyricsInput" name="lyrics"  required="required"><?=$formData['lyrics'] ?></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-right">
                <button  onclick="closeSelf();" type="button" class="btn bg-teal-400 access-multiple-open legitRipple"><?= $btnName; ?>
                    <i class="icon-circle-right2 position-right"></i></button>
                <a onclick="window.close()"  href="<?= base_url('tracks'); ?>" class="btn btn-danger access-multiple-open legitRipple"><i
                        class="icon-circle-left2 position-left"></i> Cancel </a>
            </div>
        </div>
    </div>
</form>