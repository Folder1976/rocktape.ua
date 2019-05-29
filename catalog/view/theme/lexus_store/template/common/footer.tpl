<?php 
	/******************************************************
	 * @package Pav Megamenu module for Opencart 1.5.x
	 * @version 1.1
	 * @author http://www.pavothemes.com
	 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
	 * @license		GNU General Public License version 2
	*******************************************************/

	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
	$themeConfig = (array)$this->config->get('themecontrol');
	$themeName =  $this->config->get('config_template');
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$LANGUAGE_ID = $this->config->get( 'config_language_id' );  
?>
</div></div></section>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'mass_bottom'); 
	$ospans = array('2','9','3');
	$cols   = 2;
	if( count($modules) ) { 
		$class = $helper->calculateSpans( $ospans, $cols );
?>


	<?php if ( $_SERVER['REQUEST_URI'] != '/' ) { ?>
	<section class="subscribe">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2 class="subscribe__title">Будь в курсе новостей</h2>
					<div class="subscribe__text">Подпишитесь на нашу рассылку, чтобы оставаться в курсе последних новостей от RockTape, включая новые продукты, рекламные акции и события в вашем регионе.</div>
				</div>
				<div class="col-md-6">
					<form action="javascript:;" method="post" class="form_podpiska">
						<input type="hidden" name="subj" value="Подписаться на новости">
						<input class="form-control" type="text" name="name" value="" placeholder="Имя" required>
						<input class="form-control" type="email" name="email" value="" placeholder="Email" required>
						<input type="submit" value="Подписаться" class="button send_mail">
					</form>
				</div>
			</div>
		</div>
	</section>
	<?php } ?>


	<?php if(false){ ?>
	<section id="pav-mass-bottom">
		<div class="container">
				<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
					<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
					<div class="<?php echo $class[$j];?>  col-sm-6"><?php echo $module; ?></div>
					<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
				<?php  $j++; } ?>
			</div>
	</section>
	<?php } ?>
