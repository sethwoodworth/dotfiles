<?php
/*
 * Template Name: Image-View
 * */

$parker_machine = True;
$dreamhost	 = False;

$max_id = 3;
//$max_id = 11850;

if(!$wp_outofbounds){
    require_once("sql.php");
    //random?!
    if(!rand){
        $id = $post->ID; 
    }
    else{
        $id = rand(1, $max_id);
    }
    $db_get_all_data_by_id_query = "SELECT * from phil WHERE id = " . $id;

    $db_connection = mysql_connect($db_host, $db_user, $db_pass);
    if (!$db_connection) {
            die('Could not connect: ' . mysql_error());
    }
    mysql_select_db($db_db);
    $db_result = mysql_query($db_get_all_data_by_id_query);
    $data = mysql_fetch_assoc($db_result);

    //getting next and previous id's
    //next:
    $nextid = False;
    $query = "SELECT id, url_to_lores_img from phil WHERE id > " . $id;
    $db_result = mysql_query($query);
    while($possibility = mysql_fetch_assoc($db_result)){
        if($possibility['url_to_lores_img']){
            $nextid = $possibility['id'];
            break;
        }
    }
    //prev:
    $previd = False;
    $query = "SELECT id, url_to_lores_img from phil WHERE id < " . $id;
    $db_result = mysql_query($query);
    while($possibility = mysql_fetch_assoc($db_result)){
        if($possibility['url_to_lores_img']){
            $previd = $possibility['id'];
            break;
        }

    }
    
}

function cleanup_html($html){
    $html = str_replace('<td>', '</td>', $html);
    $html = trim($html, "'\t\n\r\0 ");
    return $html;
}

function parse_links($python_list){
    $trimmed = trim(cleanup_html($python_list), '[]');
    if(!$trimmed){
        return False;
    }
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
    if(!$trimmed){
        return False;
    }
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
$data['path_to_lores_img'] = $path_to_data . "lores/" . gen_data_dir($id) . "/" . add_nulls($id, 5) . ".jpg";
$data['path_to_thumb_img'] = $path_to_data . "thumbs/" . gen_data_dir($id) . "/" . add_nulls($id, 5) . ".jpg";
$data['path_to_hires_img'] = $path_to_data . "hires/" . gen_data_dir($id) . "/" . add_nulls($id, 5) . ".tif";


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

	<div id="content-onecol">

	<?php if (have_posts() || $rand) : ?>

		<?php //while (have_posts()) : the_post(); ?>

			<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
<!--
				<h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
-->
				
				

				<div class="entry">
					<?php the_content('<em>Continue reading &rarr;</em>'); ?>

<div id="navlinks">
    <?php if($previd) { ?>
    <a href="<?php bloginfo('wpurl'); echo "?p=" . ($id-1) . "&dir=b" ?>">Prev</a>
    <?php } ?>
    &nbsp;
    <?php if($nextid) { ?>
    <a style="float: right;" href="<?php bloginfo('wpurl'); echo "?p=" . ($id+1) . "&dir=f" ?>">Next</a>
    <?php } ?>
    </div>


<div style="text-align: center; width: 100%; display: block;">
    <img style="display: inline-block" src="<?php echo $data['path_to_lores_img'] ?>"  />
</div>
    <p>
<div id="desc">
<?php echo $data['desc'] ?>
</div>

<div id="not_desc">
<?php if($data['source']){ ?>
<h4>Source</h4>
<div>
<?php echo $data['source'] ?>
</div>
<?php } ?>

<h6>Downloads:</h6>
<div class="block_datapt">
<ul>
<?php if($data['url_to_lores_img']) {?>
<li>Low Resolution: <a href="<?php echo $data['path_to_lores_img'] ?>">ROD server</a>,<a href="<?php echo $data['url_to_lores_img'] ?>">CDC server</a></li>
<?php } ?>
<?php if($data['url_to_hires_img']) {?>
<li>High Resolution: <a href="<?php echo $data['path_to_hires_img'] ?>">ROD server</a>, <a href="<?php echo $data['url_to_hires_img'] ?>">CDC server</a></li>
<?php } ?>
<?php if($data['url_to_thumb_img']) {?>
<li>Thumbnail: <a href="<?php echo $data['path_to_thumb_img'] ?>">Rod server</a>, <a href="<?php echo $data['url_to_thumb_img'] ?>">CDC Server</a></li>
<?php } ?>
<li></li>
</ul>
</div>


<?php if($data['links']){ ?>
<h6>Copyright Status</h6>
<div class="block_datapt">
<p>
<?php echo $data['copyright'] ?>
</p>
</div>
<?php } ?>

<?php if($data['links']){ ?>
<h6>Related Links:</h6>
<div class="block_datapt">
<?php echo $data['links'] ?>
</div>
<?php } ?>


<p class="datapoint">
    <strong class="label">Image Id:</strong>
    <?php echo $data['id'] ?>
</p>
<?php if($data['creation']){ ?>
<p class="datapoint">
    <strong class="label">Creation Date:</strong>
    <?php echo $data['creation'] ?>
</p>
<?php } ?>
<?php if($data['credit']){ ?>
<p class="datapoint">
    <strong class="label">Photo Credit:</strong>
    <?php echo $data['credit'] ?>
</p>
<?php } ?>
<?php if($data['provider']){ ?>
<p class="datapoint">
    <strong class="label">Content Providers(s):</strong>
    <?php echo $data['provider'] ?>
</p>
<?php } ?>


<?php if($data['categories']){ ?>
<h6>Categories:</h6>
<div class="block_datapt">
<?php echo $data['categories'] ?>
</div>
<?php } ?>


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
</div>
				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
				<?php the_tags( '<p class="small">Tags: ', ', ', '</p>'); ?>


				</div>
				<div class="clearfix"></div>

			</div>

		<?php //endwhile; ?>

		
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
	<?php else : ?>

		<h2 class="center">Not Found</h2>
		<p class="center">Sorry, but you are looking for something that isn't here.</p>
        <p style="text-align: right">
        <a href="<?php bloginfo('wpurl') ?>?p=1">Back to the Beginning &raquo;</a>
        </p>
<p>&nbsp;</p>
		<?php //get_search_form(); ?>

	<?php endif; ?>

	</div>
	

<?php //get_sidebar(); ?>

<?php get_footer(); ?>
