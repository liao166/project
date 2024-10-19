<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

<head>
    <?php require_once("headfile.php"); ?>
</head>

<body>
    <?php
    $SQLstring = "SELECT * FROM cart,product WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "'AND emailid is NULL AND cart.p_id=product.p_id ORDER BY cartid DESC";
    $cart_rs = $link->query($SQLstring);
    $pTotal = 0;
    ?>
    <form id="idFormAioCheckOut" class="text-center" method="post" action="./ECPayAIO_PHP-master/AioSDK/example/sample_All_CreateOrder.php">
        <?php while ($cart_data = $cart_rs->fetch()) {
            $pTotal += $cart_data['p_price'] * $cart_data['qty'] + 100;
        }
        ?>
        <div class="row">
            <label class="col-sm-8 offset-2">總計 (Total):
                <input type="text" name="TotalAmount" value="<?php echo $pTotal; ?>" class="form-control" readonly />
            </label>
        </div>
        <button id="submitbtn" type="submit" class="btn btn-success mt-5">綠界線上支付</button>
    </form>
    <?php require_once("jsfile.php"); ?>
    <script type="text/javascript">
        $(function() {
            $("#submitbtn").click(function() {
                let msg = "進入綠界結帳系統!";
                if (!confirm(msg)) return false;
                $.ajax({
                    url: 'gotoecpay.php',
                    type: 'post',
                    dataType: 'json',
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                        } else {
                            alert("Database reponse error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
        });
    </script>
</body>

</html>