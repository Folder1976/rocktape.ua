<?php echo $header; ?>

</div></div></div>

<section class="page-product-blog__section seminar-short-info">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="seminar-short-info__title"><?php echo $name; ?></h1>
                <?php echo $description; ?>
               </div>
           <div class="col-md-4">
               <img src="/image/data/education/special-rocktape_img.jpg" alt="special-rocktape" class="seminar-short-info__img">
           </div>
        </div>
    </div>
</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/ppb-galery.tpl"; ?>


<?php include DIR_TEMPLATE."lexus_store/template/product/parts/reg-seminar.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/seminar-list.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/youtube.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/advantages.tpl"; ?>


<?php echo $footer; ?>

