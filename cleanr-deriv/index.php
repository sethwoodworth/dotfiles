<?php

if($_GET['rand']){
    $rand = True;
    require_once("page.php");
    exit;

}

?>
<?php get_header(); ?>

	<div id="content-onecol">
		<h2 class="center">Public Health Image Library Mirror</h2>
		<p class="center">This is the part where we tell you how cool we are.</p>
		<?php //get_search_form(); ?>

<p style="text-align: right">
<a href="<?php bloginfo('wpurl') ?>?rand=1">View a random image &raquo;</a>
</p>
<p style="text-align: right">
<a href="<?php bloginfo('wpurl') ?>?p=1">Browse the database from the beginning &raquo;</a>
</p>

	</div>
	


<?php get_footer(); ?>
