<?php
if (isset($_GET['code'])) {
    $client_id = '2001774863';
    $client_secret = '4704416da61a202e39ff0a27e44df97c';
    $redirect_uri = 'http://localhost/project/index.php';
    $code = $_GET['code'];

    // 執行登入  取得登入資訊
    $data = array(
        "grant_type" => "authorization_code",
        "code" => $code,
        "redirect_uri" => $redirect_uri,
        "client_id" => $client_id,
        "client_secret" => $client_secret
    );

    $data_string = http_build_query($data);

    $ch = curl_init('https://api.line.me/oauth2/v2.1/token');
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt(
        $ch,
        CURLOPT_HTTPHEADER,
        array(
            'Content-Type: application/x-www-form-urlencoded'
        )
    );

    $result = curl_exec($ch);
    //echo $result;
    $return_arr = array();
    $return_arr = json_decode($result, true);


    // 解析 id_token
    $data = array(
        "id_token" => $return_arr['id_token'],
        "client_id" => $client_id
    );


    $data_string = http_build_query($data);

    //echo $data_string;
    $ch = curl_init('https://api.line.me/oauth2/v2.1/verify');
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt(
        $ch,
        CURLOPT_HTTPHEADER,
        array(
            'Content-Type: application/x-www-form-urlencoded'
        )
    );

    $result2 = curl_exec($ch);
    //echo $result;
    $return_arr2 = array();
    $return_arr2 = json_decode($result2, true);

    // 取得姓名
    $user_name = $return_arr2['name'];

    // 取得line編號
    $user_onlyID = $return_arr2['sub'];

    // 取得email
    $user_email = $return_arr2['email'];

    // 執行 SQL 語句尋找是否有此帳戶
    $query = sprintf("SELECT * FROM `member` WHERE email='%s' AND cname='%s'", $user_email, $user_name);
    $result = $link->query($query);
    if ($result) {
        if ($result->rowCount() == 1) {
            $data = $result->fetch();
            if ($data['active']) {
                $_SESSION['login'] = true;
                $_SESSION['emailid'] = $data['emailid'];
                $_SESSION['lineid'] = $data['lineid'];
                $_SESSION['cname'] = $data['cname'];
                $_SESSION['imgname'] = $data['imgname'];
                echo "<script>alert('會員登入成功。');</script>";
                if ($data['lineid'] == "") {
                    $query = sprintf("UPDATE `member` SET lineid='%s' WHERE member.emailid='%d'", $user_onlyID, $_SESSION['emailid']);
                    $link->query($query);
                }
            }
        } else {
            // 執行 SQL 語句以將用戶資料插入資料庫
            $insertsql = "INSERT INTO `member` (email, cname, lineid) VALUES ('" . $user_email . "', '" . $user_name . "','" . $user_onlyID . "')";
            $result = $link->query($insertsql);
            $emailid = $link->lastInsertId();     //讀剛新增會員編號
            if ($result) {
                $_SESSION['login'] = true;      //設定會員註冊完直接登入
                $_SESSION['emailid'] = $emailid;
                $_SESSION['lineid'] = $user_onlyID;
                $_SESSION['cname'] = $user_name;
                echo "<script>alert('會員註冊成功，請記得修改會員資料。');</script>";
            }
        }
    }
}
