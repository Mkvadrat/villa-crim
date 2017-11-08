<footer>
  <div class="container">
    <div class="row">
     <div class="col-sm-1">
      <ul class="tel" itemscope="" itemtype="http://schema.org/Organization">
        <meta itemprop="name" content="АН Вилла-Крым">
        <meta itemprop="address" content="Россия, республика Крым, город Алушта, ул. Ленина 37А, офис №31">
        <li>г.Алушта, ул. Ленина, 37 Б, 2 этаж</li>
        <li><span itemprop="email">villa-crimea@mail.ru</span> skype:<span itemprop="skype">villa-crimea</span></li>
        <li itemprop="telephone">+7 978 888 16 18</li>
      </ul>
      </div>
      <div class="col-sm-1">
       <!-- <a href="http://it-pomidor.ru/"><img src="/image/catalog/logo_P.png"></a> -->

       <ul class="by-flats">
         <li>
           <a href="http://villa-crimea.com.ru/kvartiri">Купить квартиру в Алуште</a>
         </li>
         <li>
           <a href="http://villa-crimea.com.ru/doma">Купить дом в Алуште
         </li>
       </ul>

        </div>
        <div class="col-sm-1">
        <ul class="foot-menu">
<li ><a href="http://villa-crimea.com.ru/">Агентство недвижимости в Алуште</a></li>
<li><a href="<?php echo $contact; ?>">Контакты</a></li>
</ul>

<div id="rss">
        <a href="https://www.facebook.com/villacrimea" target="_blank" title="Facebook" rel="nofollow" style="float:right; margin-right:8px; width: 30px;"><img style=" width: 100%;" src="/image/catalog/facebook.png" alt=""></a>
        <a href="http://vk.com/villacrimeacom" title="Vkontakte" rel="nofollow" target="_blank" style="float:right; margin-right:17px; width: 30px;"><img style="width: 100%;" src="/image/catalog/vkontakte.png" alt=""></a>
<a href="http://instagram.com/villa_crimea" title="Instagram" rel="nofollow" target="_blank" style="float:right; margin-right:17px; width: 30px;"><img style="width: 100%;" src="/image/catalog/instagram-icon2.png" alt=""></a>
<a href="https://www.youtube.com/user/ian1q2w3" title="Instagram" rel="nofollow" target="_blank" style="float:right; margin-right:17px; width: 30px;"><img style="width: 100%;" src="/image/catalog/youtube.png" alt=""></a>   
 </div>
</div>
      <?php if ($informations) { ?>
   <!--    <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div> -->
    </div>
<!--     <hr>
    <p><?php echo $powered; ?></p>  -->
  </div>
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter32173209 = new Ya.Metrika({
                    id:32173209,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true,
                    trackHash:true,
                    ut:"noindex"
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/32173209?ut=noindex" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>