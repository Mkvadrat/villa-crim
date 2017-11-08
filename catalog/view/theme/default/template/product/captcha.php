<?php

  $string = "";
  for ($i = 0; $i < 5; $i++)
    $string .= chr(rand(84, 132)); // Генерация случайных символов
  $_SESSION['rand_code'] = $string; // Записываем код в сессию
  $dir = "fonts/"; // Путь к папке со шрифтом
  $image = imagecreatetruecolor(170, 60); // Создаём полотно
  $color = imagecolorallocate($image, 180, 85, 85); // Задаём цвет текста
  $white = imagecolorallocate($image, 255, 255, 255); // Создаём цвет заднего фона
  imagefilledrectangle($image, 0, 0, 170, 60, $white); // Закрашиваем изображение
  // Создаём текст на картинке
  imagettftext ($image, 30, 0, 10, 40, $color, $dir."verdana.ttf", $_SESSION['rand_code']); 
  header("Content-type: image/png"); // Отправляем заголовок с типом содержимого
  imagepng($image); // Выводим изображение капчи

?>