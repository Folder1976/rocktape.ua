<?php echo $header; ?>

</div></div></div>


<?php switch ( $_GET["_route_"] ) {
    case 'education': ?>

    <section class="home-full-video">
        <div class="home-full-video__wrap">
            <video loop="loop" autoplay="" playsinline="" muted="" preload="none" src="/image/data/education/FMT-Splash-v1.mp4" style="margin: 0px;" width="1280" height="720">
                <source type="video/mp4" src="/image/data/education/FMT-Splash-v1.mp4">
            </video>
        </div>

        <div class="home-full-video__content">
            <div class="home-full-video__content-inner">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-md-offset-1">
                        <h1 class="home-full-video__title">Становитесь лучше.</h1>
                        <p class="home-full-video__text">Учитесь под руководством ведущих экспертов в области движения и реабилитации.</p>
                        <a href="/timelist" class="home-full-video__link btn-theme-primary">Изучить образовательные программы</a>
                    </div>
                    <div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs">
                        <img src="/image/data/education/FMT-General-2.png" alt="FMT-General-2.png">
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <br>
    <br>
    <br>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">Движение – ключ к исцелению. И неважно, работаете ли вы с именитым спортсменом или с человеком, попавшим в автомобильную аварию.</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <p><b>FMT (Functional Movement Techniques). Функциональные Двигательные Техники. Серия образовательных программ, которые разработаны и преподаются первоклассными специалистами в области анализа движения и устранения нарушений мобильности. Курсы FMT познакомят вас с революционным подходом к пониманию того, как мы двигаемся и почему получаем травмы.</b></p>
                    <p></p>
                    <p>На семинарах вы узнаете о стратегиях мобильности и стабильности, а также поймете, почему мы выбрали концепцию кинезиологического тейпирования движений, а не мышц. Наше обучение направлено на то, чтобы после него вы могли эффективно применять полученные знания и работать <b>НА РЕЗУЛЬТАТ.</b></p>
                </div>
                <div class="col-md-8 col--black">
                    <p><b>Любая образовательная программа FMT базируется на нескольких важных концептах:</b>/</p>

                    <p><b>1. Пирамида Движения</b><br>
                    На всех курсах FMT мы применяем двухэтапную оценку движения – до и после применения методик и техник, изученных на курсе.</p>

                    <p><b>2. Доказательства</b><br>
                    Каждый FMT курс – это обязательное сочетание современных научных исследований и клинического опыта наших инструкторов, а также сертифицированных специалистов в области здравоохранения и фитнеса.</p>

                    <p><b>3. В фокусе – фасция</b><br>
                    Мы придерживаемся концепции мышечных цепей. Понимая эту систему, можно определить, почему произошло нарушение мобильности и как его исправить.</p>

                    <p><b>4. Практика – залог успешного обучения</b><br>
                    На наших курсах всегда динамично. Каждый участник должен быть вовлечен в процесс. Если вы планируете прийти к нам на семинар, приготовьтесь – двигаться придется много!</p>
                </div>

            </div>
            <br>
            <div class="row">

                <div class="col-md-12 col--red">
                    <h4 class="text-center">Серия курсов FMT предназначена для профессионалов в области здравоохранения и физической культуры. Врачи различных специальностей, массажисты, тренеры – мы рады делиться знаниями с каждым.</h4>
                </div>
            </div>
        </div>
    </section>

<?php break; // end education ?>








<?php case 'instructor': ?>
<?php echo 'instructor'; ?>
<?php break; // end instructor ?>










<?php default: ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
   <?php if ($categories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="blog-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $blog) { ?>
      <li><a href="<?php echo $blog['href']; ?>"><?php echo $blog['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($description) { ?>
  <div class="blog-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>

</div>
<script type="text/javascript"><!--
function display(view) {
    if (view == 'list') {
        $('.product-grid').attr('class', 'product-list');
        
        $('.product-list > div').each(function(index, element) {
            html  = '<div class="right">';
            html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
            html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
            html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
            html += '</div>';           
            
            html += '<div class="left">';
            
            var image = $(element).find('.image').html();
            
            if (image != null) { 
                html += '<div class="image">' + image + '</div>';
            }
            
            var price = $(element).find('.price').html();
            
            if (price != null) {
                html += '<div class="price">' + price  + '</div>';
            }
                    
            html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
            html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
            
            var rating = $(element).find('.rating').html();
            
            if (rating != null) {
                html += '<div class="rating">' + rating + '</div>';
            }
                
            html += '</div>';
                        
            $(element).html(html);
        });     
        
        $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
        
        $.totalStorage('display', 'list'); 
    } else {
        $('.product-list').attr('class', 'product-grid');
        
        $('.product-grid > div').each(function(index, element) {
            html = '';
            
            var image = $(element).find('.image').html();
            
            if (image != null) {
                html += '<div class="image">' + image + '</div>';
            }
            
            html += '<div class="name">' + $(element).find('.name').html() + '</div>';
            html += '<div class="description">' + $(element).find('.description').html() + '</div>';
            
            var price = $(element).find('.price').html();
            
            if (price != null) {
                html += '<div class="price">' + price  + '</div>';
            }
            
            var rating = $(element).find('.rating').html();
            
            if (rating != null) {
                html += '<div class="rating">' + rating + '</div>';
            }
                        
            html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
            html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
            html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
            
            $(element).html(html);
        }); 
                    
        $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
        
        $.totalStorage('display', 'grid');
    }
}

view = $.totalStorage('display');

if (view) {
    display(view);
} else {
    display('list');
}
//--></script>







<?php break; ?>
<?php } // end switch ?>



<?php echo $footer; ?>

