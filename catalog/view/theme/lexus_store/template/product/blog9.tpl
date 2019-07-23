<?php echo $header; ?>


</div></div></div>

<section class="page-product-blog__section ppb-review-foto">
    <img src="/image/data/education/rocktape_feedback_education.jpg" alt="">
</section>

<section class="page-product-blog__section ppb-review-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="ppb-review-text__title">В Украине обучилось уже более 600 человек. Многие из них поделились своим впечатлением о наших курсах в социальных сетях.</h1>
            </div>
        </div>
    </div>
</section>


<section class="page-product-blog__section ppb-review-list">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                    <?php foreach ($video_src as $value) { ?>
                        <div class="col-md-4">
                            <iframe
                                    allowfullscreen="true"
                                    allowtransparency="true"
                                    class="instagram-media instagram-media-rendered"
                                    data-instgrm-payload-id="instagram-media-payload-3"
                                    frameborder="0"
                                    height="850"
                                    id="instagram-embed-3"
                                    scrolling="no"
                                    src="https://www.instagram.com/p/<?php echo $value; ?>/embed/captioned/"
                                    style="background: white;
                                            max-width: 658px;
                                            width: calc(100% - 2px);
                                            border-radius: 3px;
                                            border: 1px solid rgb(219, 219, 219);
                                            box-shadow: none;
                                            display: block;
                                            margin: 0px 0px 12px;
                                            min-width: 326px;
                                            padding: 0px;">
                                
                            </iframe>
                        </div>
                    <?php } ?>ы
            </div>
        </div>
    </div>
</section>


<section class="page-product-blog__section ppb-review-list">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <?php echo str_replace('et_pb_module', 'et_pb_module col-md-4', $description); ?>
            </div>
        </div>
    </div>
</section>

<style>
    .et_pb_module{
        
    }
</style>


<?php echo $footer; ?>