<?php } ?>
<section id="footer">
	<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_top' ); 
	$ospans = array();
	$cols   = 1;
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_top'])&& $themeConfig['block_footer_top']?(int)$themeConfig['block_footer_top']:count($modules);
	//if( $cols < count($modules) ){ $cols = count($modules); }
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
		<div class="footer-top">
		<div class="container">
			<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
				<div class="<?php echo $class[$j];?>  col-md-6"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
			<?php  $j++;  } ?>
		</div>
	</div>
	<?php } ?>
	
	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_center'); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_center'])&& $themeConfig['block_footer_center']?(int)$themeConfig['block_footer_center']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-center">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
	<?php } elseif((isset($themeConfig['enable_footer_center'])&&$themeConfig['enable_footer_center'])) { ?>


	<?php

	$partners = array(
		array(
			'name' => 'runukraine',
			'logo' => '/image/data/partners/runukraine.png'
		),
		array(
			'name' => 'crossfitbanda',
			'logo' => '/image/data/partners/crossfitbanda.svg'
		),
		array(
			'name' => 'crossfitbanda',
			'logo' => '/image/data/partners/crossfitbanda.svg'
		),
		array(
			'name' => 'runukraine',
			'logo' => '/image/data/partners/runukraine.png'
		),
	);
	?>



	<div class="footer-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="footer-box">
						<h4 class="footer-box__title">Наша миссия</h4>
						<div class="footer-box__text">
							Мы даем врачам, тренерам, спортсменам инструменты, которые помогают их пациентам и им самим быть сильными дольше с помощью лучших кинезиологических тейпов, передового обучения и защитной экипировки. Мы хотим, чтобы люди двигались больше и правильно.
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="footer-box">
						<h4 class="footer-box__title">Последнее из блога</h4>
						<ul class="footer-box__list">
							<?php foreach ($blogs as $blog_link) { ?>
								<li><a href="<?php echo $blog_link['href']; ?>"><?php echo $blog_link['title']; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				</div>
				<div class="clearfix visible-sm visible-xs"></div>
				<div class="col-md-4 col-sm-12">
					<div class="footer-box">
						<h4 class="footer-box__title">Партнеры</h4>

						<img src="/image/data/partners/partners.png" alt="partners" class="partners__img">
						
						<?php if(false){ ?>
						<div class="footer-box__partners">
							<?php foreach ($partners as $partner) { ?>
							<div class="footer-box__partners-item">
								<img src="<?php echo $partner['logo']; ?>" alt="<?php echo $partner['name']; ?>">
							</div>
							<?php } ?>
						</div>
						<?php } ?>


					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="footer-bottom">
		<div class="container">
			<div class="row">
		  		<?php if( isset($themeConfig['widget_contactus_data'][$LANGUAGE_ID]) && trim($themeConfig['widget_contactus_data'][$LANGUAGE_ID]) ) { ?>
				<div class="column col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<div class="box contact-us">
						<div class="box-heading"><span><?php echo $this->language->get('text_contact_us'); ?></span></div>
						<?php echo html_entity_decode( $themeConfig['widget_contactus_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
					</div>
				</div>
				 <?php }else { ?>
				 <div class="column col-xs-12 col-sm-6 col-md-4 col-lg-4">
					<div class="box contact-us">
						<div class="box-heading"><span><?php echo $text_information; ?></span></div>
					   <ul>
					      <?php foreach ($informations as $information) { ?>
					      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					      <?php } ?>
					    </ul>
				   	</div>
				</div> 
				  <?php } ?>
				  
				<div class="column col-xs-12 col-sm-6 col-md-3 col-lg-3">
					<div class="box">
						<div class="box-heading"><span><?php echo $text_service; ?></span></div>
						<ul class="list">
						  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
						  <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
						  <li><a href="<?php echo $about_us; ?>"><?php echo $text_about_us; ?></a></li>
						  <li><a href="<?php echo $about_rocktape; ?>"><?php echo $text_about_rocktape; ?></a></li>
						  <!-- <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>						  -->
						  <li><a href="/garantiya">Гарантия и возврат товаров</a></li>						 
						</ul>
					</div>
				</div>

				<div class="column col-xs-12 col-sm-6 col-md-3 col-lg-3">
					<div class="box">
						<div class="box-heading"><span><?php echo $text_account; ?></span></div>
						<ul class="list">
						  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
						  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						  <li><a href="<?php echo $compare_products; ?>"><?php echo $text_compare; ?></a></li>
						</ul>
					</div>
				</div>
				  
				<div class="column col-xs-12 col-sm-6 col-md-2 col-lg-2">
					<div class="box">
					<div class="box-heading"><span><?php echo $text_extra; ?></span></div>
					<ul class="list">
					  <?php foreach ($informations as $information) { ?>
					  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					  <?php } ?>
					  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
					</ul>
				  </div>
				</div>
			 </div> 
		</div>
	</div>

	<?php  } ?>	
	<?php
	/**
	 * Footer Bottom
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_bottom' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_bottom'])&& $themeConfig['block_footer_bottom']?(int)$themeConfig['block_footer_bottom']:count($modules);	
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-bottom">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
	<?php } ?>

	<div id="powered">
		<div class="container">
			<div class="copyright pull-left">
				<?php if( isset($themeConfig['enable_custom_copyright']) && $themeConfig['enable_custom_copyright'] ) { ?>
					<?php echo $themeConfig['copyright'];?>
				<?php } else { ?>
					<?php echo $powered; ?>
				<?php } ?>
			</div>
			<div class="pull-right">
				<div class="list-folow footer-soc">
					<a data-original-title="Facebook" data-placement="top" data-toggle="tooltip" href="https://www.facebook.com/rocktapeukraine/" title=""><i class="icon-facebook">&nbsp;</i></a>
					<a data-original-title="Instagram" data-placement="top" data-toggle="tooltip" href="https://www.instagram.com/rocktape_ukraine/" title=""><i class="icon-instagram">&nbsp;</i></a>
					<a data-original-title="YouTube" data-placement="top" data-toggle="tooltip" href="https://www.youtube.com/channel/UCIhWc7-bNR35LZamIcSIU8w" title=""><i class="icon-youtube">&nbsp;</i></a>
				</div>
			</div>

			<?php if (false) { // ( isset($themeConfig['widget_paypal_data'][$LANGUAGE_ID]) ) {?>
				<div class="paypal pull-right">
					<?php //echo html_entity_decode( $themeConfig['widget_paypal_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
			</div>
			 <?php } ?>
		</div>
	</div>
</section>

<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
	<?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>
</section> 
</body></html>
