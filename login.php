<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

<?php
//取得要返回的php頁面
if (isset($_GET['sPath'])) {
    $sPath = $_GET['sPath'] . ".php";
} else {
    //登入完成預設要進入首頁
    $sPath = "index.php";
}
//檢查是否完成登入驗證
if (isset($_SESSION['login'])) {
    header(sprintf("location: %s", $sPath));
}
?>

<head>
    <?php require_once("headfile.php"); ?>
    <style type="text/css">
        /* Card component */
        .mycard.mycard-container {
            max-width: 400px;
            height: 660px;
        }

        .mycard {
            background-color: #f7f7f7;
            padding: 20px 25px 30px;
            margin: 0 auto 25px;
            margin-top: 100px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }

        .profile-img-card {
            margin: 0 auto 10px auto;
            display: block;
            width: 80px;
        }

        .profile-name-card {
            font-size: 20px;
            text-align: center;
        }

        .form-signin input[type="email"],
        .form-signin input[type="password"],
        .form-signin button {
            width: 100%;
            height: 44px;
            font-size: 16px;
            display: block;
            margin-bottom: 20px;
        }

        .btn.btn-signin {
            font-weight: 700;
            background-color: #ab7f20;
            color: white;
            height: 38px;
            transition: background-color 1s;
        }

        .btn-signin:hover,
        .btn-signin:active,
        .btn-signin:focus {
            background-color: #6d3220;
        }

        .form-signin .btn1 {
            display: flex;
            align-items: center;
            flex-direction: column;
        }

        .btn.lineimg {
            width: 110px;
            height: 32px;
            background-image: url(./images/btn_login_base.png);
            background-repeat: no-repeat;
        }

        .btn.lineimg:hover {
            background-image: url(./images/btn_login_hover.png);
        }

        .btn.lineimg:active {
            background-image: url(./images/btn_login_press.png);
        }

        .other a, p{
            color: #ab7f20;
            font-size: 20px;
        }

        .other a:hover,
        .other a:active,
        .other a:focus {
            color: #6d3220;
        }

        .content .row .col-md-12 {
            min-height: 1000px;
        }
    </style>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 loginbg">
                    <div class="mycard mycard-container">
                        <img id="profile-img" class="profile-img-card" src="images/太極1.png">
                        <p id="profile-name" class="profile-name-card">會員登入</p>
                        <form action="" method="POST" class="form-signin" id="form1">
                            帳號:<input type="email" id="inputAccount" name="inputAccount" class="form-control" placeholder="example:name@gmail.com" required autofocus>
                            密碼:<input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                            <button class="btn btn-signin mt-4" type="submit">Sign in</button>
                            <div class="other mt-5 text-center">
                                <a href="register.php">新用戶/</a><a href="contact.php">忘記密碼?</a>
                            </div>
                            <hr>
                            <div class="btn1">
                                <p class="other">使用以下方式註冊或登入</p>
                                <button id="lineLogin" class="btn lineimg text-center"></button>
                                <div id="g_id_onload" data-client_id="745588392722-ldt3hokig9ll3mk6nekm1qmj9apnipo5.apps.googleusercontent.com" data-callback="handleCallback" data-context="signin" data-ux_mode="popup" data-auto_prompt="false">
                                </div>
                                <div class="g_id_signin" data-type="standard" data-shape="rectangular" data-theme="filled_blue" data-text="signin" data-size="medium" data-logo_alignment="left" data-width="110">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
    <script type="text/javascript" src="commlib.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#form1").submit(function() {
                const inputAccount = $("#inputAccount").val();
                const inputPassword = MD5($("#inputPassword").val());
                $("#loading").show();
                //利用$.ajax函數呼叫後台的auth_user.php驗證帳號密碼
                $.ajax({
                    url: 'auth_user.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        inputAccount: inputAccount,
                        inputPassword: inputPassword,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            // window.location.reload();
                            window.location.href = "<?php echo $sPath; ?>";
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫。");
                    }
                });
            });
            $('#lineLogin').on('click', function(e) {
                let client_id = '2001774863';
                let redirect_uri = 'http://localhost/project/index.php';
                let link = 'https://access.line.me/oauth2/v2.1/authorize?';
                link += 'response_type=code';
                link += '&client_id=' + client_id;
                link += '&redirect_uri=' + redirect_uri;
                link += '&state=login';
                link += '&scope=openid%20profile%20email';
                window.location.href = link;
            });
        });
    </script>
    <script>
        // 成功登入後的回調函數
        function parseJwt(token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };

        function handleCallback(response) {
            const data = parseJwt(response.credential);
            console.log(data);

            // 將 'data' 資料透過 AJAX 發送到後端（PHP）
            $.ajax({
                type: 'POST',
                url: 'googleLogin.php', // 您的 PHP 文件
                dataType: 'json',
                data: {
                    userData: data
                }, // 您要傳送的使用者資料
                success: function(data) {
                    if (data.c == true) {
                        alert(data.m);
                        window.location.href = "<?php echo $sPath; ?>";
                        // 處理成功訊息（可選）
                    } else {
                        alert(data.m);
                    }
                },
                error: function(error) {
                    alert('發生錯誤：', error);
                    // 處理錯誤訊息（可選）
                }
            });
        }
    </script>
    <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255, 255, 255,.5);z-index:9999;"><i class="spinner-border text-warning" style="position:absolute;top:50%;left:50%;"></i></div>
</body>

</html>