<?php
$start = '<li class="breadcrumb-item active" aria-current="page">產品介紹</li>';
$level1Open = "";
$level2Open = "";
if (isset($_GET['p_id']) && $_GET['p_id'] != "") {
    //使用p_id產品代碼取出資料
    //處理第一層
    $SQLstring = sprintf("SELECT * FROM product,pyclass WHERE product.classid=pyclass.classid AND product.p_id=%d", $_GET['p_id']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level1Cname = $data['cname'];
    $level1UPclassid = $data['classid'];
    $level1Open = '<li class="breadcrumb-item"><a href="product.php?classid=' . $level1UPclassid . '">' . $level1Cname . '</a></li>';
    //處理第二層
    $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $data['p_name'] . '</li>';
    $start = '<li class="breadcrumb-item" aria-current="page"><a href="product.php">產品介紹</a></li>';
} elseif (isset($_GET['search_name'])) {
    //使用關鍵字查詢
    $level1Open = '<li class="breadcrumb-item active" aria-current="page">關鍵字查詢:' . $_GET['search_name'] . '</li>';
    $start="";
} elseif (isset($_GET['classid'])) {
    $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=1 AND classid=%d", $_GET['classid']);
    $classid_rs = $link->query($SQLstring);
    $data = $classid_rs->fetch();
    $level2Cname = $data['cname'];
    $level2Uplink = $data['uplink'];
    $level2Open = '<li class="breadcrumb-item active" aria-current="page">' . $level2Cname . '</li>';
    $start = '<li class="breadcrumb-item"><a href="product.php">產品介紹</a></li>';
}
?>
<nav aria-label="breadcrumb" class="mt-5">
    <ol class="breadcrumb b1">
        <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
        <?php echo $start . $level1Open . $level2Open; ?>
    </ol>
</nav>