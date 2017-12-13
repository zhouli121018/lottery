<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>排行榜</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid">
  <div id="order-top" class="clear">
    <div class="top-item active" title="#rank">
      中奖排行榜
    </div>
    <div class="top-item" title="#newin">
      最新参与记录
    </div>
  </div>

  <div>
    <div id="rank">
      <div id="tab-title" class="text-center">
        <div class="btn-group" role="group">
          <button type="button" class="btn btn-default active">日榜</button>
          <button type="button" class="btn btn-default">周榜</button>
          <button type="button" class="btn btn-default">月榜</button>
        </div>
      </div>

      <div id="tab-list">
        <div class="rank-top">
          <div class="rank-top-item">
            <div class="rank-top-avatar">
              <img src="images/0.jpg" class="img-responsive" alt="1"/>
              <span class="first">1</span>
            </div>
            <div class="rank-top-name">小样</div>
            <div class="rank-top-number">已中奖:180单</div>
          </div>
          <div class="rank-top-item">
            <div class="rank-top-avatar">
              <img src="images/1.jpg" class="img-responsive" alt="1"/>
              <span class="second">2</span>
            </div>
            <div class="rank-top-name">小样</div>
            <div class="rank-top-number">已中奖:180单</div>
          </div>
          <div class="rank-top-item">
            <div class="rank-top-avatar">
              <img src="images/1.jpg" class="img-responsive" alt="1"/>
              <span class="third">3</span>
            </div>
            <div class="rank-top-name">小样</div>
            <div class="rank-top-number">已中奖:180单</div>
          </div>
        </div>
        <div class="rank-middle">
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>4</span>
              <div class="rank-img-box">
                <img src="images/0.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>5</span>
              <div class="rank-img-box">
                <img src="images/1.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>6</span>
              <div class="rank-img-box">
                <img src="images/3.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>7</span>
              <div class="rank-img-box">
                <img src="images/3.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>8</span>
              <div class="rank-img-box">
                <img src="images/3.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>9</span>
              <div class="rank-img-box">
                <img src="images/3.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
          <div class="rank-middle-item">
            <div class="rank-mid-left">
              <span>10</span>
              <div class="rank-img-box">
                <img src="images/3.jpg" alt="0" class="img-responsive"/>
              </div>
              <span>阳光</span>
            </div>
            <div>
              已中奖：<span>190</span>单
            </div>
          </div>
        </div>
      </div>

    </div>
    <div id="newin">
      <div class="newin-item">
        <div class="img-box">
          <img src="images/2.jpg" class="img-responsive" alt="2"/>
        </div>
        <div class="username">
          惠州市国泰名家具抢购到1件京东E卡经典卡200面值
        </div>
        <div class="time-result">
          <p>2017-09-05:10:14:42</p>
          <p>小数</p>
        </div>
      </div>
      <div class="newin-item">
        <div class="img-box">
          <img src="images/2.jpg" class="img-responsive" alt="2"/>
        </div>
        <div class="username">
          惠州市国泰名家具抢购到1件京东E卡经典卡200面值
        </div>
        <div class="time-result">
          <p>2017-09-05:10:14:42</p>
          <p>小数</p>
        </div>
      </div>
      <div class="newin-item">
        <div class="img-box">
          <img src="images/2.jpg" class="img-responsive" alt="2"/>
        </div>
        <div class="username">
          惠州市国泰名家具抢购到1件京东E卡经典卡200面值
        </div>
        <div class="time-result">
          <p>2017-09-05:10:14:42</p>
          <p>小数</p>
        </div>
      </div>
      <div class="newin-item">
        <div class="img-box">
          <img src="images/2.jpg" class="img-responsive" alt="2"/>
        </div>
        <div class="username">
          惠州市国泰名家具抢购到1件京东E卡经典卡200面值
        </div>
        <div class="time-result">
          <p>2017-09-05:10:14:42</p>
          <p>小数</p>
        </div>
      </div>
    </div>
  </div>
  <div id="rankFoot"></div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/rank.js"></script>
</body>
</html>