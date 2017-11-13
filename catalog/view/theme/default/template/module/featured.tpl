
<div class="row" id="rowp">
<!--<?php foreach ($products as $product) { ?>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
<div class="product-thumb transition">
<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
<div class="caption">
<p><?php echo $product['name']; ?></p>
<?php if($product['price']) { ?>
<p class="price"><span>Цена:</span>
<?php echo $product['rub']; ?> руб. / <?php echo $product['price']; ?> $
</p>
<?php } ?>

<?php if ($product['rating']) { ?>
<div class="rating">
<?php for ($i = 1; $i <= 5; $i++) { ?>
<?php if ($product['rating'] < $i) { ?>
<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } else { ?>
<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } ?>
<?php } ?>
</div>
<?php } ?>

</div>
<div class="button-group">
<a href="<?php echo $product['href']; ?>">Подробнее</a>
</div>
</div>
</div>
<?php } ?>-->
<div class="col-md-9">
<ul class="list-objects">
<?php foreach ($products as $product) { ?>
<li>
<div class="block-photo" style="background-image: url(<?php echo $product['thumb']; ?>);">
<?php if($product['badge']){ ?>
<?php if($product['badge'] == 2){ ?>
<img class="labe" src="catalog/view/theme/default/image/label-new.png" alt="">
<?php }elseif($product['badge'] == 3){ ?>
<img class="labe" src="catalog/view/theme/default/image/label-urgently.png" alt="">
<?php }elseif($product['badge'] == 4){ ?>
<img class="labe" src="catalog/view/theme/default/images/labe.png" alt="">
<?php }elseif($product['badge'] == 5){ ?>
<img class="labe" src="catalog/view/theme/default/image/label-sale.png" alt="">
<?php } ?>
<?php } ?>
</div>
<div class="block-description">
<p class="title"><?php echo $product['name']; ?></p>
<div class="info-block">
<?php if($product['filter_data']){ ?>
<?php foreach($product['filter_data'] as $value){ ?>
<div>
<dl>
<dt><?php echo $value['name']; ?></dt>
<dd><?php echo $value['value']; ?></dd>
</dl>
</div>	
<?php } ?>
<?php } ?>
<?php if($product['options'] && $visible != 1){ ?>
<?php foreach($product['options'] as $value){ ?>
<div>
<dl>
<dt><?php echo $value['name']; ?></dt>
<dd><?php echo $value['value']; ?></dd>
</dl>
</div>											
<?php } ?>
<?php } ?>
</div>
<div class="more-block">
<div>
<a href="<?php echo $product['href']; ?>" class="more">Подробнее</a>

<?php if($product['model']){ ?>
<span class="id">ID <b><?php echo $product['model']; ?></b></span>
<?php } ?>
</div>
<?php if($product['price']) { ?>
<div>
<span class="price-rub"><?php echo $product['rub']; ?> руб.</span>
<span class="price-usd"><?php echo $product['price']; ?> $</span>
</div>
<?php } ?>
</div>
</div>
</li>
<?php } ?>
</ul>
</div>
</div>