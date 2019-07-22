<?php
// временно:
$logo = '/image/catalog/ROOFER_LOGO_1.jpg';
$name = 'Your Store';
$home = '/';
?>



</div> <!-- ./ site__content -->

<footer class="footer">

  <?php // lead-magnet ?>
  <?php if(false){ //( !isset($_COOKIE["lmagnet"]) ) { ?>
  <div id="mf-lead-magnet" class="mf-popup-block mf-lead-magnet mfp-hide mfp-with-anim lmagnet">
    <div class="lmagnet__top-black">
      <h3 class="lmagnet__title">Проверенная технология с пошаговой иструкцией от лидеров рынка кровельного строительства!</h3>
    </div>

    <div class="lmagnet__top-white">
      <h3 class="lmagnet__title">Именно поэтому, подрядчик может схалтурить.</h3>
      <h3 class="lmagnet__title">Причина этому — ваша некомпетентность!</h3>
      <h5 class="lmagnet__subtitle">Получи бесплатно инструкции, чек листы как выбрать подрядчика на строительство кровли.</h5>
    </div>

    <div class="lmagnet__content">
      <h3 class="lmagnet__title">что внутри?</h3>

      <div class="lmagnet__list">
        <div class="lmagnet__list-item lmagnet-list-item">
          <i class="ico-lm-1 lmagnet-list-item__icon"></i>
          <div class="lmagnet-list-item__text">Как выбрать подрядчика на монтаж кровли. Топ-5 ошибок</div>
        </div>

        <div class="lmagnet__list-item lmagnet-list-item">
          <i class="ico-lm-2 lmagnet-list-item__icon"></i>
          <div class="lmagnet-list-item__text">Как правильно составить договор с подрядчиком</div>
        </div>

        <div class="lmagnet__list-item lmagnet-list-item">
          <i class="ico-lm-3 lmagnet-list-item__icon"></i>
          <div class="lmagnet-list-item__text">Как разработать тех.задание на строительство кровли</div>
        </div>

        <div class="lmagnet__list-item lmagnet-list-item">
          <i class="ico-lm-4 lmagnet-list-item__icon"></i>
          <div class="lmagnet-list-item__text">Как найти подрядчика в интернете и не ошибиться</div>
        </div>

        <div class="lmagnet__list-item lmagnet-list-item">
          <i class="ico-lm-5 lmagnet-list-item__icon"></i>
          <div class="lmagnet-list-item__text">время прочтения по каждому пункту 5 минут!</div>
        </div>
      </div>

      <div class="msg"></div>
      <form id="lmagnet__form" method="post" action="/index.php?route=account/universalform" class="lmagnet__form">
        <input type="hidden" name="formname" value="lead-magnet">
        <div class="form-group form-group--center">
          <input type="text" class="input input--phone" value="" name="phone" placeholder="Ваш телефон" required>
          <input type="email" class="input" value="" name="email" placeholder="Ваш e-mail" required>
          <input type="button" class="btn btn--black" value="получить" id="lead-magnet-send">
        </div>
        <div class="form-group">
          <input type="checkbox" class="checkbox" name="agree" id="lmagnet-agree" checked>
          <label for="lmagnet-agree" class="label">Я согласен(на) на обработку персональных данных.</label>
        </div>
      </form>
    </div>
  </div>

  <input type="hidden" id="lead-magnet-is-showed" value="0">
  <script type='text/javascript'>
    // возвращает cookie с именем name, если есть, если нет, то undefined
    function getCookie(name) {
      var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
      ));
      return matches ? decodeURIComponent(matches[1]) : undefined;
    }

    function setCookie(name, value, options) {
      options = options || {};

      var expires = options.expires;

      if (typeof expires == "number" && expires) {
        var d = new Date();
        d.setTime(d.getTime() + expires * 1000);
        expires = options.expires = d;
      }
      if (expires && expires.toUTCString) {
        options.expires = expires.toUTCString();
      }

      value = encodeURIComponent(value);

      var updatedCookie = name + "=" + value;

      for (var propName in options) {
        updatedCookie += "; " + propName;
        var propValue = options[propName];
        if (propValue !== true) {
          updatedCookie += "=" + propValue;
        }
      }

      document.cookie = updatedCookie;
    }
  </script>
  <script type='text/javascript'>
  $(document).ready(function() {
    $('body').mouseout(function(e) {
      if ( $('#lead-magnet-is-showed').val() == 0 && e.relatedTarget == null ) {
        $('#lead-magnet-is-showed').val(1);
        $.magnificPopup.open({
          items: { src: '#mf-lead-magnet' },
          type: 'inline'
        });

        // ставим куку на 24 часа:
        setCookie('lmagnet', 1, { expires: 86400 });
      }
    });
  });
  </script>

  <script type="text/javascript"><!--

  $("#lmagnet__form").submit(function(){return false;})
	function sends(){
        $.ajax({
          type: "POST",
          url: 'https://rooferr.ru/amo/amo.php',
          data: $('#lmagnet__form input[type=text], #lmagnet__form input[type=hidden], #lmagnet__form input[type=checkbox]:checked, #lmagnet__form input[type=email]'),
        }).done(function() {
          console.log('success');
        }).fail(function() {
          console.log('fail');
        });
      }
  $('#lead-magnet-send').on('click', function() {

    if ( $('#lmagnet__form input[name=phone]').val() == '' || $('#lmagnet__form input[name=email]').val() == '' ) {
      $('#mf-lead-magnet .msg').text('Введите корректные данные').css({'color': 'red', 'text-align': 'center'});
      return;
    }
   
    $.ajax({
      url: '/index.php?route=account/universalform',
      type: 'post',
      data: $('#lmagnet__form input[type=text], #lmagnet__form input[type=hidden], #lmagnet__form input[type=checkbox]:checked, #lmagnet__form input[type=email]'),
      dataType: 'json',
      beforeSend: function() {
        $('#lead-magnet-send').button('loading');
		sends();
      },
      complete: function() {
        $('#lead-magnet-send').button('reset');
      },
      success: function(json) {
      
       
        if (json['error']) {
          $('#lead-magnet-send').button('error');
         $('.msg').html('<div class="text-danger">' + json['error'] + '</div>');
        }


        if (json['success']) {
          $('#lead-magnet-send').button('success');
          show_modal_msg('<div class="alert-success">' + json['success'] + '</div>');
          $('.form.form--mf-popup')[0].reset();
          $('.mfp-close').trigger('click');
          location.href = '<?php echo HTTP_SERVER;?>thank-you';
        }
      },
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
    });
  });
  //--></script>
  <?php } ?>
  <?php //END lead-magnet ?>



  <!-- popups -->
  <div id="get-consultation" class="mf-popup-block mf-get-consultation mfp-hide mfp-with-anim">
    <h3 class="mf-title">консультация</h3>
    <div class="row">
      <div class="col-md-7" >
        <div class="msg"></div>
        <form method="post" name="test" enctype="multipart/form-data" class="form form--mf-popup">
          <input type="hidden" name="formname" value="get-consultation">
          <div class="form__group">
            <input type="text" class="input" name="name" placeholder="Имя">
          </div>
          <div class="form__group">
            <input type="text" class="input input--phone" name="phone" placeholder="Телефон">
          </div>
          <div class="form__group">
            <textarea name="comment" rows="5" class="textarea" placeholder="Информация о проекте"></textarea>
          </div>
          <div class="form__group">
            <div class="hidden"><input type="file" class="input input--file" name="file" id="get-consultation__file"></div>
            <label for="get-consultation__file" class="form-label form-label--file">Прикрепить файл</a> 
          </div>
          <div class="form__group">
            <input type="checkbox" class="checkbox" value="1" name="agree" id="get-consultation__agree" required>
            <label for="get-consultation__agree" class="form-label">С <a href="/privacy">политикой конфиденциальности</a> ознакомлен</label>
          </div>
          <div class="form__group">
            <button class="btn btn--black" id="msg_send"
                        data-loading-text="Отправляю . . ."
                        data-error-text="Ошибка"
                        data-success-text="Отправлено"
                        data-reset-text="связаться">связаться</button>
          </div>
        </form>

