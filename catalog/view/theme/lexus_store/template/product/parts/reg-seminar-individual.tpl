<section class="page-product-blog__section ppb-reg-seminar">
    <div class="container" id="reg_seminars">
        <div class="row">
            <div class="col-md-12">
                 <h2 class="text-center">Индивидуальное обучение</h2>
                <h4 class="text-center">Хотите обучиться индивидуально — сообщите нам!</h4>
<br>
                <form action="" class="form ppb-form" id="reg_form2">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <input type="hidden" name="form_name" class="form-control" value="Форма регистрации">
                            <input type="text" name="seminar_name" class="form-control" placeholder="Имя" required>
                            <input type="text" name="seminar_surname" class="form-control" placeholder="Фамилия">
                            <input type="text" name="seminar_phone" class="form-control" placeholder="Телефон" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="email" name="seminar_email" class="form-control" placeholder="Email">
                            <select name="seminar_seminar" class="form-control" required>
                                <option value="0">Семинар</option>
                                <?php foreach($attribute_groups as $row){ ?>
                                    <?php if(isset($_GET['seminar']) AND $_GET['seminar'] == $row['name']){ ?>
                                        <option value="<?php echo $row['name']; ?>" selected><?php echo $row['name']; ?></option>
                                    <?php }else{ ?>
                                        <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                                <!--option value="2">FMT Performance</option>
                                <option value="3">FMT Screen + Movability</option>
                                <option value="4">FMT Blades</option>
                                <option value="5">FMT Blades Advanced</option>
                                <option value="6">FMT RockPods</option>
                                <option value="7">FMT RockFloss</option>
                                <option value="8">RockTape Logopedix</option>
                                <option value="9">RockTape Beauty</option-->
                            </select>
                            <input type="button" class="ppb-button pull-right" id="msg_send2" value="Зарегистрироваться">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-12">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
    
    
$('#msg_send2').on('click', function() {
   
  $.ajax({
    url: '/index.php?route=account/universalform',
    type: 'post',
    data: $('#reg_form2').serialize(),
    dataType: 'json',
     beforeSend: function() {
      $('#msg_send').button('loading');
    },
    complete: function() {
      $('#msg_send').button('reset');
    },
    success: function(json) {
     
        //console.log(json);
     
      if (json['error']) {
        $('#msg_send').button('error');
       $('.msg').html('<div class="text-danger">' + json['error'] + '</div>');
      }


      if (json['success']) {
        $('#msg_send').button('success');
        show_modal_msg('<div class="alert-success">' + json['success'] + '</div>');
        $('#reg_form input').val('');
        
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
});
    
</script>



