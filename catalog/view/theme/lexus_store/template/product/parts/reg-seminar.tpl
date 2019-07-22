<section class="page-product-blog__section ppb-schedule">
    <div class="container" id="all_seminars">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">РАСПИСАНИЕ</h2>
                <h4 class="text-center">Ближайшие семинары RockTape</h4>

                <div class="table-responsive">
                    <table class="table table-striped table-bordered list table-middle">
                        <tr>
                            <th class="left">Название семинара</th>
                            <th class="center">Город</th>
                            <th class="center">Дата</th>
                            <th></th>
                        </tr>
                        <?php foreach($attributes as $row){ ?>
                        <tr>
                            <td class="left" style="vertical-align: middle;"><a href="<?php echo $row['link']; ?>"><?php echo $row['group_name']; ?></a></td>
                            <td class="center" style="vertical-align: middle;"><?php echo $row['name']; ?></td>
                            <td class="center" style="vertical-align: middle;"><?php echo date('d.m.Y', strtotime($row['date'])); ?></td>
                            <td class="center"><a href="<?php echo $row['link'].'?seminar='.$row['group_name']; ?>" class="ppb-button">Зарегистрироваться</a></td>
                        </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

