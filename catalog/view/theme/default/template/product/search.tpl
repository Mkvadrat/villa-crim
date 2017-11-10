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
      <ul class="left-navbar mar">
                        <li><a href="http://villa-crimea.com.ru/ychastki">Участки</a></li>
                                <li><a href="http://villa-crimea.com.ru/kvartiri">Квартиры</a></li>
                                <li><a href="http://villa-crimea.com.ru/doma">Дома</a></li>
                                <li><a href="http://villa-crimea.com.ru/gostinici">Гостиницы</a></li>
                                <li><a href="http://villa-crimea.com.ru/ellingi">Эллинги</a></li>
                                <li><a href="http://villa-crimea.com.ru/garaji">Гаражи</a></li>
                                <li><a href="http://villa-crimea.com.ru/komercheskaya">Коммерческая недвижимость</a></li>
                                <li><a href="http://villa-crimea.com.ru/racshirenii-poisk">Расширенный поиск</a></li>
                      </ul>
    </div>
  </nav>
    <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
     
        <div class="col-md-2">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-md-2">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>

      <div class="col-md-2">
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </div>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
      <?php if ($products) { ?>
        <div class="row" id="categ">  
        <div class="col-md-0">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-1 text-right">
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
      </div>
      <br />
     <div class="row">
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
													<img class="labe" src="catalog/view/theme/default/image/label-sale.png" alt="">
												<?php }elseif($product['badge'] == 5){ ?>
													<img class="labe" src="catalog/view/theme/default/images/labe.png" alt="">
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
        <!--<?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
              <p><?php echo $product['name']; ?></p>
                <?php if ($product['price']) { ?>
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
        </div>
        <?php } ?>-->
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?> 