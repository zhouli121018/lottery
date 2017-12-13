<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>首页</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid text-center done">
  <div class="done-top">
    <h3><span class="glyphicon glyphicon-ok"></span>您的订单已转卖</h3>
    <p>转卖收入：<b>￥297</b></p>
  </div>
  <div class="done-middle">
    <a href="money.html">查看钱包余额</a>
  </div>
  <div class="row done-bottom">
    <div class="col-xs-6">
     <a href="index.jsp"><p>继续参战</p></a>
    </div>
    <div class="col-xs-6">
      <a href="exchange.jsp"><p>兑奖记录</p></a>
    </div>
  </div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/done.js"></script>
</body>
</html>