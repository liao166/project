<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

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
            <div class="row text-center">
                <div class="col-md-12 mt-5 ltext">
                    中藥相關知識連結
                </div>
            </div>
            <div class="row mt-5 text-center">
                <div class="col-md-6">
                    <a href="https://yibian.hopto.org/" target="_blank"><img src="images/醫砭.PNG" class="animate__animated animate__zoomIn" alt="醫砭" title="醫砭"></a>
                </div>
                <div class="col-md-6">
                    <a href="https://traditional-worldmedicine.com/" target="_blank"><img src="images/中醫道.PNG" class="animate__animated animate__zoomIn" alt="中醫道" title="中醫道"></a>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-12 mt-5 ltext">
                    中藥製藥廠連結
                </div>
            </div>
            <div class="row mt-5 text-center">
                <div class="col-md-6">
                    <a href="https://www.herb.com.tw/" target="_blank"><img src="images/勝昌製藥廠.png" class="animate__animated animate__zoomIn" alt="勝昌製藥廠" title="勝昌製藥廠"></a>
                </div>
                <div class="col-md-6">
                    <a href="https://w3.sunten.com.tw/" target="_blank"><img src="images/順天堂藥廠.jpg" class="animate__animated animate__zoomIn" alt="順天堂藥廠" title="順天堂藥廠"></a>
                </div>
            </div>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
</body>

</html>