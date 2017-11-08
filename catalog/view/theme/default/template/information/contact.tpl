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
	
	<div class="col-md-9">
			<div class="new-ontact" itemscope itemtype="http://schema.org/Organization">
			  <h2>Контакты агентства недвижимости "Вилла Крым " в г. Алушта</h2>

			  <img class="landscape" src="/image/catalog/landscape.png" alt="">

			  <div class="our-contacts">
				<div class="contacts-left">
				  <h3>АН "Вилла-Крым":</h3>
				  <p>Агентство работает с 2011 года.</p>
				  <p>Офис агентства находится в центре города</p>
				  <p>по адресу: ул. Ленина, 37 Б, 2 этаж</p>
				  <p>Удобная локация, наличие парковки.</p>
				</div>
				<div class="contacts-right">
				  <p><span>Адрес: </span>Россия, республика Крым, город Алушта, ул. Ленина, 37 Б, 2 этаж</p>
				  <p><span>Телефон:</span>8 (978) 888-16-18</p>
				  <p><span>Skype:</span>villa-crimea</p>
				  <p><span>E-mail:</span>villa-crimea@mail.ru</p>
						<meta itemprop="name" content="АН Вилла-Крым">
						<meta itemprop="address" content="Россия, республика Крым, город Алушта, ул. Ленина 37А, офис №31">
						<meta itemprop="telephone" content="8 (978) 888-16-18">
						<meta itemprop="skype" content="villa-crimea">
						<meta itemprop="email" content="villa-crimea@mail.ru">
						<meta itemprop="founder" content="Коцеблюк Евгений Дмитриевич">
				</div>
			  </div>

			  <p class="cursive" itemprop="description">Звоните и мы найдем  для вас  и вашей семьи лучший вариант !</p>

			  <h3>Мы на карте</h3>

			  <img class="pattern" src="/image/catalog/pattern.png" alt="">

				<div class="map-in-contact">
				  <div class="border-map"></div>
				  <div class="border-shadow"></div>
					<iframe src="https://api-maps.yandex.ua/frame/v1/-/CZsKF6ky" width="100%" height="526" frameborder="0" scroll="false"></iframe>
				</div>

			  <h3>Наша команда</h3>

			  <img class="pattern" src="/image/catalog/pattern.png" alt="">

			  <ul class="our-team">
				<li>
				  <figure itemscope itemtype="http://schema.org/Person">
					<img src="/image/catalog/team1.png" alt="">
					<figcaption>
					  <span itemprop="name">Коцеблюк Евгений Дмитриевич</span><br>
					  Директор<br>
					  <i>Телефон:</i> 8 (978) 861-24-44
							<meta itemprop="contactPoint" content="8 (978) 861-24-44">
					</figcaption>
				  </figure>
				</li>
				<li>
				  <figure itemscope itemtype="http://schema.org/Person">
					<img src="/image/catalog/team2.png" alt="">
					<figcaption>
					  <span itemprop="name">Коцеблюк Елена</span><br>
					  Исполнительный директор<br>
					  <i>Телефон:</i> 8 (978) 861-24-44
							<meta itemprop="contactPoint" content="8 (978) 861-24-44">
							<meta itemprop="worksFor" content="АН Вилла-Крым">
					</figcaption>
				  </figure>
				</li>
				<li>
				  <figure itemscope itemtype="http://schema.org/Person">
					<img src="/image/catalog/team3.png" alt="">
					<figcaption>
					  <span itemprop="name">Татьяна Згеря</span><br>
					  Специалист по продаже недвижимости<br>
					  <i>Телефон:</i> 8 (978) 081-11-02
							<meta itemprop="contactPoint" content="8 (978) 081-11-02">
							<meta itemprop="worksFor" content="АН Вилла-Крым">
					</figcaption>
				  </figure>
				</li>
				<!--<li>
				  <figure itemscope itemtype="http://schema.org/Person">
					<img src="/image/catalog/team4.png" alt="">
					<figcaption>
					  <span itemprop="name">Виктор Жуков</span><br>
					  Начальник отдела продаж<br>
					  <i>Телефон:</i> 8 (978) 815-28-83
							<meta itemprop="contactPoint" content="8 (978) 815-28-83">
							<meta itemprop="worksFor" content="АН Вилла-Крым">
					</figcaption>
				  </figure>
				</li>-->
			  </ul>
			
			
			<h3>Форма обратной связи.</h3>

			<form action="">
            <input class="input" value="" id="name_form" name="name" type="text" style="width:15%" placeholder="Имя" />
            <input class="input" value="" id="email_form" name="email" type="text" style="width:15%" placeholder="Email" />
            <!--<input class="input" value="" id="phone_form" name="phone" type="text" style="width:15%" placeholder="Вопрос" />-->
        <textarea value="" id="body_form" name="body" cols="1" rows="5" style="width:30%" placeholder="Вопрос"/></textarea></p>
            <p><input onclick="SendForm();" value="Отправить" type="submit" /></p>
            </div>
            <script type="text/javascript">
            function SendForm() { 
              $.ajax({
                url: 'index.php?route=information/information/callbackform',
                type: 'POST',
                dataType: 'json',
                data: {'name' : $('#name_form').attr('value'), 'email' : $('#email_form').attr('value'), 'tel' : $('#phone_form').attr('value'), 'body' : $('#body_form').attr('value')}, 
                success: function(response) {
                  alert(response.message);
                }
              });
            };
            </script>
          </form>

		</div>
	</div>
	<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>
