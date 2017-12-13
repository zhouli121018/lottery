<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);  	   
	if(request.getQueryString()!=null) 
			{   
			    url+="?"+request.getQueryString();           
			}
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>兑换商城</title>
  <script>
//    var useragent = navigator.userAgent;
//    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
//      location.href='sorry.jsp';
//    }
  </script>
</head>
<body style="padding-top:50px;">
<!--指定容器-->
<div class="container-fluid">
  <div id="order-top" class="clear navbar-fixed-top">
    <div class="top-item active" title="#exchange-left">
      所有奖品
    </div>
    <div class="top-item" title="#exchange-detail">
      兑换记录
    </div>
  </div>
<!--   <span class="glyphicon glyphicon-plus go-charge"></span> -->
  
  <div>
    <div id="exchange-left">
	     <div class="mycharge">
		   <div>
		      <span class="mount-img"></span><b class="myredcard"></b>
		   </div>
	     </div>
      <div class="order-list">
<!--         <div class="order-item check"> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-6"> -->
<!--               订单编号：<span>208164</span> -->
<!--             </div> -->
<!--             <div class="col-xs-6 text-right"> -->
<!--               <span class="status new">未使用</span> -->
<!--               <span class="glyphicon glyphicon-menu-down"></span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-4"> -->
<!--               <img src="images/082819381459a400a6b1c30.jpg" class="img-responsive" alt="0"/> -->
<!--             </div> -->
<!--             <div class="col-xs-6 mid-title"> -->
<!--               <p class="title">京东E卡经典卡200面值</p> -->
<!--               <p>商品编号：<span>16</span></p> -->
<!--             </div> -->
<!--             <div class="col-xs-2 times"> -->
<!--               X3 -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--           <div class="order-item"> -->
<!--             <div class="row"> -->
<!--               <div class="col-xs-6"> -->
<!--                 订单编号：<span>208164</span> -->
<!--               </div> -->
<!--               <div class="col-xs-6 text-right"> -->
<!--                 <span class="status">已转卖</span> -->
<!--                 <span class="glyphicon glyphicon-menu-down"></span> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--               <div class="col-xs-4"> -->
<!--                 <img src="images/082819381459a400a6b1c30.jpg" class="img-responsive" alt="0"/> -->
<!--               </div> -->
<!--               <div class="col-xs-6 mid-title"> -->
<!--                 <p class="title">京东E卡经典卡200面值</p> -->
<!--                 <p>商品编号：<span>16</span></p> -->
<!--               </div> -->
<!--               <div class="col-xs-2 times"> -->
<!--                 X3 -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         <div class="order-item disabled"> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-6"> -->
<!--               订单编号：<span>208164</span> -->
<!--             </div> -->
<!--             <div class="col-xs-6 text-right"> -->
<!--               <span class="status">已转卖</span> -->
<!--               <span class="glyphicon glyphicon-menu-down"></span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-4"> -->
<!--               <img src="images/082819381459a400a6b1c30.jpg" class="img-responsive" alt="0"/> -->
<!--             </div> -->
<!--             <div class="col-xs-6 mid-title"> -->
<!--               <p class="title">京东E卡经典卡200面值</p> -->
<!--               <p>商品编号：<span>16</span></p> -->
<!--             </div> -->
<!--             <div class="col-xs-2 times"> -->
<!--               X3 -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="order-item"> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-6"> -->
<!--               订单编号：<span>208164</span> -->
<!--             </div> -->
<!--             <div class="col-xs-6 text-right"> -->
<!--               <span class="status">已转卖</span> -->
<!--               <span class="glyphicon glyphicon-menu-down"></span> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row"> -->
<!--             <div class="col-xs-4"> -->
<!--               <img src="images/082819381459a400a6b1c30.jpg" class="img-responsive" alt="0"/> -->
<!--             </div> -->
<!--             <div class="col-xs-6 mid-title"> -->
<!--               <p class="title">京东E卡经典卡200面值</p> -->
<!--               <p>商品编号：<span>16</span></p> -->
<!--             </div> -->
<!--             <div class="col-xs-2 times"> -->
<!--               X3 -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->

        <div class="order-item row">
	          <div class="col-xs-7">
	            <div>
	              <img src="images/20.png" alt="20" class="img-responsive"/>
	            </div>
	            <p>京东卡-面值20元</p>
	          </div>
	          <div class="col-xs-5">
	            <div>
	              <span>数量 </span>
	              <div class="input-group">
	                <span class="input-group-addon btn">-</span>
	                <input type="number" class="form-control text-center" min="0"  value="1" />
	                <span class="input-group-addon btn">+</span>
	              </div>
	            </div>
	            <div class="order-exchange-middle">
	              <span>消耗 </span><b>200</b> 红钻
	            </div>
	            <div>
	              <button type="button" class="btn btn-block">兑换</button>
	            </div>
	          </div>
        </div>
        <div class="order-item row">
          <div class="col-xs-7">
            <div>
              <img src="images/100.png" alt="100" class="img-responsive"/>
            </div>
            <p>京东卡-面值100元</p>
          </div>
          <div class="col-xs-5">
            <div>
              <span>数量 </span>
              <div class="input-group">
                <span class="input-group-addon btn">-</span>
                <input type="number" class="form-control text-center" min="0"  value="1" />
                <span class="input-group-addon btn">+</span>
              </div>
            </div>
            <div class="order-exchange-middle">
              <span>消耗 </span><b>1000</b> 红钻
            </div>
            <div>
              <button type="button" class="btn btn-block">兑换</button>
            </div>
          </div>
        </div>
        <div class="order-item row">
          <div class="col-xs-7">
            <div>
              <img src="images/200.png" alt="200" class="img-responsive"/>
            </div>
            <p>京东卡-面值200元</p>
          </div>
          <div class="col-xs-5">
            <div>
              <span>数量 </span>
              <div class="input-group">
                <span class="input-group-addon btn">-</span>
                <input type="number" class="form-control text-center" min="0"  value="1" />
                <span class="input-group-addon btn">+</span>
              </div>
            </div>
            <div class="order-exchange-middle">
              <span>消耗 </span><b>2000</b> 红钻
            </div>
            <div>
              <button type="button" class="btn btn-block">兑换</button>
            </div>
          </div>
        </div>
        <div class="order-item row">
          <div class="col-xs-7">
            <div>
              <img src="images/500.png" alt="500" class="img-responsive"/>
            </div>
            <p>京东卡-面值500元</p>
          </div>
          <div class="col-xs-5">
            <div>
              <span>数量 </span>
              <div class="input-group">
                <span class="input-group-addon btn">-</span>
                <input type="number" class="form-control text-center" min="0"  value="1" />
                <span class="input-group-addon btn">+</span>
              </div>
            </div>
            <div class="order-exchange-middle">
              <span>消耗 </span><b>5000</b> 红钻
            </div>
            <div>
              <button type="button" class="btn btn-block">兑换</button>
            </div>
          </div>
        </div>
        <div class="order-item row">
          <div class="col-xs-7">
            <div>
              <img src="images/1000.png" alt="1000" class="img-responsive"/>
            </div>
            <p>京东卡-面值1000元</p>
          </div>
          <div class="col-xs-5">
            <div>
              <span>数量 </span>
              <div class="input-group">
                <span class="input-group-addon btn">-</span>
                <input type="number" class="form-control text-center" min="0"  value="1" />
                <span class="input-group-addon btn">+</span>
              </div>
            </div>
            <div class="order-exchange-middle">
              <span>消耗 </span><b>10000</b> 红钻
            </div>
            <div>
              <button type="button" class="btn btn-block">兑换</button>
            </div>
          </div>
        </div>


     
<!--       <div class="row exchange-bottom navbar-fixed-bottom"> -->
<!--         <div class="col-xs-6"> -->
<!--           <button class="btn btn-block">一键提货</button> -->
<!--         </div> -->
<!--         <div class="col-xs-6"> -->
<!--           <a href="#" class="btn btn-block active sell-btn">一键转卖 <small>99折</small></a> -->
<!--         </div> -->
<!--       </div> -->
    </div>
    <p class="hasMore">—— 不要拉了 只有这些商品 ——</p>
    </div>
<!--     <div id="exchange-right"></div> -->
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
    <div id="exchangefoot"></div>
   



</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/exchange.js"></script>
</body>
</html>