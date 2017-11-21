<!DOCTYPE html>

<!--[if IE]><![endif]-->

<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->

<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->

<!--[if (gt IE 9)|!(IE)]><!-->

<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

<!--<![endif]-->

<head>

<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title><?php echo $title; ?></title>

<base href="<?php echo $base; ?>" />

<?php if ($description) { ?>

<meta name="description" content="<?php echo $description; ?>" />

<?php } ?>

<?php if ($keywords) { ?>

<meta name="keywords" content= "<?php echo $keywords; ?>" />

<?php } ?>

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<?php if ($icon) { ?>

<link href="<?php echo $icon; ?>" rel="icon" />

<?php } ?>

<?php foreach ($links as $link) { ?>

<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />

<?php } ?>







<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.js"></script>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />

<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">

  <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-ui.js"></script>

  <script type="text/javascript" src="catalog/view/javascript/jquery/jquery.ui.touch.js"></script>

  <script type="text/javascript" src="catalog/view/javascript/jquery/QapTcha.jquery.js"></script>

<?php foreach ($styles as $style) { ?>

<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />

<?php } ?>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>



<?php foreach ($scripts as $script) { ?>

<script src="<?php echo $script; ?>" type="text/javascript"></script>

<?php } ?>

<?php echo $google_analytics; ?>



<!-- FANCYBOX -->



<link rel="stylesheet" href="catalog/view/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />

<script type="text/javascript" src="catalog/view/source/jquery.fancybox.pack.js?v=2.1.5"></script>

<link rel="stylesheet" href="catalog/view/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />



<!-- <link rel="stylesheet" href="catalog/view/theme/default/css/reset.css"> --> <!-- отваливаются стили -->



<link rel="stylesheet" href="catalog/view/theme/default/catalog/view/theme/default/css/fonts.css">

<link rel="stylesheet" href="catalog/view/theme/default/css/styles.css">

<link rel="stylesheet" href="catalog/view/theme/default/css/media.css">


<script src="catalog/view/theme/default/js/common.js" type="text/javascript"></script>

<!-- OWL CAROUSEL -->
<link rel="stylesheet" href="catalog/view/theme/default/css/owl.carousel.min.css">
<link rel="stylesheet" href="catalog/view/theme/default/css/owl.theme.default.min.css">
<script type="text/javascript" src="catalog/view/theme/default/js/owl.carousel.min.js"></script>


<!--<link rel="stylesheet" href="catalog/view/theme/default/css/owl.carousel.min.css">
<link rel="stylesheet" href="catalog/view/theme/default/css/owl.theme.default.min.css">
<script type="text/javascript" src="catalog/view/theme/default/js/owl.carousel.min.js"></script>-->



<!-- HTML5 for IE -->

<!--[if IE]>

<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>

<![endif]-->

		

</head>

<body class="<?php echo $class; ?>">



<header>

  <div class="container">

    <div class="row">

    <div class="col-sm-5">

      <ul>

        <li>Агентство недвижимости</li>

        <li>"Вилла Крым"</li>

        <li>г. Алушта, ул. Ленина, 37 Б, 2 этаж</li>

      </ul>



      <a class="fancybox req-call" href="#form-cull">Заказать звонок</a>



      <a class="fancybox sell-property" href="#req-call">Хочу продать недвижимость</a>



      <a class="fancybox by-property" href="#req-call">Хочу купить 

      недвижимость</a>



      <div class="hidden" enctype="" method="" name="">

        <div class="header-form" id="req-call">

          <div>

            <input type="text" value="" id="name2" name="name" placeholder="Имя">

            <input type="text" value="" id="email2" name="email" placeholder="Email">

            <textarea id="body2" value="" name="body" placeholder="Вопрос"></textarea>

            <button onclick="SendForm2();$.fancybox.close();" type="submit" >Отправить</button>

          </div>

<script type="text/javascript">

function SendForm2() {	

	$.ajax({

		url: 'index.php?route=common/header/feedback',

		type: 'POST',

		dataType: 'json',

		data: {'name' : $('#name2').attr('value'), 'email' : $('#email2').attr('value'), 'body' : $('#body2').attr('value')},	

		success: function(response) {

			alert(response.message);

		}

	});

};

</script>

        </div>



        <div id="form-cull">

          <div>

              <input type="text" value="" id="name3" name="name" placeholder="Имя">

              <input type="text" value="" id="phone" name="phone" placeholder="Телефон">

              <textarea value="" id="body3" name="body" placeholder="Вопрос"></textarea>

              <button onclick="SendCallback(); $.fancybox.close();" type="submit" >Отправить</button>

          </div>

<script type="text/javascript">

function SendCallback() {	

	$.ajax({

		url: 'index.php?route=common/header/callbackform',

		type: 'POST',

		dataType: 'json',

		data: {'name' : $('#name3').attr('value'), 'phone' : $('#phone').attr('value'), 'body' : $('#body3').attr('value')},	

		success: function(response) {

			alert(response.message);

		}

	});

};

</script>

        </div>

      </div>



      </div>

      <div class="col-sm-4">

        <div id="logo">

          <?php if ($logo) { ?>

          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>

          <?php } else { ?>

          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>

          <?php } ?>

        </div>

      </div>

      <div class="col-sm-3">

        <ul>

          <li>8 (978) 888-16-18</li>

          <li><span>villa-crimea</span></li>

          <li>villa-crimea@mail.ru</li>

        </ul>

        <?php echo $search; ?>



        <!-- <div class="block-ask-question">

          <button class="ask-question" type="button">Задать вопрос</button>



          <div>

            <input type="text" value="" id="name" name="name" placeholder="Имя">

            <input type="text" value="" id="email" name="email" placeholder="Email">

            <textarea id="body" value="" name="body" placeholder="Вопрос"></textarea>

            <button onclick="SendForm();" type="submit" >Отправить</button>

          </div>

<script type="text/javascript">

function SendForm() {	

	$.ajax({

		url: 'index.php?route=common/header/feedback',

		type: 'POST',

		dataType: 'json',

		data: {'name' : $('#name').attr('value'), 'email' : $('#email').attr('value'), 'body' : $('#body').attr('value')},	

		success: function(response) {

			alert(response.message);

		}

	});

};

</script>	  

		  

		  

		  

        </div> -->

      </div>

      <div  class="container">

      

    <div  class="collapse navbar-collapse navbar-ex1-collapse">

<ul class="nav navbar-nav">

<li class="dropdown"><a href="http://villa-crimea.com.ru/">Главная</a></li>

<li class="dropdown"><a href="http://villa-crimea.com.ru/yslugi">Услуги</a></li>

<li class="dropdown"><a href="<?php echo $about; ?>">О нас</a></li>

<li class="dropdown"><a href="<?php echo $contact; ?>">Контакты</a></li>

</ul>

</div> 

</div>

    </div>

  </div>

</header>

<?php if ($categories) { ?>



<div class="container">

</div>

<?php } ?>

<script type="text/javascript">



window.onload = function(){

  //document.getElementById('mar').style.height = document.getElementById ('rowp').offsetHeight+100 + "px";

  

        };      

</script> 



<script type="text/javascript">

    $(document).ready(function() {

        $(".fancybox").fancybox();

    });

</script>



<script>

  $(function(){

            $('.ask-question').click(function(){

                $('.block-ask-question').toggleClass('visible');

            });

        });

</script>