<?php echo $header; ?>

</div></div></div>

<section class="page-product-blog__section seminar-short-info">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="seminar-short-info__title">FMT Blades + Blades Advanced</h1>
                <?php echo $description; ?>
                <p class="text-center">
                    <a href="<?php echo HTTP_SERVER.ltrim($_SERVER['REQUEST_URI'], '/').'#all_seminars'; ?>" class="ppb-button">Посмотреть ближайшие семинары</a>
                </p>
           </div>
           <div class="col-md-4">
               <img src="/image/data/education/Blades-Blades-Advanced.jpg" alt="Blades-Blades-Advanced" class="seminar-short-info__img">
           </div>
        </div>
    </div>
</section>

<?php include DIR_TEMPLATE."lexus_store/template/product/parts/ppb-galery.tpl"; ?>


<section class="page-product-blog__section seminar-description">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <?php echo $description1; ?>
            </div>
            <div id="accordion-seminar" class="col-md-4">
                <div class="accordion">
                    <div class="accordion__title text-center" data-toggle="collapse" data-target="#accordion-1"><?php echo $name3; ?></div>
                    <div id="accordion-1" class="accordion__content collapse in">
                        
                        <?php echo $description3; ?>
                        <br>
                    </div>
                </div>
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-2"><?php echo $name4; ?></div>
                    <div id="accordion-2" class="accordion__content collapse">
                        <?php echo $description4; ?>
                        <br>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-12">
                <br>
                <h4 class="text-center"><?php echo $name2; ?></h4>
                <br>
                <div class="table-responsive">
                    
                        <?php echo $description2; ?>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>




        <div class="row">
            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-basic"><?php echo $name5; ?></div>
                    <div id="accordion-basic" class="accordion__content collapse">
                        <?php echo $description5; ?>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-performance"><?php echo $name6; ?></div>
                    <div id="accordion-performance" class="accordion__content collapse">
                        <?php echo $description6; ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-price"><?php echo $name7; ?></div>
                    <div id="accordion-price" class="accordion__content collapse">
                        <?php echo $description7; ?>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-included"><?php echo $name8; ?></div>
                    <div id="accordion-included" class="accordion__content collapse"><?php echo $description8; ?></div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="accordion">
                    <div class="accordion__title text-center collapsed" data-toggle="collapse" data-target="#accordion-faq"><?php echo $name9; ?></div>
                    <div id="accordion-faq" class="accordion__content collapse">
                        <?php echo $description9; ?>
                    </div>
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

