<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=checkout";
    header(sprintf("Location: %s", $sPath));
}
?>

<head>
    <?php require_once("headfile.php"); ?>
    <style type="text/css">
        .table td,
        .table th {
            padding: 0.75rem;
            vertical-align: top;
            border-bottom: none;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container">
            <?php require_once("checkout_content.php"); ?>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
    <script type="text/javascript">
        $(function() {
            function changeLink(newText, newHref, newHowpay, newId) {
                $('#btn04').html(newText);
                $('#btn04').attr('href', newHref);
                $('#btn04').attr('howpay', newHowpay);
                $('#btn01', '#btn02', '#btn03', '#btn04').attr('id', newId);
            }

            $('#home-tab').click(function() {
                changeLink("<i class='fas fa-cart-arrow-down pr-2'></i>確認結帳", '', '3', 'btn04');
            });

            $('#profile-tab').click(function() {
                var p_name = "<?php echo $cart_data['p_name']; ?>";
                var pTotal = "<?php echo $pTotal+100; ?>";
                changeLink("<i class='fas fa-credit-card me-1'></i>信用卡付款", "Ecpay.php", '4', 'btn01');
            });

            $('#contact-tab').click(function() {
                var p_name = "<?php echo $cart_data['p_name']; ?>";
                var pTotal = "<?php echo $pTotal; ?>";
                changeLink("<i class='fas fa-university'></i>銀行轉帳付款", "Ecpay.php", '5', 'btn02');
            });

            $('#epay-tab').click(function() {
                var p_name = "<?php echo $cart_data['p_name']; ?>";
                var pTotal = "<?php echo $pTotal; ?>";
                changeLink("<i class='fas fa-money-check-alt'></i>電子支付付款", "Ecpay.php", '6', 'btn03');
            });
            //取得縣市碼後查詢鄉鎮市名稱放入#myTown
            $("#myCity").change(function() {
                var CNo = $('#myCity').val();
                if (CNo == "") {
                    return false;
                }
                $.ajax({
                    url: 'Town_ajax.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        CNo: CNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myTown').html(data.m);
                        } else {
                            alert("Database reponse error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //選鄉鎮市後，查詢郵遞區號放入#myzip,#add_lable
            $("#myTown").change(function() {
                var AutoNo = $('#myTown').val();
                if (AutoNo == "") {
                    $('#myzip').val("");
                    $('#add_label').html("");
                    return false;
                }
                $.ajax({
                    url: 'Zip_ajax.php',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        AutoNo: AutoNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myzip').val(data.Post);
                            $('#add_label').html('郵遞區號：' + data.Post + data.Cityname + data.Name);
                        } else {
                            alert("Database reponse error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //新增其他收件人檢查資料是否有輸入
            $('#recipient').click(function() {
                var validate = 0,
                    msg = "";
                var cname = $("#cname").val();
                var mobile = $("#mobile").val();
                var myzip = $("#myzip").val();
                var address = $("#address").val();
                if (cname == "") {
                    msg = msg + "收件人不得為空白!;\n";
                    validate = 1;
                }
                if (mobile == "") {
                    msg = msg + "電話不得為空白!;\n";
                    validate = 1;
                }
                if (myzip == "") {
                    msg = msg + "郵遞區號不得為空白!;\n";
                    validate = 1;
                }
                if (address == "") {
                    msg = msg + "地址不得為空白!;\n";
                    validate = 1;
                }
                if (validate) {
                    alert(msg);
                    return false;
                }
                $.ajax({
                    url: 'addbook.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cname: cname,
                        mobile: mobile,
                        myzip: myzip,
                        address: address,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database reponse error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //更換收件人處理程序
            $('input[name=gridRadios]').change(function() {
                var addressid = $(this).val();
                $.ajax({
                    url: 'changeaddr.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database reponse error：" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            //系統進行結帳處理
            $("#btn04").click(function() {
                let msg = "系統將進行結帳處理，請確認產品金額與收件人是否正確!";
                if (!confirm(msg)) return false;
                $("#loading").show();
                var addressid = $('input[name=gridRadios]:checked').val();
                var howpay = $(this).attr('howpay');
                $.ajax({
                    url: 'addorder.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                        howpay: howpay,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.href = "index.php";
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
    <!-- Modal收件人地址處理對話框 -->
    <?php
    //取得所有收件人資料
    $SQLstring = sprintf("SELECT *,city.Name AS ctName,town.Name AS toName FROM addbook,city,town WHERE emailid='%d' AND addbook.myzip=town.Post AND town.AutoNo=city.AutoNo", $_SESSION['emailid']);
    $addbook_rs = $link->query($SQLstring);
    ?>
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">收件人資訊：</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col">
                                <input type="text" name="cname" id="cname" class="form-control" placeholder="收件者姓名">
                            </div>
                            <div class="col">
                                <input type="number" name="mobile" id="mobile" class="form-control" placeholder="收件者電話">
                            </div>
                            <div class="col">
                                <select name="myCity" id="myCity" class="form-control">
                                    <option value="">請選擇市區</option>
                                    <?php $city = "SELECT * FROM `city` where State=0";
                                    $city_rs = $link->query($city);
                                    while ($city_rows = $city_rs->fetch()) { ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>">
                                            <?php echo $city_rows['Name']; ?>
                                        </option>
                                    <?php } ?>
                                </select><br>
                            </div>
                            <div class="col">
                                <select name="myTown" id="myTown" class="form-control">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="hidden" name="myzip" id="myzip" value="">
                                <label for="address" id="add_label" name="add_label">郵遞區號：</label>
                                <input type="text" name="address" id="address" class="form-control" placeholder="地址">
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-center">
                            <div class="col-auto">
                                <button type="button" class="btn btn-success" id="recipient" name="recipient">新增收件人</button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <table class="table">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">收件者姓名</th>
                                <th scope="col">電話</th>
                                <th scope="col">地址</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($data = $addbook_rs->fetch()) { ?>
                                <tr>
                                    <th scope="row"><input type="radio" name="gridRadios" id="gridRadios[]" value="<?php echo $data['addressid']; ?>" <?php echo ($data['setdefault']) ? 'checked' : ''; ?>></th>
                                    <td><?php echo $data['cname']; ?></td>
                                    <td><?php echo $data['mobile']; ?></td>
                                    <td><?php echo $data['myzip'] . $data['ctName'] . $data['toName'] . $data['address']; ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255, 255, 255,.5);z-index:9999;"><i class="spinner-border text-info" style="position:absolute;top:50%;left:50%;"></i></div>
</body>

</html>