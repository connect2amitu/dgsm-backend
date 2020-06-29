<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $title; ?> - DGSM</title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet"
        type="text/css">
    <link href="<?= base_url("assets/css/icons/icomoon/styles.css")?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url("assets/css/bootstrap.css")?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url("assets/css/core.css")?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url("assets/css/components.css")?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url("assets/css/colors.css")?>" rel="stylesheet" type="text/css">


	<link href='<?= base_url("assets/css/jquery.dataTables.min.css")?>' rel='stylesheet' type='text/css'>

    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script type="text/javascript" src="<?= base_url("assets/js/plugins/loaders/pace.min.js")?>"></script>
    <script type="text/javascript" src="<?= base_url("assets/js/core/libraries/jquery.min.js")?>"></script>
    <script type="text/javascript" src="<?= base_url("assets/js/core/libraries/bootstrap.min.js")?>"></script>
    <script type="text/javascript" src="<?= base_url("assets/js/plugins/loaders/blockui.min.js")?>"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="<?= base_url("assets/js/plugins/forms/styling/switchery.min.js")?>"></script>
    <script type="text/javascript" src="<?= base_url("assets/js/plugins/forms/styling/uniform.min.js")?>"></script>
    <script type="text/javascript" src="<?= base_url("assets/js/plugins/pickers/daterangepicker.js")?>"></script>

    <script type="text/javascript" src="<?= base_url("assets/js/core/app.js")?>"></script>
    <!-- <script type="text/javascript" src="<?= base_url("assets/js/pages/dashboard.js")?>"></script> -->

    <script type="text/javascript" src="<?= base_url("assets/js/plugins/ui/ripple.min.js")?>"></script>



    <!-- /theme JS files -->
    <script>
    $(document).ready(function() {
        $('.checkBoxClass').click(function() {
			
            var total = $(document).find('input[name="chk[]"]:checked').length;
			
            if (total > 0)
                $("#deleteselected").show();
            else
                $("#deleteselected").hide();
            if (total == 0)
                $('#ckbCheckAll').removeAttr('checked');
        });

        $("#ckbCheckAll").click(function() {
            if ($(".checkBoxClass").is(':checked')){
                $(".checkBoxClass").prop("checked", false);
                $("#deleteselected").hide();
			}
            else{
                $(".checkBoxClass").prop("checked", true);
				$("#deleteselected").show();
			}
            return true;
        });

    });
	function selectRecord(){
		var totalCheck = $(document).find('input[name="chk[]"]:checked').length;
		var total = $(document).find('input[name="chk[]"]').length;
		if (totalCheck > 0){
			$("#deleteselected").show();
		}
		else{
			$("#deleteselected").hide();
		}
		if (totalCheck == total){
			$("#ckbCheckAll").prop('checked', true);
		}else{
			$('#ckbCheckAll').removeAttr('checked');
		}
					
	}
    function deleteall() {
        if (confirm('are you sure you want to delete?'))
           
        return false;
    }
    </script>
	<script type="text/javascript" src="<?=base_url("assets/js/plugins/forms/selects/select2.min.js")?>"></script>
	<script type="text/javascript" src="<?=base_url("assets/js/plugins/notifications/sweet_alert.min.js")?>"></script>
</head>

<body>
    <?php
	$this->load->view('notification/index.php');
?>
    <!-- Main navbar -->
    <div class="navbar navbar-inverse header-highlight">
        <!-- <div class="navbar navbar-default header-highlight"> -->
        <div class="navbar-header">
            <a class="navbar-brand" href="<?=base_url()?>"><img src="<?=base_url("assets/images/logo_light.png")?>" alt=""></a>

            <ul class="nav navbar-nav visible-xs-block">
                <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
                <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
            </ul>
        </div>

        <div class="navbar-collapse collapse" id="navbar-mobile">
            <ul class="nav navbar-nav">
                <li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a>
                </li>
            </ul>

            <div class="navbar-right">
                <p class="navbar-text"><?php
