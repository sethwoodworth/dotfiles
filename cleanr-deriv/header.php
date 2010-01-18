<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<!--[if IE]><link type="text/css" href="<?php bloginfo('template_directory'); ?>/css/ie.css" rel="stylesheet" media="all" /><![endif]-->
<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="alternate" type="application/atom+xml" title="<?php bloginfo('name'); ?> Atom Feed" href="<?php bloginfo('atom_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<?php wp_head(); ?>

</head>
<body>
<div class="container_16">
<div id="header" class="grid_16">
 <h1><a href="<?php echo get_option('home'); ?>/"><?php bloginfo('name'); ?></a><span class="description"><?php bloginfo('description'); ?></span></h1>	

<!--
<ul id="nav">
  <?php wp_list_pages('title_li=Pages'); ?>
  <?php wp_list_categories('title_li=Categories'); ?>
  <li class="last-child"><a href="<?php bloginfo('rss2_url'); ?>" class="rss">RSS</a></li>
</ul>
-->
  
</div>
<hr />
