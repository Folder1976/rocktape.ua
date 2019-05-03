<?php 
	$span = 12/$cols; 
?>

<div class="box pav-block bloglatest">
	<div class="box-heading"><h4><span><?php echo $heading_title; ?></span></h4></div>
	<?php if( trim($message) ) { ?>
				<div class="box-description"><?php echo $message;?></div>
				<?php } ?>
		<?php if( !empty($blogs) ) { ?>
		<div class="pavblog-latest clearfix">
			<?php foreach( $blogs as $key => $blog ) { ?>
			<?php //if( $key++%count($blogs) == 0 ) { ?>
			<div class="row">
			<?php //} ?>
				<div class="col-lg-4 col-md-3 col-sm-4 col-xs-12 pavblock">
					<div class="blog-item">					
						<div class="blog-body clearfix">
							
							<div class="image clearfix">
								<?php if( $blog['thumb']  )  { ?>
									<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" alt="<?php echo $blog['title'];?>">
								<?php } ?>
							</div>
							
								<h4 class="blog-title">
									<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
								</h4>

								<div class="description">
									<?php echo utf8_substr( $blog['description'],0, 100 );?>
								</div>

								<p>
									<a href="<?php echo $blog['link'];?>" class="pull-right readmore"><?php echo $this->language->get('text_readmore');?><span class="icon-angle-right"></span></a>
								</p> 
							
							
						</div>	
					</div>
				</div>
			<?php //if( ( $key%count($blogs)==0 || $key == count($blogs)) ){  ?>			
			</div>
			<?php //} ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>

