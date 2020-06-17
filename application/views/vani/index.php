<script>
$(document).ready(function(e){
  $('.playBtn').click(function(e) {
        var sourceUrl = $(this).attr("data-src")
        console.log("sourceUrl", sourceUrl);

        var audio = $("#player");
        // $(".playBtn").removeClass('btn-success')
        // $(this).addClass('btn-success')
        $("#mp3_src").attr("src", sourceUrl);
        audio[0].pause();
        audio[0].load();
        //suspends and restores all audio element
        audio[0].oncanplaythrough = audio[0].play();
        e.preventDefault();
    });
})
</script>

<div class="page-header page-header-inverse">
    <div class="page-header-content">
        <div class="page-title">
            <h5>
                <i class="icon-circle-left2 position-left"></i>
                <span class="text-semibold">Vani</span>
                <!-- <small class="display-block">Dark background color</small> -->
            </h5>
        </div>
    </div>
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li><a href="<?=base_url()?>"><i class="icon-home2 position-left"></i> Home</a></li>
            <li class="active">Vani</li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="row">
        <div class="page-header-content">
            <button type="submit" id="deleteselected" class="btn btn-rounded mb-20 btn-danger legitRipple"
                style="display: none;" onclick="return deleteall()">Delete</button>
            <a href="<?= base_url('vani/add'); ?>" class="btn btn-rounded mb-20 btn-success legitRipple">Add <i
                    class="icon-add-to-list"></i> </a>

            <audio controls id="player" controlsList="nodownload">
                <source id="mp3_src" class="audio" src="#" type="audio/mp3">
                Your browser does not support the audio tag.
            </audio>

        </div>
    </div>
    <div class="row">
        <div class="panel panel-flat">
            <form id="checkboxdata" method="POST" action="<?= base_url('vani/deleteall'); ?>">
                <table class="table table-hover" id="dTable">
                    <thead>
                        <tr>
                            <td width="1%"><input type="checkbox" id="ckbCheckAll" name="select_all"></td>
                            <th>#</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Year</th>
                            <th>City</th>
                            <th>Album</th>
                            <th>Artist</th>
                            <th>Lyrics</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                </table>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" class="init">
  function playsong(sourceUrl){
        console.log("sourceUrl", sourceUrl);

        var audio = $("#player");
        // $(".playBtn").removeClass('btn-success')
        // $(this).addClass('btn-success')
        $("#mp3_src").attr("src", sourceUrl);
        audio[0].pause();
        audio[0].load();
        //suspends and restores all audio element
        audio[0].oncanplaythrough = audio[0].play();
        return false;
  }
