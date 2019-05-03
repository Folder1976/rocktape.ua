<?php 
	$cols = 4;
	$span = 12/$cols;
  $themeConfig = (array)$this->config->get('themecontrol');
  $categoryConfig = array( 
    'show_swap_image'  => 0
  ); 

  $categoryConfig  = array_merge($categoryConfig, $themeConfig );
?>
<div class="box box-product special highlighted nopadding">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-product" >
			  <?php foreach ($products as $i => $product) { ?>
				 <?php if( $i++%$cols == 0 ) { ?>
				  <div class="row">
				<?php } ?> 
			  <div class="product-item col-lg-<?php echo $span;?>">
        <?php if($i==1) {?>
        <div class="product-block first">
        <?php }else{ ?>
        <div class="product-block">
        <?php } ?>
      <?php if ($product['thumb']) { ?>
      <div class="image">
        <a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a> 
        <?php //#2 End fix quickview in fw?>
          <?php 
          if( $categoryConfig['show_swap_image'] ){
            $product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
            if(isset($product_images) && !empty($product_images)) {
              $thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
                ?>  
            <div class="faceback">
              <a class="img back" href="<?php echo $product['href']; ?>">
                <img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>">
              </a>  
            </div>    
          <?php } } ?>       
      </div>
      <?php } ?>
          <div class="product-meta">
        <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
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
          </div>
        <?php } ?>
    </div>
			  </div></div>
			  
			 <?php if( $i%$cols == 0 || $i==count($products) ) { ?>
				 </div>
				<?php } ?>
			
			  <?php } ?>

    </div>
  </div>
   </div>
