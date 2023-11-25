<!doctype html>
<html lang="zh-TW">
<?php require_once('Connections/conn_db.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : ""; ?>

<head>
    <?php require_once("headfile.php"); ?>
</head>

<body>
    <section class="header">
        <?php require_once("header.php"); ?>
    </section>
    <section class="content">
        <?php require_once("navbar.php"); ?>
        <div class="container">
            <div class="about mt-5 left">
                <img src="images/廖朝恩.jpg" alt="廖朝恩" title="廖朝恩">
                <h2>《興德堂中藥房創建人－廖朝恩》</h2>
            </div>
            <div class="text up">
                <img class="fleft" src="images/接骨執照.jpg" alt="接骨執照" title="接骨執照">
                <p>他在年輕的時候，跟隨他的叔公學習了接骨技術，每當叔公治療患者時，他都專注地細心觀察每一個接骨過程的細節，一步一步地精通了接骨的精要，後來，他有去藥房打工，學習了中藥的治療和調配技巧，並買了書籍自修，倚靠這種自學的努力，他成功考取了接骨執照和藥商牌照。</p>
                <div class="clear"></div>
                <img class="fright" src="images/創建人和他太太.jpg" alt="創建人和他太太" title="創建人和他太太">
                <p>在娶了太太之後，兩人一起租了一間房子，開始從事幫助他人治療骨傷的行業，他負責為患者進行接骨和包紮，而他的太太則負責前往中藥房購買治療骨傷所需的藥材，兩人各司其職，經歷了許多困難的時刻，但最終他們賺了不少錢，購下了當初租用的房子，他們將之改為興德堂中藥房，開始經營自己的藥房。</p>
                <div class="clear"></div>
                <img src="images/診療室.jpg" class="pic fleft" alt="診療室" title="診療室">
                <p>當時大型醫院還不普及，漢醫藥是主流治療管道，因此蠻多客人紛紛湧入，他繼續負責幫客人看診、接骨和包紮，之後寫好藥單給他太太，讓她在藥櫃前幫客人抓取藥單上的藥材，而有時，他們的兒子也會前來幫忙，就這樣每天都忙得不可開交，大多數前來治療骨傷的患者都得到了有效的治療，並對他的手藝讚不絕口。</p>
                <div class="clear"></div>
                <p>開業至今已經過了六十多年，雖然現在不再有像當初那樣源源不斷的客人，但廖朝恩和他的太太仍然繼續開業，秉持著幫助他人的心，繼續為患者提供治療。</p>
            </div>
        </div>
    </section>
    <section class="footer">
        <?php require_once("footer.php"); ?>
    </section>
    <?php require_once("jsfile.php"); ?>
</body>

</html>