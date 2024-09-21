<?php
//列出產品類別第一層
$SQLstring = "SELECT * FROM pyclass ORDER BY sort";
$pyclass01 = $link->query($SQLstring);
$i = 1; //控制編號順序
?>
<div class="row mb-5">
    <h3 class="mb-5 left">產品種類</h3>
    <?php
    while ($pyclass01_Rows = $pyclass01->fetch()) {
        $i = $pyclass01_Rows['classid'];
    ?>
        <div class="col-md-4 text-center up">
            <div class="card csh">
                <a href="product.php?classid=<?php echo $pyclass01_Rows['classid']; ?>">
                    <div class="img-container">
                        <img src="images/<?php echo $pyclass01_Rows['cname']; ?>.jpg" class="card-img-top" alt="<?php echo $pyclass01_Rows['cname']; ?>" title="<?php echo $pyclass01_Rows['cname']; ?>">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title"><?php echo $pyclass01_Rows['cname']; ?></h4>
                        <p class="c1"><?php echo $pyclass01_Rows['ctext']; ?></p>
                    </div>
                </a>
            </div>
        </div>
    <?php $i++;
    } ?>
</div>