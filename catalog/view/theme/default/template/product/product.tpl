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
      <ul class="left-navbar prod">
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
    <?php echo $content_top; ?>
      <div class="row" id="prod">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
        <h1><?php echo $heading_title; ?>
            <?php if($price) { ?>
            <?php echo $rub; ?> руб. / <?php echo $price; ?> $
            <?php } ?>
        </h1>

        <?php if ($thumb || $images) { ?>
        <ul class="thumbnails">
          <?php if ($thumb) { ?>
          <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
          <?php } ?>
          <img class="elem3" src="/image/catalog/elem1.png">
          <?php if ($images) { ?>
          <div id="slideshow">
          <div id="slidesContainer">
          <?php foreach ($images as $image) { ?>
          
          <li class="image-additional slide"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
          
          <?php } ?>
          </div>
          </div>
          <?php } ?>
        </ul>
        <?php } ?>
         
  
        </div>
        <div class="col-sm-8">
         <div class="detali-content">
           
          <ul class="list-unstyled">
            <h3>Детали:</h3>
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <?php if($price) { ?>
            <li><span>Цена:</span> <?php echo $rub; ?> руб. / <?php echo $price; ?> $</li>
            <?php } ?>
            <?php if ($location) { ?>
            <li><span>Адрес:</span> <?php echo $location; ?></li>
            <?php } ?>
            <?php if ($totalarea) { ?>
            <li><span><?php echo $entry_totalarea; ?></span> <?php echo $totalarea; ?></li>
            <?php } ?>
            <?php if ($ucharea) { ?>
            <li><span><?php echo $entry_ucharea; ?></span> <?php echo $ucharea; ?></li>
            <?php } ?>
            <?php if ($houseroom) { ?>
            <li><span><?php echo $entry_houseroom; ?></span> <?php echo $houseroom; ?></li>
            <?php } ?>
            <?php if ($kitchen) { ?>
            <li><span><?php echo $entry_kitchen; ?></span> <?php echo $kitchen; ?></li>
            <?php } ?>
            <?php if ($level) { ?>
            <li><span><?php echo $entry_level; ?></span> <?php echo $level; ?></li>
            <?php } ?>
            <?php if ($storeys) { ?>
            <li><span><?php echo $entry_storeys; ?></span> <?php echo $storeys; ?></li>
            <?php } ?>
            <?php if ($furniture) { ?>
            <li><span><?php echo $entry_furniture; ?></span> <?php echo $furniture; ?></li>
            <?php } ?>
            <?php if ($purpose) { ?>
            <li><span><?php echo $entry_purpose; ?></span> <?php echo $purpose; ?></li>
            <?php } ?>
            <?php if ($ownership) { ?>
            <li><span><?php echo $entry_ownership; ?></span> <?php echo $ownership; ?></li>
            <?php } ?>
            <?php if ($Light) { ?>
            <li><span><?php echo $entry_Light; ?></span> <?php echo $Light; ?></li>
            <?php } ?>
            <?php if ($Gas) { ?>
            <li><span><?php echo $entry_Gas; ?></span> <?php echo $Gas; ?></li>
            <?php } ?>
            <?php if ($Water) { ?>
            <li><span><?php echo $entry_Water; ?></span> <?php echo $Water; ?></li>
            <?php } ?>
            <?php if ($sewerage) { ?>
            <li><span><?php echo $entry_sewerage; ?></span> <?php echo $sewerage; ?></li>
            <?php } ?>
            <?php if ($numrooms) { ?>
            <li><span><?php echo $entry_numrooms; ?></span> <?php echo $numrooms; ?></li>
            <?php } ?>
            <?php if ($colnums) { ?>
            <li><span><?php echo $entry_colnums; ?></span> <?php echo $colnums; ?></li>
            <?php } ?>
            <?php if ($colsanuz) { ?>
            <li><span><?php echo $entry_colsanuz; ?></span> <?php echo $colsanuz; ?></li>
            <?php } ?>
            <?php if ($remont) { ?>
            <li><span><?php echo $entry_remont; ?></span> <?php echo $remont; ?></li>
            <?php } ?>
                      <?php if ($phone) { ?>
            <li><span><?php echo $entry_phone; ?></span> <?php echo $phone; ?></li>
            <?php } ?>
            <?php if ($FIO) { ?>
            <li><span><?php echo $entry_FIO; ?></span> <?php echo $FIO; ?></li>
            <?php } ?>
            <?php if ($reward) { ?>
            <li><span><?php echo $text_reward; ?></span> <?php echo $reward; ?></li>
            <?php } ?>
  
          </ul>

          
          <ul class="list-unstyled osob">
          <h3>Особенности:</h3>
                      <?php if ($komunikacion) { ?>
            <li>Имеются все коммуникации</li>
            <?php } ?>
          <?php if ($ymore) { ?>
            <li>У моря</li>
            <?php } ?>
            <?php if ($vidmore) { ?>
            <li>Вид на море</li>
            <?php } ?>
            <?php if ($vidgori) { ?>
            <li>Вид на горы</li>
            <?php } ?>
          </ul>
          </div>
          <div style="clear: both;"></div>
           <div class="tab-content">
          <h3>Описание:</h3>
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                    <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                </div>
                <div class="buttons">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
          <?php if ($price) { ?>

          <?php } ?>
           <div class="tab-content">
           <?php
