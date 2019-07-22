<?php echo $header; ?>

</div></div></div>

<section class="page-product-blog__section seminar-short-info">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="seminar-short-info__title">FMT RockPods & RockFloss</h1>
                <?php echo $description; ?>
                <p class="text-center">
                    <a href="<?php echo HTTP_SERVER.ltrim($_SERVER['REQUEST_URI'], '/').'#all_seminars'; ?>" class="ppb-button">Посмотреть ближайшие семинары</a>
                </p>
           </div>
           <div class="col-md-4">
               <img src="/image/data/education/FMT-RockPods-FMT-RockFloss.jpg" alt="FMT-RockPods-FMT-RockFloss" class="seminar-short-info__img">
           </div>
        </div>
    </div>
</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/ppb-galery.tpl"; ?>

<section class="page-product-blog__section seminar-description">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h5><?php echo $name1; ?></h5>
                <?php echo $description1; ?>
                <h5><?php echo $name2; ?></h5>
                <?php echo $description2; ?>
            </div>
            <div id="accordion-seminar" class="col-md-4">
                <div class="accordion">
                    <div class="accordion__title text-center" data-toggle="collapse" data-target="#accordion-1"><h5><?php echo $name3; ?></h5></div>
                    <div id="accordion-1" class="accordion__content collapse in">
                        <?php echo $description3; ?>
                        <br>
                    </div>
                </div>
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-2"><h5><?php echo $name4; ?></h5></div>
                    <div id="accordion-2" class="accordion__content collapse">
                        <?php echo $description4; ?>
                        <br>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-price"><?php echo $name5; ?></div>
                    <div id="accordion-price" class="accordion__content collapse">
                        <?php echo $description5; ?>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-included"><?php echo $name6; ?></div>
                    <div id="accordion-included" class="accordion__content collapse"><?php echo $description6; ?></div>
                </div>
            </div>
        </div>
    </div>

</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/reg-seminar.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/seminar-list.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/youtube.tpl"; ?>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/advantages.tpl"; ?>


<?php echo $footer; ?>

