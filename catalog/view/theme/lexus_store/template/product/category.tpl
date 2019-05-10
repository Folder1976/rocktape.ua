<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );
	$themeConfig = (array)$this->config->get('themecontrol');
	 $this->language->load('module/themecontrol');
	 $categoryConfig = array(
		'listing_products_columns' 		     => 0,
		'listing_products_columns_small' 	 => 2,
		'listing_products_columns_minismall' => 1,
		'cateogry_display_mode' 			 => 'grid',
		'category_pzoom'				     => 1,
		'show_swap_image'					 => 0,
		'quickview' 						 => 0
	);
	$categoryConfig  = array_merge($categoryConfig, $themeConfig );
	$DISPLAY_MODE 	 = $categoryConfig['cateogry_display_mode'];
	$MAX_ITEM_ROW 	 = $themeConfig['listing_products_columns']?$themeConfig['listing_products_columns']:3;
	$MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small'] ;
	$MAX_ITEM_ROW_MINI  = $categoryConfig['listing_products_columns_minismall'];
	$categoryPzoom 	    = $categoryConfig['category_pzoom'];
	$quickview=$themeConfig['quickview'];
?>
<?php echo $header; ?>

<?php if( $SPAN[0] ): ?>
	<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12">
		<?php echo $column_left; ?>
	</aside>
<?php endif; ?>
<!-- <section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12"> -->
<section class="col-sm-12 col-xs-12">
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>

