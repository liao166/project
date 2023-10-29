<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php"); ?>
<?php
//驗證是否帳號登入
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=orderlist";
    header(sprintf("Location:%s", $sPath));
}
?>
<head>
    <?php require_once("headfile.php"); ?>
    <style type="text/css">
        .accordion-header a {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container">
            <?php require_once("order_content.php"); ?>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
</body>

</html>