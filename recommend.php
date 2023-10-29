<div class="row">
    <h3 class="mb-5 left">推薦商品</h3>
    <div id="carouselExampleSlidesOnly" class="carousel slide up" data-bs-ride="carousel">
        <div class="carousel-inner">
            <?php
            $SQLstring = "SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id order by product.p_id ASC";
            $pList = $link->query($SQLstring);
            ?>
            <div class="carousel-item active">
                <div class="row text-center">
                    <?php while ($pList_Rows = $pList->fetch()) { ?>
                        <?php if ($pList_Rows['p_id'] == '1' || $pList_Rows['p_id'] == '3' || $pList_Rows['p_id'] == '6') { ?>
                            <div class="card col-md-4">
                                <a href="product1.php?p_id=<?php echo $pList_Rows['p_id']; ?>">
                                    <div class="img-container">
                                        <img src="images/<?php echo $pList_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList_Rows['p_name']; ?>" title="<?php echo $pList_Rows['p_name']; ?>">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><?php echo $pList_Rows['p_name']; ?></h5>
                                        <p class="card-text">NT<?php echo $pList_Rows['p_price']; ?></p>
                                    </div>
                                </a>
                            </div>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
            <?php
            $SQLstring = "SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id order by product.p_id ASC";
            $pList = $link->query($SQLstring);;
            ?>
            <div class="carousel-item">
                <div class="row text-center">
                    <?php while ($pList_Rows = $pList->fetch()) { ?>
                        <?php if ($pList_Rows['p_id'] == '7' || $pList_Rows['p_id'] == '8' || $pList_Rows['p_id'] == '10') { ?>
                            <div class="card col-md-4">
                                <a href="product1.php?p_id=<?php echo $pList_Rows['p_id']; ?>">
                                    <div class="img-container">
                                        <img src="images/<?php echo $pList_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList_Rows['p_name']; ?>" title="<?php echo $pList_Rows['p_name']; ?>">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><?php echo $pList_Rows['p_name']; ?></h5>
                                        <p class="card-text">NT<?php echo $pList_Rows['p_price']; ?></p>
                                    </div>
                                </a>
                            </div>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>