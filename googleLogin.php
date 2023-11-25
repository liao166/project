<?php
header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json;charset=utf-8');
(!isset($_SESSION)) ? session_start() : "";
require_once('Connections/conn_db.php');

if (isset($_POST['userData'])) {
    $userData = $_POST['userData']; // 從前端獲取的使用者資料
    $name = $userData['name']; // 假設這是資料中的名稱
    $email = $userData['email']; // 假設這是資料中的電子郵件
    $userid = $userData['sub'];
    // 執行 SQL 語句尋找是否有此帳戶
    $query = sprintf("SELECT * FROM `member` WHERE email='%s' AND cname='%s'", $email, $name);
    $result = $link->query($query);
    if ($result) {
        if ($result->rowCount() == 1) {
            $data = $result->fetch();
            if ($data['active']) {
                $_SESSION['login'] = true;
                $_SESSION['emailid'] = $data['emailid'];
                $_SESSION['googleid'] = $data['googleid'];
                $_SESSION['cname'] = $data['cname'];
                $_SESSION['imgname'] = $data['imgname'];
                $retcode = array("c" => "1", "m" => '會員登入成功。');
                if ($data['googleid'] == "") {
                    $query = sprintf("UPDATE `member` SET googleid='%s' WHERE member.emailid='%d'", $userid, $_SESSION['emailid']);
                    $link->query($query);
                }
            }
        } else {
            // 執行 SQL 語句以將用戶資料插入資料庫
            $insertsql = "INSERT INTO `member` (email, cname, googleid) VALUES ('" . $email . "', '" . $name . "', '" . $userid . "' )";
            $result = $link->query($insertsql);
            $emailid = $link->lastInsertId();     //讀剛新增會員編號
            if ($result) {
                $_SESSION['login'] = true;      //設定會員註冊完直接登入
                $_SESSION['emailid'] = $emailid;
                $_SESSION['email'] = $email;
                $_SESSION['cname'] = $name;
                $_SESSION['googleid'] = $userid;
                $retcode = array("c" => "1", "m" => '會員註冊成功，請記得修改會員資料。');
            }
        }
    } else {
        $retcode = array("c" => "0", "m" => '抱歉!會員驗證失敗，請連絡管理人員。');
    }
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}
return;
?>