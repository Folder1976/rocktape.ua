<?php

	$themeConfig = (array)$this->config->get( 'themecontrol' );
	$themeName =  $this->config->get('config_template');
	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$helper->setDirection( $direction );
	/* Add scripts files */
	$helper->addScript( 'catalog/view/javascript/jquery/jquery-1.7.1.min.js' );
	$helper->addScript( 'catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js' );
	$helper->addScript( 'catalog/view/javascript/jquery/ui/external/jquery.cookie.js' );
	$helper->addScript( 'catalog/view/javascript/common.js' );
	$helper->addScript( 'catalog/view/theme/'.$themeName.'/javascript/common.js' );
	$helper->addScript( 'catalog/view/javascript/jquery/bootstrap/bootstrap.min.js' );
	$helper->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
	$helper->addScriptList( $scripts );

	$helper->addCss( 'catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css' );
	if( isset($themeConfig['customize_theme'])
		&& file_exists(DIR_TEMPLATE.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css') ) {
		$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/customize/'.$themeConfig['customize_theme'].'.css'  );
	}

	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/animation.css' );
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/font-awesome.min.css' );
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/font.css' );
	$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/dev.css' );
	$helper->addCss( 'catalog/view/javascript/jquery/colorbox/colorbox.css' );

	$helper->addCss( 'catalog/view/javascript/slick-slider/slick.css' );
	$helper->addScript( 'catalog/view/javascript/slick-slider/slick.min.js' );
	$helper->addCssList( $styles );
	$layoutMode = $helper->getParam( 'layout' );

?>
<!DOCTYPE html>
<html dir="<?php echo $helper->getDirection(); ?>" class="<?php echo $helper->getDirection(); ?>" lang="<?php echo $lang; ?>">
<head>
<!-- Mobile viewport optimized: h5bp.com/viewport -->
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($helper->getCssLinks() as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
	<?php if( isset($themeConfig['theme_width'])  && $themeConfig['theme_width'] &&  $themeConfig['theme_width'] != 'auto' ) { ?>
			<style> #page-container .container{max-width:<?php echo $themeConfig['theme_width'];?>; width:auto}</style>
	<?php } ?>

	<?php if( isset($themeConfig['use_custombg']) && $themeConfig['use_custombg'] ) {	?>
	<style>
		body{
			background:url( "image/<?php echo $themeConfig['bg_image'];?>") <?php echo $themeConfig['bg_repeat'];?>  <?php echo $themeConfig['bg_position'];?> !important;
		}</style>
	<?php } ?>
<?php
	if( isset($themeConfig['enable_customfont']) && $themeConfig['enable_customfont'] ){
	$css=array();
	$link = array();
	for( $i=1; $i<=3; $i++ ){
		if( trim($themeConfig['google_url'.$i]) && $themeConfig['type_fonts'.$i] == 'google' ){
			$link[] = '<link rel="stylesheet" type="text/css" href="'.trim($themeConfig['google_url'.$i]) .'"/>';
			$themeConfig['normal_fonts'.$i] = $themeConfig['google_family'.$i];
		}
		if( trim($themeConfig['body_selector'.$i]) && trim($themeConfig['normal_fonts'.$i]) ){
			$css[]= trim($themeConfig['body_selector'.$i])." {font-family:".str_replace("'",'"',htmlspecialchars_decode(trim($themeConfig['normal_fonts'.$i])))."}\r\n"	;
		}
	}
	echo implode( "\r\n",$link );
?>
<style>
	<?php echo implode("\r\n",$css);?>
</style>
<?php } else { ?>

<?php if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) { ?>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,700|Poppins:300,400,500" rel="stylesheet">
<?php } else { ?>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,700|Poppins:300,400,500" rel="stylesheet">
<?php } ?>


<?php } ?>

<?php foreach( $helper->getScriptFiles() as $script )  { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
<link  href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/paneltool.css" rel="stylesheet"/>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorpicker/js/colorpicker.js"></script>
<link  href="catalog/view/javascript/jquery/colorpicker/css/colorpicker.css" rel="stylesheet" />
<?php } ?>

<?php if( isset($themeConfig['custom_javascript'])  && !empty($themeConfig['custom_javascript']) ){ ?>
	<script type="text/javascript"><!--
		$(document).ready(function() {
			<?php echo html_entity_decode(trim( $themeConfig['custom_javascript']) ); ?>
		});
//--></script>
<?php }	?>

<!--[if lt IE 9]>
<?php if( isset($themeConfig['load_live_html5'])  && $themeConfig['load_live_html5'] ) { ?>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<?php } else { ?>
<script src="catalog/view/javascript/html5.js"></script>
<?php } ?>
<script src="catalog/view/javascript/respond.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $themeName;?>/stylesheet/ie8.css" />
<![endif]-->

<?php if ( isset($stores) && $stores ) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php // echo $google_analytics; ?>
</head>
<body id="offcanvas-container" class="offcanvas-container layout-<?php echo $layoutMode; ?> fs<?php echo $themeConfig['fontsize'];?> <?php echo $helper->getPageClass();?> <?php echo $helper->getParam('body_pattern','');?>">


<?php if (false) { ?>
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-5QL4L2"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5QL4L2');</script>
<!-- End Google Tag Manager -->
<?php } ?>


<section id="page" class="offcanvas-pusher" role="main">
<section id="header">
		<section id="topbar">
			<div class="container"><div class="container-inner">
				<div class="col-lg-8 col-md-8 hidden-sm hidden-xs pull-left wrapper">
					<div class="links pull-left ">
						<!-- <li><a class="first" href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li> -->
                        <div class="account-access pull-left">
                        <a class="account" href="<?php echo $account; ?>"><?php echo $text_account; ?>
                        </a>
	                        <div class="welcome">
								<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
								<?php } else { ?>
								<?php echo $text_logged; ?>
								<?php } ?>
							</div>
                    	</div>
						<a class="wishlist" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
						<!-- <a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a> -->
						<a class="last checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> 
						<!-- <a class="last checkout" href="/garantiya">Гарантия</a><a class="last checkout" href="/garantiya">Гарантия</a> -->
					</div>
					<div class="pull-left">
						<div class="social_custom">
							<div class="box-content">
								<div class="list-folow">
									<!-- <a data-original-title="Google-plus" data-placement="bottom" data-toggle="tooltip" href="https://plus.google.com/110252421626037566488" title=""><i class="icon-google-plus">&nbsp;</i></a> -->
									<a data-original-title="Facebook" data-placement="bottom" data-toggle="tooltip" href="https://www.facebook.com/rocktapeukraine/" title=""><i class="icon-facebook">&nbsp;</i></a>
									<a data-original-title="Instagram" data-placement="bottom" data-toggle="tooltip" href="https://www.instagram.com/rocktape_ukraine/" title=""><i class="icon-instagram">&nbsp;</i></a>
									<a data-original-title="YouTube" data-placement="bottom" data-toggle="tooltip" href="https://www.youtube.com/channel/UCIhWc7-bNR35LZamIcSIU8w" title=""><i class="icon-youtube">&nbsp;</i></a>
									<!-- <a data-original-title="Vk" data-placement="bottom" data-toggle="tooltip" href="https://vk.com/rocktapeua" title=""><i class="icon-vk">&nbsp;</i></a> -->
								</div>
							</div>
						</div>
					</div>

                    <!-- <div class="currency pull-left">
                        <?php echo $currency; ?>
                    </div> -->
                    <div class="language pull-left">
                        <?php echo $language; ?>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 hidden-sm hidden-xs pull-right">
                    <?php echo $cart; ?>
                </div>

                <div class="show-mobile hidden-lg hidden-md pull-left">
					<div class="quick-user pull-left hidden-sm">
						<div class="quickaccess-toggle">
							<i class="icon-user"></i>
						<div class="inner-toggle">
							<div class="login links">
							Welcome visitor you can
							<?php if (!$logged) { ?>
								<?php echo $text_welcome; ?>
							<?php } else { ?>
								<?php echo $text_logged; ?>
							<?php } ?>
							</div>
						</div>
						</div>
					</div>
					<div class="quick-access pull-left">
						<div class="quickaccess-toggle">
							<i class="icon-list"></i>
							<div class="inner-toggle ">
								<ul >
									<li><a class="account" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a class="wishlist" href="<?php echo $wishlist; ?>" id="mobile-wishlist-total"><?php echo $text_wishlist; ?></a></li>
									<li><a class="shoppingcart" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
									<li><a class="last checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="quick-setting pull-left">
						<div class="quickaccess-toggle">
							<i class="icon-cog"></i>
							<div class="inner-toggle">
								<div class="currency pull-left">
			                        <?php echo $currency; ?>
			                    </div>
			                    <div class="language pull-left">
			                        <?php echo $language; ?>
			                    </div>
							</div>
						</div>
					</div>

					<div class="quick-setting pull-left">
						<div class="quickaccess-toggle">
							<a href="<?php echo $checkout; ?>"><i class="icon-shopping-cart"></i></a>
						</div>
					</div>

					<div class="hidden-xs welcome pull-right">
						<?php if (!$logged) { ?>
						<?php echo $text_welcome; ?>
						<?php } else { ?>
						<?php echo $text_logged; ?>
						<?php } ?>
					</div>
				</div>


			</div></div>
		</section>
		<section id="header-main">
			<div class="container">
				<div class="row header-wrap">
					<div class="col-lg-6 col-md-4 col-sm-12 col-xs-12 inner">
					  <?php if ($logo) { ?>
					  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
					  <?php } ?>

                        <div id="search" class="hidden-md hidden-sm hidden-xs">
                            <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" class="<?php echo $seo_search; ?>" />
                            <span class="button-search"></span>
                        </div>


					</div>

					<div class="header-right col-lg-6 col-md-8 col-sm-12 col-xs-12 header-hidden inner">
						<?php
							$LANGUAGE_ID = $this->config->get( 'config_language_id' );
					 		if( isset($themeConfig['widget_delivery_data'][$LANGUAGE_ID]) ) { ?>
							<?php echo html_entity_decode( $themeConfig['widget_delivery_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>

					 	<?php } ?>
					</div>

				</div>
			</div>
	  </section>
<section id="pav-mainnav">
	<div class="container">
		<div class="mainnav-wrap">
			<div class="row">
				<div class="hidden-lg col-md-2 col-sm-9 col-xs-9 pull-right">
                        <div id="search-small">
                            <input type="text" name="search1" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
                            <span class="button-search"></span>
                        </div>
				</div>
				<div class="col-lg-11 col-md-10 col-sm-12 col-xs-12">
				 	<div class="navbar navbar-inverse">
				<nav class="pav-megamenu" role="navigation">
						<?php
						/**
						 * Main Menu modules: as default if do not put megamenu, the theme will use categories menu for main menu
						 */
						$modules = $helper->getModulesByPosition( 'mainmenu' );
						if( count($modules) && !empty($modules) ){

						?>

							<?php foreach ($modules as $module) { ?>
								<?php echo $module; ?>
							<?php } ?>

						<?php } elseif ($categories) {  ?>


							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								</button>
							</div>

						    <div class="collapse navbar-collapse navbar-ex1-collapse">
							    <ul class="nav navbar-nav">
									<?php foreach ($categories as $category) { ?>
									<?php if ($category['children']) { ?>
									<li class="parent dropdown deeper "><a href="<?php echo $category['href'];?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?>
									<b class="caret"></b>
									</a>
									<?php } else { ?>
									<li ><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
									<?php } ?>
									<?php if ($category['children']) { ?>
									  <ul class="dropdown-menu">
										<?php for ($i = 0; $i < count($category['children']);) { ?>

										  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
										  <?php for (; $i < $j; $i++) { ?>
										  <?php if (isset($category['children'][$i])) { ?>
										  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
										  <?php } ?>
										  <?php } ?>

										<?php } ?>
									  </ul>
									  <?php } ?>
									</li>
									<?php } ?>
									<li><a href="http://training.rocktape.ua/" target="_blank">Обучение</a></li>
									<li><a href="<?php echo $shipping; ?>" title="<?php echo $text_shipping; ?>"><?php echo $text_shipping; ?></a></li>
									<li><a href="<?php echo $contact; ?>" title="<?php echo $text_contact; ?>"><?php echo $text_contact; ?></a></li>
									<li><a href="http://rocktape.ua/pavblog" title="<?php echo $text_blog; ?>"><?php echo $text_blog; ?></a></li>
								</ul>
							</div>
						<?php } ?>
				</nav>

				  	</div>
				</div>

			</div>
		</div>
	</div>
</section>  <!-- /#pav-mainnav -->
</section>  <!-- /#header -->




<?php if ( true ) { // if (   [ ГЛАВНАЯ СТРАНИЦА ]   ) { ?>
<section class="home-full-video">
	<div class="home-full-video__wrap">
		<video loop="loop" autoplay="" playsinline="" muted="" preload="none" src="/image/data/video/video-1.mp4" style="margin: 0px;" width="1280" height="720">
			<source type="video/mp4" src="/image/data/video/video-1.mp4">
			<source type="video/webm" src="/image/data/video/video-1.webm">
		</video>
	</div>

	<div class="home-full-video__content">
		<div class="home-full-video__content-inner">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<h1 class="home-full-video__title">PAIN STOPS HERE</h1>
					<p class="home-full-video__text">Делай снова то, что ты любишь. Двигайся больше и лучше с RockTape!</p>
					<a href="/apparel" class="home-full-video__link btn-theme-primary">Купить продукцию</a>
					<a href="//rocklab.rocktape.ua" class="home-full-video__link btn-theme-primary">Помощь специалиста</a>
				</div>
			</div>
		</div>
		</div>
	</div>
</section>




<?php
// home slider
$home_slider = array(
	array(
		'title' => "The Official Knee Sleeves of CrossFit®",
		'text' => "Competition-grade CrossFit® knee protection designed for the demands of the world’s most intense fitness movement. Slay your workout.",
		'btn_text' => "Explore Assassins",
		'btn_href' => "#",
		'image' => "/image/data/home-slider/CF-Assassins.png",
		'background' => '#111111',
		'background_btn' => '#c8102e',
	),
	array(
		'title' => "Kinesiology Tape Perfected.",
		'text' => "We’ve perfected RockTape, and it’s called Edge. RockTape + RockSauce for powerful pain* relief to go.",
		'btn_text' => "Explore RockTape Edge",
		'btn_href' => "#",
		'image' => "/image/data/home-slider/2xEdge-H2O-Black-PreCut-1.png",
		'background' => '#c8102e',
		'background_btn' => '#111111',
	),
	array(
		'title' => "Pain? Meet Fire and Ice.",
		'text' => "Muscle and joint pain* doesn’t stand a chance. Meet the new RockSauce family.",
		'btn_text' => "Explore RockSauce",
		'btn_href' => "#",
		'image' => "/image/data/home-slider/rs-slide.png",
		'background' => '#111111',
		'background_btn' => '#c8102e',
	),
	array(
		'title' => "Supercharge your stretch.",
		'text' => "Meet RockFloss, the newest & most versatile muscle and joint recovery tool. Easy & infinitely reusable.",
		'btn_text' => "Explore RockFloss",
		'btn_href' => "#",
		'image' => "/image/data/home-slider/RockFloss_Band.png",
		'background' => '#c8102e',
		'background_btn' => '#111111',
	),
);
?>
<div id="home-slider" class="h-slider">
	<?php foreach ($home_slider as $slide) { ?>
	<div class="h-slider__item" style="background: <?php echo $slide['background']; ?>">
		<div class="h-slider__inner">
			<div class="h-slider__left-col">
		  	<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>" class="h-slider__img">
		  </div>
		  <div class="h-slider__right-col">
		  	<h2 class="h-slider__title"><?php echo $slide['title']; ?></h2>
		  	<div class="h-slider__text"><?php echo $slide['text']; ?></div>
		  	<a href="<?php echo $slide['btn_href']; ?>" class="h-slider__btn btn-theme-primary" style="background: <?php echo $slide['background_btn']; ?>"><?php echo $slide['btn_text']; ?></a>
		  </div>
		</div>
	</div>
	<?php } ?>
</div>







<?php
$home_slider_popular = array(
	array(
		'title' => 'RockTape',
		'text' => 'Лучший в мире кинезио тейп',
		'image' => '/image/data/home-slider-popular/Medical-Tape-510x382.jpg',
		'href' => '/kinesio-tapes',
	),
	array(
		'title' => 'Экипировка',
		'text' => 'Ваша защита в самых жестких воркаутах',
		'image' => '/image/data/home-slider-popular/Retail-Assassins-510x382.jpg',
		'href' => '/outfit',
	),
	array(
		'title' => 'RockSouce',
		'text' => 'Эффективное обезболивание в спортивной медицине',
		'image' => '/image/data/home-slider-popular/Medical-Topicals-510x382.jpg',
		'href' => '/rock-sause',
	),
	array(
		'title' => 'RockFloss',
		'text' => 'Твой помощник для улучшения мобильности',
		'image' => '/image/data/home-slider-popular/Retail-Floss-510x382.png',
		'href' => '/rockfloss',
	),
	array(
		'title' => 'Помощь специалиста',
		'text' => 'Найди RockDoc-а в своем городе',
		'image' => '/image/data/home-slider-popular/Retail-Find-Doc-1-510x382.jpg',
		'href' => '/help-specialist',
	),



	array(
		'title' => 'Помощь специалиста',
		'text' => 'Найди RockDoc-а в своем городе',
		'image' => '/image/data/home-slider-popular/Retail-Find-Doc-1-510x382.jpg',
		'href' => '/help-specialist',
	),
	array(
		'title' => 'Помощь специалиста',
		'text' => 'Найди RockDoc-а в своем городе',
		'image' => '/image/data/home-slider-popular/Retail-Find-Doc-1-510x382.jpg',
		'href' => '/help-specialist',
	),
	array(
		'title' => 'Помощь специалиста',
		'text' => 'Найди RockDoc-а в своем городе',
		'image' => '/image/data/home-slider-popular/Retail-Find-Doc-1-510x382.jpg',
		'href' => '/help-specialist',
	),
	array(
		'title' => 'Помощь специалиста',
		'text' => 'Найди RockDoc-а в своем городе',
		'image' => '/image/data/home-slider-popular/Retail-Find-Doc-1-510x382.jpg',
		'href' => '/help-specialist',
	),
);
?>


<div id="home-slider-popular" class="h-slider-popular">
	<div class="slider__arrows">
	  <div class="slider__arrow slider__arrow--prev">
	    <span></span>
	  </div>
	  <div class="slider__arrow slider__arrow--next">
	    <span></span>
	  </div>
	</div>

	<div class="h-slider-popular__list">
		<?php foreach ($home_slider_popular as $slide) { ?>
		<div class="h-slider-popular__item">
			<a href="<?php echo $slide['href']; ?>" class="h-slider-popular__link">
				<div class="h-slider-popular__image">
					<img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>">
				</div>
				<div class="h-slider-popular__meta">
					<span class="h-slider-popular__icon">+</span>
					<div class="h-slider-popular__title"><?php echo $slide['title']; ?></div>
					<div class="h-slider-popular__text"><?php echo $slide['text']; ?></div>
				</div>
			</a>
		</div>
		<?php } ?>
	</div>
</div>
<?php } ?>



<section class="subscribe">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2 class="subscribe__title">Будь в курсе новостей</h2>
				<div class="subscribe__text">Подпишитесь на нашу рассылку, чтобы оставаться в курсе последних новостей от RockTape, включая новые продукты, рекламные акции и события в вашем регионе.</div>
			</div>
			<div class="col-md-6">
				<form action="" method="post">
					<input class="form-control" type="text" name="name" value="" placeholder="Имя" required>
					<input class="form-control" type="email" name="email" value="" placeholder="Email" required>
					<input type="submit" value="Подписаться" class="button">
				</form>
			</div>
		</div>
	</div>
</section>


















<?php
/**
 * Slideshow modules
 */
$modules = $helper->getModulesByPosition( 'slideshow' );
if( $modules ){
?>
<section id="pav-slideshow" class="pav-slideshow">
	<div class="container">
		<div class="row">
			<?php foreach ($modules as $module) { ?>
				<?php echo $module; ?>
			<?php } ?>
		</div>
	</div>
</section>
<?php } ?>

<?php
/**
 * Promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 */
$modules = $helper->getModulesByPosition( 'showcase' );
$ospans = array();

if( count($modules) ){
$cols = isset($config['block_showcase'])&& $config['block_showcase']?(int)$config['block_showcase']:count($modules);
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-showcase" id="pavo-showcase">
	<div class="container">
	<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if(  $i++%$cols == 0 || count($modules)==1  ){  $j=1;?><div class="row"><?php } ?>
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
	<?php  $j++;  } ?>
	</div>
</section>
<?php } ?>
<?php
/**
 * Promotion modules
 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
 */
$modules = $helper->getModulesByPosition( 'promotion' );
$ospans = array();

if( count($modules) ){
$cols = isset($config['block_promotion'])&& $config['block_promotion']?(int)$config['block_promotion']:count($modules);
$class = $helper->calculateSpans( $ospans, $cols );
?>
<section class="pav-promotion" id="pav-promotion">
	<div class="container">
	<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
			<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>
			<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
	<?php  $j++;  } ?>
	</div>
</section>
<?php } ?>
<section id="sys-notification">
	<div class="container">

		<?php if ( isset($error) && $error ) { ?>
    		<div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    	<?php } ?>

		<div id="notification"></div>
	</div>
</section>



	<?php if( isset($themeConfig['enable_offsidebars']) && $themeConfig['enable_offsidebars'] ) { ?>
	<section id="columns" class="offcanvas-siderbars"><div class="container">
	<div class="row visible-xs"><div class="container">
		<div class="offcanvas-sidebars-buttons">
			<button type="button" data-for="column-left" class="pull-left btn btn-danger"><i class="glyphicon glyphicon-indent-left"></i> <?php echo $this->language->get('text_sidebar_left'); ?></button>

			<button type="button" data-for="column-right" class="pull-right btn btn-danger"><?php echo $this->language->get('text_sidebar_right'); ?> <i class="glyphicon glyphicon-indent-right"></i></button>
		</div>
	</div></div>
	<?php }else { ?>
	<section id="columns"><div class="container">
	<?php } ?>
	<div class="row">