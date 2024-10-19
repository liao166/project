<?php 
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8'); //return json string

require_once('Connections/conn_db.php');
(!isset($_SESSION)) ? session_start() : "";

if (isset($_SESSION['emailid']) && $_SESSION['emailid'] != "") {
    $emailid = $_SESSION['emailid'];
    $ip = $_SERVER['REMOTE_ADDR'];
    $query = sprintf("UPDATE cart SET emailid ='%s' WHERE ip='%s' AND emailid IS NULL;", $emailid, $ip);
    $result = $link->query($query);
    if ($result) {
        $retcode = array("c" => "1", "m" => '謝謝您，進入綠界系統結帳。');
    } else {
        $retcode = array("c" => "0", "m" => '抱歉!資料無法寫入後台資料庫，請聯絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>