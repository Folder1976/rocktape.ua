<section class="page-product-blog__section ppb-youtube">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2 class="ppb-youtube__title">Присоединяйтесь к команде РокДоков – сертифицированных специалистов RockTape!</h2>
                <p>Серия образовательных программ FMT разработана и преподается первоклассными специалистами в области анализа движения и устранения нарушений мобильности.<br>
                <b>Приходите к нам учиться, вливайтесь в команду и получайте различные бонусы.</b></p>
            </div>
            <div class="col-md-4">
                <div class="ppb-youtube__count-rokdoc">50,000</div>
                <div class="ppb-youtube__count-rokdoc-text">РокДоков по всему миру</div>
            </div>
        </div>

        <?php if ( isset($video_src) && count($video_src)>0 ) { ?>
        <div class="row">
            <?php foreach ($video_src as $value) { ?>
            <?php if ( count($video_src) == 1 ) { ?>
            <div class="col-md-12">
            <?php } else { ?>
            <div class="col-md-6">
            <?php } ?>
                <div class="iframe__container">
                  <iframe src="<?php echo $value; ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
            <?php } ?>
        </div>
        <?php } ?>

    </div>
</section>