if (isset($_POST['name'])) {$name = $_POST['name']; if ($name == '') {unset($name);}}
if (isset($_POST['email'])) {$email = $_POST['email']; if ($email == '') {unset($email);}}
if (isset($_POST['tel'])) {$tel = $_POST['tel']; if ($tel == '') {unset($tel);}}
if (isset($_POST['body'])) {$body = $_POST['body']; if ($body == '') {unset($body);}}


 

if (isset($name) && isset($email) && isset($tel) && isset($body)){
 
$address = "villa-crimea@mail.ru";
$mes = "Объект:$heading_title \nИмя: $name \nE-mail: $email \nНомер телефона: $tel \nТекст: $body";
$send = mail ($address,$tel,$mes,"Content-type:text/plain; charset = UTF-8\r\nFrom:$email");
if ($send == 'true')
{echo "Сообщение отправлено успешно.";}
else {echo "Ошибка, сообщение не отправлено!";}
 
}
if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['tel'])){
  $name = $_POST['name'];
  $email = $_POST['email'];
  $tel = $_POST['tel'];
  if ($name == '' || $email == '' || $tel == '') {
    unset($name);
    unset($email);
    unset($tel);
    echo "Ошибка, сообщение не отправлено! Заполните все поля!";
}
}
?>
 
<h3>Форма обратной связи.</h3>
     <script type="text/javascript">
    var a = Math.ceil(Math.random() * 10);
    var b = Math.ceil(Math.random() * 10);       
    var c = a + b
    function DrawBotBoot()
    {
        document.write("What is "+ a + " + " + b +"? ");
        document.write("<input id='BotBootInput' type='text' maxlength='2' size='2'/>");
    }    
    function ValidBotBoot(){
        var d = document.getElementById('BotBootInput').value;
        if (d == c) return true;        
        return false;
        
    }
    </script>
      <link rel="stylesheet" href="catalog/view/javascript/jquery/QapTcha.jquery.css" type="text/css">
<!--<form name="MyForm" action="" method="post">
<p><input class="input" name="name" type="text" style="width:15%" /> Ваше имя*</p>
<p><input class="input" name="email" type="text" style="width:15%" /> Электронная почта*</p>
<p><input class="input" name="tel" type="text" style="width:15%" /> Номер телефона*</p>
<p>Текст сообщения:<br /><textarea name="body" cols="1" rows="5" style="width:30%" /></textarea></p>
    <div class="QapTcha"></div>

    <input id="submit" type="submit" name="btp-submit" value="Отправить" disabled="">

</form>-->

<div>
  <p><input type="text" value="" id="name5" name="name" placeholder="Имя"></p>
  <p><input type="text" value="" id="email5" name="email" placeholder="Email"></p>
  <p><input type="text" value="" id="phone5" name="phone" placeholder="Телефон"></p>
  <p><textarea value="" id="body5" name="body" placeholder="Вопрос"></textarea></p>
  <div class="QapTcha"></div><br/><br/><br/><br/><br/><br/>
  
  <input type="submit" onclick="SendCallbackProduct()" value="Отправить" >
</div>

<script type="text/javascript">
function SendCallbackProduct() {	
	$.ajax({
		url: 'index.php?route=product/product/productFormSend&product_id=<?php echo $product_id; ?>',
		type: 'POST',
		dataType: 'json',
		data: {'name' : $('#name5').attr('value'), 'email' : $('#email5').attr('value'), 'phone' : $('#phone5').attr('value'), 'body' : $('#body5').attr('value')},	
		success: function(response) {
			alert(response.message);
		}
	});
};
</script>

<script type="text/javascript">
  $(document).ready(function(){
    // Simple call
    $('.QapTcha').QapTcha();
    
    // More complex call
    // $('.QapTcha').QapTcha({
    //   autoSubmit : true,
    //   autoRevert : true,
    //   PHPfile : 'path_to_my_php_file/Qaptcha.jquery.php'
    // });
  });
</script>

</div>
          </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-14'; ?>
        <?php } ?>

      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script> 
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
var currentPosition = 0;
var slideWidth = 140;
var slideWidt = 147;
var slides = $('.slide');
var numberOfSlides = slides.length;

// Remove scrollbar in JS
$('#slidesContainer').css('overflow', 'hidden');

// Wrap all .slides with #slideInner div
slides
.wrapAll('<div id="slideInner"></div>')
// Float left to display horizontally, readjust .slides width
.css({
'float' : 'left',
'width' : slideWidth
});

// Set #slideInner width equal to total width of all slides
$('#slideInner').css('width', slideWidth * numberOfSlides+200);

// Insert controls in the DOM
$('#slideshow')
.prepend('<span class="control" id="leftControl">Clicking moves left</span>')
.append('<span class="control" id="rightControl">Clicking moves right</span>');

// Hide left arrow control on first load
manageControls(currentPosition);

// Create event listeners for .controls clicks

  var handler = function(){

currentPosition = ($(this).attr('id')=='rightControl') ? currentPosition+1 : currentPosition-1;


manageControls(currentPosition);

$('#slideInner').animate({
'marginLeft' : slideWidt*(-currentPosition)
});
};

$('.control')
.on('click', handler);
if(currentPosition==0){ $('#leftControl').off('click',handler);}else{  }
function manageControls(position){

if(position==0){ $('#leftControl').off('click');  } if(position==1){ $('#leftControl').on('click',handler); }

if(position==numberOfSlides-4){ $('#rightControl').off('click');  } if(position==numberOfSlides-5){ $('#rightControl').on('click',handler); }
} 
});
</script>
<?php echo $footer; ?>