//跳出確認訊息對話框
function btn_confirmLink(message, url) {
    if (message == "" || url == "") {
        return false;
    }
    if (confirm(message)) {
        window.location = url;
    }
    return false;
}

function pdaddcart(p_id) {
    let msg = "確定將該產品加入購物車?";
    if (!confirm(msg)) return false;
    var qty = $("#qty").val();
    if (qty == undefined) {
        qty = 1;
    }
    //利用jquery $.ajax函數呼叫後台的addcart.php
    $.ajax({
        url: 'addcart.php',
        type: 'get',
        dataType: 'json',
        data: { p_id: p_id, qty: qty, },
        success: function (data) {
            if (data.c == true) {
                alert(data.m);
                window.location.reload();
            } else {
                alert(data.m);
            }
        },
        error: function (data) {
            alert("系統目前無法連接到後台資料庫。");
        }
    });
}

//將產品p_id加入購物車
function addcart(p_id) {
    var qty = $("#qty").val();
    if (qty <= 0) {
        alert("產品數量不得為0或為負數，請再修改數量!");
        return (false);
    }
    if (qty == undefined) {
        qty = 1;
    } else if (qty >= 51) {
        alert("由於採購限制，產品數量將限制在50以下!");
        return (false);
    }
    //利用jquery $.ajax函數呼叫後台的addcart.php
    $.ajax({
        url: 'addcart.php',
        type: 'get',
        dataType: 'json',
        data: { p_id: p_id, qty: qty, },
        success: function (data) {
            if (data.c == true) {
                alert(data.m);
                window.location.reload();
            } else {
                alert(data.m);
            }
        },
        error: function (data) {
            alert("系統目前無法連接到後台資料庫。");
        }
    });
}

//將產品p_id直接進入結帳頁面
function buy(p_id) {
    var qty = $("#qty").val();
    if (qty <= 0) {
        alert("產品數量不得為0或為負數，請再修改數量!");
        return (false);
    }
    if (qty == undefined) {
        qty = 1;
    } else if (qty >= 51) {
        alert("由於採購限制，產品數量將限制在50以下!");
        return (false);
    }
    //利用jquery $.ajax函數呼叫後台的buy.php
    $.ajax({
        url: 'buy.php',
        type: 'get',
        dataType: 'json',
        data: { p_id: p_id, qty: qty, },
        success: function (data) {
            if (data.c == true) {
                alert(data.m);
                window.location.href = "checkout.php";
            } else {
                alert(data.m);
            }
        },
        error: function (data) {
            alert("系統目前無法連接到後台資料庫。");
        }
    });
}

let boxes = document.querySelectorAll(".up");
let boxes1 = document.querySelectorAll(".left");

window.addEventListener("scroll", checkBoxes);
checkBoxes();

function checkBoxes() {
    console.log(window.innerHeight);
    let triggerBottom = window.innerHeight * 1;
    boxes.forEach((box) => {
        let boxTop = box.getBoundingClientRect().top;
        if (boxTop < triggerBottom) {
            box.classList.add("show");
        }
    });
    boxes1.forEach((box) => {
        let boxTop = box.getBoundingClientRect().top;
        if (boxTop < triggerBottom) {
            box.classList.add("show");
        }
    });
}