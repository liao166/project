<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php"); ?>

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
            <div class="row">
                <div class="col-md-2">
                    <?php require_once("sidebar.php"); ?>
                </div>
                <div class="col-md-10">
                    <?php require_once("breadcrumb.php"); ?>
                    <?php require_once("product_list.php"); ?>
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