<?php
//列出產品類別第一層
$SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
$pyclass01 = $link->query($SQLstring);
$i = 1; //控制編號順序
?>
<div class="accordion mt-5" id="accordionExample">
    <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <em class="fas fa-shopping-bag me-1"></em>產品種類
            </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                <table class="table">
                    <tbody>
                        <?php
                        while ($pyclass01_Rows = $pyclass01->fetch()) {
                            $i = $pyclass01_Rows['classid'];
                        ?>
                            <tr>
                                <td><em class="fas <?php echo $pyclass01_Rows['fonticon']; ?>"></em><a href="product.php?classid=<?php echo $pyclass01_Rows['classid']; ?>"><?php echo $pyclass01_Rows['cname']; ?></a></td>
                            </tr>
                        <?php $i++;
                        } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>