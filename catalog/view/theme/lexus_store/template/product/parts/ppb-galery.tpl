<section class="page-product-blog__section ppb-galery">
    <div class="container">
        <div class="row">
            <?php foreach ($images as $img) { ?>
            <div class="col-md-3 col-sm-4 col-xs-6">
                <a href="<?php echo $img['image']; ?>" class="gallery-item">
                    <img src="<?php echo $img['image_min']; ?>" alt="">
                    <span class="ppb-galery__overlay"></span>
                </a>
            </div>
            <?php } ?>
        </div>
    </div>
</section>


<script>
$('.zoom-foto').magnificPopup({
  type: 'image',
});
$('.gallery-item').magnificPopup({
  type: 'image',
  gallery:{
    enabled:true
  }
});
</script>
