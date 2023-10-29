<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

<head>
    <?php require_once("headfile.php"); ?>
    <link type="text/css" rel="stylesheet" href="fancybox-2.1.7/source/jquery.fancybox.css">
    <script>
        // 修改現有的 change 函數，以處理 + 和 - 按鈕的邏輯
        function changeQuantity(btn, n) {
            // 獲取輸入框元素
            var input = btn.parentNode.querySelector('input[type="number"]');
            // 獲取原來的數量
            var amount = parseInt(input.value);
            // 當 amount=1 時不能再點擊 "-" 按鈕
            // 使用 n < 0 表示點擊了减號按鈕
            if (amount <= 1 && n < 0) {
                alert("產品數量不得為0或為負數，請再修改數量!");
                return (false);
            } else if (amount >= 50 && n > 0) {
                alert("由於採購限制，產品數量將限制在50以下!");
                return (false);
            }
            // 根據加減來改變數量
            input.value = amount + n;
        }
    </script>
    <style type="text/css">
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        /*# sourceMappingURL=style.css.map */
    </style>
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
                    <?php require_once("product1_content.php"); ?>
                </div>
            </div>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
    <script type="text/javascript" src="fancybox-2.1.7/source/jquery.fancybox.pack.js"></script>
    <script type="text/javascript">
        $(function() {
            $('.fancybox').fancybox();
        });
    </script>
</body>

</html>