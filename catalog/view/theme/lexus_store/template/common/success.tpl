<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl" ); ?>
<?php echo $header; ?>

<?php if( $SPAN[0] ): ?>
<aside class="col-lg-<?php echo $SPAN[0];?> col-sm-<?php echo $SPAN[0];?> col-xs-12">
	<?php echo $column_left; ?>
</aside>
<?php endif; ?>

<section class="col-lg-<?php echo $SPAN[1];?> col-sm-<?php echo $SPAN[1];?> col-xs-12">
    <?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl" );  ?>
    <div id="content">
        <?php echo $content_top; ?>
        <h1><?php echo $heading_title; ?></h1>    
        <?php echo $text_message; ?>
        <?php if(isset($order_info) && $order_info['payment_method'] == 'Наложенный платеж'): ?>
            <p style="color: red;">Внимание! В стоимость заказа не включены расходы на услуги Новой почты за доставку товара и денежный перевод.</p>
        <?php endif; ?>
        <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</section> 


<?php if( $SPAN[2] ): ?>
<aside class="col-lg-<?php echo $SPAN[2];?> col-sm-<?php echo $SPAN[2];?> col-xs-12">	
	<?php echo $column_right; ?>
</aside>
<?php endif; ?>
<?php if(isset($order_info) && !empty($order_info)){?>
            <script>
            dataLayer.push({
            'event': 'transaction',
            'transactionId': '<?php echo $order_info["order_id"];?>',
            'transactionAffiliation': 'RockTapeWebStore',
            'transactionTotal': '<?php echo number_format($order_info["total"],2,'.', '');?>',                              // сумма заказа
            'couponCode': undefined,
            'transactionProducts': [
            <?php foreach($order_products as $product){?>
                    {                                  
                        'sku': '<?php echo $product["model"];?>',
                        'name': '<?php echo $product["name"];?>',
                        'category': '<?php echo $product["cname"];?>',
                        'price': '<?php echo number_format($product["price"],2,'.', '');?>',
                        'brand': '<?php echo $product["mname"];?>',
                        'quantity': <?php echo $product["quantity"];?>
                    },
            <?php } ?>
            ]
        });
</script>      
<?php } ?> 
<?php echo $footer; ?>
