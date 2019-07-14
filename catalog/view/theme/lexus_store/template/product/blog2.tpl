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
                <h1 class="page-product-blog__section-title">Наши инструкторы</h1>
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
                    <div class="instructor__post">Инструктор RockTape FMT. Медицинский директор.</div>
                    <div class="instructor__text">Физиотерапевт, кинезиолог, RockDoc, аспирант Charles University (Prague), специалист DNS и PNF. Руководитель отделения реабилитации в «Спорт Клинике», Санкт-Петербург.</div>
                    <a href="https://www.instagram.com/yantherapy/" class="instructor__link">@yantherapy</a>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/Max.jpg" alt="Максим Панкратов">
                    </div>
                    <div class="instructor__name">Максим Панкратов</div>
                    <div class="instructor__post">Инструктор RockTape FMT.</div>
                    <div class="instructor__text">Практикующий спортивный врач, травматолог-ортопед, специалист по ударно-волновой терапии (частная практика). Опытный лектор и преподаватель курсов FMT.
                    Ведет прием в «Ист Клиник», Москва.</div>
                    <a href="https://www.instagram.com/treatrasta/" class="instructor__link">@treatrasta</a>
                </div>
            </div>

            <div class="clearfix visible-sm"></div>

            <div class="col-md-3 col-sm-6">
                <div class="instructor">
                    <div class="instructor__foto">
                       <img src="/image/data/instructors/natalia.jpg" alt="Наталья Лабзова">
                    </div>
                    <div class="instructor__name">Наталья Лабзова</div>
                    <div class="instructor__post">Инструктор RockTape FMT.</div>
                    <div class="instructor__text">Терапевт, врач ЛФК и спортивной медицины, реабилитолог, массажист.
                    Образование: УГМУ, СПбГМУ. Повышение квалификации в области реабилитации, массажа, кинезиотейпирования и спортивной медицины на базе: СПбГМУ им. Мечникова, ПСПбГМУ им. акад. И. П. Павлова, Образовательного Центра Rocktape USA. Ведет прием в «Спорт Клинике», Санкт-Петербург.</div>
                    <a href="https://www.instagram.com/gostrongerlonger/" class="instructor__link">@gostrongerlonger</a>
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
