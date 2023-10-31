<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php
if (isset($_POST['flag'])) {
    //要將使用者送出的訊息資料回寫到資料庫
    $cname = $_POST['cname'];
    $tel = $_POST['tel'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $message = $_POST['message'];
    $SQLstring = sprintf("INSERT INTO feedback (cname, tel, email, address, message) VALUES ('%s','%s','%s','%s','%s')", $cname, $tel, $email, $address, $message);
    $result = $link->query($SQLstring);
    if ($result) {
        echo "<script>alert('謝謝您!送出資料已經收到，我們盡速與您聯絡。');</script>";
    } else {
        echo "<script>alert('資料無法寫入，請與管理員聯絡。');</script>";
    }
}
?>

<head>
    <?php require_once("headfile.php"); ?>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container text-center mt-5 pb-5 box">
            <div class="row">
                <div class="col-sm-12 mt-5">
                    <h2>聯絡我們</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8 offset-2">
                    <form action="contact.php" method="post" name="form1" id="form1">
                        <div class="row">
                            <input type="text" class="form-control" name="cname" id="cname" placeholder="Name" required>
                        </div>
                        <br>
                        <div class="row">
                            <input type="number" class="form-control" name="tel" id="tel" placeholder="TEL" required>
                        </div>
                        <br>
                        <div class="row">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                        </div>
                        <br>
                        <div class="row">
                            <input type="text" class="form-control" name="address" id="address" placeholder="Address" required>
                        </div>
                        <br>
                        <div class="row">
                            <textarea class="form-control" name="message" id="message" rows="6" placeholder="Message" required></textarea>
                            <input type="hidden" name="flag" id="flag" value="form1">
                        </div>
                        <br>
                        <button type="submit" class="btn btn-mycolor btn-lg">送出</button>
                    </form>
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