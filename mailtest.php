
<?php
    $to = 'info@rocktape.ua'; //ком� о�п�ави�� пи��мо
    $subject = 'the subject'; // �ема пи��ма
    $message = 'hello'; // �ооб�ение
    $headers = 'From: dsm@freehost.com.ua' . "\r\n" . // в поле from �каз�вае��� к�о о�п�ави�ел�.
    'Reply-To: dsm@freehost.com.ua' . "\r\n" . // в поле Reply-To ��ани��� об�а�н�й email (можно �каза�� �оже �амое ��о и в поле FROM)
    'X-Mailer: PHP/' . phpversion();
    mail($to, $subject, $message, $headers);

#mail('support@freehost.com.ua','mail test','mail test');
?>