// I'm India so my timezone is Asia/Calcutta
date_default_timezone_set('Asia/Calcutta');

// 24-hour format of an hour without leading zeros (0 through 23)
$Hour = date('G');

if ($Hour >= 5 && $Hour <= 11) {
    echo "Good Morning";
} else if ($Hour >= 12 && $Hour <= 18) {
    echo "Good Afternoon";
} else if ($Hour >= 19 || $Hour <= 4) {
    echo "Good Evening";
}
?>, Amit!</p>
                <p class="navbar-text"><a href="<?= base_url('login/logout') ?>"><i class="icon-switch2"></i></a></p>
                <p class="navbar-text"><a target="_blank"
                        href="http://localhost/phpmyadmin/db_structure.php?server=1&db=dgsm"><i
                            class="icon-database"></i></a></p>
            </div>
        </div>
    </div>
    <!-- /main navbar -->


    <!-- Page container -->
    <div class="page-container">

        <!-- Page content -->
        <div class="page-content">

            <!-- Main sidebar -->
            <div class="sidebar sidebar-main">
                <div class="sidebar-content">

                    <!-- User menu -->
                    <div class="sidebar-user-material">
                        <div class="category-content">
                            <div class="sidebar-user-material-content">
                                <a href="#"><img src="<?= base_url("assets/images/placeholder.jpg")?>" class="img-circle img-responsive"
                                        alt=""></a>
                                <h6>Chauhan Amit</h6>
                                <span class="text-size-small">Surat Gujarat</span>
                            </div>
                        </div>
                    </div>
                    <!-- /user menu -->

                    <!-- Main navigation -->
                    <div class="sidebar-category sidebar-category-visible">
                        <div class="category-content no-padding">
                            <ul class="navigation navigation-main navigation-accordion">

                                <!-- Main -->
                                <!-- <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li> -->
                                <li class="<?= !$this->uri->segment(1) ? "active":""?>"><a
                                        href="<?=base_url()?>"><i class="icon-home4"></i> <span>Dashboard</span></a>
                                </li>
                                <li class="<?= $this->uri->segment(1)==="cities"?"active":""?>"><a
                                        href="<?=base_url('/cities')?>"><i class="icon-width"></i> <span>City</span></a>
                                </li>
                                <li class="<?= $this->uri->segment(1)==="albums"?"active":""?>"><a
                                        href="<?=base_url('/albums')?>"><i class="icon-width"></i> <span>Album</span></a>
                                </li>
                                <li class="<?= $this->uri->segment(1)==="artists"?"active":""?>"><a
                                        href="<?=base_url('/artists')?>"><i class="icon-width"></i>
                                        <span>Artist</span></a></li>
                                <li class="<?= $this->uri->segment(1)==="quotes"?"active":""?>"><a
                                        href="<?=base_url('/quotes')?>"><i class="icon-width"></i>
                                        <span>Quotes</span></a></li>
                                <li class="<?= $this->uri->segment(1)==="tracks"?"active":""?>"><a
                                        href="<?=base_url('/tracks')?>"><i class="icon-width"></i> <span>Bhajan</span></a>
                                </li>
                                <li class="<?= $this->uri->segment(1)==="vani"?"active":""?>"><a
                                        href="<?=base_url('/vani')?>"><i class="icon-width"></i> <span>Vani</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /main navigation -->

                </div>
            </div>
            <!-- /main sidebar -->


            <!-- Main content -->
            <div class="content-wrapper">

                <!-- Content area -->

                <?= $content;?>

                <!-- /content area -->

            </div>
            <!-- /main content -->

        </div>
        <!-- /page content -->

    </div>
    <!-- /page container -->

</body>
	<script type="text/javascript" src="<?=base_url("assets/js/pages/form_select2.js")?>"></script>
<script src="<?= base_url("assets/js/pages/jquery.dataTables.min.js")?>"></script>

<script type="text/javascript" src="<?= base_url("assets/js/plugins/forms/validation/validate.min.js")?>"></script>
</html>

