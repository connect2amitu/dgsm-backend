<div class="page-header page-header-inverse">
    <div class="page-header-content">
        <div class="page-title">
            <h5>
                <i class="icon-circle-left2 position-left"></i>
                <span class="text-semibold">Album</span>
                <!-- <small class="display-block">Dark background color</small> -->
            </h5>
        </div>
    </div>
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li><a href="<?=base_url()?>"><i class="icon-home2 position-left"></i> Home</a></li>
            <li class="active">Album</li>
        </ul>
    </div>
</div>

<div class="content">
    <div class="row">
        <div class="page-header-content">
            <button type="button" onclick="deleteselected()" id="deleteselected" class="btn btn-rounded mb-20 btn-danger legitRipple"
                style="display: none;">Delete</button>
            <a href="<?= base_url('albums/add'); ?>" class="btn btn-rounded mb-20 btn-success legitRipple">Add <i
                    class="icon-add-to-list"></i> </a>
        </div>
    </div>
    <div class="row">
        <div class="panel panel-flat">
        <form id="checkboxdata" method="POST" action="<?= base_url('albums/deleteall'); ?>">
        <table id='dTable' class='display dataTable'>
            <thead>
                <tr>
                    <th><input type="checkbox" id="ckbCheckAll" name="select_all"></th>
                    <th>#</th>
                    <th>Cover</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Slug</th>
                    <th>Artist</th>
                    <th>Tags</th>
                    <th>Action</th>
                </tr>
            </thead>
        </table>
        </form>
        </div>
    </div>
</div>


<script type="text/javascript" class="init">
$(document).ready(function(){
  $('#dTable').DataTable({
    'processing': true,
    'serverSide': true,
    'serverMethod': 'post',
    "bAutoWidth": false,
    'stateSave': true,
    'ajax': '<?=base_url('albums/getData')?>',
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
          data: 'cover',
          orderable: false, 
          render:function ( data, type, row, meta ) {
            var path = "<?= base_url();?>/"+data
            return `<img src="`+path+`" height="100" width="100" />`;
          }
        },
        { 
          data: 'name'
        },
        { 
          data: 'type'
        },
        { 
          data: 'slug'
        },
        { 
          data: 'artist_name',
          width: "100px"
        },
        { 
          data: 'tags',
          orderable: false, 
          render: function ( data, type, row, meta ) {
            var tagsArray = "";
            row.tags.split(",").forEach(tag => {
              tagsArray+='<span class="label label-default">'+tag+'</span> '
            });
            return tagsArray;
           }
        },
        {
          "targets": -1,
          width: "110px",
          orderable: false, 
          render: function ( data, type, row, meta ) {
            var path = "<?= base_url('albums/edit/');?>"+row.id;
            var frontURL = "<?= FRONT_END_SITE ?>/album/"+row.slug;
            var addPlaylistURL = row.type === "vani"? "<?= base_url('vani/add?album=');?>"+row.id : "<?= base_url('tracks/add?album=');?>"+row.id 
            return `
            <a style="margin-right:5px;color:black" href="`+addPlaylistURL+`" target="" class="legitRipple"> <i class="icon-playlist-add position-left"></i></a>
            <a style="margin-right:5px;color:blue" href="`+frontURL+`" target="_blank" class="legitRipple"> <i class="icon-pin position-left"></i></a>
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
          url: '<?= base_url('albums/delete') ?>',
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