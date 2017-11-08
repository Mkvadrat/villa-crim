<?php echo $header; ?>
<div class="container">
  <div class="row">
 
  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
 <nav>
    <div class="left-menu">
      <ul class="left-navbar">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
  <img class="slidimg" src="/image/catalog/slid-bg.png">

    <?php echo $content_top; ?>
    <div class="right-menu">
      <ul class="right-navbar">
        <!--<li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=1">Алушта</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=2">Виноградное</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=3">Запрудное</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=5">Изобильное</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=6">Кипарисное</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=7">Верхняя Кутузовка</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=8">Нижняя Кутузовка</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=9">Лавровое</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=10">Лазурное</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=11">Лучистое</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=12">Малореченское</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=13">Малый Маяк</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=14">Партенит</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=15">Розовое</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=16">Рыбачье</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=17">Семидворье</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=18">Солнечногорское</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=4">Ялта</a></li>
        <li><a href="http://villa-crimea.com.ru/racshirenii-poisk&filter=19">Другие районы</a></li>-->
        
        <li><a href="<?php echo $alushta; ?>">Алушта</a></li>
        <li><a href="<?php echo $vinogradnoye; ?>">Виноградное</a></li>
        <li><a href="<?php echo $zaprudnoye; ?>">Запрудное</a></li>
        <li><a href="<?php echo $izobilnoye; ?>">Изобильное</a></li>
        <li><a href="<?php echo $kiparisnoye; ?>">Кипарисное</a></li>
        <li><a href="<?php echo $verkhnyaya_kutuzovka; ?>">Верхняя Кутузовка</a></li>
        <li><a href="<?php echo $nizhnyaya_kutuzovka; ?>">Нижняя Кутузовка</a></li>
        <li><a href="<?php echo $lavrovoye; ?>">Лавровое</a></li>
        <li><a href="<?php echo $lazurnoye; ?>">Лазурное</a></li>
        <li><a href="<?php echo $luchistoye; ?>">Лучистое</a></li>
        <li><a href="<?php echo $malorechenskoye; ?>">Малореченское</a></li>
        <li><a href="<?php echo $malyy_mayak; ?>">Малый Маяк</a></li>
        <li><a href="<?php echo $partenit; ?>">Партенит</a></li>
        <li><a href="<?php echo $rozovoye; ?>">Розовое</a></li>
        <li><a href="<?php echo $rybachye; ?>">Рыбачье</a></li>
        <li><a href="<?php echo $semidvorye; ?>">Семидворье</a></li>
        <li><a href="<?php echo $solnechnogorskoye; ?>">Солнечногорское</a></li>
        <li><a href="<?php echo $yalta; ?>">Ялта</a></li>
        <li><a href="<?php echo $nikita; ?>">Никита</a></li>
        <li><a href="<?php echo $oreanda; ?>">Ореанда</a></li>
        <li><a href="<?php echo $gaspra; ?>">Гаспра</a></li>
        <li><a href="<?php echo $mishor; ?>">Мисхор</a></li>
        <li><a href="<?php echo $livadija; ?>">Ливадия</a></li>
        <li><a href="<?php echo $massandra; ?>">Массандра</a></li>        
        <li><a href="<?php echo $drugiye_rayony; ?>">Другие районы</a></li>
      </ul>
    </div>
     <a class="rekom" href="http://villa-crimea.com.ru/srochnaya-prodaja">Срочная продажа</a>
      <div class="col-sm-10">
    <?php echo $content_bottom; ?>
      </div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>