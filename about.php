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
            <p></p>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
</body>

</html>