<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  
  <div class="row"><?php echo $column_left; ?>
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
      <ul class="left-navbar" id="mar">
				<li><a href="http://villa-crimea.com.ru/ychastki">Участки</a></li>
				<li><a href="http://villa-crimea.com.ru/kvartiri">Квартиры</a></li>
				<li><a href="http://villa-crimea.com.ru/doma">Дома</a></li>
				<li><a href="http://villa-crimea.com.ru/gostinici">Гостиницы</a></li>
				<li><a href="http://villa-crimea.com.ru/ellingi">Эллинги</a></li>
				<li><a href="http://villa-crimea.com.ru/garaji">Гаражи</a></li>
				<li><a href="http://villa-crimea.com.ru/komercheskaya">Коммерческая недвижимость</a></li>
				<li><a href="http://villa-crimea.com.ru/racshirenii-poisk">Расширенный поиск</a></li>
				<li><a href="http://villa-crimea.com.ru/arenda">Аренда</a></li>
		</ul>
    </div>
  </nav>
	<div class="heading_title">
      <h1><?php echo $heading_title; ?></h1>
	</div>
    
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row" id="categ">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row"id="categ">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
       <div class="row" id="categ">
<?php echo $content_top; ?>
        <div class="col-md-0">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-1 sor text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-4 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-1 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
<button type="button" id="button-filter" class="btn btn-primary">Фильтр</button>
</div>
      <div class="row" id="categ"></div>
      <br />
      <div class="row" id="rowp">
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
												<?php if($product['options'] && $product['visible'] == 1){ ?>
													<?php foreach($product['options'] as $option){ ?>
													<?php if($option['product_option_value']){ ?>
														<?php foreach ($option['product_option_value'] as $option_value) { ?>
														<div>
															<dl>
																	<dt><?php echo $option['name']; ?></dt>
																	<dd><?php echo $option_value['name']; ?></dd>
															</dl>
														</div>
														<?php } ?>
													<?php }else{ ?>
													<div>
														<dl>
																<dt><?php echo $option['name']; ?></dt>
																<dd><?php echo $option['value']; ?></dd>
														</dl>
													</div>
													<?php } ?>
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
        <!--<?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image">
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
						</div>
            <div>
              <div class="caption">
              <p><?php echo $product['name']; ?></p>
                <?php if($product['price']) { ?>
								<p class="price"><span>Цена:</span>
								<?php echo $product['rub']; ?> руб. / <?php echo $product['price']; ?> $
								</p>
                <?php } ?>
								
								<?php if($product['badge']){ ?>
									<div class="object-box">
										<?php if($product['badge'] == 2){ ?>
										 <img class="label-object" src="catalog/view/theme/default/image/label-new.png" alt="">
										<?php }elseif($product['badge'] == 3){ ?>
											<img class="label-object" src="catalog/view/theme/default/image/label-urgently.png" alt="">
										<?php }elseif($product['badge'] == 4){ ?>
											<img class="label-object" src="catalog/view/theme/default/image/label-sale.png" alt="">
										<?php } ?>
									</div>
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
        </div>
        <?php } ?>-->
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $results; ?></div>
        <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php if ($description) { ?>
      <div class="textblok" id="tab-description">
      <img class="elem1" src="/image/catalog/elem1.png">
      <?php echo $description; ?>
      <img class="elem2" src="/image/catalog/elem2.png">
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
