<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="{#PLIGG_Visual_Language_Direction#}" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	{checkActionsTpl location="tpl_pligg_admin_head_start"}

	<link rel="stylesheet" type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/bootstrap.css" media="screen">
	<link rel="stylesheet" type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/bootstrap-responsive.css" media="screen">
	<link rel="stylesheet" type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/{$the_template}/css/jquery.pnotify.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/style.css" media="screen">
	{checkForCss}
	
	<meta name="Language" content="en-us">
	<meta name="Robots" content="none">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>{#PLIGG_Visual_Name#} Admin Panel</title>
	<link rel="icon" href="{$my_base_url}{$my_pligg_base}/favicon.ico" type="image/x-icon"/>	

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>

	<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.coda-slider-2.0.js"></script> 
	<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.pnotify.js"></script>
	<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/bootstrap.js"></script>

	{if $pagename eq "admin_index"}
		<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.ui.widget.js"></script> 
		<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.ui.mouse.js"></script> 
		<script type="text/javascript" src="{$my_base_url}{$my_pligg_base}/templates/admin/js/jquery/jquery.ui.sortable.js"></script>
		<link type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/jquery.ui.theme.css" rel="stylesheet" /> 
		<link type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/admin_home.css" rel="stylesheet" />		
		<link type="text/css" href="{$my_base_url}{$my_pligg_base}/templates/admin/css/coda-slider-2.0.css" rel="stylesheet" media="screen" />
	{/if}
	
	<script src="{$my_base_url}{$my_pligg_base}/templates/admin/js/simpleedit.js" type="text/javascript"></script>
	
	{if $pagename eq "admin_index"}
		{literal}
		<script type="text/javascript">
		$(function() {
			$(".column").sortable({
				connectWith: '.column'
			});

			$(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header")
					.addClass("ui-widget-header")
					.end()
				.find(".portlet-content");

			$(".ui-icon-minusthick").click(function() {
				$(this).toggleClass("ui-icon-minusthick").toggleClass("ui-icon-plusthick");
				$(this).parents(".portlet:first").find(".portlet-content:first").toggle();
				$(this).parents(".portlet:first").find(".portlet-content:first").each(function(index) {
					$.get("admin_index.php", { action: "minimize", display: this.style.display, id: this.parentNode.id }, function(data){
					});
				});
			});
			$(".ui-icon-plusthick").click(function() {
				$(this).toggleClass("ui-icon-plusthick").toggleClass("ui-icon-minusthick");
				$(this).parents(".portlet:first").find(".portlet-content:first").toggle();
				$(this).parents(".portlet:first").find(".portlet-content:first").each(function(index) {
					$.get("admin_index.php", { action: "minimize", display: this.style.display, id: this.parentNode.id }, function(data){
					});
				});
				var panelHeight = $(this).parents(".portlet:first").find(".panel:first").height();
				var codaslider = $(this).parents(".portlet:first").find(".coda-slider:first");
				codaslider.codaSlider();
	//			codaslider.css({ height: panelHeight });
			});


			jQuery(document).ajaxError(function(event, request, settings){ alert("Error"); });

			$( ".column" ).sortable({
				stop: function(event, ui) { 
					var data = '';
					$(".portlet").each(function(index) {
						data += this.id + ',';
					});
					$.get("admin_index.php", { action: "move", left: ui.offset.left, top: ui.offset.top, id: ui.item[0].id, list: data }, function(data){
	//  					alert("data load " + data);
					});

				}
			});

	//		$(".column").disableSelection();

		});
		$().ready(function() {
			$(".coda-slider").each(function(index) {
			$('#'+this.id).codaSlider();
			});
		});
		</script>
		{/literal}
	{/if}
	
	{checkActionsTpl location="tpl_pligg_admin_head_end"}

</head>
<body dir="{#PLIGG_Visual_Language_Direction#}">
{checkActionsTpl location="tpl_pligg_admin_body_start"}
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<!-- Be sure to leave the brand out there if you want it shown -->
			<a class="brand" href="{$my_base_url}{$my_pligg_base}/admin/admin_index.php">{#PLIGG_Visual_AdminPanel#} Panel</a>
			
			<!-- .pull-right pushes content to the right side -->
			<div class="pull-right">
				<ul class="nav">
					<li><a href="{$URL_logout}">{#PLIGG_Visual_Logout#}</a></li>
				</ul>
				{*
				<form name="vbform" method="post" action="http://forums.pligg.com/search.php?do=process&forumchoice=-1&searchdate=-1" class="navbar-search pull-left">
					<input type="text" placeholder="Search" class="search-query input-medium" name="query">
				</form>
				*}
			</div>
			
			<!-- Everything you want hidden at 940px or less, place within here -->
			<div class="nav-collapse">
				<ul class="nav">
					<li><a href="http://forums.pligg.com/">Pligg CMS Support</a></li>
					<li><a href="{$my_base_url}{$my_pligg_base}/">{#PLIGG_Visual_Home#}</a></li>
					{checkActionsTpl location="tpl_header_admin_links"}
				</ul>
			</div><!--/.nav-collapse -->
        </div>
	</div>
</div>
	
	
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<div id="AdminAccordion" class="accordion">
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<span class="accordion-heading-title">
									<a href="#CollapseManage" data-parent="#AdminAccordion" data-toggle="collapse" class="accordion-toggle">
										<li class="nav-header"><img src="{$my_base_url}{$my_pligg_base}/templates/admin/images/manage.png" width="16px" height="16px" /> {#PLIGG_Visual_AdminPanel_Manage_Nav#}</li>
									</a>
								</span>
								<span class="badge accordion-heading-alert">
									14
								</span>
							</div>
							<div class="accordion-body collapse in" id="CollapseManage">
								<div class="accordion-inner">
									<li{if $pagename eq "admin_links"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_links.php">Submissions <span class="pull-right badge badge-gray">10</span></a></li> 
									<li{if $pagename eq "admin_comments"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_comments.php">Comments <span class="pull-right badge badge-gray">3</span></a></li> 
									<li{if $pagename eq "admin_users" || $pagename eq "admin_user_validate"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_users.php">Users</a></li> 
									<li{if $pagename eq "admin_group"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_group.php">Groups <span class="pull-right badge badge-gray">1</span></a></li> 
									<li{if $pagename eq "admin_page" || $pagename eq "edit_page" || $pagename eq "submit_page"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_page.php">Pages</a></li> 
									<li{if $pagename eq "admin_categories" || $pagename eq "admin_categories_tasks"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_categories.php">Categories</a></li> 
								</div>
							</div>
						</div>
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#CollapseSettings" data-parent="#AdminAccordion" data-toggle="collapse" class="accordion-toggle">
									<li class="nav-header"><img src="{$my_base_url}{$my_pligg_base}/templates/admin/images/configure.png" width="16px" height="16px" /> Settings</li>
								</a>
							</div>
							{*  Sample of hidden accordion. No "in" class, and height set to 0px *}
							<div class="accordion-body collapse" style="height: 0px;" id="CollapseSettings">
								<div class="accordion-inner">
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Anonymous"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Anonymous">Anonymous</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "AntiSpam"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=AntiSpam">AntiSpam</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Avatars"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Avatars">Avatars</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Comments"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Comments">Comments</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Groups"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Groups">Groups</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Live"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Live">Live</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Location Installed"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Location Installed">Location Installed</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Misc"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Misc">Miscellaneous</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "OutGoing"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=OutGoing">OutGoing</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "SEO"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=SEO">SEO</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Story"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Story">Story</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Submit"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Submit">Submit</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Tags"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Tags">Tags</a></li>
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Voting"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Voting">Voting</a></li>
									{checkActionsTpl location="tpl_pligg_admin_navtabs_end"}
								</div>
							</div>
						</div>
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#CollapseTemplate" data-parent="#AdminAccordion" data-toggle="collapse" class="accordion-toggle">
									<li class="nav-header"><img src="{$my_base_url}{$my_pligg_base}/templates/admin/images/template.png" width="16px" height="16px" /> Template</li>
								</a>
							</div>
							<div class="accordion-body collapse in" id="CollapseTemplate">
								<div class="accordion-inner">
									<li{if $pagename eq "admin_config" && $templatelite.get.page eq "Template"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_config.php?page=Template">Template Settings</a></li>
									<li{if $pagename eq "admin_editor"} class="active"{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_editor.php">{#PLIGG_Visual_AdminPanel_Template_Nav#} Editor</a></li>
								</div>
							</div>
						</div>
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<span class="accordion-heading-title">
									<a href="#CollapseModules" data-parent="#AdminAccordion" data-toggle="collapse" class="accordion-toggle">
										<li class="nav-header"><img src="{$my_base_url}{$my_pligg_base}/templates/admin/images/module.png" width="16px" height="16px" /> Modules</li>
									</a>
								</span>
								<span class="badge accordion-heading-alert">
									<a href="{$my_base_url}{$my_pligg_base}/admin/admin_modules.php">2</a>
								</span>
							</div>
							<div class="accordion-body collapse in" id="CollapseModules">
								<div class="accordion-inner">
									<li{if $pagename eq "admin_modules"}{php} if ($_GET["status"] == ""){ echo ' class="active"'; } {/php}{/if}><a href="{$my_base_url}{$my_pligg_base}/admin/admin_modules.php" {if $pagename eq "admin_modules"}class="active"{/if} >{#PLIGG_Visual_AdminPanel_Modules_Nav#} <span class="pull-right badge badge-gray">2</span></a></li> 
									{checkActionsTpl location="tpl_header_admin_main_links"}
								</div>
							</div>
						</div>
						
						<div class="accordion-group">
							<div class="accordion-heading">
								<span class="accordion-heading-title">
									<a href="#CollapseWidgets" data-parent="#AdminAccordion" data-toggle="collapse" class="accordion-toggle">
										<li class="nav-header"><img src="{$my_base_url}{$my_pligg_base}/templates/admin/images/widgets.png" width="16px" height="16px" /> Widgets</li>
									</a>
								</span>
								<span class="badge accordion-heading-alert">
									<a href="{$my_base_url}{$my_pligg_base}/admin/admin_widgets.php">1</a>
								</span>
							</div>
							<div class="accordion-body collapse in" id="CollapseWidgets">
								<div class="accordion-inner">
									<li><a href="{$my_base_url}{$my_pligg_base}/admin/admin_widgets.php" {if $pagename eq "admin_widgets"}class="active"{/if} >Installed {#PLIGG_Visual_AdminPanel_Widgets_Nav#} <span class="pull-right badge badge-gray">1</span></a></li> 
									<li><a href="{$my_base_url}{$my_pligg_base}/admin/admin_widgets.php?status=uninstalled" {if $pagename eq "admin_widgets"}class="active"{/if} >Uninstalled {#PLIGG_Visual_AdminPanel_Widgets_Nav#}</a></li>
								</div>
							</div>
						</div>
						
					</div>
				</ul>
			</div>
		</div>
		<div class="span9">
			<div class="row-fluid">
				
				{*
				<ul class="breadcrumb">
					<li><a href="{$my_base_url}{$my_pligg_base}/">{#PLIGG_Visual_Home#}</a> <span class="divider">/</span></li> <li><a href="{$my_base_url}{$my_pligg_base}/admin/admin_index.php">{#PLIGG_Visual_AdminPanel#}</a>  <span class="divider">/</span></li>
					{if $pagename eq "admin_backup"}<li class="active">{#PLIGG_Visual_AdminPanel_Backup#}</li>{/if}
					{if $module eq "captcha"}<li class="active">{#PLIGG_Visual_AdminPanel_Captcha#}</li>{/if}
					{if $pagename eq "admin_categories" || $pagename eq "admin_categories_tasks"}<li class="active">{#PLIGG_Visual_AdminPanel_Categories#}</li>{/if}
					{if $pagename eq "admin_comments"}<li class="active">{#PLIGG_Visual_AdminPanel_Comments#}</li>{/if}
					{if $pagename eq "admin_config"}<li class="active">{#PLIGG_Visual_AdminPanel_Configure#}</li>{/if}
					{if $pagename eq "admin_index"}<li class="active">{#PLIGG_Visual_AdminPanel_Home#}</li>{/if}
					{if $modulename eq "admin_language"}<li class="active">{#PLIGG_Visual_AdminPanel_Language#}</li>{/if}
					{if $pagename eq "admin_modules"}<li class="active">{#PLIGG_Visual_AdminPanel_Modules_Nav#}</li>{/if}
					{if $pagename eq "admin_widgets"}<li class="active">{#PLIGG_Visual_AdminPanel_Widgets_Nav#}</li>{/if}
					{if $pagename eq "admin_page"}<li class="active">{#PLIGG_Visual_AdminPanel_Pages#}</li>{/if}
					{if $pagename eq "admin_links"}<li class="active">{#PLIGG_Visual_AdminPanel_News#}</li>{/if}
					{if $pagename eq "admin_editor"}<li class="active">{#PLIGG_Visual_AdminPanel_Template_Nav#}</li>{/if}
					{if $pagename eq "admin_users"}<li class="active">{#PLIGG_Visual_AdminPanel_Users#}</li>{/if}
					{if $pagename eq "admin_group"}<li class="active">{#PLIGG_Visual_AdminPanel_Groups#}</li>{/if}
					{checkActionsTpl location="tpl_pligg_admin_breadcrumbs"}
				</ul>
				*}
				
				<div id="main_content">
					<div class="bluerndcontent">
						{checkActionsTpl location="tpl_pligg_admin_legend_before"}
						{include file=$tpl_center.".tpl"}
						{* Start Pagination *}
							{if ($pagename eq "admin_users" && $templatelite.get.mode=='') || $pagename eq "admin_comments" || $pagename eq "admin_links" || $pagename eq "admin_user_validate"}	
								{php} 
								Global $db, $main_smarty, $rows, $offset, $URLMethod;
								$oldURLMethod=$URLMethod;
								$URLMethod=1;
								$pagesize=get_misc_data('pagesize');
								do_pages($rows, $pagesize ? $pagesize : 30, $the_page); 
								$URLMethod=$oldURLMethod;
								{/php}
							{/if} 
						{* End Pagination *}
						{checkActionsTpl location="tpl_pligg_admin_legend_after"}

					</div>
				</div>
				{checkActionsTpl location="tpl_pligg_admin_body_end"}
			</div><!-- /row-fluid -->
		</div><!-- /span9 -->
	</div><!-- /row-fluid -->
	
	<hr />
	<footer>
		<p>Powered by <a href="http://www.pligg.com/">Pligg CMS</a></p>
	</footer>
	
</div><!-- /container-fluid -->

{* JavaScript to prevent the carousel function from automatically changing content *}
{literal}
	<script type='text/javascript'>//<![CDATA[ 
	$(window).load(function(){
		$(function() {
			$('.carousel').each(function(){
				$(this).carousel({
					interval: false
				});
			});
		});
	});//]]>  
	</script>
{/literal}

{* JavaScript to allow multiple sidebar accordions to be open *}
{literal}
	<script type='text/javascript'>//<![CDATA[ 
	$(window).load(function(){
	$('.collapse').collapse({
		toggle: false
	});

	//$(".collapse").collapse()

	});//]]>  
	</script>
{/literal}

{literal}
	<script type="text/javascript">
		$(document).ready(function() {
		// https://gist.github.com/1688900
		// Support for AJAX loaded modal window.
		// Focuses on first input textbox after it loads the window.
			$('[data-toggle="modal"]').click(function(e) {
				e.preventDefault();
				var href = $(this).attr('href');
				if (href.indexOf('#') == 0) {
					$(href).modal('open');
				} else {
					$.get(href, function(data) {
						$('<div class="modal" >' + data + '</div>').modal();
					}).success(function() { $('input:text:visible:first').focus(); });
				}
			});
		});
	</script>
{/literal}

</body>
</html>