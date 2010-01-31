<form method="get" id="searchform" action="<?php bloginfo('url'); ?>/">
	<input type="text" name="s" id="s" value="<?php echo wp_specialchars($search_text, 1); ?>" onfocus="clearInput('s', '<?php echo wp_specialchars($search_text, 1); ?>')" onblur="clearInput('s', '<?php echo wp_specialchars($search_text, 1); ?>')" /> 
	<input type="image" src="<?php bloginfo('template_url'); ?>/images/search_magnifier.gif" id="searchbtn" value="Search" />
</form>
