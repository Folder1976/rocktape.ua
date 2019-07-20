<section class="page-product-blog__section ppb-schedule">
    <div class="container" id="all_seminars">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">РАСПИСАНИЕ</h2>
                <h4 class="text-center"><?php echo $name4; ?></h4>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>Название семинара</th>
                            <th>Город</th>
                            <th>Дата</th>
                            <th></th>
                        </tr>
                        <?php foreach($attributes as $row){ ?>
                        <tr>
                            <td><a href="<?php echo $row['link']; ?>"><?php echo $row['group_name']; ?></a></td>
                            <td><?php echo $row['name']; ?></td>
                            <td><?php echo $row['date']; ?></td>
                            <td><a href="<?php echo $row['link'].'?seminar='.$row['group_name']; ?>" class="ppb-button">Зарегистрироваться</a></td>
                        </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
