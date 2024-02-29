<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

<head>
    <?php require_once("headfile.php"); ?>
</head>
<?php
$SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product_img.sort=1 ORDER BY cartid DESC";
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
            <input type="text" name="TotalAmount" value="<?php echo $pTotal; ?>" class="form-control" />
        </label>
    </div>
    <button type="submit" class="btn btn-success mt-5">綠界線上支付</button>
</form>

</html>