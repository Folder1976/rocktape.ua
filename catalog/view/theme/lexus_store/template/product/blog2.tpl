<?php echo $header; ?>

<?php
/*
Инструкторы
http://rocktape.ua/instructor
*/
?>

<?php
/*
$version = "001";
	$themeConfig = (array)$this->config->get( 'themecontrol' );
	$themeName =  $this->config->get('config_template');
	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$helper->setDirection( $direction );
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/blog.css?'.$version );
*/
?>


</div></div></div>

<section class="page-product-blog__section mb0 ppb-instructors">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-product-blog__section-title">Наши инструкторы</h1>
                <br><br>
           </div>
        </div>
        <div class="row">
            <?php
            $row = 1;
            $col = 0;
            ?>
            <?php foreach($banners as $banner){ ?>
                <?php
                if ( $col == 4 ) {
                    $row++;
                    $col = 1;
                } else {
                    $col++;
                }
                ?>
                <div class="col-md-3 col-sm-6">
                    <div class="instructor">
                        <div class="instructor__foto">
                           <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
                        </div>
                        <div class="instructor__name"><?php echo $banner['title']; ?></div>
                        <div class="instructor__post"><?php echo $banner['btn_text']; ?></div>
                        <div class="instructor__text"><?php echo $banner['text']; ?></div>
                        <a href="<?php echo $banner['link']; ?>" target="_blank" class="instructor__link"><?php echo $banner['background']; ?></a>
                    </div>
                </div>

                <?php if ( $col == 2 ) { ?>
                    <div class="clearfix visible-sm"></div>
                <?php } ?>
    
                <?php if ( $col == 4 ) { ?>
                    <div class="clearfix"></div>
                <?php } ?>
            <?php } ?>
         
        </div>
    </div>
</section>





<?php echo $footer; ?>

