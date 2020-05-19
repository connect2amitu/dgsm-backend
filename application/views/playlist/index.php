<div class="page-header page-header-inverse">
	<div class="page-header-content">
		<div class="page-title">
			<h5>
				<i class="icon-circle-left2 position-left"></i>
				<span class="text-semibold">Playlist</span>
				<!-- <small class="display-block">Dark background color</small> -->
			</h5>
		</div>
	</div>
	<div class="breadcrumb-line">
		<ul class="breadcrumb">
			<li><a href="<?=base_url()?>"><i class="icon-home2 position-left"></i> Home</a></li>
			<li class="active">Playlist</li>
		</ul>
	</div>
</div>
<div class="content">
	<div class="row">
		<div class="page-header-content">
				<button type="submit" id="deleteselected" class="btn btn-rounded mb-20 btn-danger legitRipple" style="display: none;"  onclick="return deleteall()">Delete</button>
				<a href="<?= base_url('playlist/add'); ?>" class="btn btn-rounded mb-20 btn-success legitRipple">Add <i
				class="icon-add-to-list"></i> </a>
	</div>
	</div>
	<div class="row">
		<div class="panel panel-flat">
			<form id="checkboxdata" method="POST" action="<?= base_url('playlist/deleteall'); ?>">
				<table class="table table-hover" id="">
					<thead>
						<tr>
							<td width="1%"><input type="checkbox" id="ckbCheckAll" name="select_all"></td>
							<th>#</th>
							<th>Name</th>
							<th>Artist</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							foreach ($data as $row) {
								?>
							<tr>
								<td width="1%"><input type="checkbox"  class="checkBoxClass" name="chk[]" value="<?= $row['id']; ?>"></td>
								<td><?=$row['id']?></td>
								<td><?=$row['name']?></td>
								<td><?=$row['artist_name']?></td>
								<td style="display:flex">
									<a style="margin-right:5px;color:green" href="<?= base_url('playlist/edit/'.$row['id']); ?>"
										class="legitRipple"><i class="icon-pencil4 position-left"></i></a>
									<a style="margin-right:5px;color:red" href="#" class="legitRipple"
									id="<?= $row['id']; ?>" onclick="del(this.id);return false;">
									<i class="icon-trash position-left"></i></a>
								</td>
						</tr>
								<?php
							}
						?>
					</tbody>
				</table>
				</form>
		<?php
			if(isset($links)) echo $links;
		?>
		</div>
	</div>
</div>

<script type="text/javascript">
function del(id)
{
    if(confirm("Are you sure you want to delete this Record?"))
    {
        $.ajax({
                url: '<?= base_url('playlist/delete') ?>',
                type: 'POST',
                data: {"id":id},
                success: function(data){
                    if (data == 1)
                    {
                        $('#'+id).closest("tr").fadeOut(300);
                    }
                },
                error: function(errorThrown ){
                    console.log( errorThrown );
                }
            });
    }
}
</script>
