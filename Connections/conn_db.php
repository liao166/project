<?php
//PDO sql連線指令
$dsn="mysql:host=localhost;dbname=chinese_pharmacy;charset=utf8";
$user="sales";
$password="123456";
$link=new PDO($dsn,$user,$password);
?>