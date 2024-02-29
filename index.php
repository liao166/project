<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("lineLogin.php"); ?>

<head>
    <?php require_once("headfile.php"); ?>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container">
            <?php require_once("carousel.php"); ?>
            <div class="card mb-5 mt-5 custom-card up">
                <div class="row g-5">
                    <div class="col-md-6">
                        <img src="images/中藥櫃2.jpg" class="img-fluid rounded-start" alt="中藥櫃">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h3 class="card-title mb-5 left">簡介</h3>
                            <p class="card-text">此藥房開業已有六十幾年，歷經三代所傳承的接骨技術，加上中藥的調配，醫治了許多前來看骨頭受傷的人，讓他們都得以恢復。
                            </p>
                            <div align="right">
                                <a href="about.php" class="btn btn-mycolor mt-5">更多...</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php require_once("product_class.php"); ?>
            <?php require_once("recommend.php"); ?>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
</body>
<!-- Messenger 洽談外掛程式 Code -->
<div id="fb-root"></div>

<!-- Your 洽談外掛程式 code -->
<div id="fb-customer-chat" class="fb-customerchat">
</div>

<script>
    var chatbox = document.getElementById('fb-customer-chat');
    chatbox.setAttribute("page_id", "182185321641042");
    chatbox.setAttribute("attribution", "biz_inbox");
</script>

<!-- Your SDK code -->
<script>
    window.fbAsyncInit = function() {
        FB.init({
            xfbml: true,
            version: 'v18.0'
        });
    };

    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = 'https://connect.facebook.net/zh_TW/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

</html>