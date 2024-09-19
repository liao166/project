<?php
//建立product
$maxRows_rs = 12;   //分業設定數量
$pageNum_rs = 0;   //起啟頁=0
if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}
$startRow_rs = $pageNum_rs * $maxRows_rs;
if (isset($_GET['search_name'])) {
    //使用關鍵字查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid=pyclass.classid AND product.p_name LIKE '%s' order by product.p_id ASC", '%' . $_GET['search_name'] . '%');
} elseif (isset($_GET['classid'])) {
    //使用產品類別查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img,pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid=pyclass.classid AND pyclass.classid='%d' order by product.p_id ASC", $_GET['classid']);
} else {
    //列出產品product資料查詢
    $queryFirst = sprintf("SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id order by product.p_id ASC");
}

$query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
$pList01 = $link->query($query);
$i = 1; //控制每列row產生
?>
<?php if ($pList01->rowCount() != 0) { ?>
    <?php while ($pList01_Rows = $pList01->fetch()) { ?>
        <?php if ($i % 4 == 1) { ?><div class="row text-center"><?php } ?>
            <?php if ($pList01_Rows['p_id'] == "18") { ?>
                <div class="card col-md-3">
                    <a href="product1.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                        <div class="img-container">
                            <img src="images/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $pList01_Rows['p_name']; ?></h5>
                            <p class="card-text">價位依選擇的藥材而定</p>
                        </div>
                    </a>
                </div>
            <?php } else { ?>
                <div class="card col-md-3">
                    <a href="product1.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                        <div class="img-container">
                            <img src="images/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $pList01_Rows['p_name']; ?></h5>
                            <p class="card-text">NT<?php echo $pList01_Rows['p_price']; ?></p>
                        </div>
                    </a>
                    <button name="btn01" id="btn01" type="button" class="cartbtn mb-5" onclick="pdaddcart(<?php echo $pList01_Rows['p_id']; ?>)"><i class="fa-solid fa-cart-shopping"></i></button>
                </div>
            <?php } ?>
            <?php if ($i % 4 == 0 || $i == $pList01->rowCount()) { ?>
            </div> <?php } ?>
    <?php $i++;
    } ?>
    <div class="row mt-2">
        <div class="col-md-12">
            <?php
            //取得目前頁數
            if (isset($_GET['totalRows_rs'])) {
                $totalRows_rs = $_GET['totalRows_rs'];
            } else {
                $all_rs = $link->query($queryFirst);
                $totalRows_rs = $all_rs->rowCount();
            }
            $totalRows_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
            //呼叫分頁功能函數
            $prev_rs = "&laquo;";
            $next_rs = "&raquo;";
            $separator = "|";
            $max_links = 20;
            $pages_rs = buildNavigation($pageNum_rs, $totalRows_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
            ?>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                </ul>
            </nav>
        </div>
    </div>
<?php } else { ?>
    <div class="alert alert-danger" role="alert">
        抱歉，沒有相關產品。
    </div>
<?php } ?>