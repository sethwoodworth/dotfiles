<?php get_header(); ?>
<div class="grid_11">
	<div id="content">

	<?php if (have_posts()) : ?>

		<h2 class="pagetitle">Search Results</h2>

		<?php while (have_posts()) : the_post(); ?>

			<div <?php post_class() ?>>
				<span class="postmetadata"><?php the_category(' / ') ?> &mdash; <?php edit_post_link('Edit', '', ' &mdash; '); ?>  <?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></span><br/>
			    <small><span class="date"><?php the_time('j') ?></span><br /><?php the_time('M y') ?> <!-- by <?php the_author() ?> --></small>
				<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
				

			</div>

		<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&larr; Older Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Newer Entries &rarr;') ?></div>
			<div class="clearfix"></div>
		</div>

	<?php else : ?>
      <div class="post">
		<h2>No posts found. Please try a different search.</h2>
		<?php //get_search_form(); ?>
	  </div>

	<?php endif; ?>

	</div>
</div>
<?php get_sidebar(); ?>

<?php get_footer(); ?>