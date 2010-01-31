<?php get_header(); ?>
	<div class="grid_11">
      <div id="content">
asdf
		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		<div class="post" id="post-<?php the_ID(); ?>">
		<h2><?php the_title(); ?></h2>
			<div class="entry">
				<?php the_content('<em>Continue reading &rarr;</em>'); ?>

				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>

			</div>
		</div>
		<?php endwhile; endif; ?>
	 <?php edit_post_link('Edit', '<p>', '</p>'); ?>
	 </div>
	</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>