$(document).ready(function(){


    
  $('#dTable').DataTable({
    'processing': true,
    'serverSide': true,
    'serverMethod': 'post',
    "bAutoWidth": false,
    'stateSave': true,
    'ajax': '<?=base_url('vani/getData')?>',
    'columns': [
        { 
          targets: 1,
          orderable:false,
          width: "5px",
          render:function ( data, type, row, meta ) {
            return ` <input type="checkbox" class="checkBoxClass styled" onchange="selectRecord()" name="chk[]" value="`+row.id+`"> `;
          }
        },
        { 
          data: 'id',
          width: "5px"
        },
        { 
          data: 'name'
        },
        { 
          data: 'type',
          width: "5px"
        },
        { 
          data: 'year',
          width: "100px",
          render: function ( data, type, row, meta ) {
            return row.month&&row.year ? `${row.month} / ${row.year}`:"N/A";
           }
        },
        { 
          data: 'city_name',
          width: "100px",
          render: function ( data, type, row, meta ) {
            return data?data:"-";
           }
        },
        { 
          data: 'album_name',
          width: "100px",
          render: function ( data, type, row, meta ) {
            var path = "<?= base_url();?>/"+row.album_cover
            return data ? data+`<br/><img class="img-circle" src="`+path+`" height="50" width="50" />`:"-";
           }
        },
        { 
          data: 'artist_name',
          width: "100px",
          render: function ( data, type, row, meta ) {
            return data?`${data} ${row.other_artist_name?`(${row.other_artist_name})`:""}`:"-";
           }
        },
        { 
          width: "10px",
          orderable: false, 
          render: function ( data, type, row, meta ) {
            return `<a title='${row.lyrics.length>0?row.lyrics:"No Lyrics Available"}' id='${row.id}' onclick='javascript:editWin(this.id); return(false);' 
            style='margin-right:5px;color:${row.lyrics.length>0?"green":"red"}' href="#" class="legitRipple add_lyrics"> <i class="icon-file-play position-left"></i></a>`;
           }
        },
        {
          "targets": -1,
          width: "110px",
          orderable: false, 
          render: function ( data, type, row, meta ) {
            var path = "<?= base_url('vani/edit/');?>"+row.id;
            var filePath = "<?= base_url();?>"+row.url;
            console.log('row =>',row);
            
            var openFront = "<?= FRONT_END_SITE?>/album/"+row.album_slug;
            return `
            <a style="margin-right:5px;color:blue" href="`+openFront+`" class="legitRipple"> <i class="icon-pin position-left"></i></a>
            <a style="margin-right:5px;" href="javascript:void(0);" class="legitRipple playBtn" onclick="playsong('`+filePath+`')" data-src="`+filePath+`"><i class="icon-play3 position-left"></i></a>
            <a style="margin-right:5px;color:green" href="`+path+`" class="legitRipple"> <i class="icon-pencil4 position-left"></i></a>
            <a style="margin-right:5px;color:red" href="javascript:;" class="legitRipple" id="`+ row.id +`" onclick="del(this.id);return false;"> <i class="icon-trash position-left"></i></a>
            `;
           }
        }
      ],
  });
 
  $('#deleteselected').on('click', function() {
    swal({
      title: "Are you sure?",
      text: "You will not be able to recover this record(s)!",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#EF5350",
      confirmButtonText: "Yes, delete it!",
      cancelButtonText: "No, cancel pls!",
      closeOnConfirm: false,
      closeOnCancel: false
    },
    function(isConfirm){
      if (isConfirm) {
        $("#checkboxdata").submit();
        swal({
          title: "Deleted!",
          text: "Your record(s) has been deleted.",
          confirmButtonColor: "#66BB6A",
          type: "success"
        });
      }
      else {
        swal({
          title: "Cancelled",
          text: "Your record(s) is safe :)",
          confirmButtonColor: "#2196F3",
          type: "error"
        });
      }
    });
    });
});
function editWin(e,h=800,w=600) {
  var y = window.outerHeight / 2 + window.screenY - ( h / 2)
    var x = window.outerWidth / 2 + window.screenX - ( w / 2)
    myWindow = window.open('<?=base_url('/vani/editLyrics')?>/'+e, "Edit", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + y + ', left=' + x);
};  
 
function del(id) {
  swal({
      title: "Are you sure?",
      text: "You will not be able to recover this record(s)!",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#EF5350",
      confirmButtonText: "Yes, delete it!",
      cancelButtonText: "No, cancel pls!",
      closeOnConfirm: false,
      closeOnCancel: false
    },
    function(isConfirm){
      if (isConfirm) {
        $.ajax({
          url: '<?= base_url('vani/delete') ?>',
          type: 'POST',
          data: { "id": id },
          success: function(data) {
            if (data == 1) {
              swal({
                title: "Deleted!",
                text: "Your record(s) has been deleted.",
                confirmButtonColor: "#66BB6A",
                type: "success"
              });
              $('#' + id).closest("tr").fadeOut(300);
            }
          },
          error: function(errorThrown) {
          console.log(errorThrown);
          }
        });        
      }
      else {
        swal({
          title: "Cancelled",
          text: "Your record(s) is safe :)",
          confirmButtonColor: "#2196F3",
          type: "error"
        });
      }
    });

    
    
}
</script>