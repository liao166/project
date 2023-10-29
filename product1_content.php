<?php
$SQLstring = sprintf("SELECT * FROM product_img WHERE product_img.p_id=%d ORDER BY sort", $_GET['p_id']);
$img_rs = $link->query($SQLstring);
$imgList = $img_rs->fetch();
?>
<h2 class="text-center mt-5 proh2 up"><?php echo $data['p_name']; ?></h2>
<?php if ($_GET['p_id'] == "18") { ?>
    <div class="card mb-5 mt-5 custom-card1 up">
        <div class="row g-10">
            <div class="col-md-5">
                <a href="images/<?php echo $imgList['img_file']; ?>" class="fancybox"><img src="images/<?php echo $imgList['img_file']; ?>" class="img-fluid rounded-start" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>"></a>
            </div>
            <div class="col-md-7">
                <div class="card-body">
                    <div class="card-body">
                        <div class="row ms-5">
                            <div class="col-md-12 mb-5">
                                <p class="card-text"><?php echo $data['p_content']; ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="card mb-5 mt-5 custom-card1 up">
        <div class="row g-10">
            <div class="col-md-5">
                <a href="images/<?php echo $imgList['img_file']; ?>" class="fancybox"><img src="images/<?php echo $imgList['img_file']; ?>" class="img-fluid rounded-start" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>"></a>
            </div>
            <div class="col-md-7">
                <div class="card-body">
                    <div class="card-body">
                        <div class="row ms-5">
                            <div class="col-md-12 mb-5">
                                <p class="card-text"><?php echo $data['p_price']; ?>元</p>
                            </div>
                        </div>
                        <div class="row mt-5 ms-5">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <button type="button" class="btn btn-mycolor" onclick="changeQuantity(this, -1)">-</button>
                                    <form>
                                        <input type="number" id="qty" name="qty" class="text-center form-control mx-2 inp1" value="1" min="1" max="50" required>
                                    </form>
                                    <button type="button" class="btn btn-mycolor" onclick="changeQuantity(this, 1)">+</button>
                                </div>
                            </div>
                            <div class="col-md-12 mt-5">
                                <button name="button01" id="button01" type="button" class="btn btn-mycolor" onclick="buy(<?php echo $data['p_id']; ?>)">購買</button>
                                <button name="button02" id="button02" type="button" class="btn btn-mycolor ms-3" onclick="addcart(<?php echo $data['p_id']; ?>)">加入購物車</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <h3 class="mb-5 left">商品介紹</h3>
    <div class="mb-5">
        <?php echo $data['p_content']; ?>
    </div>
<?php } ?>