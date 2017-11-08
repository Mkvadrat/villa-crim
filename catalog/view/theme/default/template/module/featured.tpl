
<div class="row" id="rowp">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
              <p><?php echo $product['name']; ?></p>
                <?php if($product['price']) { ?>
                <!--<p class="price"><span>Цена:</span>
                  <?php if (!$product['pricerus']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span><?php echo $product['pricerus']; ?></span>
                  <?php } ?>
                </p>-->
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
  <?php } ?>
</div>