<script type="text/javascript"><!--

$('#get-consultation__file').on('change', function(e){
  var label = $('label[for="get-consultation__file"]');

  if ( $(this).val() == "" ) {
    label.text("Прикрепить файл");
  } else {
    label.text($(this).val());
  }
  
});

$("#get-consultation").submit(function(){
	$.ajax({
          type: "POST",
          url: 'https://rooferr.ru/amo/amo.php',
          data: $('#get-consultation input[type=hidden], #get-consultation input[type=text], #get-consultation input[type=file], #get-consultation input[type=checkbox]:checked, #get-consultation textarea'),
		}).done(function() {
          console.log('success');
        }).fail(function() {
          console.log('fail');
        });
		return false;
		})


$('#msg_send').on('click', function() {
  
    var $input = $("#get-consultation__file");
    var fd = new FormData(document.forms.test);
    fd.append('file', $input.prop('files')[0]);

    
  $.ajax({
    url: '/index.php?route=account/universalform',
    type: 'post',
    data: fd, //$('#get-consultation input[type=text], #get-consultation input[type=file], #get-consultation input[type=checkbox]:checked, #get-consultation textarea'),
    dataType: 'json',
    processData: false,
    contentType: false,
    beforeSend: function() {
      $('#msg_send').button('loading');
    },
    complete: function() {
      $('#msg_send').button('reset');
    },
    success: function(json) {
    
    //console.log(json);
    //return false;
    
      if (json['error']) {
        $('#msg_send').button('error');
       $('.msg').html('<div class="text-danger">' + json['error'] + '</div>');
      }


      if (json['success']) {
        $('#msg_send').button('success');
        show_modal_msg('<div class="alert-success">' + json['success'] + '</div>');
        $('.form.form--mf-popup')[0].reset();
        $('.mfp-close').trigger('click');
        location.href = '<?php echo HTTP_SERVER;?>thank-you';
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
});
//--></script>
        
      </div>
      <div class="col-md-5 text-center">
        <img class="mf-get-consultation__foto" src="catalog/view/theme/default/img/foto/sales-manager.jpg" alt="sales-manager">
        <p>Вас будет обслуживать<br>менеджер отдела продаж:<br><b>Анна</b></p>
      </div>
    </div>
  </div>

  <div class="back-to-top">
    <div class="back-to-top__inner">
      <svg class="icon icon-chevron-up back-to-top__icon">
        <use xlink:href="catalog/view/theme/default/img/sprite/symbol/sprite.svg#chevron-up"></use>
      </svg>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="footer__container">
          
          <div class="footer__logo-col">
            <div class="footer__logo logo">
              <a href="<?php echo $home; ?>" class="logo__link"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="logo__img" /></a>
            </div>
            <p class="footer__powered"><?php echo $powered; ?></p>
          </div>

          <div class="footer__col-products">
            <div class="footer__title">Товары</div>
            <ul class="footer__menu">
              <?php foreach($categories as $category){ ?>
              <li><a href="<?php echo $category['href'];?>"><?php echo $category['name'];?></a></li>
              <?php } ?>
            </ul>
          </div>

          <div class="footer__col-services">
            <div class="footer__title">Услуги</div>
            <ul class="footer__menu">
               <?php foreach($blog_categories as $category){ ?>
              <li><a href="<?php echo $category['href'];?>"><?php echo $category['name'];?></a></li>
              <?php } ?>
             </ul>
          </div>

          <div class="footer__col-nav">
            <div class="footer__title">Навигация</div>
            <ul class="footer__menu">
              <li><a href="/services">Услуги</a></li>
              <li><a href="/products">Товары</a></li>
              <li><a href="<?php echo $manufacturer; ?>">Все бренды</a></li>
              <li><a href="/company-reviews">Отзывы</a></li>
              <li><a href="/works">Наши проекты</a></li>
              <li><a href="/command">Команда</a></li>
              <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <li><a href="/privacy">Политика конфиденциальности</a></li>
            </ul>
          </div>

          <div class="footer__col-address">
            <div class="row">
              <div class="col-md-6">
                <div class="footer__title">Наш адрес</div>
                <p><?php echo $address; ?></p>
                <!-- <p>Тел.: <a href="tel:<?php echo preg_replace('/[^0-9+]/', '', $telephone); ?>" style="white-space: nowrap;"><?php echo $telephone; ?></a></p> -->
				<p>Тел.: <a class="rst_phone_f" href="tel:84952350330">8 (495) 235-03-30</a></p>
              </div>
              <div class="col-md-6">
                <div class="footer__title">мы в соц. сетях</div>
                <ul class="footer__social">
                  <li><a href="https://vk.com/roofferr"><svg class="icon icon-facebook-logo footer__social-icon"><use xlink:href="catalog/view/theme/default/img/sprite/symbol/sprite.svg#vk-logo"></use></svg></a></li>
                  <li><a href="https://www.facebook.com/Руфер-2013173762310831/"><svg class="icon icon-facebook-logo footer__social-icon"><use xlink:href="catalog/view/theme/default/img/sprite/symbol/sprite.svg#facebook-logo"></use></svg></a></li>
                  <li><a href="https://www.instagram.com/rooferr.ru/"><svg class="icon icon-facebook-logo footer__social-icon"><use xlink:href="catalog/view/theme/default/img/sprite/symbol/sprite.svg#instagram-logo"></use></svg></a></li>
                  <li><a href="http://t.me/Rooferr_bot"><svg class="icon icon-facebook-logo footer__social-icon"><use xlink:href="catalog/view/theme/default/img/sprite/symbol/sprite.svg#telegram-logo"></use></svg></a></li>
                </ul>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d5385.0344323659!2d37.12454795530563!3d55.42555983581724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1suk!2sua!4v1550581180244" height="170" frameborder="0" style="border:0; width: 100%;" allowfullscreen></iframe>
              </div>
            </div>
          </div>


        </div>
      </div>
    </div>
  </div>
  
</footer>

<script src="catalog/view/theme/default/js/libs.js?1.09" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/main.js?1.09" type="text/javascript"></script>













<?php if (false) { ?>

<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

<?php } ?>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<style>
  .modal_msg{
    display: none;
    position: fixed;
    width: 70%;
    z-index: 99999;
    background-color: white;
    border: 1px solid;
    padding: 20px 10px;
    text-align: center;
    left: 15%;
    top: 40%;
    font-weight: bold;
    font-size: 2rem;
    -webkit-box-shadow: 0 0 100px rgba(0, 0, 0, 0.7);
            box-shadow: 0 0 100px rgba(0, 0, 0, 0.7);
  }
</style>
<script>
  function show_modal_msg(msg){
   
    $('.modal_msg').html(msg);
    $('.modal_msg').show();
    
    setTimeout(function(){
      $('.modal_msg').hide(500);
    }, 2000);
  }
</script>
<div class="modal_msg"></div>
<script type="text/javascript">
function init() {
var date = new Date(new Date().getTime() + 6000 * 1000);
function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
};
var utm_medium = getUrlVars()["utm_medium"];
var utm_campaign = getUrlVars()["utm_campaign"];
var utm_term = getUrlVars()["utm_term"];
var utm_content = getUrlVars()["utm_content"];
var utm_source = getUrlVars()["utm_source"];
if (utm_medium != undefined){document.cookie = "utm_medium="+utm_medium+"; path=/; expires=" + date.toUTCString();}
if (utm_campaign != undefined){document.cookie = "utm_campaign="+utm_campaign+"; path=/; expires=" + date.toUTCString();}
if (utm_term != undefined){document.cookie = "utm_term="+utm_term+"; path=/; expires=" + date.toUTCString();}
if (utm_content != undefined){document.cookie = "utm_content="+utm_content+"; path=/; expires=" + date.toUTCString();}
if (utm_source != undefined){document.cookie = "utm_source="+utm_source+"; path=/; expires=" + date.toUTCString();}
};
window.onload = init;
</script>





<link rel="stylesheet" href="https://cdn.envybox.io/widget/cbk.css">
<script type="text/javascript" src="https://cdn.envybox.io/widget/cbk.js?wcb_code=03089544ceffb9d168bad90eee2fc904" charset="UTF-8" async></script>



</body></html>




