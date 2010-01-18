<?php
/*
 * Template Name: Image-View
 * */

// we connect to example.com and port 3307
$db_host = 'localhost';
$db_db = 'cdc_phil_data';
$db_user = 'pyrak';
$db_pass = 'toast';
$id = $post->ID; 
$db_get_all_data_by_id_query = "SELECT * from phil WHERE id = " . $id;

$db_connection = mysql_connect($db_host, $db_user, $db_pass);
if (!$db_connection) {
        die('Could not connect: ' . mysql_error());
}
mysql_select_db($db_db);
$db_result = mysql_query($db_get_all_data_by_id_query);
$data = mysql_fetch_assoc($db_result);

function cleanup_html($html){
    $html = str_replace('<td>', '</td>', $html);
    $html = trim($html, "'\t\n\r\0 ");
    return $html;
}

function parse_links($python_list){
    $trimmed = trim(cleanup_html($python_list), '[]');
    $pairs = explode("), ", $trimmed);
    //in another dimension! (wolfmother)
    foreach ($pairs as $key => $pair){
        $pair = str_replace("u'", "", $pair);
        $pair = trim($pair, "()");
        $pair = explode("', ", $pair);
        $pair[1] = trim($pair[1], "'");
        $pairs[$key] = $pair;
    }
    //okay, so now we have a multi-dimensional array.  good.
    $return = "<ul>";
    foreach($pairs as $pair){
        $return .= '<li><a href="' . $pair[1] . '">' . $pair[0] . "</a></li>\n";
    }
    $return .= "</ul>";
    return $return;
    

}
function this_many_spaces($n){
    $return = "";
    for($i = 1; $i <= $n; $i++){
        $return .= "&nbsp;&nbsp;";
    }
    return $return;

}
function parse_categories($python_list){
    $trimmed = str_replace("u'", "", $python_list);
    $trimmed = trim($trimmed, "'\n");
    $leaves = explode("\n", $trimmed);
    foreach($leaves as $key => $leaf){
        $leaf_explosion = explode(" ", $leaf);
        $leaf = array();
        $leaf[0] = $leaf_explosion[0];
        unset($leaf_explosion[0]);
        $leaf[1] = implode(" ", $leaf_explosion);
        $leaves[$key] = $leaf;
    }
    //okay, so now we have a multi-dimensional array.  good.
    $return = "<ul>";
    foreach($leaves as $pair){
        $return .= '<li>' . this_many_spaces($pair[0]) . $pair[1] . "</li>\n";
    }
    $return .= "</ul>";
    return $return;
}

//thanks guys
//http://stackoverflow.com/questions/733454/best-way-to-format-integer-as-string-with-leading-zeros
function add_nulls($int, $cnt=2) {
        $int = intval($int);
            for($i=0; $i<($cnt-strlen($int)); $i++)
                        $nulls .= '0';
                return $nulls.$int;
}


function gen_data_dir($id){
    $floor = $id - ($id % 100);
    $zfilled = add_nulls($floor, 5);
    $xed = substr($zfilled, 0, 3) . "XX";
    return $xed;
}


$data['desc'] = cleanup_html($data['desc']);
$data['links'] = parse_links($data['links']);
$data['categories'] = parse_categories($data['categories']);


$data['copyright'] = cleanup_html($data['copyright']);
$path_to_data = "/ROD/wordpress/wp-content/themes/cleanr-deriv/collect-phil-cdc/";
$data['path_to_lores_img'] = $path_to_data . "lores/" . gen_data_dir($id) . "/" . add_nulls($id, 5) . ".jpg";


/* deprecated: we gave up on sqlite
$db_filename = "sqlite:/home/pyrak/workspace/collect-phil-cdc/phil.cdc.sqlite";
$db_handle = sqlite_open($db_filename);
$db_selectall_query = "select * from phil";
$id = 1;
$db_select_by_id_query = "select * from phil where id = " + $id;
sqlite_unbuffered_query($db_handle, $db_select_by_id_query);
 */
?>


<?php get_header(); ?>

	<div id="content-imglibrary">

	<?php if (have_posts()) : ?>

		<?php while (have_posts()) : the_post(); ?>

			<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
<!--
				<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
-->
				
				

				<div class="entry">
					<?php the_content('<em>Continue reading &rarr;</em>'); ?>

<div style="text-align: center; width: 100%; display: block;">
    <img style="display: inline-block" src="<?php echo $data['path_to_lores_img'] ?>"  />
</div>
    <p>
<?php echo $data['desc'] ?>
</p>

<?php if($data['source']){ ?>
<h4>Source</h4>
<div>
<?php echo $data['source'] ?>
</div>

<?php } ?>

<?php if($data['links']){ ?>
<div class="copyright">
<h6>Copyright Status</h6>
<p>
<?php echo $data['copyright'] ?>
</p>
</div>
<?php } ?>

<?php if($data['links']){ ?>
<h6>Related Links:</h6>
<?php echo $data['links'] ?>
<?php } ?>

<?php if($data['categories']){ ?>
<h6>Categories:</h6>
<?php echo $data['categories'] ?>
<?php } ?>

<table>
<tr>
    <td>id:</td>
    <td><?php echo $data['id'] ?></td>
</tr>
<?php if($data['creation']){ ?>
<tr>
    <td>Creation Date:</td>
    <td><?php echo $data['creation'] ?></td>
</tr>
<?php } ?>
<?php if($data['credit']){ ?>
<tr>
    <td>Photo Credit:</td>
    <td><?php echo $data['credit'] ?></td>
</tr>
<?php } ?>
<?php if($data['provider']){ ?>
<tr>
    <td>Content Providers(s):<td>
    <td><?php echo $data['provider'] ?></td>
</tr>
<?php } ?>
</table>
<?php //TODO: CATEGORIES ?>


<!--
<?php echo $data['desc'] ?>
<?php echo $data['source'] ?>
<?php echo $data['copyright'] ?>
<?php echo $data['id'] ?>
<?php echo $data['creation'] ?>
<?php echo $data['credit'] ?>
<?php echo $data['links'] ?>
<?php echo $data['provider'] ?>
<?php echo $data['categories'] ?>
<?php echo $data['is_color'] ?>
<?php echo $data['url_to_hires_img'] ?>
<?php echo $data['url_to_thumb_img'] ?>
<?php //Content Providers(s): echo  $data['source'] ?>

-->
				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
				<?php the_tags( '<p class="small">Tags: ', ', ', '</p>'); ?>


				</div>
				<div class="clearfix"></div>

			</div>

		<?php endwhile; ?>

	<?php else : ?>

		<h2 class="center">Not Found</h2>
		<p class="center">Sorry, but you are looking for something that isn't here.</p>
		<?php //get_search_form(); ?>

	<?php endif; ?>
		
	<?php comments_template(); ?>

				<p class="postmetadata alt">
					<small>
						You can follow any comments to this entry through the <?php post_comments_feed_link('RSS 2.0'); ?> feed.

						<?php if (('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
							// Both Comments and Pings are open ?>
							You can <a href="#respond">leave a comment</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.

						<?php } elseif (!('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
							// Only Pings are Open ?>
							Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.

						<?php } elseif (('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
							// Comments are open, Pings are not ?>
							You can skip to the end and leave a comment. Pinging is currently not allowed.

						<?php } elseif (!('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
							// Neither Comments, nor Pings are open ?>
							Both comments and pings are currently closed.

						<?php } edit_post_link('Edit this entry','','.'); ?>

					</small>
				</p>

	</div>
	

<?php //get_sidebar(); ?>

<?php get_footer(); ?>
