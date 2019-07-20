<section class="page-product-blog__section ppb-reg-seminar">
    <div class="container" id="reg_seminars">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Форма регистрации</h2>

                <form action="" class="form ppb-form">
                    <div class="row">
                        <div class="form-group col-sm-6">
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
                            <input type="submit" class="ppb-button pull-right" value="Зарегистрироваться">
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

