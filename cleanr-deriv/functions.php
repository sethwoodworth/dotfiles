<?php

// Path constants
define('THEME', get_bloginfo('template_url'), true);
define('THEME_JS', THEME . '/js/', true);

if (function_exists('register_sidebar'))
    register_sidebar();

function theme_load_js() {
    if (is_admin()) return;
    wp_enqueue_script('jquery');
    wp_enqueue_script('nav', THEME_JS .'jquery.dropdown.js', array('jquery'));

}
add_action('init', theme_load_js);

function cleanr_theme_comment($comment, $args, $depth) {
   $GLOBALS['comment'] = $comment; ?>
   <li <?php comment_class(); ?> id="li-comment-<?php comment_ID() ?>">
    
     <div id="comment-<?php comment_ID(); ?>">
     <div class="commenthead">
      <div class="comment-author vcard">
         <?php echo get_avatar($comment,$size='36',$default='<path_to_url>' ); ?>

         <?php printf(__('<cite class="fn">%s</cite>'), get_comment_author_link()) ?>
      </div>
      

      <div class="comment-meta commentmetadata"><a href="<?php echo htmlspecialchars( get_comment_link( $comment->comment_ID ) ) ?>"><?php printf(__('%1$s at %2$s'), get_comment_date(),  get_comment_time()) ?></a><?php edit_comment_link(__('(Edit)'),'  ','') ?>
     
     <?php if ($comment->comment_approved == '0') : ?>
         <em><?php _e('...awaiting moderation') ?></em>
         <br />
      <?php endif; ?>
      </div>
      <div class="clear"></div>
     
     </div>
     

	<div class="commentbody">
      <?php comment_text() ?>

      <div class="reply">
         <?php comment_reply_link(array_merge( $args, array('depth' => $depth, 'max_depth' => $args['max_depth']))) ?>
      </div>
     </div>
     </div>
<?php } ?>