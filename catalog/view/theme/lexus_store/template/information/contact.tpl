<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" );
    $themeConfig = $this->config->get( 'themecontrol' );
?>
<?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>  
<?php if( $SPAN[0] ): ?>
<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12">
    <?php echo $column_left; ?>
</aside>
<?php endif; ?> 
<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
<div id="content"><?php echo $content_top; ?>
  
  <h1 class="heading_title"><?php echo $heading_title; ?></h1>

            <?php //start contact map ?>
            <div class="contact-location">
                <div id="contact-map"></div>
            </div>
            <?php // Jquery googlemap api v3?>
            <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=ru"></script>
            <script src="catalog/view/javascript/gmap/gmap3.min.js"></script>
            <script src="catalog/view/javascript/gmap/gmap3.infobox.js"></script>
            <script>
                var mapDiv, map, infobox;
                var lat = <?php echo isset($themeConfig['location_latitude'])?$themeConfig['location_latitude']:'40.705423'; ?>;
                var lon = <?php echo isset($themeConfig['location_longitude'])?$themeConfig['location_longitude']:'-74.008616'; ?>;
                jQuery(document).ready(function($) {
                    mapDiv = $("#contact-map");
                    mapDiv.height(400).gmap3({
                        map:{
                            options:{
                                center:[lat,lon],
                                zoom: 15
                            }
                        },
                        marker:{
                            values:[
                                {latLng:[lat, lon], data:"<?php echo isset($themeConfig['location_address'])?$themeConfig['location_address']:'79-99 Beaver Street, New York, NY 10005, USA'; ?>"},
                            ],
                            options:{
                                draggable: false
                            },
                            events:{
                                  mouseover: function(marker, event, context){
                                    var map = $(this).gmap3("get"),
                                        infowindow = $(this).gmap3({get:{name:"infowindow"}});
                                    if (infowindow){
                                        infowindow.open(map, marker);
                                        infowindow.setContent(context.data);
                                    } else {
                                        $(this).gmap3({
                                        infowindow:{
                                            anchor:marker, 
                                            options:{content: context.data}
                                        }
                                      });
                                    }
                                },
                                mouseout: function(){
                                    var infowindow = $(this).gmap3({get:{name:"infowindow"}});
                                    if (infowindow){
                                        infowindow.close();
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
            <?php //end contact map ?>

  <hr>     
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="row">
    <div class="contact-info col-lg-5 col-md-5 col-sm-12 col-xs-12">
    <h2><?php echo $text_location; ?></h2><hr>
      <div class="contact-address">
        <h4><b><?php echo $store; ?></b></h4>
        <ul><li><i class="icon-map-marker"></i><span><b> <?php echo $text_address; ?></b><br />
        <?php echo $address; ?></span></li>
        <?php if ($telephone) { ?>
        <li><i class="icon-phone"></i><span>
		<b> <?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?>
		<br />
		+38 (097) 280-82-01
		</span></li>
        <?php } ?>
        <?php if ($fax) { ?>
        <li><i class="icon-hdd"></i><span><b><?php echo $text_fax; ?></b><br />
        <?php echo $fax; ?></span></li>
        <?php } ?>
        </ul>
        <br>
        <p>Продукция RockTape в других городах Украины у <a href="http://rocktapestore.com.ua/partners" style="color: #C72828;">наших партнеров</a>.</p>
      </div>
    
      <?php  if(  isset($themeConfig['contact_customhtml']) && isset($themeConfig['contact_customhtml'][$this->config->get('config_language_id')]) && trim($themeConfig['contact_customhtml'][$this->config->get('config_language_id')]) ){ ?>
        <div class="contact-customhtml">
            <?php echo html_entity_decode(($themeConfig['contact_customhtml'][$this->config->get('config_language_id')])); ?>
        </div>
        <?php } ?> 

    </div>
    <div class="contact-form col-lg-7 col-md-7 col-sm-12 col-xs-12">
    <h2><?php echo $text_contact; ?></h2><hr>
    <b><?php echo $entry_name; ?></b><br />
    <input class="form-control" type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input class="form-control" type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea class="form-control" name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />

    <div class="navbar-form">
        <div class="form-group">
            <?php if ($site_key) { ?>
	           <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
            <?php } ?>
        </div>
    </div>
    <div class="buttons">
      <div class="center"><input type="submit" value="<?php echo $button_submit; ?>" class="button" /></div>
    </div>
    </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
</section> 
<?php if( $SPAN[2] ): ?>
<aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12"> 
    <?php echo $column_right; ?>
</aside>
<?php endif; ?>
<?php echo $footer; ?>