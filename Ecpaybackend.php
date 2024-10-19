<?php 
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string

require_once('Connections/conn_db.php');
(!isset($_SESSION)) ? session_start() : "";

if (isset($_SESSION['emailid']) && $_SESSION['emailid'] != "") {
    $emailid = $_SESSION['emailid'];
    $addressid = $_POST['addressid'];
    $howpay = $_POST['howpay'];
    $ip = $_SERVER['REMOTE_ADDR'];
    $orderid = date('Ymdhis') . rand(10000, 99999); //自行產生時間+訂單編號
    $query = sprintf("INSERT INTO uorder (orderid, emailid, addressid, howpay, status) VALUES ('%s','%d','%d','%d','7');", $orderid, $emailid, $addressid, $howpay);
    $result = $link->query($query);
    if ($result) {
        $query = sprintf("UPDATE cart SET orderid ='%s', status= '8' WHERE ip='%s' AND orderid IS NULL;", $orderid, $ip);
        $result = $link->query($query);
        $retcode = array("c" => "1", "m" => '謝謝您，再次確認價錢。');
    } else {
        $retcode = array("c" => "0", "m" => '抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>