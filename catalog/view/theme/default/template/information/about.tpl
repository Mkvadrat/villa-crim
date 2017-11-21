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
 
	<div class="left-menu" >
	  <ul class="left-navbar" id="mar">
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
		
	<?php echo $content_top; ?>
	
  <!-- ABOUT US -->
  <div class="container">
	<div class="row">
	  <div class="col-md-9">
		<div class="new-about-us">
		  <h2>О нас</h2>
		<div class="wrap-slider">
		  	<div class="owl-carousel owl-theme">
			    <div class="item"><img class="our-team" src="/image/catalog/sl1.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl2.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl3.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl4.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl5.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl6.jpg" alt=""></div>
			    <div class="item"><img class="our-team" src="/image/catalog/sl7.jpg" alt=""></div>
			</div>
		</div>

		  <!-- <img class="our-team" src="/image/catalog/our-team.png" alt=""> -->

		  <h2>Агентство недвижимости в Алуште «Вилла Крым» это все самое лучшее, что может предложить наш город для тех, кто решил купить недвижимость на ЮБК.</h2>

		  <img class="pattern" src="/image/catalog/pattern.png" alt="">

		  <p>Недвижимость Алушты и Алуштинского района  - это огромный выбор  домов, земельных участков под застройку, вторичных квартир, элитных вилл и апартаментов, а также гостиниц и пансионатов.</p>

		  <p>Объекты в нашем городе давно и прочно составляют конкуренцию недвижимости в Ялте, благодаря тому, что представляют для покупателей жилья в Крыму серьезную альтернативу  по многим параметрам:</p>

		  <ol>
			<li><span>Алуштинский район располагает большими земельными ресурсами, чем Ялта;</span></li>
			<li><span>цена за метр квадратный жилья ниже до 50 %, при сохранении всех природных выгод  ЮБК</span></li>
			<li><span>обширный выбор  объектов: домов, вилл, квартир, земельных участков, гостиниц  с готовыми под продажу документами РФ;</span></li>
			<li><span>адекватное соответствие «цена/качество» - без переплаты за всем известное «что вы хотели, ну это же Ялта!»;</span></li>
			<li><span>хорошие пляжи, отличная инфраструктура районов, ухоженный милый город с налаженной самостоятельной жизнью и «в сезон» и в «не сезон»: банки, супермаркеты, заправки и СТО, больницы и школы, медицинские и SPA-центры, детские развлекательные комплексы и  др., крайне низкий уровень преступности – жизнь в Алуште комфортна и спокойна.</span></li>
		  </ol>

		  <img class="view" src="/image/catalog/view.png" alt="">

		  <h2>Определившись с бюджетом,  необходимо выбрать – что конкретно вы хотите купить:</h2>

		  <img class="pattern" src="/image/catalog/pattern.png" alt="">

		  <ul>
			<li>дом или виллу</li>
			<li>квартиру в Алуште с ремонтом или под ремонт</li>
			<li>участок под застройку в Алуштинском районе (с видом на море, с видом на горы, с коммуникациями, с электричеством, водопроводом, канализацией, газифицированный, ровный, с уклоном, недорого и пр.)</li>
			<li>гостиницу, отель или пансионат на ЮБК (действующую, под ремонт, с мебелью и оборудованием, </li>
		  </ul>

		  <p> И каждый раздел  сайта агентства недвижимости "Вилла Крым" состоит из десятков  новых объявлений о продаже недвижимости в Алуште. Подбор вариантов, общение с продавцами, просмотры множества объектов - все....времени. Ведь известно, что каждый хозяин хвалит свой объект, поэтому так важно, чтобы предварительно перед покупкой дома или квартиры риелтор оценил реальное состояние жилья, расположение, состояние документов и др., чтобы вы сосредоточились на отобранных по вашим требованиям и наиболее подходящих вариантах для вас и ваших близких. Все это занимает огромное количество времени.</p>

		  <p> Кроме того, чтобы подобрать лучший вариант для покупки вам необходимо знать все местные особенности:</p>

		  <ul>
			<li>Это и реальный район, его состояние и расположение при покупке квартиры,</li>
			<li>местонахождение земельного надела, подъездные пути и сети, которые обслуживают это место,</li>
			<li>возможность постройки на этом месте дома, особенности почвы,</li>
			<li>есть ли необходимость выравнивания или  укрепления грунта</li>
			<li>подбор виллы в нужном месте, в зависимости от ваших пожеланий – с мебелью или без, с большим участком, с ландшафтным дизайном, «под ключ»</li>
			<li>приобретение гостиницы или коммерческого помещения – это всегда планирование успешного рентабельного бизнеса, который в огромной степени зависит от расположения и состояния </li>
		  </ul>

		  <p> Работая с нами, вы получаете специалистов, прекрасно знающих все свои объекты, специфику каждого поселка, каждого объекта недвижимости, представленного на сайте www.villa-crimea.com.ru.</p>

		  <img class="view1" src="/image/catalog/view1.png" alt="">

		  <h2>Недвижимость Алушты: купля-продажа по выгодным ценам<br>
		  <span>С нами приятно и выгодно работать:</span></h2>

		  <img class="pattern" src="/image/catalog/pattern.png" alt="">

		  <div class="for-salespeople">
			<h4>Для продавцов:</h4>

			<p>Выгодно и быстро продать ваш объект – вот основная цель нашей работы.  И мы ежедневно работает над совершенствованием продаж:  на нашем счету сотни успешных сделок!</p>

			<ul>
			  <li>• Продажа,  а так же выкуп объектов недвижимости на Южном Берегу Крыма (Алушта и Ялта, от пгт. Рыбачьего до Фороса);</li>

			  <li>• Профессиональная оценка;</li>

			  <li>• консалтинговые услуги в сфере недвижимости;</li>

			  <li>• подготовка и юридическое сопровождение сделок.</li>
			</ul>

			<p>Мы предоставляем персональный сервис каждому продавцу. Агентство располагает широким спектром дополнительных услуг по продаже недвижимости в Алуште:</p>

			<ul>
			  <li>• личные сайты,</li>

			  <li>• реклама в газетах и журналах,</li>

			  <li>• на остановках,</li>

			  <li>• в лифтах,</li>
			  
			  <li>• профессиональная реклама на всех известных  авторитетных интернет-порталах.</li>
			</ul>
		  </div>

		  <div class="for-buyers">
			<h4>Для покупателей:</h4>

			<p>Купить жилье в Алуште с помощью агентства недвижимости  «Вилла Крым» - это Грамотный подбор, спокойный комфортный выбор и осмотр, юридически и финансово защищенная сделка купли-продажи.</p>

			<p>Агентство работает с 2011 года и полностью владеет всей базой объектов  недвижимости Алушты и Алуштинского  района.  На сайте выставлены только существующие объекты, представленные  на продажу хозяевами.</p>

			<p>К каждому покупателю мы находим индивидуальный подход и поддерживаем теплые отношения и после заключения сделки, и большинство клиентов становятся нашими друзьями.</p>

			<p>И мы благодарны за то, что они приводят к нам своих друзей, чтобы купить или продать с нашей помощью комфортный дом или уютную квартиру в Алуште.</p>

			<p>За время работы агентства главным для нас стало доверие клиентов.</p>
		  </div>

		  <div class="our-contacts">
			<p>У нас  отлично налажена система партнерских продаж:  мы отправляем сведения об объекте все партнерам по ЮБК. Это отличная возможность сэкономить время Продавца -  больше не надо обращаться в несколько агентств.</p>

			<p>Весь спектр риэлторских услуг, отличный  сервис и  профессиональное юридическое сопровождение сделки на всех этапах: от подготовки документов  до проведения сделки.</p>

			<p>Наш офис расположен в центре Алушты, по адресу: г.Алушта, ул. Ленина, 37 Б, 2 этаж</p>
		  </div>

		  <p class="cursive">Звоните и мы найдем  для вас  и вашей семьи лучший вариант !</p>

		  <h2>Наши сертификаты</h2>

		  <img class="pattern" src="/image/catalog/pattern.png" alt="">

		  <a class="fancybox f-sertificate" rel="group" href="/image/catalog/2sert.jpg"><img src="/image/catalog/f-sert.png" alt="" /></a>

		  <a class="fancybox s-sertificate" rel="group" href="/image/catalog/1sert.jpg"><img src="/image/catalog/s-sert.png" alt="" /></a>
		</div>
	  </div>
	</div>
  </div>

	<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>
