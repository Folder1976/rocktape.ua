<?php echo $header; ?>

<?php
/*
Инструкторы
http://rocktape.ua/instructor
*/
?>

<?php
/*
$version = "001";
	$themeConfig = (array)$this->config->get( 'themecontrol' );
	$themeName =  $this->config->get('config_template');
	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$helper->setDirection( $direction );
$helper->addCss( 'catalog/view/theme/'.$themeName.'/stylesheet/blog.css?'.$version );
*/
?>


</div></div></div>

<section class="page-product-blog__section mb0 ppb-instructors">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-product-blog__section-title color--white text-center">Наши инструкторы</h1>
                <br><br>
           </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/yan.jpg" alt="Янь Нгуен">
                    </div>
                    <div class="instructor__name">Янь Нгуен</div>
                    <div class="instructor__post">Инструктор RockTape Европа</div>
                    <div class="instructor__text">Физиотерапевт, кинезиолог, аспирант Charles University (Prague), специалист DNS и PNF</div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/" alt="Максим Панкратов">
                    </div>
                    <div class="instructor__name">Максим Панкратов</div>
                    <div class="instructor__post"></div>
                    <div class="instructor__text"></div>
                </div>
            </div>

            <div class="clearfix visible-sm"></div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/natalia.jpg" alt="Наталья Лабзова">
                    </div>
                    <div class="instructor__name">Наталья Лабзова</div>
                    <div class="instructor__post">Инструктор, RockTape СНГ</div>
                    <div class="instructor__text">Врач ЛФК и спортивной медицины, массажист, кинезиолог. В работе использует тейпирование, массаж, мягкие мануальные техники.</div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/artem.png" alt="Артем Сгурский">
                    </div>
                    <div class="instructor__name">Артем Сгурский</div>
                    <div class="instructor__post">Инструктор, RockTape UA</div>
                    <div class="instructor__text">Физический терапевт, в работе использует методы Mulligan, Kaltenborn, Maitland, McKenzie, Cyriax. Опытный преподаватель.</div>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/viktor.png" alt="Виктор Рыбка">
                    </div>
                    <div class="instructor__name">Виктор Рыбка</div>
                    <div class="instructor__post">Инструктор, RockTape UA</div>
                    <div class="instructor__text">Ортопед-травматолог, практикующий хирург, кинезиолог. В работе использует современные методы реабилитации и кинезиотейпирование.</div>
                </div>
            </div>
        </div>
    </div>
</section>





<?php echo $footer; ?>
