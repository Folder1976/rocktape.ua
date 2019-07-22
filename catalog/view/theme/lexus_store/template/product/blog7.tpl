<?php echo $header; ?>

</div></div></div>

<section class="page-product-blog__section seminar-short-info">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="seminar-short-info__title">Rocktape LogopediX</h1>
                <?php echo $description; ?>
                <p class="text-center">
                    <a href="<?php echo HTTP_SERVER.ltrim($_SERVER['REQUEST_URI'], '/').'#all_seminars'; ?>" class="ppb-button">Посмотреть ближайшие семинары</a>
                </p>
           </div>
           <div class="col-md-4">
               <img src="/image/data/education/special-rocktape_img.jpg" alt="special-rocktape" class="seminar-short-info__img">
           </div>
        </div>
    </div>
</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/ppb-galery.tpl"; ?>

<section class="page-product-blog__section seminar-description">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <?php echo $description1; ?>

            </div>
        </div>


        <div class="row">
            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-price"><?php echo $name2; ?></div>
                    <div id="accordion-price" class="accordion__content collapse">
                        <?php echo $description2; ?>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-included"><?php echo $name3; ?></div>
                    <div id="accordion-included" class="accordion__content collapse"><?php echo $description3; ?></div>
                </div>
            </div>
        </div>
    </div>

</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/reg-seminar.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/seminar-list.tpl"; ?>

<?php
$video_src = array (
    'https://www.youtube.com/embed/GxAyOVRSfxU',
); ?>
<?php include DIR_TEMPLATE."lexus_store/template/product/parts/youtube.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/advantages.tpl"; ?>


<?php echo $footer; ?>