<div id="content"><?php echo $content_top; ?>

  <h1 class="heading_title"><span><?php echo $heading_title; ?></span></h1>

  <?php if ($thumb || $description) { ?>
    <?php if (false) { //if ($thumb) { ?>
    <div class="category-info clearfix">
      <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div><hr>
    </div>
    <?php } ?>
  <?php } ?>

  <?php if ($categories) { ?>
  <div class="category-list clearfix">
  <h2 class="heading_title"><span><?php echo $text_refine; ?></span></h2>
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) {
      	$name = str_replace("(", '<span>(',  $category['name'] );
        $category['name'] = str_replace(")", ')</span>', $name);
       ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) {
    	$name = str_replace("(", '<span class="">(',  $categories[$i]['name'] );
        $categories[$i]['name'] = str_replace(")", ')</span>', $name);
    	?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>






  <?php if ($products) { ?>

    <div class="product-filter clearfix">
      <?php if (false) { ?>
      <div class="display">
    		<span><?php echo $text_display; ?></span>
    		<span><?php echo $text_list; ?></span>
    		<a onclick="display('grid');"><?php echo $text_grid; ?></a>
    	</div>
      <?php } ?>

    	<div class="limit custom-select-wrapper"><span><?php echo $text_limit; ?></span>
    		<label class="custom-select-inner">
  	      <select class="form-control custom-select" onchange="location = this.value;">
  	        <?php foreach ($limits as $limits) { ?>
  	        <?php if ($limits['value'] == $limit) { ?>
  	        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
  	        <?php } else { ?>
  	        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
  	        <?php } ?>
  	        <?php } ?>
  	      </select>
      	</label>
      </div>

      <div class="product-compare "><a href="<?php echo $compare; ?>" id="compare-total" class="btn"><?php echo $text_compare; ?></a></div>

      <div class="sort custom-select-wrapper"><span><?php echo $text_sort; ?></span>
        <label class="custom-select-inner">
  	      <select class="form-control custom-select" onchange="location = this.value;">
  	        <?php foreach ($sorts as $sorts) { ?>
  	        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  	        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  	        <?php } else { ?>
  	        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  	        <?php } ?>
  	        <?php } ?>
  	      </select>
      	</label>
      </div>

    </div>




<div class="product-list"> <div class="products-block">
    <?php
	$cols = $MAX_ITEM_ROW ;
	$span = floor(12/$cols);
	$small = floor(12/$MAX_ITEM_ROW_SMALL);
	$mini = floor(12/$MAX_ITEM_ROW_MINI);
	foreach ($products as $i => $product) { ?>
	<?php if(false){//( $i++%$cols == 0 ) { ?>
		  <div class="row">
	<?php } ?>
    <!-- <div class="col-xs-6 col-lg-<?php echo $span;?> col-sm-<?php echo $small;?> col-xs-<?php echo $mini;?>"> -->
    <div class="col-xs-6 col-lg-3 col-md-4">
    	<div class="product-block">
	      <?php if ($product['thumb']) { ?>
	      <div class="image"><?php if( $product['special'] ) {   ?>
	    	<span class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></span>
	    	<?php } ?>

	    		<a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>

	      	<?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
	      	<a href="<?php echo $zimage;?>" class="colorbox product-zoom hidden-sm hidden-xs" rel="colorbox" title="<?php echo $product['name']; ?>"><span class="icon-zoom-in"></span></a>
	      	<?php } ?>

	      	<?php //#2 End fix quickview in fw?>
	      	    <?php
      			if( $categoryConfig['show_swap_image'] ){
	      		$product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
				if(isset($product_images) && !empty($product_images)) {
					$thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
				?>
				<div class="faceback hidden-xs hidden-sm">
					<a class="img back" href="<?php echo $product['href']; ?>">
						<img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>">
					</a>
				</div>
				<?php } } ?>

			<?php //#2 Start fix quickview in fw?>
				<?php if ($quickview) { ?>
					<a class="pav-colorbox hidden-sm hidden-xs" href="index.php?route=themecontrol/product&amp;product_id=<?php echo $product['product_id']; ?>"><?php echo $this->language->get('quick_view'); ?></a>
				<?php } ?>
	      </div>
	      <?php } ?>
		<div class="product-meta">
	        <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
	        <div class="description">
				<?php echo utf8_substr( strip_tags($product['description']),0,100);?>...
			</div>

			 <?php if ($product['rating']) { ?>
				<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
			<?php } ?>

	         <?php if ($product['price']) { ?>
			 <div class="price">
				  <?php if (!$product['special']) { ?>
				  <?php echo $product['price']; ?>
				  <?php } else { ?>
				  <span class="price-new"><?php echo $product['special']; ?></span>
				  <span class="price-old"><?php echo $product['price']; ?></span>
				  <?php } ?>
				  <span class="cart"> <input type="button"  value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></span>

			</div>
			  <?php } ?>

			<div class="product-hover">
		        <div class="wishlist pull-right"><a  onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $this->language->get("button_wishlist"); ?></a></div>
		        <div class="compare pull-right"><a class="pavicon-compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $this->language->get("button_compare"); ?></a></div>
    		</div>
		</div>
	    </div>
		</div>
	 <?php if (false) { //( $i%$cols == 0 || $i==count($products) ) { ?>
	 </div>
	 <?php } ?>

    <?php } ?>
  </div>
  </div>

   <div class="pagination"><?php echo $pagination; ?></div>
   <?php if ($description) { ?>
    <div class="category-description"><hr><div class="description"><?php echo $description; ?></div><hr></div>
    <?php } ?>

  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		$('.product-list .image').addClass('col-lg-4 col-md-4 col-sm-4 col-xs-4');
		$('.product-list .product-meta').attr('class','product-meta-list col-lg-8 col-md-8 col-sm-8 col-xs-8');

		$('.products-block  .product-block').each(function(index, element) {
			 $(element).parent().addClass("col-fullwidth");
		});
		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list active"><em><?php echo $text_list; ?></em></a><a class="grid"  onclick="display(\'grid\');"><em><?php echo $text_grid; ?></em></a>');

		$.totalStorage('display', 'list');
	} else {
		$(".image").removeClass("col-lg-4 col-md-4 col-sm-4 col-xs-4");
		$(".product-meta-list").attr('class','product-meta');
		$('.product-list').attr('class', 'product-grid');

		$('.products-block  .product-block').each(function(index, element) {
			 $(element).parent().removeClass("col-fullwidth");
		});

		$('.display').html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"></span><em><?php echo $text_list; ?></em></a><a class="grid active"><em><?php echo $text_grid; ?></em></a>');

		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('<?php echo $DISPLAY_MODE;?>');
}
//--></script>
<?php if( $categoryPzoom ) {  ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: false,
		onLoad:function(){
			$("#cboxNext").remove(0);
			$("#cboxPrevious").remove(0);
			$("#cboxCurrent").remove(0);
		}
	});

});
//--></script>
<?php } ?>
</section>

<?php if( $SPAN[2] ): ?>
	<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12">
		<?php //echo $column_right; ?>
	</aside>
<?php endif; ?>

<?php echo $footer; ?>