<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>资金明细</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid exchange-detail">
   <div id="order-top" class="clear">
    <div class="top-item active" title="#bet-detail">
       交易明细
    </div>
    <div class="top-item" title="#exchange-detail">
      兑奖明细
    </div>
  </div>
    <div>
        <div id="bet-detail" class="detail-item">
	        <div class="row">
	            <div class="col-xs-6">
	                <b>购卡</b>
	                <p>2017-08-31 17:35:00</p>
	            </div>
	            <div class="col-xs-6 text-right">-110.00元</div>
	        </div>
	        <div class="row">
	            <div class="col-xs-6">
	                <b>转卖</b>
	                <p>2017-08-31 17:35:00</p>
	            </div>
	            <div class="col-xs-6 text-right plus">+396.00元</div>
	        </div>
	        <div class="row">
	            <div class="col-xs-6">
	                <b>购卡</b>
	                <p>2017-08-31 17:35:00</p>
	            </div>
	            <div class="col-xs-6 text-right">-110.00元</div>
	        </div>
	        <div class="row">
	            <div class="col-xs-6">
	                <b>转卖</b>
	                <p>2017-08-31 17:35:00</p>
	            </div>
	            <div class="col-xs-6 text-right plus">+396.00元</div>
	        </div>
        </div>
        <div id="exchange-detail">
            <div class="row">
               <div class="col-xs-5">
               		<img  src="images/100.png" class="img-responsive">
               </div>
               <div class="col-xs-7">
                   <p>京东卡-面值100元</p>
                   <p>数量：<b>2</b> 张</p>
                   <p>金额：<b>200</b>元</p>
                   <p>2017-09-06 08:15:00</p>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-5">
               		<img  src="images/200.png" class="img-responsive">
               </div>
               <div class="col-xs-7">
                   <p>京东卡-面值200元</p>
                   <p>数量：<b>2</b> 张</p>
                   <p>金额：<b>400</b>元</p>
                   <p>2017-09-06 08:15:00</p>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-5">
               		<img  src="images/500.png" class="img-responsive">
               </div>
               <div class="col-xs-7">
                   <p>京东卡-面值500元</p>
                   <p>数量：<b>2</b> 张</p>
                   <p>金额：<b>1000</b>元</p>
                   <p>2017-09-06 08:15:00</p>
               </div>
            </div>
        </div>
    </div>
    
    <div id="exchangeDetailFoot"></div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/exchangeDetail.js"></script>
</body>
</html>