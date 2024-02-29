<?php
//讀取後台購物車內產品數量
$SQLstring = "SELECT * FROM cart WHERE orderid is NULL AND ip='" . $_SERVER['REMOTE_ADDR'] . "'";
$cart_rs = $link->query($SQLstring);
?>
<div class="flex">
    <div class="item">
        <div id="google_translate_element"></div>
        <!-- <div class="dropdown drop">
            <button class="btn btn-light btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                選擇語言
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">中文</a></li>
                <li><a class="dropdown-item" href="#">English</a></li>
            </ul>
        </div> -->
    </div>
    <div class="item">
        <form name="search" action="product.php" id="search" class="search" role="search" method="get">
            <div class="input-group searchtop">
                <input type="text" size="10" name="search_name" class="form-control-sm input" placeholder="產品搜尋" value="<?php echo (isset($_GET['search_name'])) ? $_GET['search_name'] : ''; ?>">
                <button class="btn btn-sm button" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="item">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <?php if (isset($_SESSION['login'])) { ?>
                    <li class="breadcrumb-item"><a href="javascript:void(0);" onclick="btn_confirmLink('是否確定登出?','logout.php')">登出</a></li>
                <?php } else { ?>
                    <li class="breadcrumb-item"><a href="login.php">登入</a></li>
                    <li class="breadcrumb-item"><a href="register.php">註冊</a></li>
                <?php } ?>
                <li class="breadcrumb-item"><a href="cart.php"><i class="fa-solid fa-cart-shopping"></i><?php echo ($cart_rs) ? $cart_rs->rowCount() : ''; ?></a>
                </li>
                <li class="breadcrumb-item"><a href="orderlist.php">查訂單</a></li>
                <?php if (isset($_SESSION['login'])) { ?>
                    <li class="dropdown breadcrumb-item">
                        <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="uploads/<?php echo ($_SESSION['imgname'] != '') ? $_SESSION['imgname'] : 'avatar.svg'; ?>" width="40" height="40" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu">
                            <a class="dropdown-item" href="orderlist.php">Order List</a>
                            <a class="dropdown-item" href="profile.php">Edit Profile</a>
                            <a class="dropdown-item" href="#" onclick="btn_confirmLink('請確定是否要登出','logout.php')">Log Out</a>
                        </ul>
                    </li>
                <?php } ?>
            </ol>
        </nav>
    </div>
</div>
<div class="logo">
    <a href="index.php"><img src="images/中藥房Logo.png" alt="興德堂中藥房" title="興德堂中藥房"></a>
</div>